Return-Path: <drew.moseley@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC46CC19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 15:10:45 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web09.6063.1659625836399801041
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 08:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gpV4H7rx;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: drew.moseley@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id m7so15235044qkk.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 08:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=obXFkbXPV5ia710f3pk1KrT8UiT2Wlxda3yeZINAW9s=;
        b=gpV4H7rxw3uv7BPXON8BxrirxzpoE/9+yFVZ3U02ZwYGxQ9ZMsGRZCJqK9/QRcfR8i
         POrZ3NKnDvDUAa1m1kuHyBBO8tFJ9yCnHmugFTO1DumvXvexUWmM50ospAb1GHqKFVOC
         v16l0tWHgIXoIHfgttFbB1nOTT1C2NlzU/uRlyNwfes+pSP4Wdotc0xMvRP4f/u8L0Jv
         2emDc6PCqf19Ef51s2AhYiFUlvqjYhkKeXQb1D95MzTW7+04epT35FS0ibmpr+amXiFS
         JVhERZgJ84OGzHTqhsYDGkhEVeNBpaE/U5MZNb98ZqIftwAcS7H3a0YUpvPjV1SHv/D6
         mxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=obXFkbXPV5ia710f3pk1KrT8UiT2Wlxda3yeZINAW9s=;
        b=jJAmlTnI1o9DB/I4Yp2HvQUNilZxp85+mKbWm+0E6zk1GrnxhQQQLh7VRLmlElXC22
         tcHnQxHYJ3Xy3p2XRSyMhSOxGBc2xaPBrryLfL47EUyKk9cAGkkC3F2RGFaO9+ldbQrv
         3zKmEADj3IVeVv8IxB0CYswQeOH8e5iw4p6w6B+496TWt5R2Nyh/mjICcK2ormzyTlbl
         Z9lHBY0pL5X87MbBeYSmZ+DNE/DwhhEFJ7uog5WXvTw2QkSG5WVCocTakW4IWSCZeNmL
         Z2JusL4okZZQv/4LMm9AfsRgxSegStpPA7rUgM86rlCQXOnOVn23ziTg9B+2nNvRexp0
         W7Rw==
X-Gm-Message-State: ACgBeo27guRE28hRxWAPdFRge5EKfB8wSHgZDc+sxLYgB/dKFCSezTW4
	6w4OHrywnoP7QJuXL0JKfPrRGYaSucKAbg==
X-Google-Smtp-Source: 
 AA6agR7U6053H+NrlpvkJ5fdyjt47h8Qs2qNvjv5+SxaOAo+HXdX7ItEsS45BTuVlE9T0MHoJFEPAQ==
X-Received: by 2002:a37:6857:0:b0:6b8:d195:8359 with SMTP id
 d84-20020a376857000000b006b8d1958359mr1743771qkc.118.1659625834504;
        Thu, 04 Aug 2022 08:10:34 -0700 (PDT)
Received: from aruba.home.moseleynet.com ([24.96.56.90])
        by smtp.googlemail.com with ESMTPSA id
 dm26-20020a05620a1d5a00b006b5df4d2c81sm834647qkb.94.2022.08.04.08.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 08:10:33 -0700 (PDT)
From: drew.moseley@gmail.com
X-Google-Original-From: drew@moseleynet.net
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	ch@denx.de
Subject: [OE-core][PATCH v2] rng-tools: Replace obsolete "wants
 systemd-udev-settle"
Date: Thu,  4 Aug 2022 11:09:52 -0400
Message-Id: <20220804150952.2831520-1-drew@moseleynet.net>
X-Mailer: git-send-email 2.37.1
In-Reply-To: 
 <CAMKF1soSmZCBvJHYM4GPSUUjg9SY+ZuRuVC7phro1YryVadd4w@mail.gmail.com>
References: 
 <CAMKF1soSmZCBvJHYM4GPSUUjg9SY+ZuRuVC7phro1YryVadd4w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 15:10:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168859

From: Drew Moseley <drew@moseleynet.net>

The systemd-udev-settle service is listed as obsolete and does in
some cases result in a significant boot time.  Replace that with a
specific wait for the random source hardware device to be loaded.

Before this change:

   Startup finished in 4.025s (kernel) + 2min 13.236s (userspace) = 2min 17.262s
   multi-user.target reached after 2min 8.153s in userspace

After this change:

   Startup finished in 3.956s (kernel) + 13.294s (userspace) = 17.250s
   multi-user.target reached after 9.522s in userspace

Signed-off-by: Drew Moseley <drew@moseleynet.net>
---
 meta/recipes-support/rng-tools/rng-tools/rngd.service | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
index 568686e80e..0f50890dcb 100644
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -3,7 +3,8 @@ Description=Hardware RNG Entropy Gatherer Daemon
 DefaultDependencies=no
 After=systemd-udev-settle.service
 Before=sysinit.target shutdown.target
-Wants=systemd-udev-settle.service
+Requires=dev-hwrng.device
+After=dev-hwrng.device
 Conflicts=shutdown.target
 
 [Service]
-- 
2.37.1


