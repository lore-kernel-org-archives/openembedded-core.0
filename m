Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF9C6B005
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 00:56:20 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id y1so780049pgk.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 16:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yiGxStsGSyUPp76ZCoXq2FVrJw2g8d7UFbsUiocjU5c=;
	b=dx8WGx/V9InE2BOat1Zy8L7hR3Z48sQTEN6YM6d2YaI+bDW5+YOlQD4InpAqykO7L+
	VKsdpfphXUSdxKXBWTUc8AsiBWKTq0XCEzyyHBuh9osItA7ElIUizNhtYemDthakrsgH
	h/sA6suNlaQBEiQWH5n6TdWJgFpEQP9f+Tw8V7Jxwv8P0NaD4iBbCQReLsfc+/RLl9vR
	39tvKK2MMNjV9Q3ft7RFn3Pv1hJU4L9Ld67TYpbm7o/Xe5BVzSZqLW3/SBfdgNYb0Ok9
	MEJXOSyfYn8ikYbFMxwE0dwkrWZg6MjEnNqLqMt7cY2gzD8ckxpLXrvdlIZ7jmvWqjTM
	1KSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yiGxStsGSyUPp76ZCoXq2FVrJw2g8d7UFbsUiocjU5c=;
	b=Eu7zBV8nMn0Y0jK2PMS6f5QrFRDYLSb14YO5CHXSasheI4x+7Kve3J9yGNwakqaiWY
	XpqFQSE7xjc2s63NiiKCEgKsksPhYHcX1N1KG+c/eBbESjCrMxnNutT1fk+O6lfJRLJL
	4dc6fkbZZQWBVYlg1mbpiw2Q83/ADmPCqyOANoa+7ubrcRYHskYGr0UxuUkAUOR3zAwN
	rjIxP2QcT9HuJKw6EmJtILEiUouBHS0ALX79thh50Vf1/oS6vayybpRFbUdFJDW/4T4g
	7wR4f0ARWOJA3mr/bqkH/7owVPHR8fJNeZDWfmtzwfe7tm8Ubt7TdTRqiEG7PVFtlrIS
	mJvw==
X-Gm-Message-State: AHQUAuY5D7dT7RpgDuC9VH3xzTa2kW7L0276XqoDTz3OV9G25YSYsAUC
	oXqS3Fz4BlbFHgbWUfKQ4Oo3hQYZ
X-Google-Smtp-Source: AHgI3Ibu+PJ5xcOxqgpg+BCm/oDKTId3HovXpJXXbwmVhFXy2dA/rW7iMnVLiXoHYul6DMd93DeHfg==
X-Received: by 2002:a63:e051:: with SMTP id n17mr17731835pgj.258.1549587380992;
	Thu, 07 Feb 2019 16:56:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id a13sm359113pgq.65.2019.02.07.16.56.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 16:56:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Feb 2019 16:56:11 -0800
Message-Id: <20190208005611.8039-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] glibc-locale: Rewrite do_install using install utility instead of cp
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
X-List-Received-Date: Fri, 08 Feb 2019 00:56:20 -0000
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
 meta/recipes-core/glibc/glibc-locale.inc | 41 ++++++++++++------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 6384f9cbf1..9cce61bf0b 100644
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
+copy_locale_files() {
+	local dir=$1 mode=$2
+
+	[ -e "${LOCALETREESRC}$dir" ] || return 0
+
+	for d in . $(find "${LOCALETREESRC}$dir" -type d -printf '%P '); do
+		install -d ${D}$dir/$d
+		find "${LOCALETREESRC}$dir/$d" -maxdepth 1 -type f \
+		-exec install -m $mode -t "${D}$dir/$d" {} \;
+	done
+}
+
+do_install() {
+	copy_locale_files ${bindir} 0755
+	copy_locale_files ${localedir} 0644
+	if [ ${PACKAGE_NO_GCONV} -eq 0 ]; then
+		copy_locale_files ${libdir}/gconv 0755
+		copy_locale_files ${datadir}/i18n 0644
 	fi
-	cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
+	copy_locale_files ${datadir}/locale 0644
+	install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
 }
 
 inherit libc-package
-- 
2.20.1


