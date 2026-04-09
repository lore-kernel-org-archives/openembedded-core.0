Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF70F36B8B
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:41 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144841.1775776297099223266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KU81oP7c;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso18119125e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776295; x=1776381095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQ1nnPZD4T81cHP4CPJAEtZLqfKwRd1IwiROmD+jMLs=;
        b=KU81oP7cd/Tj/gd8POHe+QIAS51JGPRiUfTNUfJ9P5Bg/hm6oE6bPzdeDK6MAKDWLQ
         lX+rkzHxmsF0/RokGOAWkNuBnY/TnBnshZrG4cQAjkkA1Vliarzdi5APAsoOhrCuebI0
         mYM2n0CFHxlfGffdE9zu7TOTdTTnfVsVBf/Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776295; x=1776381095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MQ1nnPZD4T81cHP4CPJAEtZLqfKwRd1IwiROmD+jMLs=;
        b=mnXycWQASzacdlJR9TkPQk7i5GEkjoUOdFQssdo+Pn3mPHgs1e0olfno1x1uvPpu2G
         lO0+G2EHClRpZh0KwLOnb/N3EC+N7Y4qxSkVTpo2HUlZcLjYli2rDogRdKw8lIUlq6Ib
         tZYuvOE56JpMOqR2kmyxESHNfBkr71N7NJ7Ju99UjMFlECuSEEIcfUrOK/RwBlM6LmwR
         hkHsfA3Ga7L0dxotz3GvHj9QVkKU1hQwS8zmcLdBvj6SQFWs2vsfR1JADmk57KvhrhGq
         /NLmn2PU9LWv2Msd+M49+Ox59ak5dZTFfGC7KQSz2KDoDCJHB8NOHe3hvIjkYQDhrvKP
         WYBA==
X-Gm-Message-State: AOJu0YwJwEugnZORbs1i8zjKI5EiShv351S24tb2v57D1U5ro8DKpOi/
	ODgS9ajqSCetIafsh83HWS/GiWe3gXdM2jNMrh+WjilQlUo/CCbWhB1gmxq/kf0aMSRbWF//rMi
	R5EKvo1BY8542
X-Gm-Gg: AeBDietBXOsrrE01pz77tsrhKZdShxVah6+BMSkZDjgZhtk53EVC+9GxFcqAgmfopP+
	aIBtOuTA8ZCXCKKtfluAfO1JNJ8XmADMZ4d2FS5gDXuWhNdLBJXu6ptMVeYskmSWjjCHxqfcpKu
	YY4OeFE7W2WrqihLtyDjMhj4z/V09ygNTQKjTzRA/2Wl9zjyFqhIjfAQF17luNSGRo5n/2GmPrT
	fOkOxILJig6hwIf7W/t6zmHZN7kyrgquCFW6O55TMvrFv3fXWgnbiKaw/bQyksqJsBhJaw87F6O
	KH7Zo5jR9mutXVZrVhD/apVByeX6P5+ANpz/9mOjcb9psE5/3ve2+BqmxaJEDkAWgFRPsgaXs/K
	YCJ14oZvd22n0M65LGAbnbTw2eQRaaB5FpaEPjAsL8uwLNWyl5BuVy9CbKGfXRfvPB9rbln/7As
	aOCPstkv0X/0p8biBPyi1k1UnO9VkkfNCfBJX4DcQRvd3+NBgts7+//8g2G4FqKpA2aXNduikC0
	dIOQ5bcLt5a27KOi3Ggl22LbOBm
X-Received: by 2002:a05:600d:8453:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-488d68ae9b7mr5843955e9.11.1775776295224;
        Thu, 09 Apr 2026 16:11:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 22/30] scripts: Default to https git protocol for YP/OE repos
Date: Fri, 10 Apr 2026 01:10:22 +0200
Message-ID: <97986a40346d7b5a13c0882674afacd98583108c.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234981

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/combo-layer.conf.example | 4 ++--
 scripts/contrib/patchtest.sh     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/combo-layer.conf.example b/scripts/combo-layer.conf.example
index 90e2b58723b..4ae3db45ab1 100644
--- a/scripts/combo-layer.conf.example
+++ b/scripts/combo-layer.conf.example
@@ -14,7 +14,7 @@ signoff = False
 
 # mandatory options
 # git upstream uri
-src_uri = git://git.openembedded.org/bitbake
+src_uri = https://git.openembedded.org/bitbake
 
 # the directory to clone the component repo
 local_repo_dir = /home/kyu3/src/test/bitbake
@@ -76,7 +76,7 @@ last_revision =
 # that matches the original commit.
 
 [oe-core]
-src_uri = git://git.openembedded.org/openembedded-core
+src_uri = https://git.openembedded.org/openembedded-core
 local_repo_dir = /home/kyu3/src/test/oecore
 dest_dir = .
 last_revision =
diff --git a/scripts/contrib/patchtest.sh b/scripts/contrib/patchtest.sh
index b1e1ea334b9..550b6a88f3c 100755
--- a/scripts/contrib/patchtest.sh
+++ b/scripts/contrib/patchtest.sh
@@ -75,8 +75,8 @@ source $PTENV/bin/activate
 cd $PTENV
 
 # clone or pull
-clone git://git.yoctoproject.org/patchtest $PT
-clone git://git.yoctoproject.org/patchtest-oe $PTOE
+clone https://git.yoctoproject.org/patchtest $PT
+clone https://git.yoctoproject.org/patchtest-oe $PTOE
 
 # install requirements
 pip install -r $PT/requirements.txt --quiet

