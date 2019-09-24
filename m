Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 15EC87F2BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:14 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id u12so258059pls.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pePUMuXbWL+S0m7tdwnNv1XKJm7FPqqKahmdEwx4xa4=;
	b=N6+BB/vQv36Y/gxjJ5kY7junhEs6/qv9DTfHF07l3q7b44eEDxggA00uCJvEuh7yUr
	ctGU/Fj8+mtlBR407DrsA5BKzohGDzS9QI1vPi44nFZ3u3PLpensFtIhXs1mPqyFoFLh
	1yNWtmZTGTpZB6D174XIU1O2zEwdVpat5uJzbYEFPotzDr5lbisldjKhdeTSxYSBhMo1
	BttcSX9l2+l4TKIe5OR0BK79srHBp27RidfqrnpXPdWyCHtjQV/jaoxr5Ff/zwNecANo
	d5bohJyNJkf8C/DtQqubdb5KgBZEoM3h6wguZ+qFCJQIodr7vGxC5mpQ3q2107WAbsR/
	v04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pePUMuXbWL+S0m7tdwnNv1XKJm7FPqqKahmdEwx4xa4=;
	b=RRyXJn/YAH3klCF5iVDk9Ou7TL97vk0l0uvA48NcJ4XktZIwGLFW1hyhutzaczKfeW
	p2Q5ioihBwV2KAX/L/0EgHjpKQ6RRgf49OlNvtDAzOjuHu2L4NF+j9e7BdqFDBRUAHzZ
	/uWftdG4opW9q5nCWHUtk2sVM1VgxLaVJ08R1m3Ji7S0dI/OQ7uoDk7xc2kK+sfa8K52
	oveqsc1odRjPE8Zt6fgogSsxLy7iSY5RAS3BfzfRLUiUkylCeXRQGoFvAr/8vzUskRbQ
	rpglnyR69rNQntYdRoEFQ6H6w/xicA1epzGVgjJtH940MQ9lHy6aT1WKPvl/KyU644oS
	wDRQ==
X-Gm-Message-State: APjAAAUQdpJL8jPJ1pVhF0IfloVTHFoslWLhO/lUW/v5/oUTzEot90Dp
	YPlFrlhqrFuXc7s7SrafiAcmp3i0n/w=
X-Google-Smtp-Source: APXvYqwpntEJOBpxH39f8G2haHSdV4puWoQ4BeRYgtn7JpX5jAq/hG9eGM//C5MWeCGANm2fxahirg==
X-Received: by 2002:a17:902:23:: with SMTP id 32mr500832pla.214.1569293414699; 
	Mon, 23 Sep 2019 19:50:14 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:21 -0700
Message-Id: <7af754ca4b1d45275dfd4a66a317f262f24edde9.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 41/50] glibc/glibc-locale: Fix do_stash_locale to work with usrmerge and multilibs
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:14 -0000

From: Jason Wessel <jason.wessel@windriver.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index a1d79b3..ff17a19 100644
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
2.7.4


