Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 36F727C4BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 18:04:11 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id c123so296901pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 10:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b4QE/+Kkormp824l/L7eIFESQA0U+0MxGrnRUhVxvyw=;
	b=D6wpY1UUxROgZ0FaXB2snLT5WGfh+3NHAqJ304C6O4u9m1MYCF5uuypGh6Y5ZgyH+k
	sIqpSwYUv1E2BJAZ6Q3Yo583vfWB7B8wA0Pp7VVA5Y23DQ4Z3+/zMK3P1lKun4AtH5/x
	bbxQVLHRuajtY4dnq1CLbbO+a2GPzD3z7jjaqn2G1CBQVcG3jU+5eyWyZAK8VjLsHQ3+
	P+JygVVlf7FEDzE9PEINXvkgEpWNk36nkZCoqtjqKwCWGW4EEieyKFYWE1vjSLiReOK5
	QZen2s1zJudJq4Jgyoi5XGoZSSNO5MTEO06tJeRn8tYSo+Oq+gipeqysX6BnO/KDYzNv
	Lsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b4QE/+Kkormp824l/L7eIFESQA0U+0MxGrnRUhVxvyw=;
	b=hsHwcWRefeW/rAuw+ouU3JwjkH0NL9a/A9QPIgqX19C6FNBmCEYd/QpCfI7fmVfAr8
	r9irIwYEBcguQYH0vk47q7ErfnT/8tCoxN6eszwP7NmiE4qYmt/nqF+esGP+TXLzacGI
	3aKZnRWIOjrg0TTc8sPP2R0z4Wlj6Ma0o+4SmmfhF03811qXpQsklrBZuY4bZudQATb0
	SyRGESrjvFq4DcDQ5CRBlEnuJavjo1TJCSasQv7o5oqDe2T3eyGpsRpMUz6hvKSRYJxn
	nitAT12rCox+S3HmrcjXm2TnpyIr1e/R3VYG1HL0om2ZfT5jHzFh6BzPaaFHIyOwcFym
	XGfg==
X-Gm-Message-State: AHQUAua/FqcAgbSfbN1Yy4curGcRnmxh3TAvkjAFxh8VTIVScnisz042
	/NV9TqSfaYdCGrOT8hv1b3Xg8OuL
X-Google-Smtp-Source: AHgI3IYpX/siZ4BUOiLPeA4nhI3FYW/YbjAa6RNST9UAmAmORw44t50Z/tyqakX3WXDQfhIt6Dv0lg==
X-Received: by 2002:a62:4bcf:: with SMTP id d76mr18126358pfj.170.1549562651390;
	Thu, 07 Feb 2019 10:04:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id
	a13sm4308533pgw.34.2019.02.07.10.04.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 10:04:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Feb 2019 10:04:03 -0800
Message-Id: <20190207180403.25571-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH V2] glibc-locale: Rewrite do_install using install utility instead of cp
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
X-List-Received-Date: Thu, 07 Feb 2019 18:04:11 -0000
Content-Transfer-Encoding: 8bit

This has been a constant source of trouble for build failures due to host-user-contaminated QA
errors of sort

ERROR: QA Issue: glibc-locale: /glibc-binary-localedata-ca-es+valencia/usr/lib/locale/ca_ES@valencia/LC_MONETARY is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]

So far we have tried to mould cp command into not carrying the build
user permissions into install area but it is never entirely fixed since
the issue keeps popping up in various scenes

This patch replaces use of cp with install utility and specifies install
mode for files explcitly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Turn the common install loop into a shell function ( Thanks Peter
Kjellerstedt)
 meta/recipes-core/glibc/glibc-locale.inc | 43 ++++++++++++------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 6384f9cbf1..c51fa482a9 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -71,28 +71,27 @@ FILES_localedef = "${bindir}/localedef"
 
 LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
 
-do_install () {
-	mkdir -p ${D}${bindir} ${D}${datadir}
-	if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
-		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
-	fi
-	if [ -n "$(ls ${LOCALETREESRC}/${localedir})" ]; then
-		mkdir -p ${D}${localedir}
-		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${localedir}/* ${D}${localedir}
-	fi
-	if [ ${@d.getVar('PACKAGE_NO_GCONV')} -eq 0 ]; then
-		mkdir -p ${D}${libdir}
-		if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
-			cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
-		fi
-		if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
-			cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
-		fi
-	fi
-	if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
-		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
-	fi
-	cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
+copy_locale_files() {
+        local dir=$1 mode=$2
+
+        [ -e "${LOCALETREESRC}$dir" ] || return 0
+
+        for d in . $(find "${LOCALETREESRC}$dir" -type d -printf '%P '); do
+                install -d ${D}$dir/$d
+                find "${LOCALETREESRC}$dir/$d" -maxdepth 1 -type f \
+                     -exec install -m $mode -t "${D}$dir/$d" {} \;
+        done
+}
+
+do_install() {
+        copy_locale_files ${bindir} 0755
+        copy_locale_files ${localedir} 0644
+        if [ ${PACKAGE_NO_GCONV} -eq 0 ]; then
+                copy_locale_files ${libdir}/gconv 0755
+                copy_locale_files ${datadir}/i18n 0644
+        fi
+        copy_locale_files ${datadir}/locale 0644
+        install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
 }
 
 inherit libc-package
-- 
2.20.1


