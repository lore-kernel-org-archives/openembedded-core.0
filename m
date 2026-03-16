Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BA3F53D90
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 19:24:21 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59447.1773689055237035051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 12:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cZBAmtGp;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: danismostlikely@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79a60975dc5so4748187b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 12:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773689054; x=1774293854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EGcPiYgeM2cMzrjubS9FMWtJKYKBHtz+uNTLqBtCOHM=;
        b=cZBAmtGpa9tM9XMXfjJznXgWMXN1ihD6bEFd2HyQ8Rc3cpt+TVa82R2So6Q9rgZ2Kd
         vpZ3wK1Zq2NXEABbDviysSRhK7KqGXLmX6OmzE04rwL6afcVRTsGVnbROLTFodKbG2y/
         SA15/HC0V8Zt9Az11J9tlp+Tp9WsUaijXOIErQfxWr1Yd/GltTLjsz8lEc05HcwhGDW+
         QJknXnkWlw864hL6/TiTFSb61QoGTzUEOrygPsI8Z/Fs0zBHMONMwQWGSU1SpPCRIaHc
         k98s7W0OPzDvMDcyTKRzOVLn9unjUjCaS0gkfZLfl0Bgq1Ql5j89ravXKmRuvdoBWM9q
         MthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773689054; x=1774293854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGcPiYgeM2cMzrjubS9FMWtJKYKBHtz+uNTLqBtCOHM=;
        b=EC+d/7gwVJoQ/P7+lJJDLyPIqJqnrjOgnHjt6nw4maW4oe1TgB56EJFNhyfZHGhmmA
         hA0acn2fNTtl6dFYRVkys645+3UaNAouTeSKZfRlPbG8VPY5dmnIdjTfoXVOK7GwiTcz
         kSNW9htweb7rdiS74CXCI85WWQcw6tfPgQuPGp/CEFAm37+qm3dUH8kx5r/g9HDZlSdP
         gZ1T7zxjMVblOGA8FQnsH4W9vZbw/RX+Sbj8zi8cfEhg/RE4D77b0fSkTDoW5tTBstd3
         D2PrJ9zRT+U1C8MaKqkihc5Z2s+WwNo9Dk5ULRvMBkUVWEiqkjsOBhLQkccfemYkkhtu
         uVSA==
X-Gm-Message-State: AOJu0YzIg8GcrLgwdyZZajPqMLyTfwTQP8L2zZ5ryBPUkQAUs+VLtFMR
	usHiSyu3aWLBv0Fc8it7BdbqBZaq1lJIfTeoWkGGkXPN0mvn/if6bmTwQXPLjA==
X-Gm-Gg: ATEYQzzaPVvn9XI2/Ouv1FjLr7QSNrb+TWwq2aYYE0pp6k2E9OlX2FJNaMkgfPFkDOL
	rnELYL/RwL1s/9bYLoVGcXEYWTJMMxm+xXsdrps60kDSbJpeGOdUmNeowipWiww7MmHt7w9cE9h
	zV5+H6RWBUZCKths/yez3W184Tqu35BhRkEfpQypUUqIYpOOh8c+/u62Eir7aFojjHwXF8zXAXd
	1CV9hAYLwjyNYADCoGMaheMDZZzbL9hdy3e/ehbhLKrCrYMxzTd8e/4atmCFSCgutmFaQrI5uA2
	lCh2HmJIBUUGs1b6Wz0TRX54QrbcXcjCE4dhu9MdB+jporIhQDuZC2YgyJhrccQBIyaptv5mvHP
	7R4ZC3PVfrSA7lHfFxtmJ04B9GCObSX2LgCuy0kGIKTQ1VQYdcBIBXoqcd9qPBJly91Tq+7M+H8
	l7Rd9adkCvbyfiRtx//EgrOb3cO1Y/UbPkhVJ/xlnz+BZyZGT7MHiptEJxLLc3KAtvbg==
X-Received: by 2002:a05:690c:6d84:b0:79a:40fb:9339 with SMTP id 00721157ae682-79a40fb9b72mr65606397b3.47.1773689054159;
        Mon, 16 Mar 2026 12:24:14 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a4d9d1bc1sm18525807b3.18.2026.03.16.12.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 12:24:13 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <danmcgr@protonmail.com>
Subject: [PATCH] systemd: break circular dependency with libfido2
Date: Mon, 16 Mar 2026 13:24:07 -0600
Message-ID: <20260316192407.3950544-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 19:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233266

From: Dan McGregor <danmcgr@protonmail.com>

libfido2 depends on udev, and when the fido2 feature is enabled
in systemd, systemd depends on libfido2. However, systemd really
only needs libfido2's headers at build time. It uses dlopen to
opportunistically enable the features at runtime. Break this
circular dependency by creating a recipe that provides libfido2's
headers and pkgconfig file. That allows systemd to build with
fido2 enabled and allows libfido2 do build as well.

Signed-off-by: Dan McGregor <danmcgr@protonmail.com>
---
 ...meson-use-libfido2_cflags-dependency.patch | 53 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_259.3.bb    |  3 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cflags-dependency.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cflags-dependency.patch b/meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cflags-dependency.patch
new file mode 100644
index 00000000000..e65dde10c32
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cflags-dependency.patch
@@ -0,0 +1,53 @@
+From 97142fd1db4124de5d5bdd3f49cc5a390286e522 Mon Sep 17 00:00:00 2001
+From: Dan McGregor <danmcgr@protonmail.com>
+Date: Wed, 11 Mar 2026 18:26:05 -0600
+Subject: [PATCH] meson: use libfido2_cflags dependency
+
+Add the libfido2 dependency to cryptenroll and cryptsetup's
+meson files. If libfido2's not installed in the default path
+the build wasn't finding its headers correctly.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/9ce905e35f690e7a10cd286be2b50594d0857f5e]
+---
+ src/cryptenroll/meson.build                  | 1 +
+ src/cryptsetup/cryptsetup-tokens/meson.build | 2 +-
+ src/cryptsetup/meson.build                   | 1 +
+ 3 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/cryptenroll/meson.build b/src/cryptenroll/meson.build
+index 488ceea14d..11265c8b41 100644
+--- a/src/cryptenroll/meson.build
++++ b/src/cryptenroll/meson.build
+@@ -23,6 +23,7 @@ executables += [
+                 'dependencies' : [
+                         libcryptsetup,
+                         libdl,
++                        libfido2_cflags,
+                         libopenssl,
+                         libp11kit_cflags,
+                 ],
+diff --git a/src/cryptsetup/cryptsetup-tokens/meson.build b/src/cryptsetup/cryptsetup-tokens/meson.build
+index 804e18bc67..0fd6309201 100644
+--- a/src/cryptsetup/cryptsetup-tokens/meson.build
++++ b/src/cryptsetup/cryptsetup-tokens/meson.build
+@@ -58,7 +58,7 @@ modules += [
+                 'sources' : cryptsetup_token_systemd_fido2_sources,
+                 'dependencies' : [
+                         libcryptsetup,
+-                        libfido2,
++                        libfido2_cflags,
+                 ],
+         },
+         template + {
+diff --git a/src/cryptsetup/meson.build b/src/cryptsetup/meson.build
+index d9778259c2..b36354fb0a 100644
+--- a/src/cryptsetup/meson.build
++++ b/src/cryptsetup/meson.build
+@@ -19,6 +19,7 @@ executables += [
+                 'sources' : systemd_cryptsetup_sources,
+                 'dependencies' : [
+                         libcryptsetup,
++                        libfido2_cflags,
+                         libmount_cflags,
+                         libopenssl,
+                         libp11kit_cflags,
diff --git a/meta/recipes-core/systemd/systemd_259.3.bb b/meta/recipes-core/systemd/systemd_259.3.bb
index a244df75c06..1504090f58c 100644
--- a/meta/recipes-core/systemd/systemd_259.3.bb
+++ b/meta/recipes-core/systemd/systemd_259.3.bb
@@ -33,6 +33,7 @@ SRC_URI += " \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0002-implment-systemd-sysv-install-for-OE.patch \
            file://0003-Do-not-create-var-log-README.patch \
+           file://0001-meson-use-libfido2_cflags-dependency.patch \
            "
 
 PAM_PLUGINS = " \
@@ -122,7 +123,7 @@ PACKAGECONFIG[default-compression-xz] = "-Dxz=true -Ddefault-compression=xz,,xz"
 PACKAGECONFIG[default-compression-zstd] = "-Dzstd=true -Ddefault-compression=zstd,,zstd"
 PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=enabled,-Defi=false -Dbootloader=disabled,python3-pyelftools-native"
 PACKAGECONFIG[elfutils] = "-Delfutils=enabled,-Delfutils=disabled,elfutils,,libelf libdw"
-PACKAGECONFIG[fido] = "-Dlibfido2=enabled,-Dlibfido2=disabled,libfido2"
+PACKAGECONFIG[fido] = "-Dlibfido2=enabled,-Dlibfido2=disabled,libfido2-initial"
 PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
 PACKAGECONFIG[repart] = "-Drepart=enabled,-Drepart=disabled"
 PACKAGECONFIG[homed] = "-Dhomed=enabled,-Dhomed=disabled"

