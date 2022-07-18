Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB679CCA482
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:49:52 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.28236.1658155784906777526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=P1msJFA2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id b10so1057760pjq.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zLy5cCp+jeV9OG6RCDv/48a1ON5Rwkqd5hWJXoCG8u8=;
        b=P1msJFA2yXbOftZ/CL8RMZa4VLgxsh1YXyzaQT8Ok07Ry7uJEpNC7WX/iWsEz35KTm
         0LGOA3Dg3IHC5LLM5tnKUMYEe80IXwmlbbe62YkLwQV8A6j1tFIOYm2LtU2FwPRUMo7W
         AtpDMIai+rZCEbkMlFxjrxS9IxRPjaFRp2G8sq+2ZrgtBQJC1CCjiWmvbxOteZ//mtn5
         P1O2vHHR5gTRj8yuAAocZLXTaXtBgPLHAXkAyRn5f+5JiIvB7IlJbTB8O95TzQ1XAkTP
         me65hxSWB7frIY36QxGswoPte34Nlhvpmyu2Qy6bzV7phELE1aID+zmSDTPwmv9Aano/
         x4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zLy5cCp+jeV9OG6RCDv/48a1ON5Rwkqd5hWJXoCG8u8=;
        b=Q97cZ6sEex8EOB0DupqUEzvXz/JD5aviF4l7+llTRynGwE8Lp2fJV/bVhHaTKzhPMb
         j8wiXX+oZWnU6GcLXveqpDL2f2FGkMnLQTaRJ2MSdX2eg99pWRx2ixrIHX9/UTyS4uMm
         j/AdfdjrFEZT8no/Ct9zBzNDTEzAP9Ij7SvEqVmfwwyVabQ7t81OHBJLPzLmpfcij59o
         7ZbE2w1mWdA6/F3gmP6eKP2NAoGbARFI9jbK29uhkUn7xMNMXW0sVu7TCJgbUC5VSkzJ
         QEH4RGFMKRBSxs32LVxMJQUimo6snuvuTuvqFm0B55SSWfPaJZnHHrKITKd+dy0IJWHM
         7ZtA==
X-Gm-Message-State: AJIora+HP4TkrunEpbhvKtOqNjASHyiKcCPu5l84MKF3fX2m8MCGtggL
	A9v5MPEaGSvrNzp8WLq5AcLvaGFwmgLay/J3
X-Google-Smtp-Source: 
 AGRyM1vP0Y0CR4wYuu41dSrp2qQTS/oQv1pLshfsBd05IfQv+oYa0mMLjd+axpLripP8+bl3pTJQ8w==
X-Received: by 2002:a17:90b:28d:b0:1f0:47:ca83 with SMTP id
 az13-20020a17090b028d00b001f00047ca83mr38372205pjb.176.1658155783799;
        Mon, 18 Jul 2022 07:49:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.49.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:49:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/35] udev-extraconf:mount.sh: fix path
 mismatching issues
Date: Mon, 18 Jul 2022 04:48:36 -1000
Message-Id: 
 <cb37eebf477e9907363b195c3d460b14717c5fea.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:49:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168211

From: Ming Liu <liu.ming50@gmail.com>

Since commit f077befd5f36ad88623aaf6a38b1a837ecb18650:
[ udev-extraconf: let automount base directory configurable ]

the mount base directory was configurable, we need drop 'run-media'
usage as well, change to figure it out from MOUNT_BASE.

Also 'get_label_name' function needs to be called ealier in
automount_systemd before checking '/tmp/.automount-$name', otherwise
they would never match.

(From OE-Core rev: c013b33162546fb5bd4bcc1daac75aa65d0be1a3)

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ed210054b3e253d5a67075bb9d4768d1661bef1)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 8b6ce77741..43acb3a7a0 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -40,11 +40,14 @@ automount_systemd() {
     name="`basename "$DEVNAME"`"
 
     # Skip already mounted partitions
-    if [ -f /run/systemd/transient/run-media-$name.mount ]; then
+    if [ -f /run/systemd/transient/$(echo $MOUNT_BASE | cut -d '/' -f 2- | sed 's#/#-#g')-*$name.mount ]; then
         logger "mount.sh/automount" "$MOUNT_BASE/$name already mounted"
         return
     fi
 
+    # Get the unique name for mount point
+    get_label_name "${DEVNAME}"
+
     # Only go for auto-mounting when the device has been cleaned up in remove
     # or has not been identified yet
     if [ -e "/tmp/.automount-$name" ]; then
@@ -61,9 +64,6 @@ automount_systemd() {
         grep "^[[:space:]]*$tmp" /etc/fstab && return
     done
 
-    # Get the unique name for mount point
-    get_label_name "${DEVNAME}"
-
     [ -d "$MOUNT_BASE/$name" ] || mkdir -p "$MOUNT_BASE/$name"
 
     MOUNT="$MOUNT -o silent"
-- 
2.25.1


