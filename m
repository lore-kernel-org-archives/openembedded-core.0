Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.24868.1611512816033822516
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 10:26:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pj3MruyM;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id c12so10061451wrc.7
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 10:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IUpJgk/qQtbV13/G7lv00+Y5EPoWv2EtbUM/E0AVQQk=;
        b=Pj3MruyMSYyDpNFvWGgC7xbJveHlBPz1sbv0WWtYZq6DkNOmJNad7Tunb+znlNi4pQ
         Jzf5XkoYLgxUvxeTXrYdu/g+n+1DW/vM5RvkMRtHyfH5NoRXXpAGMMqfcE9kSRkJyfBW
         +YMFjJuw1gEvf6I71pZbgtI/loGvVX6VDLtBlAaqkZhCbyVnIHm2pTWSg0WCK/9DDsSr
         S5dJ7oBf7bRdAp25IV2JbLH1KB3RsEuGDZKw9ZhQDIyS8v5tve5HeVk0IJTul+28FPZW
         lywhLn2I4+uIxo71zQFRHJillCGxRMAvBvP0/U4/tUt5pXN7QfxE3Jy2HKii6lW5jp1V
         SQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IUpJgk/qQtbV13/G7lv00+Y5EPoWv2EtbUM/E0AVQQk=;
        b=V0VRUtByIWFeSGXutKOp4f5aV1NscaVi8FL7cjxufKHotBFuVaHi1NDLMuxk/s75zg
         +01Edu64jfOq7xmW8oCqlCoH3zdQdR3SOZ3xYpmQ243y8dHDuxDVT4qUVdSmNU4J3l5I
         DLd3I0IPBxd+IppCKjwToX3olZi+z+rmJNiO4I1XTkgFt05WlrKzU9fRgLioXXR6qkH9
         xkbLVUiMl+sxRNeHIR9HSPCk6CnsmhSAZSuAy7drkLkaHDzNhHTPGNKJV7mjq29rHWtX
         aHBvssFZE4M2hckUprE6KevA/i/5xp+1N0Lvz701y/ZZl9jPvK5ymC/dbHUoEzM9YJ1A
         69Xg==
X-Gm-Message-State: AOAM532NCedwf8Ihf4WIBE57wLnRyD7sxX2TfZ3AXgwFEO6mQQAhmcMT
	02tpoXxgE5jjnqTCCFX9UCS2HnSgdB+RSg==
X-Google-Smtp-Source: ABdhPJzT9jAbXaMD2BRWl1CFXabAyq5qkk/9NMpWnJCFA+nHOvK2B4Jno2+R56udwuVjLj0l69Corw==
X-Received: by 2002:a5d:62c1:: with SMTP id o1mr2769698wrv.275.1611512814592;
        Sun, 24 Jan 2021 10:26:54 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id p18sm18365509wmc.31.2021.01.24.10.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 10:26:54 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/4] spirv-tools: cleanup
Date: Sun, 24 Jan 2021 18:26:45 +0000
Message-Id: <20210124182647.1613511-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210124182647.1613511-1-quaresma.jose@gmail.com>
References: <20210124182647.1613511-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- spirv-headers is provived in a separete receipe, so add it as dependencie
- add a new package spirv-tools-lesspipe that needs bash
- remove unneeded external sources

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../spir/spirv-tools_2020.6.bb                | 31 ++++++-------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
index eb07833f22..2c855d8d8e 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
@@ -2,37 +2,26 @@ SUMMARY  = "The SPIR-V Tools project provides an API and commands for \
 processing SPIR-V modules"
 DESCRIPTION = "The project includes an assembler, binary module parser, \
 disassembler, validator, and optimizer for SPIR-V."
+SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SECTION = "graphics"
 
+SRCREV = "b27b1afd12d05bf238ac7368bb49de73cd620a8e"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
-DEST_DIR = "${S}/external" 
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;name=spirv-tools \
-           git://github.com/KhronosGroup/SPIRV-Headers.git;name=spirv-headers;destsuffix=${DEST_DIR}/spirv-headers \
-           git://github.com/google/effcee.git;name=effcee;destsuffix=${DEST_DIR}/effcee \
-           git://github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2 \
-           git://github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest \
-           file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch;destsuffix=${DEST_DIR}/effcee \
-"
-SRCREV_spirv-tools = "b27b1afd12d05bf238ac7368bb49de73cd620a8e"
-SRCREV_spirv-headers = "f027d53ded7e230e008d37c8b47ede7cd308e19d"
-SRCREV_effcee = "cd25ec17e9382f99a895b9ef53ff3c277464d07d"
-SRCREV_re2 = "5bd613749fd530b576b890283bfb6bc6ea6246cb"
-SRCREV_googletest = "f2fb48c3b3d79a75a88a99fba6576b25d42ec528"
 
 inherit cmake python3native
 
-EXTRA_OECMAKE += "-DSPIRV_WERROR=OFF"
+DEPENDS = "spirv-headers"
 
-do_install_append() {
-	install -d ${D}/${includedir}/spirv
-	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}${includedir}/spirv
-	install -d ${D}/${includedir}/spirv/unified1
-	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified1/* ${D}${includedir}/spirv/unified1
-}
+EXTRA_OECMAKE += "-DSPIRV-Headers_SOURCE_DIR=${STAGING_EXECPREFIXDIR}"
 
 FILES_SOLIBSDEV = ""
 FILES_${PN} += "${libdir}/*.so"
 
+PACKAGES =+ "${PN}-lesspipe"
+FILES_${PN}-lesspipe = "${base_bindir}/spirv-lesspipe.sh"
+RDEPENDS_${PN}-lesspipe += "${PN} bash"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.0

