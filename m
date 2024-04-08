Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C79CD128A
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 13:20:22 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.106448.1712582412753240365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Apr 2024 06:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jj7XKM+K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4168a5d75aaso2920295e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 06:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1712582411; x=1713187211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eWlVgIsFWdRsOvvACQtR3dtdPN8eqb0opX0wSsUzvFs=;
        b=Jj7XKM+Kr7Po0mnvqXqsoXcNAd21BhIcQJGTOWJ4xNenaHfWXMfP1PFzJti+x1Tj2P
         vhNK5tDome/aLDOA1SYXpZhTPR1GSthuSN/GYTHYrQs0PeIvLim9P9FhwKHesSBvRB3D
         SToaRwtcQoLuM+xCZYVsDwrCZjHbc4Fv10gHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712582411; x=1713187211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eWlVgIsFWdRsOvvACQtR3dtdPN8eqb0opX0wSsUzvFs=;
        b=tWhkekM41StotNHpzFwscU+A2goVK0ksLJV5gwPdQlWRbtB6nxjouRb5Q0spnBoOx8
         IohLnyFnXR/099yZgKTfICjo/zGp1a6rWPZGMVtN9EaChtqK9HxsZ2H1HnYhegiPrNj4
         jb8tRN50ACMEGXZlW4994zU3b1qPrrkKnJH4FnuofKDpuicKgxapX7E4arDU6xhBxG7p
         mMYeFcjII1dE/0TLOzVd2brl05NTUBA4iEL5n/yb68tCBRSrom7fRU7lqBZBxVSVA0cv
         bov6QNQAZW4BKLshDoSHAj76G7nBTEsk1eDWVQ4dLx3EB1vfY4+MQyXViHUmuToO+YUc
         zZRA==
X-Gm-Message-State: AOJu0YzxjnooBZBWD/lKfJAl5Ha97BWxkDmMyrAA7Ohpu9mPhW3R9hbv
	bXcCXfHqY5GBv6/Vqya5C0CJ6xpRESqSCQ0RETK9nZNFuWbQDHDq0FCmMpxnGbM0iZooPlN8uHP
	G
X-Google-Smtp-Source: AGHT+IGKpUy2SxW0pQF75jWvYdLAA7OQ/Gp5gsujGZWv+W523ydMhKeASkLoHDG+8FEnoZo8fKlg8g==
X-Received: by 2002:a05:600c:34c3:b0:415:4a83:88f9 with SMTP id d3-20020a05600c34c300b004154a8388f9mr6031974wmq.38.1712582410727;
        Mon, 08 Apr 2024 06:20:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c0d5:82ce:9fe1:f44f])
        by smtp.gmail.com with ESMTPSA id hn3-20020a05600ca38300b004162b578d8bsm13139748wmb.1.2024.04.08.06.20.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 06:20:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] xwayland: Upgrade 23.2.4 -> 23.2.5
Date: Mon,  8 Apr 2024 14:20:07 +0100
Message-Id: <20240408132009.1763710-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 13:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198011

"""
This release contains the 3 security fixes that actually apply to
Xwayland reported in today's security advisory:

  * CVE-2024-31080
  * CVE-2024-31081
  * CVE-2024-31083

Additionally, it also contains a couple of other fixes, a copy/paste
error in the DeviceStateNotify event and a fix to enable buttons with
pointer gestures for backward compatibility with legacy X11 clients.
"""

https://lists.x.org/archives/xorg/2024-April/061614.html

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xwayland/{xwayland_23.2.4.bb => xwayland_23.2.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.4.bb => xwayland_23.2.5.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.4.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_23.2.4.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 092359172ab..b934a873d19 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.4.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a99e159b6d0d33098b3b6ab22a88bfcece23c8b9d0ca72c535c55dcb0681b46b"
+SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.40.1


