Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89888C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 13:31:56 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.49787.1748871109151632771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 06:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g2kthV+w;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so3404977f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748871107; x=1749475907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GHP5OmhP/yDAhhNnIanKHpqV+/+re/JcmzuSKtfw9aI=;
        b=g2kthV+w9MQrCNGEPykwWXX3VqbWboYuwm/BaJJhETPB4qFBOSiQPjnFKCvsp+WdKP
         cYDcb5RxfClyPEa6wuuXdIvMCrhypVWI9JcLgqnGni9KJJO06sGQ38ZeXgIrqtrzc88R
         8FZsiyRmK/k9SiP+4re9BsvwfaNsj6RNboNa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748871107; x=1749475907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHP5OmhP/yDAhhNnIanKHpqV+/+re/JcmzuSKtfw9aI=;
        b=uQsOIzgkLvrvT5rU09r9TcHPG9ukkPPc5sXLaG1IabQuPl7F/xefxT05lK6QFODNkD
         IOqA2x+gUpIvK7KPItxiUdNPL9+KVmXegYb9udUPMUHtTR0MobzKFIXSLJDpJ2q2JgDq
         hmJtH0T9idnDYVW+DhFlSlO1LP+6PvLGkxxgW0lHeyWy/gnX6/y2ISiTSKegcI6bk4tb
         Pl9dmY21WxuhGYhSqjvSewg7kWRb/cNAP3LoHtPSOCBkAL4Ll1+wL0qoeGLkW4cmMtFY
         HA9gfjLe4R9LCdGp5KwqwWXlfRdkKU9t3VsmKJ5JAFNEzHGHZuMB2NB5NChNpC8N3JVk
         AFaQ==
X-Gm-Message-State: AOJu0Yy8cpxDf28IXQL6r6FSb5USFeQdkEof9PeWTi9nL6KVxMWwvZiL
	wl4iLgO3bXX21IEfl+jcA7DS09LPXsHGdUZ7O3JQwXNt8vBGl2jk7OvRRWKQ3l3O46ly7Z1Fww1
	Jrn9ROg8=
X-Gm-Gg: ASbGnctUM4usopNCGCkdTF2b5qrqy2VaAQA+QfsHHIC1I1uYV5b/np+qX/+tslmX2DV
	ubgGnuEyernsZKK8AbCFaQJD670UfiEd+xxfncWk/yYn7y7cVDcTsLTQx5/mV2xnrPfO37CUW1c
	HFfJ3prXUDWByHQrASh42WOY5ORsHDdR6cnkjoi5qOz/HHsSwY11b9d3hK5UtJlcTdxa0C7Y9aS
	8hyVj71vwh8yKKgBq6vp2m0NXbE6oWK52l+SoXwvcBwJlwQMt7pYmyT1WrEb3XTV2ii8NeyLwSS
	hq79k6f3MRMQvEldnyqO1gIaXQaMn0ZY0PcYRiprxfZtEg3xMh9lPaPysD7EORxKir5sfjF39nS
	jnEKP
X-Google-Smtp-Source: AGHT+IHxXbF5pculShLQyLYS730yD00ri1JMIzAfri9EMKaAnUGJDzTIbviQ4qdrHK4zn3e4Wn2GMw==
X-Received: by 2002:a05:6000:1a8b:b0:3a4:f70d:aff0 with SMTP id ffacd0b85a97d-3a4f70db161mr10798316f8f.14.1748871106822;
        Mon, 02 Jun 2025 06:31:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:dac2:e1a5:9f09:aee2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm14629468f8f.26.2025.06.02.06.31.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:31:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] qemu: Upgrade 10.0.0 -> 10.0.2
Date: Mon,  2 Jun 2025 14:31:43 +0100
Message-ID: <20250602133144.3521798-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 13:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217719

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../qemu/{qemu-native_10.0.0.bb => qemu-native_10.0.2.bb}   | 0
 ...system-native_10.0.0.bb => qemu-system-native_10.0.2.bb} | 0
 meta/recipes-devtools/qemu/qemu.inc                         | 2 +-
 ...mu-Add-addition-environment-space-to-boot-loader-q.patch | 2 +-
 .../qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch      | 2 +-
 .../qemu/0004-qemu-Do-not-include-file-if-not-exists.patch  | 2 +-
 ...mu-Add-some-user-space-mmap-tweaks-to-address-musl.patch | 2 +-
 .../qemu/qemu/0006-qemu-Determinism-fixes.patch             | 2 +-
 ...sts-meson.build-use-relative-path-to-refer-to-file.patch | 2 +-
 ...fine-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch | 2 +-
 .../0010-configure-lookup-meson-exutable-from-PATH.patch    | 2 +-
 ...mu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch | 2 +-
 meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch   | 6 +++---
 .../qemu/{qemu_10.0.0.bb => qemu_10.0.2.bb}                 | 0
 14 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_10.0.0.bb => qemu-native_10.0.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_10.0.0.bb => qemu-system-native_10.0.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu_10.0.0.bb => qemu_10.0.2.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_10.0.0.bb b/meta/recipes-devtools/qemu/qemu-native_10.0.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_10.0.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_10.0.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.0.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_10.0.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0842a7b20a2..0aba6d82761 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,7 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "22c075601fdcf8c7b2671a839ebdcef1d4f2973eb6735254fd2e1bd0f30b3896"
+SRC_URI[sha256sum] = "ef786f2398cb5184600f69aef4d5d691efd44576a3cff4126d38d4c6fec87759"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index e7e816dbfae..f27208f45f4 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 41b238e15df84a4181a2b39cfbcc52a08f9fdbba Mon Sep 17 00:00:00 2001
+From 27273fcac6857750f07a2632bdb6b0ed66ae982a Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index 566079f8ad5..ad5c5ba03ee 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From 70697264fc5aa9679c5f1cdcb590252254c44983 Mon Sep 17 00:00:00 2001
+From 19b95073e5d42dc4aa5392da3d422ab668003107 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index de22516e1de..c04e42608f5 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From 09936dc09b577448d354e82919829ef6a809dc94 Mon Sep 17 00:00:00 2001
+From 913064f9fe724fa1b70b9bf6dd3444c7dddeb928 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 9e5dceb566a..388d11d10d2 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From 8ab2b722da7868c507cfdd67ae6d535c8ba36f53 Mon Sep 17 00:00:00 2001
+From f2adfc703e94819b0daca98fde1d0a30168c292d Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 2bf9baf7ea3..4690d86315f 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From 30d463f09142faa745a8756df95a2ff6434c2335 Mon Sep 17 00:00:00 2001
+From e032726e9da8de0088d6c70cfd92e0a52155315f Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index 9cf1a522590..7c24f432f24 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From 8536e8cce199eec6e8c403c4a7ca95a7fb55e1cf Mon Sep 17 00:00:00 2001
+From ebeab06747306ec16299207bf4bd7481a472b4de Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 0f8cf06eae2..54421544bb5 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From aa00914a01cc969f6061097cc8e597b528465ad6 Mon Sep 17 00:00:00 2001
+From 9c225234a756f2745cf04c3c3af6ef6b6acf4277 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 073b868f479..28a10d98bd7 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From 9067e464685cb503d58a07520769a49c5f9f2e47 Mon Sep 17 00:00:00 2001
+From 9adf3fc3ea2cbccb41d49695a53c74fed6850fb0 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index d2d35083ec7..b06020d106a 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From e0ae1256317af5157c44b7a56e045c3dbee8c923 Mon Sep 17 00:00:00 2001
+From 0d85988457a475c25b84085cf090040150a9c16d Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meson
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
index 4451c5d52fe..1cc973443e0 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -1,4 +1,4 @@
-From 0d201513f96e79a7640933205072c5704b2727e0 Mon Sep 17 00:00:00 2001
+From 7e09654fa179ad5fab1dc0a47886c6a1a2acc097 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Sep 2024 16:19:37 -0700
 Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_np()
@@ -20,10 +20,10 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
-index 0f4997a91..4559d0fac 100644
+index 8001ca153..79fb43f92 100644
 --- a/target/riscv/kvm/kvm-cpu.c
 +++ b/target/riscv/kvm/kvm-cpu.c
-@@ -1885,8 +1885,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
+@@ -1968,8 +1968,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
      if (riscv_has_ext(&cpu->env, RVV)) {
          ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
          if (ret) {
diff --git a/meta/recipes-devtools/qemu/qemu_10.0.0.bb b/meta/recipes-devtools/qemu/qemu_10.0.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_10.0.0.bb
rename to meta/recipes-devtools/qemu/qemu_10.0.2.bb

