Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id B60C37F4EA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:37:01 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id az1so4453238plb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pePUMuXbWL+S0m7tdwnNv1XKJm7FPqqKahmdEwx4xa4=;
	b=UWTzsMPaysibEk+fkxy0oZU5ODRRNMLlh7kOYTlJLFhSzK5mzNigzYCjHO/xy/ysNU
	02Bnvl75VoG7oXziedk5uk+rvtxC/Eravh/YGyJmC7MJ2WEj6UzcC+vpj2Sgwx2rsLmy
	QdlWAV56POADMh0Y7e1q4Yks5/WBRm8NNRJFuJ0Jc3+CHuKOe7lULriX9eCCMFev90zE
	QNTEZoCak6a2af54cVnCpdCCFPS/JXuFKfpTCImXTO4WgybFg+kzsR1ccE1mC/R/ZjT/
	eBYvegmpsOhJykXz/1M3bSB5i/HD3a7+fhf27wqjbcOJfFKjhF2kJticuGYERzgDz0Tb
	W0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pePUMuXbWL+S0m7tdwnNv1XKJm7FPqqKahmdEwx4xa4=;
	b=tgRgZLxveMmubk3K6fmdDh/f7l0XIZzdXdW5NTY+Gv34FWtppwvrgZUv9YW4yQEekN
	TwhyXO4k4XMA6HT3151Zflr1CmThxhLT6bGeUAKecjrpNYmZm1idikPeUkwRXiNdOLuh
	rkYeHdFo8NJckY6mvrXI8cuFwSS42xJu+JNvPtffnUKPcOZEdXJXSqJhWd/8k94XZHX5
	Xm09vaxpibLrNSksvDdB2+tsX/8GOijhRqygeIOnrulSREFNESL1CKEX2nwqwkY3urI+
	UPTf0CH8ja6cILMtqQcZtFpKm8s6XE27Z1WM8TnulUYwCWuYHuld4KN6VPwpNA/SZ9rV
	anzQ==
X-Gm-Message-State: APjAAAUsMYZDUtT5Hrr+FW6vqpNarQJJTbFsg6rqV1agIs1y1CkZ/a5W
	+Bq2mQ8rCnq98e75GihWdKu9oCIu
X-Google-Smtp-Source: APXvYqxAiVYJqcJIFY8cu1Gvu7HS9Y4w9CkZbDIFDCMQI33e8VB/KgYP2vgj70x6eyDzTBaeD3crLQ==
X-Received: by 2002:a17:902:8609:: with SMTP id
	f9mr25117488plo.112.1567348622829; 
	Sun, 01 Sep 2019 07:37:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.37.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:37:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:36:19 -0700
Message-Id: <7af754ca4b1d45275dfd4a66a317f262f24edde9.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 41/43] glibc/glibc-locale: Fix do_stash_locale to work with usrmerge and multilibs
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
X-List-Received-Date: Sun, 01 Sep 2019 14:37:01 -0000

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


