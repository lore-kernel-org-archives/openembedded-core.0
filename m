Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C35EE7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 20:55:40 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.91809.1734468932076599529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 12:55:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l63vqGPR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7242f559a9fso7367944b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 12:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734468931; x=1735073731; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Be1NpRqqfe8CY2xkcJuFYygK0QxoNikft6c5AM0sNjk=;
        b=l63vqGPRQH9lk3Z4UiTMsClIY8xqSjZ5HWdTvKS9LBOp1sOlixN68/Zp03apTkkMCw
         EMldf0II8MyYIDtT72gAkF/pik9zCD//xC5K+/2VuEi/hmpu58KshlasXH67ZK1yDGUn
         D9cytgxfFpcfwiM/F2DGs5B+UPc6f58Jq9Dx53CBhI94occQgqWhaKdqlBKaAJ+T/vvu
         2rQ8B5sgQAlP4c+145JEz/ME4+asiAYoO3G/bUml8NIqeoS7xINY6nur09YiJUTpumZU
         +HOKhN5l6pnw+gKnaQCHHvnp/q5716kfyCyE/g0+mLad1/WqAAtfhdDZH9vfcdO7NCaB
         MU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734468931; x=1735073731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Be1NpRqqfe8CY2xkcJuFYygK0QxoNikft6c5AM0sNjk=;
        b=R+YQ67Bitc3UD4N7wtVqlDyqAS9AnTUI0ZxYBw/jw0j0ILEhD5V/0wWyAf3S7I5pvD
         qutmcSVCSKcqXFz8zLpJLUXu41mFP0JuVJUQOcLzGjCKK66ioWjsBD2D14uBrCmwSeSV
         s2I04CP9xrmFCKZELQEv5vlx+Uf5xmChTuWnzzy6Gd0KH89N6nSheQIlUUjPQQHPcHJe
         v42/xx+k+aept8fYYbIYmoVhm4Qv0hF4fm40aEjmQU6ruSDwBjXAyPChmjP7t6lmcJFQ
         2c07erKfZOzPnu7zlaHw0kNPoik5UQWGu6bZoq99ehzAYaXe8CUvuZMT43e1FG7zh9Ip
         DZtw==
X-Gm-Message-State: AOJu0YwKH/F5yuymjV2tHlcwnrlNbuHSEgndZLaJqy3dRLh2vPIGZTR9
	QLnSCjR8t3d40udzSCqEgCHwLK9fNUVegM2vR+JvvEqy6Ufpk9MxBj36YW95QnrpmaDa65gDa4y
	3
X-Gm-Gg: ASbGncuoqRcGPYWsce42SRoCpGeJPQJA7uN58Akm1eJPR8BCIeZthcpgNArcph/4eCo
	OjzY4ofwojDsPGk4SN9nPm/14UeIwZlfe+ZrZDAxMcr+xnrg3B4cxYs5Zc5UijwAS/ZZJRDxPa6
	Z2z9spUnd8K87C+wJc5JYsq/2WBZcEeL+qwM8hA/GE2Sl+I4SN7ij7noBEUy0pIk1sBpnVTe0vj
	Gk/5DLALj10A0TxwI4UoqlAUMUIAFEp89ReFllrrdX7rg==
X-Google-Smtp-Source: AGHT+IF7WqLinfx/vS5L4cL90+DE2x1+s8H4f5NTvnDbS07G0tuJUeX8MCvMuqNC6gwr32uhaP7V4g==
X-Received: by 2002:a05:6a00:3cd0:b0:728:e182:a8b with SMTP id d2e1a72fcca58-72a8d226adbmr656182b3a.9.1734468931401;
        Tue, 17 Dec 2024 12:55:31 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7353294b3a.69.2024.12.17.12.55.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 12:55:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 9/9] base-passwd: Add the sgx group
Date: Tue, 17 Dec 2024 12:55:00 -0800
Message-Id: <cd7618319cf14cf1e65320b0eb57ca12028efc0f.1734468756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734468756.git.steve@sakoman.com>
References: <cover.1734468756.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 20:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208855

From: Alex Kiernan <alex.kiernan@gmail.com>

To avoid errors from eudev/udev we need an sgx group, but if we add it
via groupadd that causes shadow login to be brought into an image, which
causes images which have CONFIG_MULTIUSER unset to fail with `setgid:
Function not implemented` as shadow's login doesn't implement the
heuristics which busybox has to handle this kernel configuration.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a1c81ac4a869cc57394071ace2ca086eb8ac47a4)
Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-base-passwd-Add-the-sgx-group.patch  | 30 +++++++++++++++++++
 .../base-passwd/base-passwd_3.5.52.bb         |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
new file mode 100644
index 0000000000..e1340e1b70
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
@@ -0,0 +1,30 @@
+From 9e57771d138ac423d5139b984b8c869122ce4976 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alexk@zuma.ai>
+Date: Fri, 28 Jul 2023 10:28:57 +0100
+Subject: [PATCH] base-passwd: Add the sgx group
+
+To avoid errors from eudev/udev we need an sgx group, but if we add it
+via groupadd that causes shadow login to be brought into an image, which
+causes images which have CONFIG_MULTIUSER unset to fail with `setgid:
+Function not implemented` as shadow's login doesn't implement the
+heuristics which busybox has to handle this kernel configuration.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index d34d2b832d43..e54fd1d2c6dc 100644
+--- a/group.master
++++ b/group.master
+@@ -34,6 +34,7 @@ video:*:44:
+ sasl:*:45:
+ plugdev:*:46:
+ kvm:*:47:
++sgx:*:48:
+ staff:*:50:
+ games:*:60:
+ shutdown:*:70:
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb
index 66b5a0e7dc..9fbba7e9c0 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0006-Make-it-possible-to-build-without-debconf-support.patch \
            file://0007-Make-it-possible-to-disable-the-generation-of-the-do.patch \
            file://0008-Add-wheel-group.patch \
+           file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
 SRC_URI[sha256sum] = "5dfec6556b5a16ecf14dd3f7c95b591d929270289268123f31a3d6317f95ccea"
-- 
2.34.1


