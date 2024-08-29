Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F86C8302C
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 10:11:23 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.9435.1724926276086272468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 03:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eArYLroA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-371bb8322b2so247412f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 03:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724926274; x=1725531074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0pISXm/ULhFkrm9Td6kkiUbUIlP8d34SSJDji1jIFTc=;
        b=eArYLroAIFlXocM0cjM8dgfENOfiARN7ZtRJeYltOXU28yqZtucVz6DKo7J2dK3s+3
         BJD/8VVlP0wCqS1z1icOZQQt64ku6X/isxV5do9RPex/71h7AjBFnK27uCkfK5kybVct
         gAWmtCHxsfhw3mV1HmQ4njfjWAWksApSVAlIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926274; x=1725531074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pISXm/ULhFkrm9Td6kkiUbUIlP8d34SSJDji1jIFTc=;
        b=Rxu9FMXk5SSkunlxUIqY6czm1B/iwc2V84FfCuK7skamUNgDHDaX+/z7q7IYe+C749
         tpFuKnwMPpGqz3GGAG07Ozbzqi5b4cmrTb+DXF6Qa9euJFs00oNE3ufPjoX6xoMDI4Uu
         uIz3ftxce6DezYw/dk4bSdrumqPSiqp40iy9qYi3ERi0XuGFiJ7hXETd/TYcH2AyVZYt
         GAwewfknYJRWLZMOyV84KUFrQ7EEbc19w3u6JGEs4xw8c2Uxso2P1M0/e/vXQ6C9IS/u
         b9Wshh+2e18kqYqUhUUDpUo6xb30dlCtO8bo/wsKayT8bnxnE3rruo4NIol+Lnncd/QV
         TInw==
X-Gm-Message-State: AOJu0Yz1S8NQxTWZUhhSSsz4Cg1inSyCOYs8HBphygFEk76WVbhD+LVi
	bJY7YdSwbos0MeqaFj3dzsLoBtBVlyWjUmwmEnuJ2uF380AFwhqAnanxnq4wDX4X5L7PO/Y5Wvc
	b
X-Google-Smtp-Source: AGHT+IG9jVL88lMjh3avmACD2/2LJ7FVYhYjyS80dLGSsRjIzKNDKy0SGhdPtkyQRTEEa8c2CP1F8A==
X-Received: by 2002:a5d:4d0c:0:b0:360:9500:9bbb with SMTP id ffacd0b85a97d-374a012b767mr652776f8f.12.1724926274092;
        Thu, 29 Aug 2024 03:11:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:19db:d42a:7902:cfcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee99d6dsm1009420f8f.48.2024.08.29.03.11.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:11:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] lz4: Disable static libraries again
Date: Thu, 29 Aug 2024 11:11:12 +0100
Message-ID: <20240829101112.3986061-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240829101112.3986061-1-richard.purdie@linuxfoundation.org>
References: <20240829101112.3986061-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 10:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203909

This option was incorrectly removed in the recent upgrade. We don't use/need
the static library so disable the build of it to save time/disk usage.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/lz4/lz4_1.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/lz4/lz4_1.10.0.bb b/meta/recipes-support/lz4/lz4_1.10.0.bb
index 3b98adf42e5..f77a2e7bb95 100644
--- a/meta/recipes-support/lz4/lz4_1.10.0.bb
+++ b/meta/recipes-support/lz4/lz4_1.10.0.bb
@@ -23,7 +23,7 @@ inherit ptest
 
 CVE_STATUS[CVE-2014-4715] = "fixed-version: Fixed in r118, which is larger than the current version."
 
-EXTRA_OEMAKE = "DESTDIR=${D}"
+EXTRA_OEMAKE = "DESTDIR=${D} BUILD_STATIC=no"
 
 do_install() {
 	oe_runmake install

