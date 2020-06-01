Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.38027.1591020750817485622
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 07:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BCcYKe05;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id t7so6494plr.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 07:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=te5rjL+94v+yIamWjQSDxazW/SMUF6feNvB6Ds+oySM=;
        b=BCcYKe051KnkSyIkgnSWLr4zeGrBRpIazjBjMsaM6rlYZ0Fs/do1FvzrCWNwyl0kZb
         U/lPC5RfMpq8pFvRDQQs20jKXd0BBXQ5qIkRoKRLBZK9N1Rsu2VpUVLYX89OWiLr9YWN
         K+f6KraSc6tQ1Udkw7Dw08ZqRTiqPGPOMMfbwDyZMiBWUpNqEY4+XnbXfex+myNfvJe5
         1/u1P2R+Is7t0smPtChrE2NAQSR3fc5AgE73npuLw+8zbSqrgjNA9Xi6Bb7A5CeJS1Yv
         4rn/CT3aaWx+v+GwxXwwCYINrn5tsri4dIBGgjzW7913AJShnLOsiC+0YbU2+kzwLJCz
         iCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=te5rjL+94v+yIamWjQSDxazW/SMUF6feNvB6Ds+oySM=;
        b=p+2bnIBfdj2qBpFty31bCbEpx/lyRHAbrRqukglcaxkCIRpm3Wfo3kZMU6GU144mr5
         YT+lGsai63KXQpsVMWmc8LMHQmMqADN0UlVHTHzvAhRa7avJp+J1vcCIpw5+8SgRSZCt
         awel/RPDT4uBapxtouSBL+GewdLrk2fwOrR2+/S/mpO1kmSv1OiEwYrWaQ6y3sQBuVkJ
         5UFDIS72OdTa24V+Upzrx/whEI13ccu8KIAIjyRY242ZmhfuNic9bEYLWEviK6P5V5uC
         Pk/28RpzzfntkaIw47XChY3zoUwbmj+WPxrlGPntMrC5BRq3x6Tsud7kdoNSce4k6qTy
         cbzw==
X-Gm-Message-State: AOAM533zyDkX0WZZTDuFCn3fhd5drP2lc2nnGqpz97UDouH3qU/Uxyq7
	ZD3zj5y0fy23qe/lJ6X9nys2HveOAUs=
X-Google-Smtp-Source: ABdhPJzZkSgeugAi8k3O6dNsyKd/KhGczKJW1DxkGhgeprHXhkqYh1bLOCUw9G/DDwoSlWjzMR0RFQ==
X-Received: by 2002:a17:90a:248a:: with SMTP id i10mr24934067pje.174.1591020749908;
        Mon, 01 Jun 2020 07:12:29 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u19sm5509859pfk.98.2020.06.01.07.12.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:12:29 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/16] qemuarm: check serial consoles vs /proc/consoles
Date: Mon,  1 Jun 2020 04:11:24 -1000
Message-Id: <b2f9f6c856e2fad0feda2ce09073562543c3dd9a.1591020366.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591020366.git.steve@sakoman.com>
References: <cover.1591020366.git.steve@sakoman.com>

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Note that this patch affects qemuarm AND qemuarm64.

When booting a VM and during operation, the following message
periodically appears:

INIT: Id "hvc0" respawning too fast: disabled for 5 minutes

This is because hvc0 is specified in SERIAL_CONSOLES in qemuarm.conf
and qemuarm64.conf, but it is not in /proc/consoles and
SERIAL_CONSOLES_CHECK is not specified, leaving getty to attempt to
enable hvc0. Add SERIAL_CONSOLES_CHECK to both conf files so that
hvc0 isn't enabled if it hasn't been set there or in local.conf.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 982b7f98b8423236cc986346379b1bde3694f131)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/qemuarm.conf   | 1 +
 meta/conf/machine/qemuarm64.conf | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 367fcef019..4e605d3a92 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -8,6 +8,7 @@ require conf/machine/include/qemu.inc
 KERNEL_IMAGETYPE = "zImage"
 
 SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-arm"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 1e2d4f018d..2cf1a0206c 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -8,6 +8,7 @@ require conf/machine/include/qemu.inc
 KERNEL_IMAGETYPE = "Image"
 
 SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-aarch64"
-- 
2.17.1

