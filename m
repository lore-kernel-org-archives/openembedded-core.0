Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D15C47077
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:46:18 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.151544.1703864772532749436
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LnIKzfSu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d43df785c2so14938695ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864771; x=1704469571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cCiustOEvXb1+EFoPsMl9sTj6e6AerC8DC/pcdiPioQ=;
        b=LnIKzfSu5DkXjEVUDZPme5JZZTZqE+4WSKzZEeEejmaKPx+3iNn8/Ot8WdKn8hPdp4
         Vk7NCQQiamr7t1hCmpnWf9lMgN0ksdhdkrExnXD7yAi8/T258Z+FSpWo7VIEIvbeVZXQ
         j6aVAdYl2jKbYd6GGqO3r6d7pPfgddyI0locGf7uOUACzp/LVzsnBrCFs8L3A/JGxngV
         f4mDQal1snwqeLYWAfriGjh/3o1VXKagKvmggIdaIOodCUQBQwA/wgg6w8nnm95fktp4
         IblzPEDRsocL4366CUMa3i9emjvy39Pe3bgyVpZoZUrA/2QekofGACzUW5HkXsy4WyHK
         Vywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864771; x=1704469571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCiustOEvXb1+EFoPsMl9sTj6e6AerC8DC/pcdiPioQ=;
        b=suG/8XZT82hX7sVLh4kSwTOnOKqMuR1qOKBXc+JcK7otHSBCCFUjfV/qhNzlqu71w4
         glB75Zj7JGJXzODK2D3Zsgq3Q5Ek9hWaSsB7mH/l/iNaZd7xef4W+rj/jGNULzLdg59f
         wZNwoYILmTOv+aDvZ5H0OA98ccF9bt/W6WU0ECexP/ZkfrTEUTR3Y8hk15VlOeXcSbzU
         fMIGk/hV3C6jlU+maE8SE4vP7Tio5X1IqI54+n0DKKrkRJG5TqrSSkYyRWnLCdF3XceA
         m1YzsNM5IsKVA6WpgBo0yLw5TPcRqEB3/uTAySk4HJKek0CtMYr/FeawkxkpPRyaHCSF
         876Q==
X-Gm-Message-State: AOJu0Yz3oY8avf7caoSHE0JvkSAc/lRhPvGcJ6VavgO1wj8nIV/63y7c
	jNXcLmfWabLKpYZsZRj/lgNGOv9GFPP8sHrpa4Z4JBtX1VPjFg==
X-Google-Smtp-Source: AGHT+IH0L6PiUN+7QQdAkg0ijSDvyHIfDz9oueT+PT3g74JJdUg9JMLtKYus99wXik6bfX7Y/3mSiw==
X-Received: by 2002:a17:902:c945:b0:1d4:3af6:6d20 with SMTP id i5-20020a170902c94500b001d43af66d20mr4318432pla.42.1703864771225;
        Fri, 29 Dec 2023 07:46:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.46.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:46:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 37/41] systemd-boot: Fix build issues on armv7a-linux
Date: Fri, 29 Dec 2023 05:44:51 -1000
Message-Id: <9fbb9b974cc8a92eb77a080c89410fb2c8b311c1.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193054

From: Viswanath Kraleti <quic_vkraleti@quicinc.com>

Backport a fix to address the build failure on armv7a introduced
in systemd v254-rc1.

see
https://github.com/systemd/systemd/issues/29381

Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 782790dc6423fe3ae1ce4cd674ab492bfc881230)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../systemd/systemd-boot_254.4.bb             |  4 +++
 ...n-Pass-all-static-pie-args-to-linker.patch | 35 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0030-meson-Pass-all-static-pie-args-to-linker.patch

diff --git a/meta/recipes-core/systemd/systemd-boot_254.4.bb b/meta/recipes-core/systemd/systemd-boot_254.4.bb
index 4ee25ee72f..2b43ccf243 100644
--- a/meta/recipes-core/systemd/systemd-boot_254.4.bb
+++ b/meta/recipes-core/systemd/systemd-boot_254.4.bb
@@ -8,6 +8,10 @@ DEPENDS = "intltool-native libcap util-linux gperf-native python3-jinja2-native
 inherit meson pkgconfig gettext
 inherit deploy
 
+SRC_URI += " \
+           file://0030-meson-Pass-all-static-pie-args-to-linker.patch \
+           "
+
 LDFLAGS:prepend = "${@ " ".join(d.getVar('LD').split()[1:])} "
 
 EFI_LD = "bfd"
diff --git a/meta/recipes-core/systemd/systemd/0030-meson-Pass-all-static-pie-args-to-linker.patch b/meta/recipes-core/systemd/systemd/0030-meson-Pass-all-static-pie-args-to-linker.patch
new file mode 100644
index 0000000000..8e563238ef
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0030-meson-Pass-all-static-pie-args-to-linker.patch
@@ -0,0 +1,35 @@
+From f85a387a67900b02c69abccb88c2ef7191c67277 Mon Sep 17 00:00:00 2001
+From: Jan Janssen <medhefgo@web.de>
+Date: Sun, 1 Oct 2023 09:55:48 +0200
+Subject: [PATCH] meson: Pass all -static-pie args to linker
+
+Fixes: #29381
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/cecbb162a3134b43d2ca160e13198c73ff34c3ef]
+Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
+---
+ src/boot/efi/meson.build | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
+index 2773eaf286..9a60a57329 100644
+--- a/src/boot/efi/meson.build
++++ b/src/boot/efi/meson.build
+@@ -161,9 +161,14 @@ efi_c_ld_args = [
+         '-Wl,--entry=efi_main',
+         '-Wl,--fatal-warnings',
+ 
+-        # These flags should be passed by -static-pie, but seem to be missing sometimes.
+-        '-Wl,--no-dynamic-linker',
+-        '-z', 'text',
++        # These flags should be passed by -static-pie, but for whatever reason the flag translation
++        # is not enabled on all architectures. Not passing `-static` would just allow the linker to
++        # use dynamic libraries, (which we can't/don't use anyway). But if `-pie` is missing and the
++        # gcc build does not default to `-pie` we get a regular (no-pie) binary that will be
++        # rightfully rejected by elf2efi. Note that meson also passes `-pie` to the linker driver,
++        # but it is overridden by our `-static-pie`. We also need to pass these directly to the
++        # linker as `-static`+`-pie` seem to get translated differently.
++        '-Wl,-static,-pie,--no-dynamic-linker,-z,text',
+ 
+         # EFI has 4KiB pages.
+         '-z', 'common-page-size=4096',
-- 
2.34.1


