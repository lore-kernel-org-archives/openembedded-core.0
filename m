Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 03A87748D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 03:15:01 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id c19-v6so440983pls.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 20:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/poeU39aEsWm2bsObEvMCP222lDQlagPykoHzKUZYTY=;
	b=Q4J60nzbTr96OGyuYUQYdnA+rrgK7C9DP2SAdrGzfK5tNU2ntAXn4hPLEA7FYnjJJG
	uGGHjCaQiKZTu3IOdHBzglWmRICqZtNo87HYzIvMjS/bNRNCkIhOQi0Jauy5TVn3wZYS
	p4Ot13rv5yrhAY2IIr3sHJiPDA/vjcLOOzuXcFGhT31YgF8+jhBhnTuH8kuofziA3bIk
	ETujxtYCwVhT+cPZd982Lgv8WzXmsWjOgx6GEytWNHWgMKZSvdK2wQplRC+rVKoBo5cL
	4qbmhDAujbM88cktXpb5qyg2K3PXccv7zGkW6WnrqtOImFlrNtE2YMrLuAxt1EXAVaEm
	wu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/poeU39aEsWm2bsObEvMCP222lDQlagPykoHzKUZYTY=;
	b=CC8Q+InVpSAwni5wKIiUpVDwnH09J2CeUK9mpvObRuKbGKZ5bjFbC6bPdvu9gthZRu
	LyPDXM67tv07e6K8YcYgivx82aWauObHSctBiIafWWOKCLVF20U+TumtEzVf8PMTUcAe
	fVL/7Kxu/dgIaM4YZHlGCoKThnizDp8bscmlbQZgGgZzKTpIf1WgMpPC+NDTwQukwGMV
	G0WOErr7cYIcJ+0Txw1XxMDtBawd1v521Eu0CokDpttRGSK+OR3OsopvkllrgulwAGDt
	FsRF3PiBe1dOwVvLhmnpRwfbMZTDbtVlNrZHeD95QvRT6MrQmNBy2HMJ9tXE8BVtis0h
	Z4Kg==
X-Gm-Message-State: ALQs6tCoICnFvJVSwYrmpjHUe82KeetbD+bYacJ+hvSzF7R7zJkkY3VG
	FK/swkPMZaMWvEGhVB+jNSnWjw==
X-Google-Smtp-Source: AB8JxZr2EL3mspHPtDhg/TWNsHQ8S3xXeS+nlIc5FSC4U7UsCnjeKyAPuy+GnKMxKTDd3euoWuPpqw==
X-Received: by 2002:a17:902:566:: with SMTP id
	93-v6mr48533554plf.327.1525922102597; 
	Wed, 09 May 2018 20:15:02 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	203sm55271472pfz.131.2018.05.09.20.15.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 20:15:02 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 20:14:55 -0700
Message-Id: <1525922097-15292-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/3] bitbake.conf: make libc over-ride lower priority than _forcevariable
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
X-List-Received-Date: Thu, 10 May 2018 03:15:02 -0000

Fix long standing quirk, _forcevariable is documented as being the
highest priority over-ride.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/bitbake.conf                        | 3 ++-
 meta/conf/distro/include/tclibc-baremetal.inc | 2 --
 meta/conf/distro/include/tclibc-glibc.inc     | 2 --
 meta/conf/distro/include/tclibc-musl.inc      | 2 --
 4 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a21b728..a772cab 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -735,7 +735,8 @@ DISTRO_NAME ??= "OpenEmbedded"
 #
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
-OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
+OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
+LIBCOVERRIDE ?= ""
 CLASSOVERRIDE ?= "class-target"
 DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
 MACHINEOVERRIDES ?= "${MACHINE}"
diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/distro/include/tclibc-baremetal.inc
index 8d570f0..1bf44c8 100644
--- a/meta/conf/distro/include/tclibc-baremetal.inc
+++ b/meta/conf/distro/include/tclibc-baremetal.inc
@@ -4,9 +4,7 @@
 
 LIBCEXTENSION = ""
 
-# Add baremetal libc overrides to the overrides.
 LIBCOVERRIDE = ":libc-baremetal"
-OVERRIDES .= "${LIBCOVERRIDE}"
 
 ASSUME_PROVIDED += "virtual/libc virtual/libiconv virtual/crypt"
 
diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
index ad8000f..8d10764 100644
--- a/meta/conf/distro/include/tclibc-glibc.inc
+++ b/meta/conf/distro/include/tclibc-glibc.inc
@@ -4,9 +4,7 @@
 
 LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION') or '') != '']}"
 
-# Add glibc overrides to the overrides for glibc.
 LIBCOVERRIDE = ":libc-glibc"
-OVERRIDES .= "${LIBCOVERRIDE}"
 
 PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index 54e1acf..052ae0e 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -4,9 +4,7 @@
 
 LIBCEXTENSION = "-musl"
 
-# Add musl libc overrides to the overrides.
 LIBCOVERRIDE = ":libc-musl"
-OVERRIDES .= "${LIBCOVERRIDE}"
 
 PREFERRED_PROVIDER_virtual/libc ?= "musl"
 PREFERRED_PROVIDER_virtual/libiconv ?= "musl"
-- 
1.9.1


