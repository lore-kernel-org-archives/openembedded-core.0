Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465D6EDB7D0
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 07:13:57 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75680.1775546028720102648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 00:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZYISrCzj;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48896199cbaso40723735e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 00:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775546027; x=1776150827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCGN8BUF5urP1YIACI5hJZJcaPbWT21zdmBon9wV9V4=;
        b=ZYISrCzje3nJGhaqg5JtlBiWWl/zbY4XIt6SpcLvLga3CKrWq1teziAgp2iSDe9tSI
         qCG8WrlM8UqppYKn2H3y463sEyyS0wWsDnWH5RdDNy0StZg5SnHkxktDVue/r/7jPAef
         +hORlU+4Ts/sSl4emwtgBfl2T3HzV7DWajM6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775546027; x=1776150827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NCGN8BUF5urP1YIACI5hJZJcaPbWT21zdmBon9wV9V4=;
        b=I3DemwxSstmOV6duMXkf4xk1mNerCyNcTvifbhDjBEPXdwuZhKkSqwpStLXa6UVosz
         70DSx9V5TbWBu178QHjkPDmVPL6qI+vb+AgQmMaXmIXw2gt4eTKl26tt/oRxL+CKXd20
         K5F8+JP+UyyV1395ayzJpK+sDhXTtNlNlwYPZt3rCFh9U0LULBtUNpqXct7i0XVwNUjS
         vyX5wHL/LxVvAFAl2lD+dJVbIpo5YY0F+8TJ0YXvOrCmw0zMjYWiQiCjLyOSg+tTyZlf
         ZsjirlsgAFSgMkrZUkpkdK+USr/MgMohNruawVdVJYQyi0YehTC2ta4kBjoLV8ckqGr7
         3/bw==
X-Gm-Message-State: AOJu0Yx7uNeKsjWkcIRIkTPE9nwecNBlFm/bF6Mn6r61EkNvl/TWaOLu
	Y4kmf0GbKMPoD+vps2g7iPpXWjxtvFBZwIThaSLnZUMFP/msiA9KJXSrjS1/dO8v7g6/lH4Uq9k
	vOi2iYl0=
X-Gm-Gg: AeBDievEEhlDkswaPBxm6GjYnYs6UL1i+o3ytNZz+uGrhw8c1PujO3N21fxkGTG7RL0
	zTuhMP3eLhPEfApno9mFnftMSoHP/3VSgztRzk7Jf/wzoLVjysxmR0xomnDnqIjkPBe1Eq4mAlg
	j21m/7pYB914lljxX6dghwLlDNl4gw3EQp9lUeCqWOnwvx6HnCHBziGQPKVCAKUoZNQRimm3HO2
	QeHCNJXq5UUBlA0FYoH1AoQZvPhKaXRP325sSM+qurmLW69kSZQO5h9cG7zdRReLl8//W1laGgF
	y794/gjZM6g/PjXg9/7Rcf2U1+FzUnALIYLVn7kwmdW/O7eTBJHQu7v55CN0yxeCrxMuat3b1bw
	ST0Y8yPJI9DWSUZkZn4JcVFfEEseabh77CmmkJ3wZSu18/9+x0ySMh1I50yHKJwNXN2gGixvzxg
	7Syc7byep4mnYhkHIPKM/VJv8P8B8cVgFGq0JAhsjpmes078TY3KT2rrP4n4hb+OW51SR+RKnRm
	qgEdWl5XktwaMASKhH4qh/4oG0=
X-Received: by 2002:a05:600c:638e:b0:485:1878:7b8c with SMTP id 5b1f17b1804b1-488997b21e9mr217852495e9.18.1775546026815;
        Tue, 07 Apr 2026 00:13:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d0fc00sm156364925e9.4.2026.04.07.00.13.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:13:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v2 07/18] tzdata/tzcode-native: upgrade 2025c -> 2026a
Date: Tue,  7 Apr 2026 09:13:15 +0200
Message-ID: <d7e7612a5b7db3b435f3d0cdc512ee356befdbfd.1775545489.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775545489.git.yoann.congal@smile.fr>
References: <cover.1775545489.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 07:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234711

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

