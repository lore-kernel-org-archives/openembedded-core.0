Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A695CFB518A
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:29 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144829.1775776280756596556
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kHzmT/N7;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso15334285e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776279; x=1776381079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCGN8BUF5urP1YIACI5hJZJcaPbWT21zdmBon9wV9V4=;
        b=kHzmT/N70e9p1QBvbQ7lpTEx2xjbhOOCj0HMrmI/Nzc/g90MiIl56cx7ZBcM0bgdCa
         4BuNKA/5GDYeXLvleNtK7mlgVpLXtjOEK0uPtbzyG9BnPXLE90KwO5WFf2NvjwvKaf/a
         cJddAxwTc4jRwK66GHmrVpb5ky/zcs63CVtdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776279; x=1776381079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NCGN8BUF5urP1YIACI5hJZJcaPbWT21zdmBon9wV9V4=;
        b=VclA7qeCdSXdgm07ppPEW/k8F6uXlYtIJrXy/1FniYRvPEjnyT0RVRSlKFyvnswz0w
         azOOLb/LyvdiaM0czpYq7+9SvI93eW3wB9RM1OHHZ2gkdlNDtGXMMS0n41jbvqNbBzks
         D/KyyEzmuYEWMxLb3dQljb2DCzhoQRz9+K0FPSv2iZGovhFnHrKcIFhX82mrF8dkhYPo
         nuL1mlI3lCA+bdZSHpDVBVEXsvW9EIKYX6ApcLFub430Kf8+9NtjyXlT5/S1RO2ripEr
         JktdhQOX7s4Sv6Jl8syRlOiIi30rrZJ+PvmDe1dwtVmgzEe9dskFc0aT+N0yKugxSMLr
         BZrA==
X-Gm-Message-State: AOJu0YwAqvjK2lCZX0kjINTqu/LYojMwQJBtxqaWFJmqQd0pYJlWGupN
	7Jau//eYdYEbM4VFQx7m8NWENNc5ShNB2J+Lm063Q24u1ii5If2mATGlOVZaX1C28oU0Wxz8DdB
	md2e7FudWzVn0
X-Gm-Gg: AeBDiesYzDzpugR4eNBGvKhxVqabNLDJlKk0OUuiZJuEWQVMv5NRjFrfaxP1+azfnmA
	DrZicw4g1sVP5gDK+jsJccvZumseYUSZLthXhCVtPjwQE+TsjsxWyjMGWOuUJc+ewzj6DnISZUf
	f6BPInIIS5pnMXUlTsyqrc9HRuOcvtntxD9RyRSECtxD9wcdygnlstw0o70fKX0+5pZHQJma1S0
	zQjoncmA9zh72McdtWZDdqf2P5jIZixh4kuXHV/2Na+kxb1bXTuvr8LfZSB80/MqpPW8kXxNQSs
	BJVH7/XbyBBjQplhIMnVswQ5fTGdpgsprnjpHHc+99BjTX8iH9Cm+b1N9R+jpzqZJB5Ok/4vHPc
	UHwvyxr1Q9k2pxyA20l3S2qEv9VMm5xCSQzAs0Vys6iWFJ0EO54T/lWznGFY3IkqgsKgGGST3Xd
	iFE+EvMJ2Yj0bX3meUhRrvOpgN3A8uR2Q/ebmUD9U+uZlut0VN6+gT94Vlsak8vUPkufo5BJAgC
	SilC3cqXLp8WDjCQU48aHbaksqS
X-Received: by 2002:a05:600c:4715:b0:488:9e54:94c0 with SMTP id 5b1f17b1804b1-488d67e7dd4mr8968875e9.8.1775776278910;
        Thu, 09 Apr 2026 16:11:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 07/30] tzdata/tzcode-native: upgrade 2025c -> 2026a
Date: Fri, 10 Apr 2026 01:10:07 +0200
Message-ID: <d7e7612a5b7db3b435f3d0cdc512ee356befdbfd.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234966

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 217ede26d64901d9a38fc119efa684487714c08a)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 1c08d4b1023..c498c0c9ffa 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025c"
+PV = "2026a"
 
 SRC_URI =" https://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            https://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "https://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
-SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"
+SRC_URI[tzcode.sha256sum] = "f80a17a2eddd2b54041f9c98d75b0aa8038b016d7c5de72892a146d9938740e1"
+SRC_URI[tzdata.sha256sum] = "77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7"

