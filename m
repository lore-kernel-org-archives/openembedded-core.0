Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EA1C021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 07:14:48 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.46031.1739776484480478409
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Feb 2025 23:14:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g1twV0mf;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: mail2szahir@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fbfe16cc39so7602595a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 23:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739776484; x=1740381284; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1sffCqWQjoV3QtcPBcnWm//uK2k1UpWVYJTb/qH2GA=;
        b=g1twV0mf3Y6R1GNtKo79dE8UNCRhL1y9sC9s+SJmexa/NG4S+ykyvyKy2JnYpLKlRi
         MLL96X3vYAg4lxWIbpjttSoLU2cGVHUEFWUpSH11GeFj+MMH6/pMXnOGbZewcVdw7Uku
         HXxARCYCVxQwVu4yLaFOPwHj0JktT8ZJIFaUvQWISTOR4/ilddd/0f0qFS43Z/GVb8je
         8gP9WB5BzCG9goEuU0kF52BIvZRmkYWL4ORw3Jt6TxV1Ydj9iJzpqggckXTyMq+qr1eb
         jq/eozg6+7lNeJVdanuYGbF2or8xr8aSVbHuHNF8h/q0deq96gwwPXX6WoDQBbQSQNZZ
         2zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739776484; x=1740381284;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1sffCqWQjoV3QtcPBcnWm//uK2k1UpWVYJTb/qH2GA=;
        b=qfKsKtmS4xwJk1nPRpuE23bmPUyLhLSV9E2yBJ1F5bGIXFkehW/3qhmSBfJzzSmxTL
         3nlx0cfnjlgpbqXhA1sT3RRpZLOdIcPmhH8hCfxnC5ZUfAN6kgASx+JbzJVtOCXFwepE
         EZ3sMqoy3+iwiRkvkIz7l0W5sn8dAuebYF25CE0ny3cM36sBe1FWs2tzYo34sUoDtBlD
         k1of0tqsQYbJp0SlUM4DYAFSAUFXq+DJo+IxU0Vmg63lLaxt0KgO4DTprdI/oMpRjCte
         6HkoW5mZXAP/HSinFbPCzLum1I6Ezm2es2GNXL08owquP2wZFl8hkflIZMQ5fvEi17Yu
         0y1A==
X-Gm-Message-State: AOJu0Yxc9UOOeIff/4p3HE5EP7sTulNz8SKDaGVmRqdi6keep4f+yZTb
	lMY5AnoDgs4Q1PezvmMfm3M5Mu2HpZlRzwAKY6MDvREZkYn9JsxjcfKm8Q1c
X-Gm-Gg: ASbGnct8Dx9guoe0D56P9tnm8fJxemcrLbPKGybCsyKaCaT2uqjjcF3okbUKB3fi+/r
	xU3UA697kUud8HUsb2d9pLAx8hRZddwqOpE1b6Mg6heL/SUsRYceW1FfcPw0DHXVixknH1VaRTK
	GfdtEMRvMTzYfkqvqEthFv7hcUPzKlf19cCii0Z7e3Sd5JK3Agt5Q5RH/NmcI9c3igtqyq7gNZa
	6NJM7URnD2QFBqytLxVDZvh5WBF7f7zw+CPr0T9QV8z49eDDS9ceVWUD7OpL2TW0ewJmgnB+FrL
	DV3xmgaCcQQiXqc13nLKky/CgmxnygtP
X-Google-Smtp-Source: AGHT+IFV6OwNh7lgB8tNeShS7v4aiFBKPQNJNTVL3KK37hcO9T9ut938T3gmvw4jWI/jjcUVS+Qk6w==
X-Received: by 2002:a17:90b:2f86:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2fc40c1d548mr14775268a91.7.1739776483586;
        Sun, 16 Feb 2025 23:14:43 -0800 (PST)
Received: from localhost.localdomain ([2405:201:e02e:c075:441b:7c9:1a87:6dd2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc13b913easm7047497a91.39.2025.02.16.23.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:14:43 -0800 (PST)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bindu.bhabu@kpit.com
Cc: Oleksandr Hnatiuk <ohnatiuk@cisco.com>,
	Oleksiy Obitotskyy <oobitots@cisco.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH] icu: remove host references in nativesdk to fix reproducibility
Date: Mon, 17 Feb 2025 12:44:31 +0530
Message-Id: <20250217071431.26922-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 07:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211519

From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>

Fix is only done for target. Use same code for nativesdk.

Backport from poky master: https://git.yoctoproject.org/poky/commit/?id=c63b8f28ac52047fad689b78d605aa792baf1ad8

(From OE-Core rev: dc6306883cc2c7d4d98d595442e5bf4037a160c5)

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c63b8f28ac52047fad689b78d605aa792baf1ad8)
Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
---
 meta/recipes-support/icu/icu_74-2.bb | 33 ++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-support/icu/icu_74-2.bb b/meta/recipes-support/icu/icu_74-2.bb
index 8352bf2a5b..53853e24a5 100644
--- a/meta/recipes-support/icu/icu_74-2.bb
+++ b/meta/recipes-support/icu/icu_74-2.bb
@@ -30,7 +30,7 @@ TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
 
 ASNEEDED = ""
 
-do_compile:prepend:class-target () {
+remove_build_host_references_from_libicutu () {
 	# Make sure certain build host references do not end up being compiled
 	# in the image. This only affects libicutu and icu-dbg
 	sed  \
@@ -39,6 +39,14 @@ do_compile:prepend:class-target () {
 	    -i ${B}/tools/toolutil/Makefile
 }
 
+do_compile:prepend:class-target () {
+	remove_build_host_references_from_libicutu
+}
+
+do_compile:prepend:class-nativesdk () {
+	remove_build_host_references_from_libicutu
+}
+
 PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
 do_install:append:class-native() {
 	mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
@@ -49,6 +57,15 @@ do_install:append:class-native() {
 	cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
 }
 
+remove_build_host_references() {
+	sed -i  \
+	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+	    -e 's|${DEBUG_PREFIX_MAP}||g' \
+	    -e 's:${HOSTTOOLS_DIR}/::g' \
+	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/Makefile.inc \
+	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/pkgdata.inc
+}
+
 do_install:append:class-target() {
     # The native pkgdata can not generate the correct data file.
     # Use icupkg to re-generate it.
@@ -56,14 +73,12 @@ do_install:append:class-target() {
         rm -f ${D}/${datadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat
         icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat
     fi
-	
-	# Remove build host references...
-	sed -i  \
-	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
-	    -e 's|${DEBUG_PREFIX_MAP}||g' \
-	    -e 's:${HOSTTOOLS_DIR}/::g' \
-	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/Makefile.inc \
-	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/pkgdata.inc
+
+	remove_build_host_references
+}
+
+do_install:append:class-nativesdk() {
+	remove_build_host_references
 }
 
 PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
-- 
2.17.1


