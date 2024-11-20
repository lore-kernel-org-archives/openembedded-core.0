Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4019D6395F
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:58:04 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.13871.1732111078994911131
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ktwFHhnw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21269c8df64so10625095ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111078; x=1732715878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3kBA5DkGas62gUhUUtByt8cuvsHEqu2EMaLijKXcTc=;
        b=ktwFHhnwhGocSNbEsfRzvzm0RZ2uphCWy43BjYaBKPr+f8PV/z6LJZ9H7b80aAgzTm
         FGmkH8KuxMiBG/h1LKSo4g0dOfEvfyk1EHEX13dqX6oyoozlatJy9MOaOcz2Ph198eWE
         Wx21xq4CKuUbxQeHtEW81yYtFx3HiEevxa+7YmdxkP7In3FgkK6z/KR5u8UwV4y3ACp3
         qmiDHpvcbJY1zy18C/zCBtSpc1xUu8c20Y9gPai4+m74GakVKkMm3MlCa067lSYJaJUB
         mtB11wZMBtwIHmanj+sNATlCkPPU3idKaysmD7AFDL4maPp9N5G7KmvHCdemTx+Gj+I5
         AdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111078; x=1732715878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3kBA5DkGas62gUhUUtByt8cuvsHEqu2EMaLijKXcTc=;
        b=oGofbuozB283IeD8PE7Wb0AGmgPqzK2UgSay8D9o1Xs4E2Glb6QDIGyk4w2cag2co7
         XiGiAKU0ZYj9uWAgw5AMvvo7eNYqfOx9VjdKUrUYnsIUxLl6VetEllJ8Pnj4FLRteNju
         ttfxmqpCc9ixeAC5+y0jfPL42P/8wkcdcySi6+9hXsObAc2kashbtJMVLFnbtzGkb9Y8
         8itUhk9VeWrrizHcCiI2LFGovybJR0+VrhVeR4M2ZTdVZurYfFhwMkm8SEtuBT4mSQ1D
         SPthMOPHxpBjkquTWFSzFZM6Z7eMgHyRQ+iS57TiYPqT8vzchEJ7oL+AwN9PNhaAUxRR
         LM5A==
X-Gm-Message-State: AOJu0YzR3zMQjxfaCAr5s/xLY1OPNIqES21wj+SofN4cQ3CoGz84Gcj9
	ClkFUd1vyHMYeFGQTfr/00A+42xM/x5ujrN/Zi5YjkMXmWJhSKUmVrsw7n8YcMf/k/9fvJeTxVg
	k
X-Google-Smtp-Source: AGHT+IFQNv/m8PsRZyUGA2gho9zLdfz/PExKgkZQYsPQtBFgwxPjBHx7IVZf4taxsgg3xCQ+MErWIQ==
X-Received: by 2002:a17:903:298f:b0:20c:872f:6963 with SMTP id d9443c01a7336-2126a3bb2edmr32593835ad.33.1732111078153;
        Wed, 20 Nov 2024 05:57:58 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 28/31] udev-extraconf: fix network.sh script did not configure hotplugged interfaces
Date: Wed, 20 Nov 2024 05:57:00 -0800
Message-Id: <31d01b27a86f84e62b3cd9698786c894091c352f.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207452

From: Regis Dargent <regis.dargent@gmail.com>

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

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 160f7139172ffdf510a0d7d4e85f7fbaac7fd000)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


