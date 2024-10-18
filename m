Return-Path: <regis.dargent@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D440D3000D
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 13:35:39 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.22000.1729258533030173185
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 06:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aPtFe+Gk;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: regis.dargent@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d47b38336so1477415f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 06:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258531; x=1729863331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=80+Z3Bti+KUPvXEvp4XPcdeEHkxnhHR9pCigNACPO3U=;
        b=aPtFe+GkLhSjNQPYpzKeeuphvJ6fzYDH/fKkdSLu2sl1gxNx6SclmFdapHdRBmbZT8
         H87gnY0Mf/emCUHtxfNxJHiKYdWBhhjB5xoqCZHdK4TEhzuLImYmpRdnk40bX0vYiwWf
         4CLbmZzUpUL8oGssubQhVVE9tykiBKzw8a9GW+cb/sMbHKt+Rtf+GcnQjjF0HqOWv83W
         dDw5eCMJPbZ2UtpGEQHX1BXbRRWbXGHel9RUh4dfh0F/5fXv7Ox3yzRc+bYbO6jSzQfA
         adtA5O9oHAyTNfMPCQzbFs91NseAGmpDo0C2Srr1gCb78svvn/OUVbJO70RBMKFsMDrP
         iAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258531; x=1729863331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80+Z3Bti+KUPvXEvp4XPcdeEHkxnhHR9pCigNACPO3U=;
        b=Qsh4cA+gMGhpEz2X6Iby8aKhnMOtNcTj0LskIGPCroCRke0jbK8EJVQpiB4+I0iZ5g
         uMxr7R2Ur0H1JCpOS1uYV4gMwzyr4wDoTmx6IXVznh5eacuSs8CGcGc303H8OfDMLcgE
         xpbkv0E1bUp7krjdTtZYktnaVajwAmb1HwKcfyjnzYV/qt+USuB6ydEHouILTpF1jpn9
         pbhCsDpHtYCOKAzvjLWxy98tO57QSLz5hM4++xZmXPs4M0zssKgvFdRXvanBZRcgzI6l
         0W/z4qiPi0aPpejMi2LKlsE/gvJUJKDny6SM/NXRg/46dT1+z9xl3OHB7Duq+TNmVsAJ
         GWsw==
X-Gm-Message-State: AOJu0YxUdlo4i1yse1nGxwsAqHuymkYTP/QnI2rqt6Bl2GDci25ow11U
	UXV+U8OneXr/Wc6o+1SY63EE1JB5pewr5oVNBNxh+/WtloC5krQeiHHF1C2l
X-Google-Smtp-Source: AGHT+IGOmb/1CpOZZgL8Z50leD4eQcHnE9RYletlshf4N0vv3o+QK9T8yOFDqUE0KlnYW34vA+OqYw==
X-Received: by 2002:a5d:564b:0:b0:37d:45c3:3455 with SMTP id ffacd0b85a97d-37eab70a1fbmr1673336f8f.30.1729258530961;
        Fri, 18 Oct 2024 06:35:30 -0700 (PDT)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf027a45sm1973754f8f.17.2024.10.18.06.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:30 -0700 (PDT)
From: Regis Dargent <regis.dargent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Regis Dargent <regis.dargent@gmail.com>
Subject: [PATCH 1/1] udev-extraconf: fix network.sh script did not configure hotplugged interfaces
Date: Fri, 18 Oct 2024 15:32:38 +0200
Message-Id: <20241018133237.575289-1-regis.dargent@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 13:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206063

Udev script network.sh is called when a new ethernet interface is plugged (eg. USB).
Due to some (old) missing files, this script does nothing, instead of configuring the
interfaces with ifup.
I just commented the corresponding lines to allow the script to reach the part where
it calls ifup.


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


