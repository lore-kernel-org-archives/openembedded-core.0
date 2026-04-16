Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482C3F8DFC3
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 21:09:06 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26352.1776373738315469890
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 14:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bDwkuiyi;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so58511925e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 14:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776373736; x=1776978536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fv+AcgRkfpONVTzlGUXcmJYNPvD4ePnMqYy9SXENRcA=;
        b=bDwkuiyi54XvuvSzW/SGHE/Kd78+ZYUPG8neIiV3G8eC0h0jvxCIkBgMO2NopYQ100
         MPWNA9gZGVLRt6cdCRVFF11g493rqXPlwrX1HzPitXZTiLqw+sVU1ToU01xQdMvzdzGk
         9wr09ApKAdPNyRcTnhAnAyj/FAJDvWLtcWaVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776373736; x=1776978536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fv+AcgRkfpONVTzlGUXcmJYNPvD4ePnMqYy9SXENRcA=;
        b=GEQfJGVEwAmBYHVSykKRiNpylnXv0iLtPqn1dgsoFhZ5aOJNe9LBkaCy/5bepWo2WQ
         TDm8WXzCk1St2KPO8kRMc2/7qbL4V9VwNCvgERmd3IrV90g5csWHwEowDnQCQDe75oJZ
         4z3V8jmbbLN1SQfLCO2kyA7OwPMk4ui9mYt3Yt0yBu8dhqV5yeE2mW7IdtTUA+Bgm5uZ
         x6G6pwu7QRB8QXDaAKk77b/p6zcsMzl1fqsr093aofZbJ6gOT6v4ji9WLMdfJVm+gf1F
         Ww6dqtCwimaUej9q6Mh1lR0YxsdwRfAMrwsd8ItwHzbf4XGD8lOf/rgY6PdAWmlpdcCd
         u75g==
X-Gm-Message-State: AOJu0YwjrWnWUmAcH8hDNNEyDC91thXxltni1JZtsu0lfOEX4RJt4WRH
	snmEo6owiqW2jCz8Uctj2YANUc+4QXwyBY3RreHR1blQ2gNMV8tni4LZADg0H+IzeLWt/Moom+x
	UUoTWXRf6GJFB
X-Gm-Gg: AeBDiet0RgJxWnPYhE7EX5AYhkbNaMQqaDFK1qCAJoTP4G1qDdxWV1wvHI0KRt4y35M
	vZSMXqw4I+X2KlzWgnxcbo5toc5a3pNpG6ywXNf2JbA80amPWaQaw/7vc1b5PcTO8WVCkAuRk4H
	BH7da9JlQAd+tXumJ8FOFPFNAY8E7BTMRnp5XQ0OAV2Cbu/KIKkQP+17DQNYrkUm+28DrohLTdt
	hshzFUmUfxDMJ0F5i02NNhTTDmnEnMJgUveo4qF6QgW6CBlwiIPNByPfDtg30QNr1t7zPQ4eFBu
	ISyP9T9F8diDOPqh0/1TTKXyTzw4n+8tI94nfhaNLpaAOGaPINdzwIit4ZGItwmunKUTNKgcojv
	905s738Ri80bVH8TUkSxfQX9b3MWcEYCov5zzhCP07Jxt2n01yD0jDwCuaz+7I8rGZKgLpQYGiR
	uX/owuIH/haBJWX6rORNCb5yMxtR24cwvYuC/NFoAKDtEBsekvJOSO0QsG/3jFlvgKmGwc2kjB0
	sBIo62A1JgWirqpTrFUaZEMOQ00wc1ZPBFl+g==
X-Received: by 2002:a05:600c:888b:b0:488:c80c:c236 with SMTP id 5b1f17b1804b1-488fb73d525mr2169165e9.5.1776373731657;
        Thu, 16 Apr 2026 14:08:51 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7c2167sm944985e9.36.2026.04.16.14.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 14:08:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 1/8] virglrenderer: update a merged patch Upstream-Status
Date: Thu, 16 Apr 2026 23:03:54 +0200
Message-ID: <20260416210836.1336162-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260416210836.1336162-1-yoann.congal@smile.fr>
References: <20260416210836.1336162-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 21:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235424

From: Yoann Congal <yoann.congal@smile.fr>

0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch got
merged and is even in the 1.3.0 tag.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...1-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
index b077bf20335..5f90d59ba76 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-c11-use-glibc-s-once_flag-ONCE_FLAG_INIT-when-presen.patch
@@ -9,7 +9,7 @@ https://patchwork.sourceware.org/project/glibc/patch/78061085-f04a-0c45-107b-5a8
 
 Just fix up our use of it.
 
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1567]
+Upstream-Status: Backport [https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/3f0f775edb2df5ea54c37863286ad565ccddb276]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/mesa/compat/c11/threads_posix.h | 8 ++++++--

