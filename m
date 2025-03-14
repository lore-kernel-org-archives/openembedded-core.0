Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D10C35FF6
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 19:36:03 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.2791.1741980961774325486
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 12:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pIPw85Ej;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2243803b776so69447075ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 12:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741980961; x=1742585761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PasTneidHq5WEFQ/gaNGyX+n1seXwU4hAiVB8jQbGMo=;
        b=pIPw85EjQztFvDRprvRYJLZLJerayciFXHVcEZwjc11S6IOcsiXF74O7TcSYOuje7h
         GtR6zELY15C/EvgXh1O9Y2L5suOfjyQrHfC/vaaE4S7hFqP8MAwz+1IwwtOgUsesWmtI
         89JAqQYUUxgfH4EsnHgqXkKLSh9ZnMMlI+XAbmFUVPEy8EAJj5unPMj+0kzGSFbBoKSC
         SxeM7achaUmomMly2fKhErT+OnC24NnPJg9lEKJgMga0lA8Zncny9+fNc/R+PYXmRqz6
         ZQYyLiDIYqxYdzB4kK9aXvOFa28R5Qs2BVsHYJPruEPu32jD8d1W44QkOGMivDNb2jxl
         fgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741980961; x=1742585761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PasTneidHq5WEFQ/gaNGyX+n1seXwU4hAiVB8jQbGMo=;
        b=CqlsD7QodffE5gR8CLKYQspb/toIbiTWTqoHyKXuHv6uUyt1gNutOMy4yrxHFofBsf
         1lUfAD6n4fZlLD9RUPxLh0xUtSd52jCKw8CaEBm0+9JJ4YnxE58QwZ+Pqef4t6xGXgbL
         cK2a/susgIdH6RliEdNWffL58BVxL18fKAqmCsapNwNPiaNXEUo727lzFOmcNFDN2SV2
         LhzCYkFUma35I5a8ZhJv3v9dPJgDX1YBLPHa5wK0U7z4dxp7r/SnJOo58BJbFHswmfku
         wehdj3U83eznEmC8sYsa4Lk9d3cycbqVquNQa3cMZ35EomMMQ2V7MlffBHAGc0cPLX9I
         wF4w==
X-Gm-Message-State: AOJu0Yx87FPOIcj+8KiVm6JhJBs4yB9Dr5RIxgt9x4isXp8SugHPMKZT
	JYvXzlycFa/sVDB5QQwh6wtTgLWGWa8FbeijQe9Fk50la6o2exphhAC47z0CBlfh2DfJAkfWEQw
	9
X-Gm-Gg: ASbGncuCsAY9VO8aYa7v4oQNCZGFIth11jzBeX02AxEUHDr9y2RjMgbtG7HB2OzH2PO
	lYbfH+6PjybOSlrUX+eDowgyYpfhhoqmDj3oibO52l3mNcYgv2Yj7AIJhR6PXhQcGaEzPzbJfaY
	7ytq62aB//9BSr+sOzgxKcp7cHDa5esVDihxMGVWCdVtX5GsuGGbzuy1Pgrd0Q5Z0X7R5xGe6X/
	P106+NffKst1ERMhqV3+TW7bmdW11OB/jOpRjo8880hooCn0PkkpRNu+DT9c6stZgbZzTlSLSLe
	LzbKsZEBgzYooIAxazwdqmFJnWuC/pD7SuCW
X-Google-Smtp-Source: AGHT+IGZAeoZclFOsxgMWUo39fkGtivBWoH3fZn1XBMjaen563l9Mvy58zooLTsDLm+DIp2FIZn0RQ==
X-Received: by 2002:a17:903:1a0b:b0:220:cd9a:a167 with SMTP id d9443c01a7336-225e0a19f52mr56348445ad.4.1741980960961;
        Fri, 14 Mar 2025 12:36:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6978:e88e:1ab7:676a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d5dsm32265685ad.153.2025.03.14.12.36.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 12:36:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/4] gcc: remove paths to sysroot from configargs.h and checksum-options for gcc-cross-canadian
Date: Fri, 14 Mar 2025 12:35:38 -0700
Message-ID: <b1aa13b9f656666458189d4dae0c25564abe2f25.1741980835.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741980835.git.steve@sakoman.com>
References: <cover.1741980835.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 19:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212862

From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>

Apply fixes from gcc-cross (84a78f46d594 and 0ead8cbdfb96) to gcc-cross-canadian.
This will improve (but not fix) reproducibility of gcc-cross-canadian.
Also move this code to functions to avoid code duplication.

[RP: Tweak patch to make the function parameters clear and fix quoting issues
ensuring the code exactly matches the original replacements with an additional
parameter.]

(From OE-Core rev: 350ff7d53f7506de2bc01f0efc569b8294b9afea)

Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f1ad5be4337c5d45c0f1bed48184336e9ab1fad8)
Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc      | 22 +++++++++++++++++++
 .../gcc/gcc-configure-common.inc              |  1 -
 .../gcc/gcc-cross-canadian.inc                |  3 +++
 meta/recipes-devtools/gcc/gcc-cross.inc       | 15 ++-----------
 meta/recipes-devtools/gcc/gcc-target.inc      | 16 ++------------
 5 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 5ac82b1b57..7f5cc109e6 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -116,3 +116,25 @@ target_prefix ?= "${prefix}"
 # The real WORKDIR location isn't a dependency for the shared workdir.
 src_patches[vardepsexclude] = "WORKDIR"
 should_apply[vardepsexclude] += "PN"
+
+remove_sysroot_paths_from_configargs () {
+	replacement=${1}
+	# Prevent sysroot path from being used in configargs.h header, as it will
+	# be rewritten when used by other sysroots preventing support for gcc
+	# plugins. Additionally the path is embeddeded into the output binary, this
+	# prevents building a reproducible binary.
+	oe_runmake configure-gcc
+	sed -i "s@${STAGING_DIR_TARGET}@$replacement@g" ${B}/gcc/configargs.h
+	sed -i "s@${STAGING_DIR_HOST}@/$replacement@g" ${B}/gcc/configargs.h
+}
+
+remove_sysroot_paths_from_checksum_options () {
+	stagingdir=${1}
+	replacement=${2}
+	# Prevent sysroot/workdir paths from being used in checksum-options.
+	# checksum-options is used to generate a checksum which is embedded into
+	# the output binary.
+	oe_runmake TARGET-gcc=checksum-options all-gcc
+	sed -i "s@${DEBUG_PREFIX_MAP}@@g" ${B}/gcc/checksum-options
+	sed -i "s@$stagingdir@$replacement@g" ${B}/gcc/checksum-options
+}
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index dba25eb754..bc17f10468 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -119,4 +119,3 @@ do_configure () {
 
 	oe_runconf
 }
-
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index ec87b46219..adcaef2b0f 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -63,6 +63,9 @@ do_configure () {
 }
 
 do_compile () {
+	remove_sysroot_paths_from_configargs '/host'
+	remove_sysroot_paths_from_checksum_options '${STAGING_DIR_HOST}' '/host'
+
 	oe_runmake all-host configure-target-libgcc
 	(cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c unwind.h md-unwind-support.h sfp-machine.h gthr-default.h)
 }
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index a540fb2434..1dbb6dc42b 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -61,19 +61,8 @@ do_compile () {
 	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
 	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
 
-	# Prevent native/host sysroot path from being used in configargs.h header,
-	# as it will be rewritten when used by other sysroots preventing support
-	# for gcc plugins
-	oe_runmake configure-gcc
-	sed -i 's@${STAGING_DIR_TARGET}@/host@g' ${B}/gcc/configargs.h
-	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/configargs.h
-
-	# Prevent sysroot/workdir paths from being used in checksum-options.
-	# checksum-options is used to generate a checksum which is embedded into
-	# the output binary.
-	oe_runmake TARGET-gcc=checksum-options all-gcc
-	sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
-	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/checksum-options
+	remove_sysroot_paths_from_configargs '/host'
+	remove_sysroot_paths_from_checksum_options '${STAGING_DIR_HOST}' '/host'
 
 	oe_runmake all-host configure-target-libgcc
 	(cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c unwind.h md-unwind-support.h sfp-machine.h gthr-default.h)
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 7dac3ef422..f51d94cd65 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -140,20 +140,8 @@ FILES:${PN}-doc = "\
 "
 
 do_compile () {
-	# Prevent full target sysroot path from being used in configargs.h header,
-	# as it will be rewritten when used by other sysroots preventing support
-	# for gcc plugins. Additionally the path is embeddeded into the output
-	# binary, this prevents building a reproducible binary.
-	oe_runmake configure-gcc
-	sed -i 's@${STAGING_DIR_TARGET}@/@g' ${B}/gcc/configargs.h
-	sed -i 's@${STAGING_DIR_HOST}@/@g' ${B}/gcc/configargs.h
-
-	# Prevent sysroot/workdir paths from being used in checksum-options.
-	# checksum-options is used to generate a checksum which is embedded into
-	# the output binary.
-	oe_runmake TARGET-gcc=checksum-options all-gcc
-	sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
-	sed -i 's@${STAGING_DIR_TARGET}@/@g' ${B}/gcc/checksum-options
+	remove_sysroot_paths_from_configargs '/'
+	remove_sysroot_paths_from_checksum_options '${STAGING_DIR_TARGET}' '/'
 
 	oe_runmake all-host
 }
-- 
2.43.0


