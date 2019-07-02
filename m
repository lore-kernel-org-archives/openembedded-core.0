Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A30487E9FF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 20:16:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x62KGWPo023217
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jul 2019 13:16:32 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 2 Jul 2019 13:16:32 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jul 2019 13:16:09 -0700
Message-ID: <20190702201609.78379-4-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702201609.78379-1-jason.wessel@windriver.com>
References: <20190702201609.78379-1-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] glibc/glibc-locale: Fix do_stash_locale to work with usrmerge and multilibs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Jul 2019 20:16:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The do_stash_locale was not working consistently across the 4 build
configurations and the multilib, usrmerge configuration would fail
entirely with the obscure message:

| DEBUG: Executing shell function do_prep_locale_tree
| tar: i18n: Cannot stat: No such file or directory
| tar: Exiting with failure status due to previous errors
| gzip: /poky/build/tmp/work/core2-64-poky-linux/glibc-locale/2.29-r0/locale-tree//usr/share/i18n/charmaps/*gz.gz: No such file or directory
| WARNING: /poky/build/tmp/work/core2-64-poky-linux/glibc-locale/2.29-r0/temp/run.do_prep_locale_tree.124690:1 exit 1 from 'gunzip $i'

Here is the 4 build configurations without the patch applied:

A) x86-64 no multilibs, no usrmerge
find ./tmp/work/*/glibc/2.29-r0/stashed-locale -type f |grep -v nscd.service |wc -l
909
B) x86-64 no multilibs, usrmerge
find ./tmp/work/*/glibc/2.29-r0/stashed-locale -type f |grep -v nscd.service |wc -l
909
C) x86-64 multilibs, no usrmerge
find ./tmp/work/*/glibc/2.29-r0/stashed-locale -type f |grep -v nscd.service |wc -l
885
D) x86-64 multilibs, usrmerge
find ./tmp/work/*/glibc/2.29-r0/stashed-locale -type f |grep -v nscd.service |wc -l
864

The issue here is that all the moves should be processed first, then a
copy should be made of the lib directories, but only in the case they
are different when using the usrmerge feature.  Even though the build
worked for the multilib configuration without usrmerge, the content
was not the same.

After applying the patch the same number of files are in all the
configurations.  The list of files was also diffed, after normalizing
the directory names to ensure all the correct files were copied.

Ultimately there are probably additional files that should be pruned
from what is copied to the stated_locale, but the purpose of this
patch is make it 100% consistent between the build types and fix the
builds.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index a1d79b3075..ff17a193c3 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -162,21 +162,28 @@ bashscripts = "mtrace sotruss xtrace"
 do_stash_locale () {
 	dest=${LOCALESTASH}
 	install -d ${dest}${base_libdir} ${dest}${bindir} ${dest}${libdir} ${dest}${datadir}
-	if [ "${base_libdir}" != "${libdir}" ]; then
-		cp -fpPR ${D}${base_libdir}/* ${dest}${base_libdir}
-	fi
+	# Hide away the locale data from the deployment
 	if [ -e ${D}${bindir}/localedef ]; then
 		mv -f ${D}${bindir}/localedef ${dest}${bindir}
 	fi
 	if [ -e ${D}${libdir}/gconv ]; then
 		mv -f ${D}${libdir}/gconv ${dest}${libdir}
 	fi
-	if [ -e ${D}${exec_prefix}/lib ]; then
-		cp -fpPR ${D}${exec_prefix}/lib ${dest}${exec_prefix}
-	fi
 	if [ -e ${D}${datadir}/i18n ]; then
 		mv ${D}${datadir}/i18n ${dest}${datadir}
 	fi
+
+	# Make a copy of all the libraries into the locale stash
+	cp -fpPR ${D}${libdir}/* ${dest}${libdir}
+	if [ "${base_libdir}" != "${libdir}" ]; then
+		cp -fpPR ${D}${base_libdir}/* ${dest}${base_libdir}
+	fi
+	if [ -e ${D}${exec_prefix}/lib ]; then
+		if [ ${exec_prefix}/lib != ${base_libdir} ] && [ ${exec_prefix}/lib != ${libdir} ]; then
+			cp -fpPR ${D}${exec_prefix}/lib ${dest}${exec_prefix}
+		fi
+	fi
+
 	cp -fpPR ${D}${datadir}/* ${dest}${datadir}
 	rm -rf ${D}${datadir}/locale/
 	cp -fpPR ${WORKDIR}/SUPPORTED ${dest}
-- 
2.21.0


