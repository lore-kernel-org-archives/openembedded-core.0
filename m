Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 536BF7CE5F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:34 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id e1so1146989pgj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pePUMuXbWL+S0m7tdwnNv1XKJm7FPqqKahmdEwx4xa4=;
	b=ob4CJn9B4PU9P5cHRqe2SNlr56NexHYQQYV1vYzLV6kQceQwLYY6TzYzDa6EV6rZ13
	34l7CuvGtHNGztlvjo29zj4wxxsMQAJ/jjuvGjKW4qCeAPzb+iHOZE8gj7aEhpsx4kiV
	NG2xJNTUFVFEVStXPMSSmhWhL3jWWMOCw+W+bsA0cGfOAR9EP6d+lRSD6OUghvXkgqzZ
	h91sgGq9sKgOq8OkWVKbVpozHu9zR/4uWn/z0kT1nOVQebsVySMS+Wbl4nABpSaD1D/M
	JnqWIKHxwh9E86BxVxcVGWsgsZC+aWhWP6C5o3OGd5ZwCqrAMmEV6/Wm95SDcv0qpYdx
	A8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pePUMuXbWL+S0m7tdwnNv1XKJm7FPqqKahmdEwx4xa4=;
	b=q3MTCV69/OXLtJ+Ep7PIM4kVWjHEEascrFZ/uwIW7t6DnZdZnyrDEDsQ5vftRCSA5d
	qSpfdxvjaUT/1J2uP2bOWUQ9zJJjFjz/OyH8jheOxhQDCXOTW9yYabQLV5+2+h/BpnIX
	3rKrOmfjZbo9m43lHSfmc8+jCK8rK/25sN/6nAADNSz63ck5IeusGxNhzJHeUE3NtnLx
	jDjY6bkqjSP7Sf9UObxHwCZD7cRnMRDQghmpbCXWtrgBobe5xEeF58p4PLvJSxkYvr6u
	EwUu88XaD4uzV6yR9DVE8IdRcMOXrgGfBUSE7Uyw4SWH9pbpoPil9rBqcgnKI1m8E6Rj
	Dr6g==
X-Gm-Message-State: APjAAAVnsYXSwwbog5A0MldJQJIITDFo/nyuPWuZpaKCwKO0jmzc6RkS
	FavPQIxIzcy0+buQij5emU1BagOjZ1I=
X-Google-Smtp-Source: APXvYqzJ9mpPgfCpO+GQmg6jCgiZLPk7Ve3AHhA53PIjDC1pi5Gip0uz6/U3aMqk4ayJ3zzdAKJnvA==
X-Received: by 2002:a17:90a:b396:: with SMTP id
	e22mr19044407pjr.102.1569818915332; 
	Sun, 29 Sep 2019 21:48:35 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:35 -0700
Message-Id: <36c223ecc5349478821a7a64a4ff14bbeae0a7da.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 40/54] glibc/glibc-locale: Fix do_stash_locale to work with usrmerge and multilibs
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:34 -0000

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


