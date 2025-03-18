Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461FBC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:11 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.4285.1742272750954124429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f0k7/LCa;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223594b3c6dso106301565ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272750; x=1742877550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLLvqlax8u+s860s0BUwlOwVbZ4U2+vsW9ruPWvozjY=;
        b=f0k7/LCaLP5/PMVZXlMOiHxeZL3BZO82n4maT14mbnlrTKNC/qyuYHi0Gz0kjlbHTc
         DK/u+v2cHbPCw6Gt0iSEpE7EoAe0dHIZhSL0Fzitf9VQFt8ptNQlnlEd/iQf5DsmGnoj
         BarRV8RZLLzLCXCPEkenIVBBJS0yGEQDL7tATZ4xBTJWF2t1BaFxFIXqk6f66SYRznMl
         8dMmzdCb7j2DTVLLrsdOsPT8/RXmiZR0Bm4IT0NbfqPvniJ/5c1NwROKN9gTCyGLRLaz
         +gH4eU14EkMNEX2S2jreVkoK6hhRUhJZZajVjUq7Y6o2aJxECRCEiuIqlfxe49dsglkM
         0QEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272750; x=1742877550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLLvqlax8u+s860s0BUwlOwVbZ4U2+vsW9ruPWvozjY=;
        b=gx4WAmAHGB7rEug9s0qz3kuM13qL5tmiFnn2EmKVf36EoFiEq6RrALOk3FgUm6Ru8U
         O8Clvw6QYKnfDucpsuLmHUtY1cUlvqkhJEbLpXTjvQz59vZ0rLxpHeAKjd9DYD67tkjA
         oFjoXSkoYLm5djh1OfvGrWWulvyRGjV9hjsSumnVV05UmYw+nkgOUJ7kdfbEIMdNMTyZ
         HzaH0lrGYWQq/SE1LOHUsbyx5sgtq5nrdAE4W9OE9FdYPp4BKRgM/jI++0PFX2I7nipS
         283AawgJvd03NRBJuP1t3AciLTyAdUc0w469PcWlSK2Ay/q1YS7jhqa0WzjaVlKhdF91
         +pcA==
X-Gm-Message-State: AOJu0YzWvdhwfvyX4lcsNzugPv83HrlbLityWBZ47rVWXQwSAkBoQRg7
	KSn025aPg7Mqdc4x4LRNHGscThBs+WOyGTlP5D+F/6E+XylW5dpLIaCnqhGv
X-Gm-Gg: ASbGnct7WSaBOd2uA7Nzb74DNjyDdr8nu2EDDjVBa7lURgGJHxB/PCellmIh4YVssaP
	8jexjSzZfdclR0XmcDmgfeKpT1rU88sOxB0jqasTYyso2rOVoGPxho8Vr1Hmc+zNU7JmtZHLghk
	dera15b9x62hlbHJac0cOKs4Z1dysNjshoE6eEIvjzzr1OEfoGbeQsK9bZa82V+dpI4bVDNwbYO
	2r6O7K/0XDADx9SHEPtU77oijhs3oEYBhaBP0vr3qaAYGStaVvwsg35QfxIKKCjM/b97mTLa0BS
	Y6xNxYSo6ERxBvNyjialFdo+mthe8YDVqKXGUHqUn4PKHr0=
X-Google-Smtp-Source: AGHT+IFcSW+5RfNvSOqQ/jXIZBGHyaeSML1D8Aj9N2WjtNXQ3QIkU9++8SRY7fCsZxwQ/nScLAcemw==
X-Received: by 2002:a17:902:d489:b0:223:6657:5008 with SMTP id d9443c01a7336-225e0a757d8mr164148245ad.24.1742272749957;
        Mon, 17 Mar 2025 21:39:09 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:39:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 23/24] psplash: Fix build with GCC 15
Date: Mon, 17 Mar 2025 21:38:43 -0700
Message-ID: <20250318043846.2422141-23-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213157

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ine-bool-if-using-C-standard-older-t.patch | 32 +++++++++++++++++++
 meta/recipes-core/psplash/psplash_git.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/psplash/files/0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch

diff --git a/meta/recipes-core/psplash/files/0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch b/meta/recipes-core/psplash/files/0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch
new file mode 100644
index 00000000000..cc5f2e02e65
--- /dev/null
+++ b/meta/recipes-core/psplash/files/0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch
@@ -0,0 +1,32 @@
+From eab6948cd8eba493f2af7533a931df5ef1d30715 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Mar 2025 20:31:19 -0700
+Subject: [PATCH] psplash: Only define bool if using C standard older than C23
+
+gcc-15 switched to -std=c23 by default:
+
+https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+
+only typedef int bool for __STDC_VERSION__ <= 201710L (C17)
+
+Upstream-Status: Submitted [https://lists.yoctoproject.org/g/yocto-patches/message/1213]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ psplash.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/psplash.h b/psplash.h
+index 1c42ec7..138e49d 100644
+--- a/psplash.h
++++ b/psplash.h
+@@ -37,7 +37,10 @@
+ 
+ typedef uint8_t  uint8;
+ typedef uint16_t uint16;
++
++#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
+ typedef int            bool;
++#endif
+ 
+ #ifndef FALSE
+ #define FALSE 0
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 233c07a380c..e47c9b408dc 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -10,6 +10,7 @@ SRCREV = "5a32cf6392c784a7ae1983a354cf07b024625cd2"
 PV = "0.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https \
+           file://0001-psplash-Only-define-bool-if-using-C-standard-older-t.patch \
            file://psplash-init \
            file://psplash-start@.service \
            file://psplash-systemd.service \

