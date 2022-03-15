Return-Path: <arnout.vandecappelle@essensium.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3DAC433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:57:06 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.11229.1647352623827789387
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=bxkm/RL4;
 spf=pass (domain: essensium.com, ip: 209.85.208.46,
 mailfrom: arnout.vandecappelle@essensium.com)
Received: by mail-ed1-f46.google.com with SMTP id b15so20203600edn.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iNZwPLsnM3fOofmqegAN5+bRTyrCBtLqMHwd7lOQLnw=;
        b=bxkm/RL4jAjmeER0lWk/rnZDbk/wUWeeCtY0KsHXbNSXB7Csk81zCFcA5R8P+WWLw+
         7Jt4arI4HY+nnsLn4FElAJKjg6iJJP2ZEHET/6+VkBxVJycR0kANYz8jGql23dQfLfiX
         c8hFm4lU6jEeq98GdUUt9dIKQEPmpawX7J/tPvlH/uTwJbGNGPlySa5Nbm2S56l0/JP1
         qwtKz2fhFSoh/NpJpL8jw3kpUP/1CiyAEHvqXa5Q4+ooSewbLZGsIsqW1IREIbemhSI8
         g1D5DGHppdiEEw8dxvtJJl5QFdDWoWiU9eHWYQ+5FLNwgoBK/208D+L0mN9p2vNnx2HJ
         oNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iNZwPLsnM3fOofmqegAN5+bRTyrCBtLqMHwd7lOQLnw=;
        b=zEmZa1xQBkeWhwDR22waz6kN3xX9bXIyNS28u+D/ZX+7iPo8i2zbIYBeV0qibZaecS
         2RIhN/CzZVFOfSP9S83wA/5AtGSdD6FbEYt5+H9A5yxujPcSyr252+IOLF2x6malAFnv
         vUgJbABdKKtDmEKJ94Ybg7z+884Ja89bKMoPW+tcuA9fwwBA9cyozSYmsiKr0emuk1gq
         Qhb074Btwl4BSYsTsje46iz7byQCcTqNinu/Jt2djL391p589xElInEMkugFush0pZbq
         O2/aFDBS++S5T/j6TvKfhILx3RFEiUlAr8y+jBbNm43rPCbTfG4HwejFPEMEPonCyhgX
         hzhA==
X-Gm-Message-State: AOAM5311VL+47Hj8DMMfffR9meXIUh/AUsyevNwqV11BdbTCE2Mjd5vj
	3t18exg/YUhFF13eMK6p8rKr7m+bEoCbTA==
X-Google-Smtp-Source: 
 ABdhPJwMCb1s272tT2xH1rolSZ94050oGWpvDnOvwE9Eb5D6Rc0y2E9bQ93TQgSl2CERB0ee/IRTuQ==
X-Received: by 2002:a05:6402:d08:b0:418:82ff:5aae with SMTP id
 eb8-20020a0564020d0800b0041882ff5aaemr9751887edb.400.1647352621752;
        Tue, 15 Mar 2022 06:57:01 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
        by smtp.gmail.com with ESMTPSA id
 x12-20020a50d9cc000000b0040f70fe78f3sm9913947edj.36.2022.03.15.06.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 06:57:01 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Subject: [PATCH] sdk: support uppercase characters in MACHINE
Date: Tue, 15 Mar 2022 14:56:46 +0100
Message-Id: <20220315135646.3687446-1-arnout@mind.be>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:57:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163287

There are no real constraints on the values that MACHINE can take, it's
perfectly possible to define a machine with uppercase letters, and
building for that machine works fine.

However, the (extensible) SDK targets include packages and packagegroups
that have MACHINE in their name, and uppercase letters are not allowed
in package names.

Therefore, convert the machine name to lowercase when it's used as a
package name: for meta-environment, meta-environment-extsdk,
packagegroup-cross-canadian, packagegroup-go-cross-canadian and
packagegroup-rust-cross-canadian. Propagate this change to other places
where those packages are referred to.

Alternatively, it would be possible to outright disallow uppercase
letters in MACHINE. However, this would affect any existing
configuration that currently works fine except for building the SDK.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I have only tested this with the base SDK, not with the extensible SDK.
I also haven't tested the changes to tclibc-baremetal, tclibc-newlib,
packagegroup-go-cross-canadian, packagegroup-rust-cross-canadian and
maintainers.inc. packagegroup-rust-cross-canadian doesn't even seem to
be used anywhere, so I guess this change would need to be propagated
somewhere externally.

Ideally in addition to lowercasing, any other illegal package name
variables should also be removed or converted. It's less likely though
that other invalid characters would be used, since that will easily
break existing recipes. Also I couldn't find a conventient function to
make such a conversion.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 meta/classes/populate_sdk_base.bbclass                        | 2 +-
 meta/classes/populate_sdk_ext.bbclass                         | 2 +-
 meta/conf/distro/include/maintainers.inc                      | 4 ++--
 meta/conf/distro/include/tclibc-baremetal.inc                 | 2 +-
 meta/conf/distro/include/tclibc-newlib.inc                    | 2 +-
 meta/recipes-core/meta/meta-environment-extsdk.bb             | 2 +-
 meta/recipes-core/meta/meta-environment.bb                    | 2 +-
 meta/recipes-core/meta/meta-go-toolchain.bb                   | 2 +-
 .../recipes-core/packagegroups/packagegroup-cross-canadian.bb | 4 ++--
 .../packagegroups/packagegroup-go-cross-canadian.bb           | 2 +-
 .../packagegroups/packagegroup-rust-cross-canadian.bb         | 2 +-
 11 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 16f929bf59..d58c881cc3 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -43,7 +43,7 @@ B:task-populate-sdk = "${SDK_DIR}"
 
 SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
 
-TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-${MACHINE}"
+TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-${@d.getVar('MACHINE', True).lower()}"
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_TARGET_TASK ?= "${@multilib_pkg_extend(d, 'packagegroup-core-standalone-sdk-target')} target-sdk-provides-dummy"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index e2019f9bbf..f2a2d9cde0 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -4,7 +4,7 @@ inherit populate_sdk_base
 
 # Used to override TOOLCHAIN_HOST_TASK in the eSDK case
 TOOLCHAIN_HOST_TASK_ESDK = " \
-    meta-environment-extsdk-${MACHINE} \
+    meta-environment-extsdk-${@d.getVar('MACHINE', True).lower()} \
     "
 
 SDK_RELOCATE_AFTER_INSTALL:task-populate-sdk-ext = "0"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index a8eceaadf4..6d1b3f4ced 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -495,8 +495,8 @@ RECIPE_MAINTAINER:pn-mesa = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER:pn-mesa-demos = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER:pn-mesa-gl = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER:pn-meson = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER:pn-meta-environment-${MACHINE} = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-meta-environment-extsdk-${MACHINE} = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-meta-environment-${@d.getVar('MACHINE', True).lower()} = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-meta-environment-extsdk-${@d.getVar('MACHINE', True).lower()} = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-meta-extsdk-toolchain = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-meta-go-toolchain = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-meta-ide-support = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
index f3d27bbaae..2e216a4158 100644
--- a/meta/conf/distro/include/tclibc-baremetal.inc
+++ b/meta/conf/distro/include/tclibc-baremetal.inc
@@ -27,7 +27,7 @@ BASEDEPENDS:remove:class-target = "virtual/${TARGET_PREFIX}compilerlibs"
 TARGET_OS = "elf"
 TARGET_OS:arm = "eabi"
 
-TOOLCHAIN_HOST_TASK ?= "packagegroup-cross-canadian-${MACHINE} nativesdk-qemu nativesdk-sdk-provides-dummy"
+TOOLCHAIN_HOST_TASK ?= "packagegroup-cross-canadian-${@d.getVar('MACHINE', True).lower()} nativesdk-qemu nativesdk-sdk-provides-dummy"
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_TARGET_TASK ?= "libgcc-dev"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE:remove = "virtual/${MLPREFIX}libc zlib ncurses"
diff --git a/meta/conf/distro/include/tclibc-newlib.inc b/meta/conf/distro/include/tclibc-newlib.inc
index 238b430e49..25c03f0aa4 100644
--- a/meta/conf/distro/include/tclibc-newlib.inc
+++ b/meta/conf/distro/include/tclibc-newlib.inc
@@ -38,7 +38,7 @@ BASE_DEFAULT_DEPS:append:class-target = " ${NEWLIB_EXTENDED}"
 TARGET_OS = "elf"
 TARGET_OS:arm = "eabi"
 
-TOOLCHAIN_HOST_TASK ?= "packagegroup-cross-canadian-${MACHINE} nativesdk-qemu nativesdk-sdk-provides-dummy"
+TOOLCHAIN_HOST_TASK ?= "packagegroup-cross-canadian-${@d.getVar('MACHINE', True).lower()} nativesdk-qemu nativesdk-sdk-provides-dummy"
 TOOLCHAIN_TARGET_TASK ?= "${LIBC_DEPENDENCIES}"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE:remove = "zlib ncurses"
 
diff --git a/meta/recipes-core/meta/meta-environment-extsdk.bb b/meta/recipes-core/meta/meta-environment-extsdk.bb
index 706312b0d6..15a86c613c 100644
--- a/meta/recipes-core/meta/meta-environment-extsdk.bb
+++ b/meta/recipes-core/meta/meta-environment-extsdk.bb
@@ -2,7 +2,7 @@
 
 require meta-environment.bb
 
-PN = "meta-environment-extsdk-${MACHINE}"
+PN = "meta-environment-extsdk-${@d.getVar('MACHINE', True).lower()}"
 
 create_sdk_files:append() {
 	local sysroot=${SDKPATH}/tmp/${@os.path.relpath(d.getVar('STAGING_DIR'), d.getVar('TMPDIR'))}/${MACHINE}
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 7118fb2aef..146f90e7df 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -69,7 +69,7 @@ do_install() {
     install -m 0644 -t ${D}/${SDKPATH} ${SDK_OUTPUT}/${SDKPATH}/*
 }
 
-PN = "meta-environment-${MACHINE}"
+PN = "meta-environment-${@d.getVar('MACHINE', True).lower()}"
 PACKAGES = "${PN}"
 FILES:${PN}= " \
     ${SDKPATH}/* \
diff --git a/meta/recipes-core/meta/meta-go-toolchain.bb b/meta/recipes-core/meta/meta-go-toolchain.bb
index c24518efe3..4d405f9b94 100644
--- a/meta/recipes-core/meta/meta-go-toolchain.bb
+++ b/meta/recipes-core/meta/meta-go-toolchain.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 inherit populate_sdk
 
 TOOLCHAIN_HOST_TASK:append = " \
-    packagegroup-go-cross-canadian-${MACHINE} \
+    packagegroup-go-cross-canadian-${@d.getVar('MACHINE', True).lower()} \
 "
 
 TOOLCHAIN_TARGET_TASK:append = " \
diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index 49c075eb11..80cc202233 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Host SDK package for cross canadian toolchain"
-PN = "packagegroup-cross-canadian-${MACHINE}"
+PN = "packagegroup-cross-canadian-${@d.getVar('MACHINE', True).lower()}"
 
 inherit cross-canadian packagegroup
 
@@ -14,7 +14,7 @@ RDEPENDS:${PN} = "\
     ${@all_multilib_tune_values(d, 'BINUTILS')} \
     ${@all_multilib_tune_values(d, 'GCC')} \
     ${@all_multilib_tune_values(d, 'GDB')} \
-    meta-environment-${MACHINE} \
+    meta-environment-${@d.getVar('MACHINE', True).lower()} \
     "
 
 # When TUNE_ARCH changes but MACHINE does not (for example when a machine definition is updated), 
diff --git a/meta/recipes-core/packagegroups/packagegroup-go-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-go-cross-canadian.bb
index d0596efe7a..6b10e816ba 100644
--- a/meta/recipes-core/packagegroups/packagegroup-go-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-go-cross-canadian.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Host SDK package for Go cross canadian toolchain"
-PN = "packagegroup-go-cross-canadian-${MACHINE}"
+PN = "packagegroup-go-cross-canadian-${@d.getVar('MACHINE', True).lower()}"
 
 inherit cross-canadian packagegroup
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
index 0d4f5ec9ef..4a347cba34 100644
--- a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Host SDK package for Rust cross canadian toolchain"
-PN = "packagegroup-rust-cross-canadian-${MACHINE}"
+PN = "packagegroup-rust-cross-canadian-${@d.getVar('MACHINE', True).lower()}"
 
 inherit cross-canadian packagegroup
 
-- 
2.35.1


