Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB4FC001E0
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 09:40:06 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.28830.1690537198658426623
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 02:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HIYfT1XY;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fbd33a57ddso20127725e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 02:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690537197; x=1691141997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zQhIZCifpwAD2gvgXFpV4hiko9VoBVnp2zUGCXtyAlA=;
        b=HIYfT1XY3xlkHVhR16hJTQ2u7w6dJYxGSXYk7/nsOX3pL6GgBcATo44k9KjpTtpF+i
         6meUrwmS8EacCjcfzYuCYpTcchqvfAlvR1yKjgpE8hFdg0vMAchweBqLZpHQWkc6s1jV
         9JUeocabOqxf13KNbgnJRpd4I5Z2TgUrdYpIzD6+2MYzxF7d5ZnmrCXXq93gM81Fs5vt
         NXiN/Iw4MJbJ8EE5Ym9s0ZmVPqmUYJ1ROgrzia08HDxF2vvFr3ALiGK5RwLSAvawh+Rs
         oiTv4qEBTnn9fGmCByoMmoCGi/H8tFZ6IMjXRt3fm2+lZr5Inx6408fq3mueGIDm/PVE
         oFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690537197; x=1691141997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQhIZCifpwAD2gvgXFpV4hiko9VoBVnp2zUGCXtyAlA=;
        b=dGDxaYSNkMpzOg/ZsK213rXlCaYMxKCq7U7ew19ymSx/n6NjUA8YQnyJk1RMauHQh1
         KwLlq4c1ITIJ61ReEpno6NjON3tlxXuaS/XPW66haAyVi5RcEuFEXJJD7/YFSKpay2sM
         cbo8gPb4kNf/FtOzqZuy69RFRNf4wkV3x8rkcJAVmNiROrg6UbtwdbpaS3ljbsQN2IFY
         VGStYpi9vUPi3XvvoBItjdtwmpRJduPDbWBzIWP2rygkfDWNJLZY81djb2/vrJpBWTr8
         DbQATSNFDLkarmh4cVwNkNf0o9ZfOFO2wgejYrrDl4SWhEXIKvBnwSY99zKpMKkF+LnI
         XINA==
X-Gm-Message-State: ABy/qLbtiPGoxXz+fOaj5RhMHAMwimcUWbssk30ib0jSKwKt9ad4YP5a
	/Q/IQ881/caBzNrSJYfwv21gUsnod8k=
X-Google-Smtp-Source: APBJJlHv5bUxqseFoPJ89pV+H8Zsx+fMKG3v5t1kL3r8KjkAoUI6Iut/k5W9fnoCJQrpChMNnio5fQ==
X-Received: by 2002:a1c:790b:0:b0:3fc:1f0:a66e with SMTP id l11-20020a1c790b000000b003fc01f0a66emr1247304wme.1.1690537196406;
        Fri, 28 Jul 2023 02:39:56 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 9-20020a05600c230900b003fbe561f6a3sm6564537wmo.37.2023.07.28.02.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 02:39:55 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 1/2] base-passwd: Add the sgx group
Date: Fri, 28 Jul 2023 10:39:48 +0100
Message-Id: <20230728093950.12046-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 09:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185015

To avoid errors from eudev/udev we need an sgx group, but if we add it
via groupadd that causes shadow login to be brought into an image, which
causes images which have CONFIG_MULTIUSER unset to fail with `setgid:
Function not implemented` as shadow's login doesn't implement the
heuristics which busybox has to handle this kernel configuration.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../0001-base-passwd-Add-the-sgx-group.patch  | 30 +++++++++++++++++++
 .../base-passwd/base-passwd_3.6.1.bb          |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sgx-group.patch
new file mode 100644
index 000000000000..e1340e1b70cf
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
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
index 204016b3e72e..44bcfb019930 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0005-Add-kvm-group.patch \
            file://0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch \
            file://0007-Add-wheel-group.patch \
+           file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
 SRC_URI[sha256sum] = "6ff369be59d586ba63c0c5fcb00f75f9953fe49db88bc6c6428f2c92866f79af"
-- 
2.39.0


