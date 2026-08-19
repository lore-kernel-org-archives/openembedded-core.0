Return-Path: <roosesweb@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4D8C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 06:22:22 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1268.1787120533413556587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 23:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xed00zJm;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: roosesweb@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4980dc26022so5954685e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 23:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787120532; x=1787725332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wkkuF4+1MJbj0YRuqIgtKwiyH5+3bVLjnnL2p+Q1UwQ=;
        b=Xed00zJmIMSy8oVt9nhxxiSe6PQQYNP4qh5RmCwz1y2A8iWn/OfBNCiYZoNZFci3hF
         jk0a8EtO6YKv+xY7YSmXDc8SBTH1Qnm53AWJ+AIaEjYTsRx/UwAkybS11sivb8Ql1KM2
         F3ATvaRWUtuvpZjjJkXoylasKn4IUrG4t9HhIKInluQwPssUoFPm6D130CMk4xP+kz8L
         bwGrMX4M5WWycWnecdLGX14M4pNwdBtTigM1bjECR0U2YdfHfFvIfclmltUJltgJ6rZs
         SXIIVzk+GbCY12tR8Lzgp8XM+C7XhFORqv8yJ7/0dsYllw9YsUtGnyRLS9B6f3teCUHe
         JAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787120532; x=1787725332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wkkuF4+1MJbj0YRuqIgtKwiyH5+3bVLjnnL2p+Q1UwQ=;
        b=SgFcUx/OmA1sBU7TI0ewkRqFSkUf1wKbIgrBsFnK70CQ1CE+RXHYZIYZg48di60Dyi
         7PLur0LtojDL0JSsrGnuwlDlqXsZwA7SpfzvlK2G8+yFCFHOtEm38ZkJU+6Rmq43qxhL
         P3yMyMRBQVqDmXXyO0/3NTBRNFaF+GD/NdNLq20Q0tUFrNzKT8IAqJaTQEWMHaahDx0g
         4nD3hUMnn3fsVVeTchmWiPEg8UxSr28+FxHIcFpwX9NGqCbKqLDEVxTh6OlJ4UROsfbV
         A57aQPb652FkytAYvBdufhZt1PVQWDls/EAiWj5q8f2irnG1ZRVeKvHQl9QzBZ/jt56x
         +R7A==
X-Gm-Message-State: AOJu0YxMzqBUT2MDa5cX3pwOpEadQGUEB5RxXqpSKZJiSSbKiYk8YvYk
	KWvYyhS1Z5800+T902GQev7aBjg0QXuzEGFyfGml3KZl/pxJfnN6/hyyAmv1cPPl
X-Gm-Gg: AR+sD12GF+PnDDccbbOOn8axm7T9fiBQDurOgtwXuNa94oLlLEQOFVvwl8dv5u56QtQ
	68hIxWQ9hLw0xBA7sFw+uMoirZGmIsO1ivnM8rTYNjcaLjD6LwGV8B6Y1eg03bJP0gFDgIgg17s
	4gsn6iCZiOIWraA0/vaCZx5DjnRiBCJR8qlxmeX2Jf5CnGSc/OJ8PBNeU+YsiUUnzOsUOO8Mare
	BQw/CpFXWQYZCHKXz+9HbmRmQtp+lpsPkZsezNiKnRrKn0MsCRxYJs4yfNs798PAFhjkXrhGakX
	faoKwjbETfhkkqCCyrzcv+ZOdKUgw/RBA93OoqRLvf6gOPkv78aadIiDq7lgaVyBUpJOySMOw70
	JzULRqVSDnV/pprmXeswmOx2pWoBFZboKxBMce/CNtzwCJ+Ksh7sn7FVYrqkJdXnLqosvnht5cn
	cSWRqRkeYexq6T04KPu8nUA0H3LYuseMhKbp21TbJzm4Z/YOXaMpSt0vDHj0v/bufkvmYgX+5Gv
	fq5zE3embSgVoYdNVNp7UFryjGey0+xgOA=
X-Received: by 2002:a05:600c:6091:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-499aa1ead50mr44556055e9.14.1787120531621;
        Tue, 18 Aug 2026 23:22:11 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:810d:ae08:d00:a23e:1b00:ebf4:5b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17f202sm32900085e9.13.2026.08.18.23.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 23:22:11 -0700 (PDT)
From: Thomas Roos <roosesweb@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [PATCH v2 4/5] image_types: skip multiubi symlinks when IMAGE_LINK_NAME is empty
Date: Wed, 19 Aug 2026 08:22:07 +0200
Message-ID: <20260819062208.680468-5-roosesweb@gmail.com>
In-Reply-To: <20260819062208.680468-1-roosesweb@gmail.com>
References: <483e1f11846c0941d287a3a9228bd759a1310bdd.camel@pbarker.dev>
 <20260819062208.680468-1-roosesweb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 06:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243710

An empty IMAGE_LINK_NAME made multiubi_mkfs link the named volumes from the
suffix alone, e.g. "_volume.ubifs". Guard the block.

AI-Generated: Uses Claude Opus 5
Signed-off-by: Thomas Roos <roosesweb@gmail.com>
---
 meta/classes-recipe/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index ca13729..6c620a5 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -217,7 +217,7 @@ multiubi_mkfs() {
 	mv ubinize${vname}-${IMAGE_NAME}.cfg ${IMGDEPLOYDIR}/
 
 	# Create own symlinks for 'named' volumes
-	if [ -n "$vname" ]; then
+	if [ -n "$vname" ] && [ -n "${IMAGE_LINK_NAME}" ]; then
 		cd ${IMGDEPLOYDIR}
 		if [ -e ${IMAGE_NAME}${vname}.ubifs ]; then
 			ln -sf ${IMAGE_NAME}${vname}.ubifs \
-- 
2.55.0


