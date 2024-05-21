Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D82C27C43
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 17:04:57 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.1250.1716311090809207732
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 10:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=nKAhCXlb;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-792ce7a1fa8so369845285a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716311090; x=1716915890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1H6G5Gy5RcnJRQzs/FqJr/kAO51hvKQkVelp9DiQsg=;
        b=nKAhCXlbMK1ywgTxRsVmCMi7U+QnUMtwvlv9NxUQe60BHv/JvSubPfQ+eQQCMEJSOC
         IwMOsqmmizSS+4r527xHUWxdRmg0EPuTXzsMjsrGJ9RACzCBKixh1pizPFpTnjVeXUXx
         MwhvS+NX6mRJpfH+6of+kBlLNRCj0RyMVlHu+OjGhD+4HZy1Ax+CB2TLdNV75rVGZC4q
         yFdDYGvy0YwG3+mDNEVMMXBU5oMj8vGOFhmzDvFRrIWiGgzJDBoVKr4w77Qpz85Dte7s
         xbuR6pmdBCB8myg5kOZ3R+fys65ETm0Wkwf0hyIXw0D1Jo2ah74A0xs5bjHxeJ+IRgrZ
         0Bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716311090; x=1716915890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1H6G5Gy5RcnJRQzs/FqJr/kAO51hvKQkVelp9DiQsg=;
        b=Z2v9BlXtVGRnyQMQ/Af2SSulJxOv0+azHVWcvtpUbFMeHE2+TWIwpGTfe3y7bVSTnO
         5D8/ShnwEL5qpUCbqfYPgKI32eYMmdAlZtVArJVCTl+oy9ziu159HN7k2zXQaLuNqUeK
         iTK1U1UULOb8ohQc1XvPnpXDhdR25/N/OnuWlbBtL5fSKmo2eLTDVONrZx//2c2qms0W
         AemkHtHPpg1Zyrbc6t7lTTBSzOVW5frpq/6sjibZ1zfPlqUFL6S3Jx7+SlMcnwctTA25
         NM+LRlN6EjKk/the6xsnaLMShhbz/ngvKLSuEixZNkD6O9bvp/GqXckogXiX7264v0tH
         iDEw==
X-Gm-Message-State: AOJu0Yy2OFgjXx1C4iRrVRgpVhuLeerjFu7YCeYW/7OPLiQuoBVJ+6X0
	ls23a3Qnsnp2hVDAUvCY3/EGIZAWFquj7C/37siQ0rnKgfGZ6R5aL+n6yNEIzxmClrcvyDLVMnT
	y
X-Google-Smtp-Source: AGHT+IEMZMxbBb+fvxeOc/Jb95HveXy+6Xs44kRiSD8IeVE5Gn3Ux0lgQ56hOqiVyeiDjYXY2+ayBw==
X-Received: by 2002:a05:620a:3b8d:b0:792:bc0b:e269 with SMTP id af79cd13be357-792c75ef7d3mr3363543185a.52.1716311089745;
        Tue, 21 May 2024 10:04:49 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2972cdsm1292833685a.54.2024.05.21.10.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 10:04:49 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: tim.orling@konsulko.com
Subject: [OE-core][PATCH 04/10] python3-referencing: upgrade 0.34.0 -> 0.35.1
Date: Tue, 21 May 2024 13:04:39 -0400
Message-ID: <20240521170445.1892398-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521170445.1892398-1-tgamblin@baylibre.com>
References: <20240521170445.1892398-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 17:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199660

Changelog: https://referencing.readthedocs.io/en/stable/changes/#v0-35-1

- Ensure that Registry.contents() also raises NoSuchResource exceptions
  for nonexistent resources, not KeyError (which is an implementation
  detail).

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...hon3-referencing_0.34.0.bb => python3-referencing_0.35.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-referencing_0.34.0.bb => python3-referencing_0.35.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-referencing_0.34.0.bb b/meta/recipes-devtools/python/python3-referencing_0.35.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-referencing_0.34.0.bb
rename to meta/recipes-devtools/python/python3-referencing_0.35.1.bb
index 6fbd10d9cf8..3e2a3806071 100644
--- a/meta/recipes-devtools/python/python3-referencing_0.34.0.bb
+++ b/meta/recipes-devtools/python/python3-referencing_0.35.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/python-jsonschema/referencing"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=93eb9740964b59e9ba30281255b044e2"
 
-SRC_URI[sha256sum] = "5773bd84ef41799a5a8ca72dc34590c041eb01bf9aa02632b4a973fb0181a844"
+SRC_URI[sha256sum] = "25b42124a6c8b632a425174f24087783efb348a6f1e0008e63cd4466fedf703c"
 
 inherit pypi python_hatchling
 
-- 
2.45.1


