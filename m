Return-Path: <regis.dargent@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBDFD2F7D6
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 16:24:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.2170.1729182263440455069
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 09:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DeN7eBWC;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: regis.dargent@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so7275575e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 09:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729182262; x=1729787062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eGRISo1RPyT/ciovVDerRuxBkhjmmAwqW1NEPlCC8nI=;
        b=DeN7eBWCIdwBna3tlK+4TfhschTjRIf05UJPG/7hVwYHp0nn7LsLI2zyj+DLOX50il
         2Jr6rJ9BamuTPMylM3XxV54NK3kaWP/Mxf5ixsgXWpH9TzNXNA8oA18wxxgZASiFrW6w
         NTilWo7DRWLOjVdhHpm98+8kTQVj5DKqBMdZ10MbMw3iDX7QVRIiyEWkWYI9ktQa7JnI
         dFWYi6eoeX6eqqRXFfKwEcdXEsjlzvF1EQ7+s1KsxDLHZy94BXF1rENi8CXEvK5wzbNl
         NhMOXIwj6JtH71Tix1BzUfjmvBkTH0OB8LXGUqoZ5gFvqC92b1pV/Sfq4gIqw93m/AwI
         yKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729182262; x=1729787062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGRISo1RPyT/ciovVDerRuxBkhjmmAwqW1NEPlCC8nI=;
        b=uYLDXBY+ANGcAMRrdhQBSu8dxWQRsmd3K5flKGMC56mQc3xTC6kot5vp7CBD9eaBN3
         S9H+SHXQbJ2g2Z9NNGwMj9X1NAXa5yXEhkwRTFbxcHj9TB1KiX15A3L3QXzOqOO04Hu1
         d9dEdzC4RE8vzkE6i9kU1tOqwQUlTK1c+qJkcEOTcnb88JrMna9+9FWhCJDL+PJuuXKD
         ONijxFSn3XrYRnMnqwokWO5dSTbCH9TY+z/1SUcNt3pQsxy3eEleLYUFCJsKkx3pwEZE
         9/UCzxGpEPmwnRaO1GXLXUjyKuJub0Wfvup1YmlJnt+YuAVcGKGkYUo20J9JOz5/3Yqw
         4+kQ==
X-Gm-Message-State: AOJu0YyXjReHrqJneHuZhBT0ftiVUNc3oclWvCACiGU4H9xWeEukeuNs
	HjOOadZJRk3n72b76LZ86XQe4TuMwugm6m7ZPdA+WtzJEdar1ZTARR7MQg==
X-Google-Smtp-Source: AGHT+IHAZQoDqGZLskLL/X9WgQPSfgV1LDQcw62TQOLZjFhhAGuTOSX+jq4p1voGo5l+IysAjmBEtg==
X-Received: by 2002:a05:600c:1e13:b0:431:5533:8f0c with SMTP id 5b1f17b1804b1-43155338fe7mr41465245e9.29.1729182261408;
        Thu, 17 Oct 2024 09:24:21 -0700 (PDT)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431606adf1csm153365e9.42.2024.10.17.09.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:24:21 -0700 (PDT)
From: Regis Dargent <regis.dargent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Regis Dargent <regis.dargent@gmail.com>
Subject: [PATCH] udev-extraconf: fix network.sh script did not configure hotplugged interfaces
Date: Thu, 17 Oct 2024 18:24:17 +0200
Message-Id: <20241017162417.527267-1-regis.dargent@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 16:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206032

Signed-off-by: Regis Dargent <regis.dargent@gmail.com>

Fixes [YOCTO 15616]

network.sh relies on (long) missing files (eg. /etc/network/options,
/etc/init.d/network) to decide if it should configure the new network
interface (ifup) or put its name in /etc/udev_network_queue for future
initialization by /etc/init.d/network service.
The actual result was that the new hotplugged interface was never
automatically configured.
Removing the obsolete tests allows the script to do its intended job.
---
 .../udev/udev-extraconf/network.sh            | 32 -------------------
 1 file changed, 32 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/network.sh b/meta/recipes-core/udev/udev-extraconf/network.sh
index 3ee92714af..ace38808cd 100644
--- a/meta/recipes-core/udev/udev-extraconf/network.sh
+++ b/meta/recipes-core/udev/udev-extraconf/network.sh
@@ -6,38 +6,6 @@ echo "$INTERFACE" | grep -q wifi && exit 0
 # udevd does clearenv(). Export shell PATH to children.
 export PATH
 
-# Check if /etc/init.d/network has been run yet to see if we are 
-# called by starting /etc/rcS.d/S03udev and not by hotplugging a device
-#
-# At this stage, network interfaces should not be brought up
-# automatically because:
-# a)	/etc/init.d/network has not been run yet (security issue)
-# b) 	/var has not been populated yet so /etc/resolv,conf points to 
-#	oblivion, making the network unusable
-#
-
-spoofp="`grep ^spoofprotect /etc/network/options`"
-if test -z "$spoofp"
-then
-	# This is the default from /etc/init.d/network
-	spoofp_val=yes
-else
-	spoofp_val=${spoofp#spoofprotect=}
-fi
-
-test "$spoofp_val" = yes && spoofp_val=1 || spoofp_val=0
-
-# I think it is safe to assume that "lo" will always be there ;)
-if test "`cat /proc/sys/net/ipv4/conf/lo/rp_filter`" != "$spoofp_val" -a -n "$spoofp_val"
-then
-	echo "$INTERFACE" >> /dev/udev_network_queue	
-	exit 0
-fi
-
-#
-# Code taken from pcmcia-cs:/etc/pcmcia/network
-#
-
 # if this interface has an entry in /etc/network/interfaces, let ifupdown
 # handle it
 if grep -q "iface \+$INTERFACE" /etc/network/interfaces; then
-- 
2.25.1


