Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id A547475454
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Apr 2018 09:05:44 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id p142-v6so3612046lfd.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Apr 2018 02:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vXl38sCfrA3YvaUs725cgAHLLCCgsmaMuK3r3ezmYlc=;
	b=NLdV3i6JJ5N+uu01p7Wik1gSXQsMKAHB/vccPiBuVrMsfe4wUgqxi/NSdHhbErxqxF
	8K7nn2sRdwlBdoY+PbOfsl6OXxY7nvx6jeQtOzFTd2b7HeR0HicuNLDmmTzB80vQZna6
	GU2c1D4mPceUdO4kGHQ2d7aKlOIGznAKiNqTQ/xRI/2rKvRVDVaUMbFQFUvNM3kgc8GE
	8C29ufRfL+30TGGk1rCsshcmZBNSRyFYxNFl7623df0kJoGe6IPuMbdff4rKqQxAfBUp
	Hod7eJo92aYZceI26S42CzIlYEddi46BVwh8NlRKzKN+pHi4bn+wL8B4BcLViH0E6hol
	36ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vXl38sCfrA3YvaUs725cgAHLLCCgsmaMuK3r3ezmYlc=;
	b=PhlsW85DTtkkJVRp6o4N8ZsheB9qV43zruI4mPSYjTbEjnKYOf1diQDdOAIyKjg3YN
	r0lxrqt3zqLOZTGpGqMXkqZJFJ2w69oMv1w+soHh4mIdrFCseo2f5P0GKy3t0W4J966P
	EHKEptWegNirJBM0Bh7pllki5TaIRoAI64uEp3cPDFfqv6fOVzNMj71apKr/aZmR8W2c
	il3Ofu6bVHzI6N61pAO0PTpfV652r4yM6uFyshZZqVodk6MTXKlMW3aJWXw48gxg6WGC
	day7wJhD8QmlJeNgKoPkjUGCQjpUPlntopW9paWaLItwe45auXxVrxBzW0Uu09GrU5xc
	T9Ng==
X-Gm-Message-State: ALQs6tAKTyISfW65o1GMS9BEUPL3oI9UzbpmTeNjz+fsVavPCBVibz9m
	du2cuE7FW+xZXgC4SD2mkImJ9w==
X-Google-Smtp-Source: AIpwx4/bMvNyWk6oeHwVotTiIp7nVFr+v7kJC99ErFKcD/64tXvZz2tHkcG6IHmfeZJhBKjCTQ/ETA==
X-Received: by 10.46.99.93 with SMTP id x90mr18916261ljb.2.1523091944520;
	Sat, 07 Apr 2018 02:05:44 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan (d83-183-77-184.cust.tele2.se.
	[83.183.77.184]) by smtp.gmail.com with ESMTPSA id
	k66sm2061456lje.82.2018.04.07.02.05.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 02:05:43 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Apr 2018 11:05:27 +0200
Message-Id: <1523091927-15811-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] meta: conf: avoid appending LIBCOVERRIDE to OVERRIDES
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
X-List-Received-Date: Sat, 07 Apr 2018 09:05:45 -0000

From: Ming Liu <liu.ming50@gmail.com>

The order of any other overrides should be before forcevariable, or
else it will get the highest priority.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/native.bbclass                   | 2 --
 meta/classes/nativesdk.bbclass                | 2 +-
 meta/conf/bitbake.conf                        | 3 ++-
 meta/conf/distro/include/tclibc-baremetal.inc | 5 ++---
 meta/conf/distro/include/tclibc-glibc.inc     | 5 ++---
 meta/conf/distro/include/tclibc-musl.inc      | 5 ++---
 6 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index a911f2a..775be04 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -106,8 +106,6 @@ PKG_CONFIG_SYSROOT_DIR = ""
 PKG_CONFIG_SYSTEM_LIBRARY_PATH[unexport] = "1"
 PKG_CONFIG_SYSTEM_INCLUDE_PATH[unexport] = "1"
 
-# we dont want libc-*libc to kick in for native recipes
-LIBCOVERRIDE = ""
 CLASSOVERRIDE = "class-native"
 MACHINEOVERRIDES = ""
 MACHINE_FEATURES = ""
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 69fb45c..b6858d2 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -6,7 +6,7 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
 
 # libc for the SDK can be different to that of the target
 NATIVESDKLIBC ?= "libc-glibc"
-LIBCOVERRIDE = ":${NATIVESDKLIBC}"
+LIBCOVERRIDE = "${NATIVESDKLIBC}"
 CLASSOVERRIDE = "class-nativesdk"
 MACHINEOVERRIDES = ""
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 93f57f3..f240999 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -729,10 +729,11 @@ DISTRO_NAME ??= "OpenEmbedded"
 #
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
-OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
+OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:${LIBCOVERRIDE}:forcevariable"
 CLASSOVERRIDE ?= "class-target"
 DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
 MACHINEOVERRIDES ?= "${MACHINE}"
+LIBCOVERRIDE ?= ""
 
 FILESOVERRIDES = "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}"
 
diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
index a8ce6d3..4c7804e 100644
--- a/meta/conf/distro/include/tclibc-baremetal.inc
+++ b/meta/conf/distro/include/tclibc-baremetal.inc
@@ -4,9 +4,8 @@
 
 LIBCEXTENSION = ""
 
-# Add baremetal libc overrides to the overrides.
-LIBCOVERRIDE = ":libc-baremetal"
-OVERRIDES .= "${LIBCOVERRIDE}"
+# Set baremetal libc overrides.
+LIBCOVERRIDE = "libc-baremetal"
 
 ASSUME_PROVIDED += "virtual/libc virtual/libiconv"
 
diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
index ad8000f..672dbfb 100644
--- a/meta/conf/distro/include/tclibc-glibc.inc
+++ b/meta/conf/distro/include/tclibc-glibc.inc
@@ -4,9 +4,8 @@
 
 LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') != '']}"
 
-# Add glibc overrides to the overrides for glibc.
-LIBCOVERRIDE = ":libc-glibc"
-OVERRIDES .= "${LIBCOVERRIDE}"
+# Set glibc overrides.
+LIBCOVERRIDE = "libc-glibc"
 
 PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index 54e1acf..cd06b11 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -4,9 +4,8 @@
 
 LIBCEXTENSION = "-musl"
 
-# Add musl libc overrides to the overrides.
-LIBCOVERRIDE = ":libc-musl"
-OVERRIDES .= "${LIBCOVERRIDE}"
+# Set musl libc overrides.
+LIBCOVERRIDE = "libc-musl"
 
 PREFERRED_PROVIDER_virtual/libc ?= "musl"
 PREFERRED_PROVIDER_virtual/libiconv ?= "musl"
-- 
2.7.4


