Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC3DCC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 13:08:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39278.1792069728508157322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 06:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jhQkJ9QE;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso49773725e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 06:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792069727; x=1792674527; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dj5DEVQAm/j+CbbnSBBaIWMyB096fjsercsNy09eLEE=;
        b=jhQkJ9QElW36SgZiRhwOJ/SAA1YC3S9+5ogv/EbHTozADiVDCsDJOsECBAZ6hjOAhp
         FuPtJ2/cj3/ITV8LPx6zKBFLrSXWZENGc/CHeD3aD7q54O9+XjUYz6hXi6pJchTbRaVk
         PiA7UtdI7QdOoC25SI4+PtWHBV1bIOt28Zc/bnd4RLjRdH/gvr2PGURQirOEjbwlT52+
         5CuorxZLeazV82CsENXWsv5E/gRUS7RRjtvg/Cxw1Th7SSyqsmcg6zFwRW1w+HWZPmOC
         idkuUaRNT9rfaE9c+G0Px9/qnmJxgJmbyDlN8E1X8/v/sWP/Qb1pkygx1CycegcfJkh5
         UO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069727; x=1792674527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dj5DEVQAm/j+CbbnSBBaIWMyB096fjsercsNy09eLEE=;
        b=yTHL2E3vk71I2eUvTktRHI4B2Zi0w1fkzoldaqaxAp5JpcHpVYbT4l4uxmHxuUwILZ
         OtZFnw7x95VmD7RuBoERUwurNWvBMI9Gr7uErMDuE4YKvDyRveIDklyFsSxftwZiDGeG
         gLqL5fLO6np4oR1Xb3BcVPwWaOU0fSw1l6kOkX4OiC37gXX2hORvzFFuBepnA4/kp3gx
         YrD6E42U8jdkrJeP85I0pJ2OwO1VJcJ/wL0bqDMicWJIcSqp12FM9zoM33qxJtTGiATV
         7uGZOoAVCelMctSjzJtOKyNMN0AYWg2MpIRugXl4PxFAVI2mwJKomADuOmq71kmt3gYk
         MKiQ==
X-Gm-Message-State: AFq9FYJBDXWvKlSFmNMAuxPxX1+AAw9I1PIC0JyT/CzxBRrf7J5QuKxe
	KDF7iVpzFxFV5r8EzPHpFjXwHQGGtMrNl23uqWqbSrAtyl2UdDaN3oikCmZw2g==
X-Gm-Gg: AYBFou0LTZrhL4/JO90nMkHJNdmnQEZyiMPOvOJcP/9397ulaZSSsImFbTzkwlf1uFe
	QluEWD/NZF3mbln7oPoqVXMV3jBAdwj30UOAhos6SsdhgIbFh1ByHJHIAwDw6BnoJSpW4z+T6zg
	VRtMvOvC8EEJlRYp7O+AMZPNTTNfzxq0tB2SBj9gK3S2RTzzlkjco/dMxtQuhHwqSozHJCtP2nz
	PnusLrGibZCP9LQurHK9C6bYjowDwcTGyvMsKq/utZPQ876KOlGGn3LiWyC6NRnf8ca+XCPoOgw
	OPbqAxRmZTB86F+yzYWVTylLPuFz+Yhlx6ba+BUY8uQ0Bd0TddK3QoPm8E5Pp+D7+nqVtOcyn36
	xpaaJJD+tuS/puCR8lfF25EfxhkDhhOabNH8wM2l385nK83/QgOw8W1aJYIPv6zBioerr7oHbN0
	r4Hmw+DO76rj7iZ0Tc/qnAbCcXBcBsiS+JclyOnPRvvq5g47aSdpnlH4geUtEHoSGtBkbPCLufs
	l7omG+W9df7A6y8KUh/bi15vM15VVRPo7etS1uD310ryajLbw==
X-Received: by 2002:a05:600c:a112:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4a1966379f7mr270469975e9.11.1792069726415;
        Thu, 15 Oct 2026 06:08:46 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm17782453f8f.36.2026.10.15.06.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:08:45 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 15 Oct 2026 14:08:43 +0100
Subject: [PATCH 1/2] base-passwd: add the render group for eudev-3.2.15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-eudev-3-2-15-v1-1-407ba1a93edb@gmail.com>
References: <20261015-eudev-3-2-15-v1-0-407ba1a93edb@gmail.com>
In-Reply-To: <20261015-eudev-3-2-15-v1-0-407ba1a93edb@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 13:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247883

Also add a comment to document why we add groups here and not in eudev,
and why they're not submitted upstream.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../0001-base-passwd-add-the-render-group.patch    | 29 ++++++++++++++++++++++
 meta/recipes-core/base-passwd/base-passwd_3.6.8.bb | 16 ++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-add-the-render-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-add-the-render-group.patch
new file mode 100644
index 000000000000..33ac1ec9e017
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-add-the-render-group.patch
@@ -0,0 +1,29 @@
+From 8e1b08f3e701bb08b57c85c6818991f92a9611ae Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Thu, 15 Oct 2026 10:58:02 +0100
+Subject: [PATCH] base-passwd: add the render group
+
+eudev-3.2.15 adds the render group:
+
+    Use the dedicated render group for /dev/dri/renderD*, kfd and accel
+    devices, as systemd does. Access is unchanged (mode 0666); systems
+    without a render group log an error and keep them root-owned.
+
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index a0f9daf92d57..20ea5da3a450 100644
+--- a/group.master
++++ b/group.master
+@@ -35,6 +35,7 @@ sasl:*:45:
+ plugdev:*:46:
+ kvm:*:47:
+ sgx:*:48:
++render:*:49:
+ staff:*:50:
+ games:*:60:
+ shutdown:*:70:
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb
index ec11e8827855..dddc326bc575 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb
@@ -5,6 +5,21 @@ SECTION = "base"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
+# We carry a number of extra groups in group.master which can neither go
+# upstream nor be created by the recipes which need them:
+#
+# - Upstream base-passwd only serves Debian and Debian-based systems. Debian
+#   policy (9.2.2) restricts base-passwd to IDs which must be statically
+#   allocated and identical everywhere; any other group is created by the
+#   package which needs it (adduser/systemd-sysusers). Upstream has told us
+#   anyone else using base-passwd is on their own:
+#   https://salsa.debian.org/debian/base-passwd/-/merge_requests/17
+#
+# - We can't create them with useradd.bbclass in the recipes which use them.
+#   Using useradd also brings shadow's login into the image, which fails with
+#   "setgid: Function not implemented" on kernels without CONFIG_MULTIUSER,
+#   unlike busybox's login.
+
 SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar.xz \
            file://0001-Add-a-shutdown-group.patch \
            file://0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch \
@@ -14,6 +29,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0007-Add-wheel-group.patch \
            file://0001-base-passwd-Add-the-sgx-group.patch \
            file://0001-Add-clock-group.patch \
+           file://0001-base-passwd-add-the-render-group.patch \
            "
 
 SRC_URI[sha256sum] = "fab3d0e6e8b641e116bda9bd5f7a7ed24482384c1513f6a369b506327fbc8dde"

-- 
2.43.0


