Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F25FE520A
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31958.1777064199684892796
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hya3Q2+i;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so91809925e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064198; x=1777668998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7DQ6qCcq9LhnyiydxFfEQpjvQ3Jm0Tc32xr/wsDFXJg=;
        b=hya3Q2+ilXri4KhwQnUxk43cpyUlJ81oHpbbSStezVDecjc4NddEtI9xe9dF+v7zGa
         ktDpv3kDXJNhMTbktjk96LlDYTJx80M2KZpBvXCJjqV11YqGxlvynOx64JdWlE3Z37dG
         b7sIpu9g3SDy6HnadBbURmxmQUNY+A3M5ehf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064198; x=1777668998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7DQ6qCcq9LhnyiydxFfEQpjvQ3Jm0Tc32xr/wsDFXJg=;
        b=L6daTHZ5KJx4SY5kJOmQmtUoGNyfjMAk2j+cAKcvHyWaKpGF4iAPa9mcWc7hC5kqMJ
         UYKp4FFJt40HyIZ2yJ1WJmGfpDM/eIT2nhDugC4qFhPr6Kc20mJ+bQmeySMLMqOrGA8p
         yrkZtEyAPva/aP2ypQKdjE7/ll6aEZ4cRy1sX1SQJnvPCKVvBcy2FzhiBqaY7XhbKRHK
         1N3WasSMUnAb0WPfI2FpdwoUJt7JQAv7RgfQH4epCqTDgue6Ln8619QxxR6xLl15oWcm
         nB7WCPWkXw112erPRE8PbEMVDw2XD179cMDkgXFkRbsq9Psz5rLwI2dhcdtakAlcashE
         lN6A==
X-Gm-Message-State: AOJu0YyD9GCIEAIgV/Z0v4F++mOd9vVAyOiWDNDGILZ2PDb7idLo9fSo
	K8FFy1JY2IqM9hlzurPPJFZ86BNQP9xIqC9i35JwtXNTJHf4y5st4cVzeAwhHPXV0WREYJr1BCy
	nju57b8E6kg==
X-Gm-Gg: AeBDieueJIFKwEMichFQpzBWaNM3KWmOWXPgbw1AY0nbJaR6T/HR0OkQ0rvdJ7c4yQz
	DbCv+2HZlE+Z+2hqpOSgmtSZXuy7dtnotCHlfZmYLgrkiIX0BAJM2El5acCVNuguvDcMhUGjTzl
	xkslwhhRNfaaOSmdux8lnbexgveARmcCPG6LgD73yPUU2+20224y5sZdCQ5v/Nx6Eu/V3/vBKKY
	H8bvGA2kMZ60Y9XUSpeK5LxBFNZJdFuhwGkz966c/+tGDJIq6wAz/7JEsKnKJzdZYq5OcX85mbq
	q4r0MTmK8tFdTRL010cKf3u60Kn2tD18Eb+vnKs0JtQXBoDtyyPmja1uBz9LluXIVSL3VrqUudK
	RnbjcFOgfCo/gINjEW21/MmF2s83OQNExB5KvvDacbYvY3HMmm1gmqhIrgc7LAn01NKOglNagKE
	8iMcRYxW+WrU1SlQrvAFXdBwkavSpCt54vj32GSfW/ZOZQISTWugvdeC/+QOQtWMzDlrBLUKsjD
	vvjMbjT5TddbPwcgzFYosfG6ow+lP65xWS4oQ==
X-Received: by 2002:a05:600c:a408:b0:48a:592c:e632 with SMTP id 5b1f17b1804b1-48a592ce943mr155429125e9.16.1777064197861;
        Fri, 24 Apr 2026 13:56:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/66] spdx30_tasks: fix condition in create_spdx
Date: Fri, 24 Apr 2026 22:55:00 +0200
Message-ID: <8071a93c6b619dc9fcc2a7f1bcf94994499defbe.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235874

From: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>

Considering that *detail* is an actual variable, not a string, remove the
quotes to make the 'in' statement coherent.

Signed-off-by: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>
Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 9c422d17573..b43d626df36 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -535,7 +535,7 @@ def create_spdx(d):
             # specified.
             if (
                 include_vex != "all"
-                and "detail" in ("fixed-version", "cpe-stable-backport")
+                and detail in ("fixed-version", "cpe-stable-backport")
             ):
                 bb.debug(1, "Skipping %s since it is already fixed upstream" % cve_id)
                 continue

