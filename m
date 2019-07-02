Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E81DC7EB18
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 20:16:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x62KGLlD021654
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jul 2019 13:16:32 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 2 Jul 2019 13:16:11 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jul 2019 13:16:08 -0700
Message-ID: <20190702201609.78379-3-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190702201609.78379-1-jason.wessel@windriver.com>
References: <20190702201609.78379-1-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] glibc-locale: Fix build error with PACKAGE_NO_GCONV = "1"
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
X-List-Received-Date: Tue, 02 Jul 2019 20:16:41 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When the PACKAGE_NO_GCONV is set to 1 an empty directory is left behind from the do_install rule:

=====
ERROR: glibc-locale-2.29-r0 do_package: QA Issue: glibc-locale: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/locale
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
glibc-locale: 2 installed and not shipped files. [installed-vs-shipped]
ERROR: glibc-locale-2.29-r0 do_package: Fatal QA errors found, failing task.
=====

The simple fix is to prune the empty directory.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-core/glibc/glibc-locale.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index f033635bd0..bf5eaee938 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -87,6 +87,9 @@ do_install() {
 	if [ ${PACKAGE_NO_GCONV} -eq 0 ]; then
 		copy_locale_files ${libdir}/gconv 0755
 		copy_locale_files ${datadir}/i18n 0644
+	else
+		# Remove the libdir if it is empty when gconv is not copied
+		find ${D}${libdir} -type d -empty -delete
 	fi
 	copy_locale_files ${datadir}/locale 0644
 	install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
-- 
2.21.0


