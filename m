Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C52AC369BD
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 03:29:44 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.609.1744860574195547835
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 20:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E8SnKVYG;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-391342fc0b5so242157f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 20:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744860572; x=1745465372; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GG32vwmnFv3xLOOflQinEZ5jg4hW0QaPUdAZR8WMrs8=;
        b=E8SnKVYGrThxJj5qHEsHPqOsZ28Hz9W63COjdCNDT5knxB0wugG/HZgFBuxjk8e/8h
         0QlM3syY6xH4YFW1erSz0tZmGvtotfoOycmUt4PT2DtPxbEifbLyWqM/7X0mKn0Ewflr
         HjfzeRmoi2mBgUioVcEY5AYndcdXRtjyo7UOlTC88mwmNL6aAfGluRQ4xWxci0SyWITO
         20bAim/ea/+S2nGslLUN08s2ECxe4dll+FO7ivJ1GkWUzuCZC58cl0Ae/ol08mJ1MFj4
         xe6u2tTeOjeQHlcV9B5u4/pvQpJ/dQ4EVOxY3sQfxPovABlDKyAuevwamytSpR6zLCro
         wPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744860572; x=1745465372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG32vwmnFv3xLOOflQinEZ5jg4hW0QaPUdAZR8WMrs8=;
        b=qTuk9f+0svKwDFWsparG8FjiL1pVlzYyWcBAT8g0AELghgtJGPQaRKeysDWtZGkqPB
         4SLyBWfgcoW+RhFfDJk2eQeo4noMSQNSLFhq5BGM5DGkk+t+iVFQFio3vTBorUJfzPlA
         rEw994PH+bBfAdAKcGNxmDEyot4ErN+ObX6Yv4rw4jwLtAtek4JAB6JihBWUetPAR/m2
         4m9AF0xXA0JnmFsTh/YZFTDjTlLzT4W5JUtZXRaobvIkilzB+9wpT1Bgi4TPjMYfrvR9
         9M3HZHnvnmiPulh/Jlw4KeGGWaoU2HUF/m+v48nzbNGSQ3Arn8z6xUuCquoeRt4/JReJ
         zZDQ==
X-Gm-Message-State: AOJu0YyS1EuxoIHZYVmBfhaKjBpofWr4PyLVWcvTxjb4pJa3K271y0bf
	4YRqOFArYYHH0lJuexJAW8J3b6NylBdBICHC3HOWHu3tGO1qw5icxxNGNjAL
X-Gm-Gg: ASbGnctHNAseTgS3xerB8xF/XqdFPqgLbj0gphVqXchdWyTlrQCotN9x4WmnAHrJIAC
	OMETEH0PDDD4hT1xWc0Pxr6YAJhaiv9d78GG3zCX29tNtyTaMXe5gFnjjjl3gqAw+I9zUlr6TbV
	EV+jC5kRTi+8trZHeXcSP214u6BQD/3SuvPehiRTXo1kKypDWw8QbsCeZ7EyxwbyCj5Own16AcI
	0WZYCh/+NQmrENgyISC5RrcsU5MTusLCJ0o8h29V4S8WyfRES8m7xeLJy/iKvDYKQSMmcInYx3V
	5+IPtaiykjED3dKslCGuiWxXcuL8RwanTcxQT/PljF/GFVZST64nnZl8oTtWAN7ft7H+6yl34sk
	CyVjm7dmz
X-Google-Smtp-Source: AGHT+IFJ1nSlEKbHs6zAqqsqzHGN/r20L7F7C6kU4QIUoIixHzEsL7y+65dzZmxVkwSlLQGbzVLxeg==
X-Received: by 2002:a5d:6daf:0:b0:390:eb6f:46bf with SMTP id ffacd0b85a97d-39ee5b13573mr3666346f8f.5.1744860572512;
        Wed, 16 Apr 2025 20:29:32 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb29sm18713620f8f.76.2025.04.16.20.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 20:29:32 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 17 Apr 2025 03:29:18 +0000
Subject: [PATCH OE-Core 5/5] connman: Set dns-backend automatically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-connman-fixes-v1-5-160b2b811116@gmail.com>
References: <20250417-connman-fixes-v1-0-160b2b811116@gmail.com>
In-Reply-To: <20250417-connman-fixes-v1-0-160b2b811116@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 03:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215037

connman supports systemd-resolved as a resolver, select it automatically when
DISTRO_FEATURES includes systemd-resolved support, then drop the patch which
disables connman when systemd-resolved is active.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...vice-stop-systemd-resolved-when-we-use-co.patch | 26 ----------------------
 meta/recipes-connectivity/connman/connman_1.44.bb  |  2 +-
 2 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch b/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch
deleted file mode 100644
index 4597fe68fcdf6f301247747c52b1d4636ebec631..0000000000000000000000000000000000000000
--- a/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 19aff57e4da920d9ca972903582305b4efe81ef3 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Mon, 12 Jun 2017 16:52:39 +0300
-Subject: [PATCH] connman.service: stop systemd-resolved when we use connman
-
-Stop systemd-resolved service when we use connman as network manager.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- src/connman.service.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/connman.service.in b/src/connman.service.in
-index 7376346..79e75d6 100644
---- a/src/connman.service.in
-+++ b/src/connman.service.in
-@@ -6,6 +6,7 @@ RequiresMountsFor=@localstatedir@/lib/connman
- After=dbus.service network-pre.target systemd-sysusers.service
- Before=network.target multi-user.target shutdown.target
- Wants=network.target
-+Conflicts=systemd-resolved.service
- 
- [Service]
- Type=dbus
diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/recipes-connectivity/connman/connman_1.44.bb
index 306d54794fefb2142dbcc374940365076c48079c..00e69182d789f499fbb8dc9dbec8e77714003fb5 100644
--- a/meta/recipes-connectivity/connman/connman_1.44.bb
+++ b/meta/recipes-connectivity/connman/connman_1.44.bb
@@ -19,7 +19,6 @@ CVE_PRODUCT = "connman connection_manager"
 DEPENDS  = "dbus glib-2.0"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-           file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
            file://connman \
            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
            "
@@ -40,6 +39,7 @@ EXTRA_OECONF += "\
     --enable-tools \
     --disable-polkit \
     --runstatedir='${runtimedir}' \
+    --with-dns-backend='${@bb.utils.contains("DISTRO_FEATURES", "systemd-resolved", "systemd-resolved", "internal", d)}' \
 "
 # For smooth operation it would be best to start only one wireless daemon at a time.
 # If wpa-supplicant is running, connman will use it preferentially.

-- 
2.46.1


