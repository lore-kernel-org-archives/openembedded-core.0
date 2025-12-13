Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6510BD5AE64
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:09 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2994.1765620065185848774
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fLvgkAER;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29845b06dd2so24140105ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620064; x=1766224864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+Ui4QIQKDX6tM6b/383GaEi5OERAp1HaqFmfLKsL1Y=;
        b=fLvgkAERQYRsIrLlubhUQIP+v2gN0I0Mw/ZTV9vmcvkHIf4ZWxG9E0jGKOAIvSiI6d
         uxAGQuuf70wt+ZtZ5BzAA9nPUbW0RFGUPT9bklthNP29L9eBWUutyI+QX2QhHA3/ZQKG
         3NlFbbVSocfCUweW6cFAsuRv89lSUb0IRqjgdM3tiu3UrrOsPlOtlXWTdb1b1jCqpq0z
         VANMe2UNsV1oovMk4hUHc2rLGe3Ea0iAYoq1W26Xhz8vtiOnnGeJDpiISdjph3C6IG/8
         4yYnzV6N3K/9UaQurbKNr9V85Fka5K/Xf+mWGkheLuRTt0UFDNH0jG+ThFGnsbP6ho/d
         sJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620064; x=1766224864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q+Ui4QIQKDX6tM6b/383GaEi5OERAp1HaqFmfLKsL1Y=;
        b=eFjxdNWojhm1rR4uF3OF2rGwvi0GxkuP6VgApEvRBnS3v/sZlXtDcnz7x30IcVddqI
         bPcLBkPw0Awb9xgP2h755iqW7iP800MqZaPb7hfjL0B2Fm4nOdklSi36LHot+2hnmTZO
         ssAKcDTNyqgx7p2iax6UWRNMCRlchQ2l/wbSTj+gMWnT48QwVciIr4WIZVFaRCIl8d/p
         Ux7hwMFQjy4hPLCgEq0pj2Ri+8U4IZ6+Iycmq/06x3vxlnbiHVqKQ44HK2CGRMQMLJwP
         snZKT3on+ZXGAEIMiZxIUpzT832DPyzJ0lKhrJwkFLE5i40KKrTLZCUj50ad8zzdnEvH
         6tgw==
X-Gm-Message-State: AOJu0YzCsphJsUWyzLUSnkam41bV/W/F/rtpTnNQT5hx+lmbRnbH8Dbv
	5KRtkNRaFzqPau661oY65uKuBrgu2BStvmBBhDgpjd73Z8stX8CUCLl2P22x8eYc
X-Gm-Gg: AY/fxX5PUiwehz+adEWB26vVJ9YrBgUBxc6l+ZDMv5nQZUcYqS4pBhQpA8A9qRpmgFZ
	Hp/u8Mk+Py0iQdrKW9Ga9qFS4pDVjwZodxZNKSMO1tCakVbBaR0ndkBRs8bIHWmPYOSYcFIPuK4
	JiL7XF9IPo0xCFYfXGb5xlCtS6KVcuUYEc8QTXKRPlb6lFpZCL9T3ZN00kcHKSXo+3IxIrHzADg
	B0G2X4eOCSUdlIZziEQHodY7SynwHM5fSYIk2ZxA71qUd+iLhu4pxUDsHdwmZmeyfEB/yQg8W6U
	myAnMSgLOW0nAk6D6ibrJmWtf93HhN+qdZXydEDZtOMV2icU397WOuvz/+g0HSKGmtxOYsA9Rn4
	NDrHpmbrSXkCPWni45tAYcIS9oho1kqZXaEaQsnW6jwRaSubm0s5gR9WJ0cA374hjWp/GXkkwzC
	1GCmUYQFcv3XeYlaYmT2SG6R0a
X-Google-Smtp-Source: AGHT+IF5MHkDmCEj7oB2W+X0GSG+v2I79AyQ1MYCQ8ucauQOmy0Ysw/PezGkQJsDAXMeGNmn+Z2/5w==
X-Received: by 2002:a17:902:d507:b0:297:f2e7:96f3 with SMTP id d9443c01a7336-29f23ce3f42mr42215075ad.50.1765620064378;
        Sat, 13 Dec 2025 02:01:04 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:03 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 31/67] gstreamer1.0-plugins-ugly: upgrade 1.26.5 -> 1.26.7
Date: Sat, 13 Dec 2025 15:28:55 +0530
Message-ID: <20251213095931.2571498-31-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227649

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 8d9ba1e3d17294c6df297cb0a200745e3ae76c9b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ugins-ugly_1.26.5.bb => gstreamer1.0-plugins-ugly_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.5.bb => gstreamer1.0-plugins-ugly_1.26.7.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb
index 5583c2f128..fa34912a06 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "3dfc43435be97e110816bac6d602b0f206a038546279683d9d25372ff127db52"
+SRC_URI[sha256sum] = "11f2e4f34bb2e841dc60edc95581572bc47be0c11e577d12bed98bb1f80a661b"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 

