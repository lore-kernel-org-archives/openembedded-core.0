Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58020E6917F
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:05 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87662.1766434080982500664
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cTQJ1ZVU;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64b8123c333so6099211a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434079; x=1767038879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fn2nN/z3P3xyAUAXqnRX8ZY6crQMMp46676KGITJzIY=;
        b=cTQJ1ZVUn87yWUHjxpjyMx+Np3s14qqQqz/6iLiVX1oXzalG6HXguMBwJgVlDi7VBo
         kg6tHVjPj2Lt70P+0pcOJEM8Fhfz60b2IU7r6h7r+7z/M6f/al6fJQqaYu1ZWsF+Vekz
         yiCIJGFs/c//SdGMvMsaua8ZaAFNa4z2dLFclmJNfApJAJxIfLsvFRlQsoCgfFO/LHhU
         U/Z2hXP9qk5TIjUlecpALfk7/1fP9Drs4kvTT92kFlVdZm/wctH2SlQWfZlHQkqy9T7v
         YEmXEmPJUTO1Ao19JHtw7TWbo1OjjVfrXoytaGwHnPIQ9Vl+PeWf3MSo6ATJo5AtpzPP
         K5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434079; x=1767038879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fn2nN/z3P3xyAUAXqnRX8ZY6crQMMp46676KGITJzIY=;
        b=g134cFYrLRLbQYcT4Nc03WADvx8HpyTv/zCL+SCFMVqWbbZ5JDJjtQbxs8NjL4Eqq1
         ysRvaPN6GCpmzyUGlwoEENeBso9iMbOlUMzD1Z0fCBboxp8GYbn34p7aMdqMSZqZVJWF
         /WaUa13i3cBaLp12zhm3e2vrTfJNZ9RmFoU+dEhQLfhgfMLT0kHKW/I4cXb3y/3ltK31
         fG1Pws8Lu6Tje0YfqyC8CKR0VCOtCG0Xh+ddOElZ/ulTdwpal0+o71btRFYTM+9cRmJs
         4ZnrMDkRROkSSAVz+hvKTGvvAZh+Y4exQhm0EZlqr2XV5LUtARULZw9Jvlfh9avtJ8WD
         PRMg==
X-Gm-Message-State: AOJu0YxAOkbOPu4JIJ6r82yMwHcymllNodQJyaoekd0qO4B+/dOV6FEg
	Waq0gEcFQTHRQcq0rouZ0QfTr1Ug3hS6yp80KY5R6mAiTa6NrdJ2URjz5kxGEg==
X-Gm-Gg: AY/fxX6HdWpTZ58yZ1Qj2/NMIf2SrXfiF3b880/H2pRP5g+hGQCYjLU4Mww54eaXfjO
	88zlpdGbud9YeUe8YO/YRqb+6ZhvYPB9/QpNKAYPNxPBgEgxPgOxnGjNIyQtZA0aMlmKPzPFZCg
	/z4fadrjNmtgl75VXlaIwBbUvIZdiHBIGtmh4dl9VLoDJVRnjdQlBLqSQF2YsfaMsJ3UigUTKr5
	x2vO+LRI22Kll6UYqjpzo0X9CbXHoASm6RRdN/YO5RXrUP12YyAJppR1NhnzSq9c4JPx916WAG/
	giUQPbjXFF1ekFqBylI7Y9D8uDuzRZVgjCvt4rLC7SRm5i+udXiTZS3pcfdIzYx+2NqGXJbB/Ry
	SlRgGty+67PH67Qj0BL1bxg1AdxvBdzxcGaq7oogjELTwsk4TnOSlqtF9SvFhcRS7MxooDsX0UQ
	CsgXx2FVPVMqO/7x3BJlpvSR3+Okuo4Jn5/gQ4sd6xXsDjEOE=
X-Google-Smtp-Source: AGHT+IF11nih8xzLnoXnGKL1vp7f3ZXgbjCQ98+4jQQDjEDom+09pJS/JLoXVuJNzDP9rnWApJlpdg==
X-Received: by 2002:a17:907:a089:b0:b7d:11b0:31ca with SMTP id a640c23a62f3a-b8037228fddmr1112904166b.65.1766434079165;
        Mon, 22 Dec 2025 12:07:59 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 020/114] icu: upgrade 77-1 -> 78.1
Date: Mon, 22 Dec 2025 21:06:02 +0100
Message-ID: <20251222200739.2278706-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228345

From: Alexander Kanavin <alex@linutronix.de>

Upstream has adopted the . as version separator, so custom recipe logic
can be dropped.

License-Update: additional files under MIT.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../icu/{icu_77-1.bb => icu_78.1.bb}          | 36 +++++++------------
 1 file changed, 12 insertions(+), 24 deletions(-)
 rename meta/recipes-support/icu/{icu_77-1.bb => icu_78.1.bb} (84%)

diff --git a/meta/recipes-support/icu/icu_77-1.bb b/meta/recipes-support/icu/icu_78.1.bb
similarity index 84%
rename from meta/recipes-support/icu/icu_77-1.bb
rename to meta/recipes-support/icu/icu_78.1.bb
index 7c9483c975..8827f05f51 100644
--- a/meta/recipes-support/icu/icu_77-1.bb
+++ b/meta/recipes-support/icu/icu_78.1.bb
@@ -5,7 +5,7 @@ internationalization (I18N) and globalization (G11N), giving applications the \
 same results on all platforms."
 HOMEPAGE = "https://icu.unicode.org/"
 
-LICENSE = "ICU"
+LICENSE = "ICU & MIT"
 DEPENDS = "icu-native"
 
 CVE_PRODUCT = "international_components_for_unicode"
@@ -25,7 +25,7 @@ EXTRA_OECONF:class-native = "--disable-icu-config ac_cv_path_install='install -c
 EXTRA_OECONF:class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config ac_cv_path_install='install -c'"
 EXTRA_OECONF:append:class-target = " --enable-automake-test-format"
 EXTRA_OECONF:append:class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
-TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${@icu_install_folder(d)}\\""', '', d)}"
+TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
 
 ASNEEDED = ""
 
@@ -61,16 +61,16 @@ remove_build_host_references() {
 	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
 	    -e 's|${DEBUG_PREFIX_MAP}||g' \
 	    -e 's:${HOSTTOOLS_DIR}/::g' \
-	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/Makefile.inc \
-	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/pkgdata.inc
+	    ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
+	    ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
 }
 
 do_install:append:class-target() {
     # The native pkgdata can not generate the correct data file.
     # Use icupkg to re-generate it.
     if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
-        rm -f ${D}/${datadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat
-        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat
+        rm -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
+        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
     fi
 
 	remove_build_host_references
@@ -92,28 +92,16 @@ FILES:libicuio = "${libdir}/libicuio.so.*"
 
 BBCLASSEXTEND = "native nativesdk"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=cf57d9459a2c5f88ecd83c75207cc5ff"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=e531a388be7c1df9a0fb7b4010c9c1d7"
 
-def icu_download_version(d):
-    pvsplit = d.getVar('PV').split('-')
-    return pvsplit[0] + "_" + pvsplit[1]
-
-def icu_download_folder(d):
-    pvsplit = d.getVar('PV').split('-')
-    return pvsplit[0] + "-" + pvsplit[1]
-
-def icu_install_folder(d):
-    pvsplit = d.getVar('PV').split('-')
-    return pvsplit[0] + "." + pvsplit[1]
-
-ICU_PV = "${@icu_download_version(d)}"
-ICU_FOLDER = "${@icu_download_folder(d)}"
+ICU_PV = "${PV}"
+ICU_FOLDER = "${PV}"
 
 # http://errors.yoctoproject.org/Errors/Details/20486/
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 
-BASE_SRC_URI = "${GITHUB_BASE_URI}/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-src.tgz"
+BASE_SRC_URI = "${GITHUB_BASE_URI}/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-sources.tgz"
 DATA_SRC_URI = "${GITHUB_BASE_URI}/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-data.zip"
 SRC_URI = "${BASE_SRC_URI};name=code \
            ${DATA_SRC_URI};name=data \
@@ -128,8 +116,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
 SRC_URI:append:class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "588e431f77327c39031ffbb8843c0e3bc122c211374485fa87dc5f3faff24061"
-SRC_URI[data.sha256sum] = "1e08bfafa442260ccabf9a872d4eab12de813d42b90769df056bab032b37e1d3"
+SRC_URI[code.sha256sum] = "6217f58ca39b23127605cfc6c7e0d3475fe4b0d63157011383d716cb41617886"
+SRC_URI[data.sha256sum] = "e7b652244f27194e0ea46a0d21cfc714ee8a818e1fd82d51a93bc91516fdcf65"
 
 UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>(?!.+rc).+)"
 GITHUB_BASE_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.47.3


