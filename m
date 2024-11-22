Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C58E6ADC6
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:27:18 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.35425.1732310837418910236
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=v5jpaOnp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-724f0f6300aso209854b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310837; x=1732915637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3kBA5DkGas62gUhUUtByt8cuvsHEqu2EMaLijKXcTc=;
        b=v5jpaOnpzSJZVT4olxrqQxv4baTf9KqxQ/hltGoscsssVRWUEYGo1jpGymCnTGfUFQ
         evYla/CIQOlRvMT8u18rq/HQQc0sCldCGA9A2u3Zy3/Sj0/bhTbt27HJUfbOOAL7Ymri
         +QFhrTPlAOcevYmCjA+MPy7l0qx53ySPyRLt7A+RoF0dgZp5VyZmZgCmgxq11ZyUp1iI
         XobHBQxcQyMRDoxaE8RWrF1v749NVXRDPtI2+8fKNmHmfcbK0cMvFaqW3FPIjolZ+Xcl
         q2HMnmP/iGNTLQivSBDkXO86zfi2inNjctvGOUwmFlydccor7ffxtJNYYIj5KNNjHUOT
         288w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310837; x=1732915637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3kBA5DkGas62gUhUUtByt8cuvsHEqu2EMaLijKXcTc=;
        b=BPjSKOv5ROeGB6JS3faJ/DRceVd3yultc63DFE5txFQuZdTm41+itqS3EPpawihlbJ
         fzjmOQgENOa1syX+/LoxPjIUj4+HEKSNyDOZK6jBIXj0VzknVMRItEsD71Nzmo+ckHbC
         Dej7U4O6a455XunQU3ZOmzZcRZXZdFJ+YqceVLFyMOXcUEIlCGhnPntECL/02dfcAQ5N
         VlVSMFtE9j33f8BP3T3AjmP3rdwpbK4drF7FRDxOARa147NT3ZQ8C9V4I46b3m6QNSU3
         OtKKjz/qDGCIBOCBv3cM+T4/55R6SNL3z+5vmmau3BgqjPnXDXjDO1pEr9GqJZwMN8fa
         YwUQ==
X-Gm-Message-State: AOJu0YwiFXy1+qr/sx0aR5gaURhS6/1EO2QwFuE8eu9N1Yf/hRCYglp2
	K4CJMbTEm+cmMUx/GG+PF0ow4vdVUpZvtHccfYC9t3iqEaLi+TAiWfoa5IjSfWYAGW7P/gyFcul
	Q
X-Gm-Gg: ASbGncuylOSHrOwN7AHhv02C5sgKc9uOK7BbPLzqX62LXJP8N3ECDfi9ly5BQ/7s13g
	QxJpVrgCDD3i0Rrm9qHQepm1ysWQydLmBVGgh1Fi1vqTBhgPRnqkWX2gRu0TvK8hPoHCyezrzy3
	wTqEfF6KuJtNw8SbBcsuJgxdZI4nzEHD4Oih98QwMDkHI6Y3/DyIM5U+CiHFwvy+iWGUr3aP8zk
	F3GBqdY0GiLD5ZaDuzowaYnGJWzDskmQTEtA30=
X-Google-Smtp-Source: AGHT+IEwqtFWTRIAIrGrQu2uusKHkbz7H695JaaG5ujw0ENg2T724f3EpTSsEzD9wcWWpq6IPRDUxA==
X-Received: by 2002:a17:903:228d:b0:211:f335:aba with SMTP id d9443c01a7336-2129f5790edmr73162905ad.31.1732310836665;
        Fri, 22 Nov 2024 13:27:16 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.27.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:27:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/19] udev-extraconf: fix network.sh script did not configure hotplugged interfaces
Date: Fri, 22 Nov 2024 13:26:38 -0800
Message-Id: <8c10f4a4dc12f65212576e6e568fa4369014aaa0.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732310669.git.steve@sakoman.com>
References: <cover.1732310669.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207669

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


