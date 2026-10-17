Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB49CCF2C1
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 16:02:04 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8834.1792252917038672257
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 09:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MABzSQ6s;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b001cd92bso408281f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 09:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792252915; x=1792857715; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dj5DEVQAm/j+CbbnSBBaIWMyB096fjsercsNy09eLEE=;
        b=MABzSQ6sCgd6RVWg2ZP/iAHDbffelGKxYUTzoBNu3avjWLMoR+ARPq4uQhjinqJIWc
         AuHRop5DKTiJpKA7rdj1MhnVBVMC4veWYio1IlXqT26CT+4cwzDVyxB/2ly+cB2veFhJ
         NXKn9OXEbaRcuIbCWW1uVdQtOTP1eRZy5Ufbd0DZIt0l/oa3X6rJue+/p84+RN/9jN0x
         bdie0p6Pd8F1psoEIWB5Ly20lYPHkVg3wQkBwM+HqWUKwm/ghYohCMDASMe0t2jAywNt
         n5eTp0QD9d98TcnKpKeKQ7pPIPyALo5N6bpXwNYs765LhTpH+LbLYQCR6jpHXyyhCQYm
         stYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792252915; x=1792857715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dj5DEVQAm/j+CbbnSBBaIWMyB096fjsercsNy09eLEE=;
        b=fDWAN3E5Rc/8uc/0LSct7n9b9MlPVww/PeyopNpKKeSy3IGUYKNoEwLPJXmFa20sqj
         nKALKT00MIiCb90xDaf5eEIU/IQBNnrpjNrybJ50t8AQgZEGQCO17XLtOB7qw1I1YPH2
         Q0ZCD1faAlhwIdadZnObtuhQjPWPG9n5dGIQ1a5ELDAnEJb9SEBheK11PCT5Mc/RLbt4
         jjVIJvL6jjgM5FHjdQbygRaWeaYY9IP0Gcdx2ytkfKAcqkFmOupNAC1yQTvjRgCvZhkq
         5wicX8tqnAGQamvOSUKTdm7jBDbk7Qh5hEIpZO9UPktD4RXfVJg2fPkG2zWkJM2cHAaR
         59MA==
X-Gm-Message-State: AFq9FYLCBlreKX0kVTsvsZ0ApWW7AdLVELEo20EwqNHXnY3SU4Z3Lo1T
	POLJm6Ztq/xMJLKuXATLBXil55dbBXpVd9CpXJNGXT2ChZB+wQvnvtdSjs1sgQ==
X-Gm-Gg: AYBFou0Swe8GbpzIv3Gqsefv7X9HlnlQAqcthqHushyX2jm6c00kKT6I+rqubllPNXT
	0LPapjGFs3TrvBIbxeHH7lSPajY0GeIgfwUvVuqO07costDNkg+AyNS4LTvDueUUvYTZS9cX6ed
	VrkwO/Y/w4nQUEuIPlYhD0pjL2ihIv9K+GoiU9OJb/A0WS+02OCj8f9VlyEdlhqxAl4SYqA8mu9
	kVD+lP5IcdF0MNi2DXiEF9Pvc+SjaYIyQnWmDlX7rjBeky8FbbwCMhdLTIrUFMsgFy5k/5+1wSu
	QVp7wrd64r4+kzacF7khJ/HC0EqT/Uaj/ejBKeoog+/YFxHLra1nMbHE+CtFcxBc4EKGHgL+MXT
	XnC1M/OHIx0/TO5VkXa1dxYguT7LjsnlMuPmgZ6eVC1fjna6dJaAsFJvLwevODVlb2SisX74fmj
	LaQEUMkLn6noDVh7WsLxuTNgq/CxtFau2rLYdIDB26FBu9LfFvC8G4tc//0Ji//iFqbxe9fb8Za
	5q0qczfFXKmLTnY8GCW02WySlX06uHBXX3tNH+Iqn65ULidRUj7jr7eHJ14gg==
X-Received: by 2002:adf:e18e:0:b0:48c:7387:6b88 with SMTP id ffacd0b85a97d-48e07fa0252mr6102047f8f.37.1792252914910;
        Sat, 17 Oct 2026 09:01:54 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ee183sm11773542f8f.29.2026.10.17.09.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:01:53 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 17 Oct 2026 17:01:49 +0100
Subject: [PATCH v2 1/2] base-passwd: add the render group for eudev-3.2.15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-eudev-3-2-15-v2-1-489cff4613f3@gmail.com>
References: <20261017-eudev-3-2-15-v2-0-489cff4613f3@gmail.com>
In-Reply-To: <20261017-eudev-3-2-15-v2-0-489cff4613f3@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 16:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248090

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


