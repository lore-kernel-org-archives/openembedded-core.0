Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4D1C3ABAA
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 15:53:19 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.22551.1746201193312455006
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 08:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MZcxjh8N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso19642365e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746201191; x=1746805991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEyzke2uVB9fOz5qmkCviVDR1IZxLOrhPRapxlAz7/g=;
        b=MZcxjh8NqR0kZ8sNCfayAVndrsXpp3Qq5Tw7GWg28ghCinGoaNnb/vCf2F/U7KllY0
         LlvqaNNa4OBodzSAPiBXduvXYNxTubEiK2EsobNCgJgoIjCMjskPpuguh2bYz4qdoTja
         KBwRYxka4NwnRf41gnlFYkze3Og8gjoJl/uE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746201191; x=1746805991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEyzke2uVB9fOz5qmkCviVDR1IZxLOrhPRapxlAz7/g=;
        b=DfMrDtFlWoStv+ViYmQKr00nz8EUxzdn07C4VPzuk45nfqt3qNUPWXmftffGEOU4/7
         vd156r6V95z3knossDQhhY438tf9HoEnoc9LtUqqAgjH89wG3paXQFzTQKd51rv8CA82
         jDNtY7E4y62UeTcB3/mDHqZhX57EJdcZWxpjG263VH0NyaLpF/ukBTfXH5EywHhCNMgY
         f5Q3hgAX1SQLKxXhou3vThaZqi2xBU/pjU8lsKpIROklg9Tj4x/EwZZAOXxsMx1ARqdR
         f0zuL0ZcySVhlo8tujjMr9LIQQZVsVvn9E3lCE+kM8NbKQg6yQ78I2ibStHFBOK0R20w
         oRog==
X-Gm-Message-State: AOJu0YwDwK+tPhe/wS5Ozp7tfcjWayND4gtonZOwszqhT1dO+lOK971N
	/zFxKxT/Ou82Z2EMIAnwXNOBDyd/CY4nGfaVpzuEE5qcDxEA3Ff5FO+jZYc0amBqIsTfmZKOo6K
	L
X-Gm-Gg: ASbGncsMqpO2nh4RaJ9u2cKxPjAzUjvmoqoiezK4BvE/2pQ5FPwSO4KoMwsFikXu9gV
	aqtpYg0ujmgKayDzAXq9TZLbyXgZnM/HpiX6om5ntwWgMuhM3RlTnFB6VsTJ/3Pg0YzSzhL3zg3
	02eWMVTGFoj/4cZ4EqvWvUzhKgtZLF7i4jPlYM0zxHtCSuFig4c4XmlPDascKq8/zKuRxsUGoRv
	6j1dp3znNdNi3TS5Y7h0ym+QiGBvV8E1o0ypvEjpzwjO/fjLRfJ3euQnyGvUIPJwlyFYUdFQdvU
	KdMq6UUJ8iwXc7tKgCzTUunAQaVj/5921cmKUWvkHHT2yL2mXS9G7v36zGhguKQt5Rn9
X-Google-Smtp-Source: AGHT+IHGoGcAbKP0FMoCfpvLB4rOOM9nU0NbXUrbi/SPzIOdbH7FtUYGoQTmONzgzyfdeTnW67JvzQ==
X-Received: by 2002:a5d:5f87:0:b0:39e:cbe1:8d68 with SMTP id ffacd0b85a97d-3a099ad3677mr2810212f8f.6.1746201190713;
        Fri, 02 May 2025 08:53:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8904:24d:3b00:200b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af2a5fsm96877785e9.20.2025.05.02.08.53.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 08:53:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemu: Upgrade 9.2.3 -> 10.0.0
Date: Fri,  2 May 2025 16:53:08 +0100
Message-ID: <20250502155308.3999939-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250502155308.3999939-1-richard.purdie@linuxfoundation.org>
References: <20250502155308.3999939-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 15:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215910

In version 10, emulation of 64 bit targets on 32 bit
systems is no longer supported. The target list is tweaked accordingly.

https://github.com/qemu/qemu/commit/acce728cbc6c154b215dfc8d05c12d8fcc2483d5

Running qemu on *any* 32 bit host is also deprecated and going to be
removed upstream in a later version soon:

https://github.com/qemu/qemu/commit/6d701c9bac1d3571e9ad511e01b27df7237f0b13

The pixman configuration option now needs to be specified so add a
PACKAGECONFIG entry, defautling to enabled. This is a required dependency
of some of the graphical backends like gtk.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../qemu/{qemu-native_9.2.3.bb => qemu-native_10.0.0.bb}    | 0
 ...-system-native_9.2.3.bb => qemu-system-native_10.0.0.bb} | 2 +-
 meta/recipes-devtools/qemu/qemu-targets.inc                 | 6 ++++++
 meta/recipes-devtools/qemu/qemu.inc                         | 4 +++-
 ...mu-Add-addition-environment-space-to-boot-loader-q.patch | 6 +++---
 .../qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch      | 6 +++---
 .../qemu/0004-qemu-Do-not-include-file-if-not-exists.patch  | 6 +++---
 ...mu-Add-some-user-space-mmap-tweaks-to-address-musl.patch | 6 +++---
 .../qemu/qemu/0006-qemu-Determinism-fixes.patch             | 2 +-
 ...sts-meson.build-use-relative-path-to-refer-to-file.patch | 2 +-
 ...fine-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch | 2 +-
 .../0010-configure-lookup-meson-exutable-from-PATH.patch    | 6 +++---
 ...mu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch | 6 +++---
 meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch   | 6 +++---
 .../recipes-devtools/qemu/{qemu_9.2.3.bb => qemu_10.0.0.bb} | 0
 15 files changed, 34 insertions(+), 26 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_9.2.3.bb => qemu-native_10.0.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_9.2.3.bb => qemu-system-native_10.0.0.bb} (95%)
 rename meta/recipes-devtools/qemu/{qemu_9.2.3.bb => qemu_10.0.0.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_9.2.3.bb b/meta/recipes-devtools/qemu/qemu-native_10.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_9.2.3.bb
rename to meta/recipes-devtools/qemu/qemu-native_10.0.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_9.2.3.bb b/meta/recipes-devtools/qemu/qemu-system-native_10.0.0.bb
similarity index 95%
rename from meta/recipes-devtools/qemu/qemu-system-native_9.2.3.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_10.0.0.bb
index e7bbe5d2916..57a7e8515a6 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_9.2.3.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_10.0.0.bb
@@ -9,7 +9,7 @@ DEPENDS += "glib-2.0-native zlib-native pixman-native qemu-native"
 
 EXTRA_OECONF:append = " --target-list=${@get_qemu_system_target_list(d)}"
 
-PACKAGECONFIG ??= "fdt alsa kvm pie slirp png \
+PACKAGECONFIG ??= "fdt alsa kvm pie slirp png pixman \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
 "
 
diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc b/meta/recipes-devtools/qemu/qemu-targets.inc
index 24f9a039485..50e5eb6796a 100644
--- a/meta/recipes-devtools/qemu/qemu-targets.inc
+++ b/meta/recipes-devtools/qemu/qemu-targets.inc
@@ -7,6 +7,12 @@ def get_qemu_target_list(d):
     import bb
     archs = d.getVar('QEMU_TARGETS').split()
     tos = d.getVar('HOST_OS')
+    tarch = d.getVar('HOST_ARCH')
+    # 32 bit hosts can't handle 64 bit targets
+    if "64" not in tarch:
+        for arch in archs.copy():
+            if "64" in arch:
+                archs.remove(arch)
     softmmuonly = ""
     for arch in ['ppcemb', 'lm32']:
         if arch in archs:
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 68b1e7067e0..0842a7b20a2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,7 +38,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "baed494270c361bf69816acc84512e3efed71c7a23f76691642b80bc3de7693e"
+SRC_URI[sha256sum] = "22c075601fdcf8c7b2671a839ebdcef1d4f2973eb6735254fd2e1bd0f30b3896"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
@@ -92,6 +92,7 @@ do_install_ptest() {
 # QEMU_TARGETS is overridable variable
 QEMU_TARGETS ?= "arm aarch64 i386 loongarch64 mips mipsel mips64 mips64el ppc ppc64 ppc64le riscv32 riscv64 sh4 x86_64"
 
+
 EXTRA_OECONF = " \
     --prefix=${prefix} \
     --bindir=${bindir} \
@@ -177,6 +178,7 @@ PACKAGECONFIG[vnc-jpeg] = "--enable-vnc --enable-vnc-jpeg,--disable-vnc-jpeg,jpe
 PACKAGECONFIG[libcurl] = "--enable-curl,--disable-curl,curl,"
 PACKAGECONFIG[nss] = "--enable-smartcard,--disable-smartcard,nss,"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
+PACKAGECONFIG[pixman] = "--enable-pixman,--disable-pixman,pixman"
 PACKAGECONFIG[gtk+] = "--enable-gtk,--disable-gtk,gtk+3 gettext-native"
 PACKAGECONFIG[vte] = "--enable-vte,--disable-vte,vte gettext-native"
 PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 7ca79b0e0b4..e7e816dbfae 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 29dce25c090792e360a1c1ff081af25d63d7df29 Mon Sep 17 00:00:00 2001
+From 41b238e15df84a4181a2b39cfbcc52a08f9fdbba Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
@@ -18,10 +18,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/mips/malta.c b/hw/mips/malta.c
-index 198da5ba3..736bf0999 100644
+index 8e9cea70b..2268a8b61 100644
 --- a/hw/mips/malta.c
 +++ b/hw/mips/malta.c
-@@ -64,7 +64,7 @@
+@@ -65,7 +65,7 @@
  #define ENVP_PADDR          0x2000
  #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
  #define ENVP_NB_ENTRIES     16
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index 292c542442c..566079f8ad5 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From e069c66ccf29fb13ef5938b68f5362737b64d638 Mon Sep 17 00:00:00 2001
+From 70697264fc5aa9679c5f1cdcb590252254c44983 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
@@ -29,10 +29,10 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index 4186c57b3..43cd805a9 100644
+index d18c1dbf2..45dde1fc5 100644
 --- a/hw/intc/apic.c
 +++ b/hw/intc/apic.c
-@@ -759,7 +759,7 @@ int apic_accept_pic_intr(DeviceState *dev)
+@@ -758,7 +758,7 @@ int apic_accept_pic_intr(DeviceState *dev)
      APICCommonState *s = APIC(dev);
      uint32_t lvt0;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index ecfddfc0e15..de22516e1de 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From 24e16b32dd0a4136ac30f8e2d48e266892814de6 Mon Sep 17 00:00:00 2001
+From 09936dc09b577448d354e82919829ef6a809dc94 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
@@ -16,10 +16,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 549e39e19..439c7beb0 100644
+index 8bfe4912e..d04984f66 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -116,7 +116,9 @@
+@@ -118,7 +118,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
  #include <linux/netlink.h>
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 0e22a4fd866..9e5dceb566a 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From ef7497674b2d41cffcb90f36bfe145c4951a03ba Mon Sep 17 00:00:00 2001
+From 8ab2b722da7868c507cfdd67ae6d535c8ba36f53 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
@@ -22,10 +22,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
  1 file changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index e4bf5d5f3..04d920c11 100644
+index d1f36e6f1..26ccf8f4d 100644
 --- a/linux-user/mmap.c
 +++ b/linux-user/mmap.c
-@@ -1105,12 +1105,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
+@@ -1108,12 +1108,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
      int prot;
      void *host_addr;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 33de959fa4d..2bf9baf7ea3 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From b0862cf4fecc11a181bc8c6602c7d09812148249 Mon Sep 17 00:00:00 2001
+From 30d463f09142faa745a8756df95a2ff6434c2335 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index 335d50be46b..9cf1a522590 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From 7bce3a9379b09dfa7d24a377a9f7f1c6a2f8bdde Mon Sep 17 00:00:00 2001
+From 8536e8cce199eec6e8c403c4a7ca95a7fb55e1cf Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 3f81154dbfe..0f8cf06eae2 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 2c2fde4042578ee29714a6421c33e00c4301d744 Mon Sep 17 00:00:00 2001
+From aa00914a01cc969f6061097cc8e597b528465ad6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 4a777dee52b..073b868f479 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From b3435faf13837f487231a01c2dca45a260ae323c Mon Sep 17 00:00:00 2001
+From 9067e464685cb503d58a07520769a49c5f9f2e47 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
@@ -9,10 +9,10 @@ Upstream-Status: Inappropriate [workaround, would need a real fix for upstream]
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/configure b/configure
-index 18336376b..2b014b97c 100755
+index 02f1dd231..2c5ecd346 100755
 --- a/configure
 +++ b/configure
-@@ -1002,12 +1002,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
+@@ -983,12 +983,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
  $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
       ${source_path}/pythondeps.toml meson || exit 1
  
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index f949206717b..d2d35083ec7 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From 81b55a014b2e5f0863a5a3fd584168c9d4ce9eb8 Mon Sep 17 00:00:00 2001
+From e0ae1256317af5157c44b7a56e045c3dbee8c923 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meson
@@ -29,10 +29,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 2b014b97c..45dc8b146 100755
+index 2c5ecd346..5315ede35 100755
 --- a/configure
 +++ b/configure
-@@ -988,14 +988,14 @@ python="$(command -v "$python")"
+@@ -969,14 +969,14 @@ python="$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
  
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
index ca667692b04..4451c5d52fe 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -1,4 +1,4 @@
-From 6e5a6d44950c48957f3906294b8efd6a76b91576 Mon Sep 17 00:00:00 2001
+From 0d201513f96e79a7640933205072c5704b2727e0 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Sep 2024 16:19:37 -0700
 Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_np()
@@ -20,10 +20,10 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
-index c53ca1f76..3c67129ef 100644
+index 0f4997a91..4559d0fac 100644
 --- a/target/riscv/kvm/kvm-cpu.c
 +++ b/target/riscv/kvm/kvm-cpu.c
-@@ -1870,8 +1870,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
+@@ -1885,8 +1885,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
      if (riscv_has_ext(&cpu->env, RVV)) {
          ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
          if (ret) {
diff --git a/meta/recipes-devtools/qemu/qemu_9.2.3.bb b/meta/recipes-devtools/qemu/qemu_10.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_9.2.3.bb
rename to meta/recipes-devtools/qemu/qemu_10.0.0.bb

