Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77927FF511B
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 16:16:24 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85467.1775578581328818371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 09:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=y5Q5bEzA;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso32177605e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775578579; x=1776183379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBTX+qTNavn6kWq18ryoO1tzu8j0c9iwV7PD4ZfpRZY=;
        b=y5Q5bEzAR9AyU4l0ivgp1B/NWrkuruC+aTMP+PtE8fj1wkrZcaYr+FgJz1TrqDRlMG
         +oZuipL94Pq4XZuXA1LhrnuQYOdtd0OrNGJmmkvM9uZmVqB3+8v48cG474L6rGfGPczb
         /vwzjnJTUnAviyy5gohcCrA1e9gjQc5PUfcnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578579; x=1776183379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WBTX+qTNavn6kWq18ryoO1tzu8j0c9iwV7PD4ZfpRZY=;
        b=IkkxoyGUow4jwHFaxrNdafPry3drIaP+HOzZaVf1vB7lEJMVxz+Knk1InyKS4GjUV0
         Y8janOTNf6c6uiGGjHslF8ZqrL3JQ0zKxnlxNKXgWJhOSbKelfKDYl7NRSz9C/wz+WeM
         atjoNgmddlLwRI/yZPaMPWoq+WnlU/27Js9xUw3/kZvfYPm0Nc7vmo8XYZ9jlpV+sUvR
         qMqS4O09mVvW0JQvFDoAaBYOCaxc5BN0O4oUmoLhtAPVGkXe3Csd3erSskzX1kX8Rb+4
         dbJb8bkyWfQuFYcmpiKO7qudDU3pHdCFiowvqYDWZ4hGLn3+/rrLUD3FwZcic+tHLRt7
         aRAw==
X-Gm-Message-State: AOJu0Yxbqpv4ayvMV9O/VOEYGLiZ6KSdqiB48A4KHn+VuqmJMsF+A7mi
	ae5sSEOHZ0uob8upLu7RLEP81dF2yiiOV72dJuUSUIvlf475vmLx2sjUjbA6AFP+S1/d1IUS3W8
	ZBwuy9WQ=
X-Gm-Gg: AeBDiev7V1AXLlSP2zKEKpnhI7pZvJeenpgHLgjQq/Ub78TJ5qoCdBOmsVdBvvDvrOQ
	ZGKQDP/pCM0Cq0Hmgxnl7AB89krz5RXx/RvHYpVvKp6aaLI1bc+5pp0/RUaL7Q0iafZaGPDnUiv
	w8TvvfabEyzD5DIFgHYZFyGvkNXiuHrYby2D9xz7I4D5WGK2qbQ9nyrwp7xVcNHr+XygdyTZgGK
	sHPRgJ2Rx7mnfaBqLmHUZ8KzGQCYWix6QuWqJOXdzng15pRwvUJGlUNP8KBXNioqb4rP2CF86IB
	RO4Rl4mzSGdiHz7h1aNGnWuslNTWhrTSpMFgBn7GJIO/EijVeGOnB/vjMrwCu8kosDAc6kBN5Ex
	6TDvbvJ1en7aYIoNgjUHBqqmofzgtTqW5EAEmY3dV4vQjtc2pn41/CF864qAQJm/Q4jiYFKNIq1
	aQFx7TOvekmoPINF97Eauh3oVyPGq3ernTFqfpEXeB8PYSLBk7VIO+rUxjbX/Cu5gpeANEiCr2V
	c7EjRc4oINxJXblIkBCY8IrKiTpLUV/gOFpFJ0=
X-Received: by 2002:a05:600c:1381:b0:487:1108:48af with SMTP id 5b1f17b1804b1-488996a351bmr251687875e9.4.1775578579405;
        Tue, 07 Apr 2026 09:16:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003bbe8013556e3516.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3bbe:8013:556e:3516])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c4b57febsm1195665e9.4.2026.04.07.09.16.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:16:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v3 06/19] tzdata,tzcode-native: Upgrade 2025b -> 2025c
Date: Tue,  7 Apr 2026 18:15:43 +0200
Message-ID: <d40198e70a3b548e5dc7b95dee4fd4b9cb0358bb.1775578386.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775578386.git.yoann.congal@smile.fr>
References: <cover.1775578386.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 16:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234759

From: Vijay Anusuri <vanusuri@mvista.com>

This release mostly changes code and commentary. The only changed data
are leap second table expiration and pre-1976 time in Baja California.

Full release notes:
  https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 452334219309793ad74abd6ff390dcb06cab929b)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index bb81d77ccc5..1c08d4b1023 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025b"
+PV = "2025c"
 
 SRC_URI =" https://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            https://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "https://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
-SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
+SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
+SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"

