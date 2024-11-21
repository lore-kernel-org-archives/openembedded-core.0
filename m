Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C33AE64035
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:55:01 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.10705.1732226100302293970
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:55:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T/nGUlub;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7ea8de14848so1302627a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226099; x=1732830899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3kBA5DkGas62gUhUUtByt8cuvsHEqu2EMaLijKXcTc=;
        b=T/nGUlub9fAb8idyXim/kjelLxfabff+H2HXBMHbEQb3pQEcaPNf/GO0HfSIiTVfqu
         4XY7+QkStFaDW/am9Ukpp42Z7oW3JukpP2OGM7ZVuieJ/4dvRGyZRdlQ10Gtbe/HY5ji
         SzSERUiPYRTszY9bEVqA3QlJ9b1o2kPqNhoz8+nggAMYtbMSe8CxacgxkbGOMA/kwUW9
         DK/nsXmCtFKKoKxqMKhVFWZvU2ABI2CH3mcCnhLdxRWt/jOWDaAyZID8Fk9h0eQ33Kej
         WMoICHtWxqwupbpcH0D5NT5oqCC+ESDNMUcwE50zzRseZ3Ks39jhdHvXav0LMgOxzD0m
         cn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226099; x=1732830899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3kBA5DkGas62gUhUUtByt8cuvsHEqu2EMaLijKXcTc=;
        b=m7k/URfLG+5AxUOkwXMPQnevs708akYKc33vLH5Wr1Cdjj3jLYn8Bluix6GictivxP
         NfWwiibfrr+0L2xSUOqvzKza+OfMXQBID+7FpCT6AR4rC3md3cdYlu8qZztXAXuTD6DK
         kuL8qUIXwaufr6LBU/plod88ocYE9jsnFxYL/tpGB/yRYwf/Ula+AqvJFv5bNCoCbzuX
         TyUQy0MA9xtageZ7fLMhn1ucb5vSo+8KqZl+Qj592SsuQbcRrVjPEEB3J5PkqS/mIGH7
         9nj22YgGX9IV9B014NqA/qskNvp9LeqbSDct58gGlWIhirHNPFZHgjssodRH2EmmM3tX
         BpCQ==
X-Gm-Message-State: AOJu0YyaAK/RC13sQY/kpJuDxXYcqZDBVCubH9VhiWfn3hNtnVh6Ourp
	J6/RdJdO7TXDw8cLWp7l216tfMhiy9ZECGH/J06mt1yPfqJenQ70GfdIpvvH95ijHCOOxLMFJXa
	j
X-Gm-Gg: ASbGncvzq5fNpaPVVnacGkTtCki0KKySA4exsidyK8hxvhsij1eVipbiqAvYyiLTOqU
	SBOClyCeuzRC5MISI/B2PmrYGFR0fGEtmzFJOAoo24Hv9egemf2z4MBrdeTG3dNXqyM7X9Ivf7b
	gRcBYdhu3yiGtCFLfmStdMKcgasVSvzBBVw7PyMttmxm1i8IqatHZ8/DvHaZiuZ+HnfZ9b/s1k+
	QJM3kphXsJUD8P8mL2GnylNBkoI2tWBl2dDUoM=
X-Google-Smtp-Source: AGHT+IGK2/vU2beNMnyi/FY5gqQyEHnTnAEL8bHfuFy4KYiPqKQ+p7+iT8Lb+AwinILTIcThc8kMaA==
X-Received: by 2002:a05:6a20:4303:b0:1db:d84f:c7d8 with SMTP id adf61e73a8af0-1e09e3b6c96mr648872637.2.1732226099349;
        Thu, 21 Nov 2024 13:54:59 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/27] udev-extraconf: fix network.sh script did not configure hotplugged interfaces
Date: Thu, 21 Nov 2024 13:54:15 -0800
Message-Id: <16c74f06c2573045698827321928702eff6c3843.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207580

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


