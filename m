Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CFDEF4EAA
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:27:39 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49552.1775456855507953666
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Py4mijys;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4887eca00c4so24313095e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775456854; x=1776061654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCGN8BUF5urP1YIACI5hJZJcaPbWT21zdmBon9wV9V4=;
        b=Py4mijysFsMtPqQjnRWPb4IdkMOm3XxdefQHKzhXV/I7o3j+QKTC1X3GFNxaDyvg6P
         Bui0Iguq+rlmY1w4deyj50nb3aJrtHf6nKNVjbG39fZii0ternuamDjDBYYilfPU9wT1
         tS/Fkqw/aNelMHIARPiDkhnESUKboVomCJ2pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775456854; x=1776061654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NCGN8BUF5urP1YIACI5hJZJcaPbWT21zdmBon9wV9V4=;
        b=IXUymvwr1iNKnyXB2FgpyGXBa5nwOkJGibr9a16BkFoDLWBVtluG6ofwC2ciTNdb2A
         8AVcOdrpY3aUMW1ba2GTNEmRoJdkBQBbvOdMdherTJesdp7OCXMLTYrMuRkLeYipl+T/
         /SdHKFo0dXAOP4lLUL+3aOL19+9vjqvFkdPi9VIfsys0Z2+e8S3ZieehBY3Lk/VlWnFh
         XfNualh5rMvoRwkSp10efuNQ3qEeUJwKXZtU6rtzsEkljGeVsq25XlvYzayawbl7Y2XQ
         tL2vTJhpy8KvLq3zpouFuPB/p5PdpZLV5CRq88dY3gRU1Sx3nI1H0KSmSYVrIXd5ufd6
         mTPw==
X-Gm-Message-State: AOJu0YyxG6ggcZXK0mDFy5Sj5igdv1ALk29/vBnRN+D+YGXqQhr7CgXz
	xdS6sw2SFgg/wLGYpzrlDImiaqe8FsEARhuzu31J+aehII5BIxXmV6rETZt1eozPrOCusyHxXWD
	xDiJ2fi0=
X-Gm-Gg: AeBDietgkibQ3HT0AwMbVkQPuphue0p3zNgMHF9yMugqhc7kAhFSTmd5isyHMKzZ1it
	tvff5HdjJwedSRsJJVkZ7lmrr2VVsVLzWVL7Uq/5eUw1JQ5f2jlxKVmEg8n+6W8IgTiD7vt0eWF
	3KEM21VQNbV3nEQudp1TskRVEiEsvQWVblKElXJ1hmSUGE7MjX0zX6wXRxyoh0G5mt2g/ItEnvg
	FEBsUvepKDquQnadXlMge/bJfCOiMMWq0amGpwAgSHBhz2o2bksQf8F0uDDhMufHvxZuh3EuyL4
	FVFUe6F/Jb8OBb+AU8KvwwI9J1NBadwTy/i9ASLO56mwm0If/TKrqbfAY4aKMcOilJUwVTuWUmx
	IVPI++fzP9vIuwEW6UhzXeNyv4fvwaUuzSdNIw0fjrHdyCDRQ/YZYDKKr6ihPeBSUi4u3ZE9/6u
	ov0yc2qDQ5L1FRjGkYIf+tD+8GlRi3Yo5UEi4q5dH2qUQKffmp0GL1WHNpV8mBOm2KVH6HfK6Ef
	3rWdtFjc63fQS1p8VmKqSrT6Ak=
X-Received: by 2002:a05:600c:64cd:b0:487:1520:d107 with SMTP id 5b1f17b1804b1-488998f8b3dmr146035095e9.31.1775456853573;
        Sun, 05 Apr 2026 23:27:33 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eab0f7sm84273785e9.29.2026.04.05.23.27.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:27:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/18] tzdata/tzcode-native: upgrade 2025c -> 2026a
Date: Mon,  6 Apr 2026 08:26:36 +0200
Message-ID: <d7e7612a5b7db3b435f3d0cdc512ee356befdbfd.1775435063.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775435063.git.yoann.congal@smile.fr>
References: <cover.1775435063.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234653

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

