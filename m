Return-Path: <roosesweb@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831A9C5DF81
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 06:22:22 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1342.1787120532894348106
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 23:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NROGn1BT;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: roosesweb@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4980dc26022so5954585e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 23:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787120531; x=1787725331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XypcZpqZTQoYdAEiStawSEcKJ9+ynuf3MXKTsyim2wk=;
        b=NROGn1BTCBVREPO0xd+rdkwYrqdp77ZVK+GM/jsa3DzyrTcxsJKVAnEDMPAU3CmmoA
         RJJazT7+uBvQXQoqiw5KKxDvGXj52q9DqnHTW2Wn/+piX1LBNgZmUg+zeGFsdwx3zGsI
         f+CsOwBiqJieYJhKXLaA82CZ39ZAURcQaNwFlmCQxOR6YBV1hC56YhbiZzNSokBjt9+X
         Uhl25YxPFEf+ccZBZ09TAK+J/zZulSq1p7JQNKzmUE7FHyODE5POWTpyJ0Nd7+5GsVNd
         jTJrrcKqEk0JsQpF4JeiQDNPnX+0vE8/Z/Xha5Ehkd/h9NQy3hvmvFWbsFkzfsJM9whj
         citg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787120531; x=1787725331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XypcZpqZTQoYdAEiStawSEcKJ9+ynuf3MXKTsyim2wk=;
        b=NhJd4k8uZ5MNuQwnHts63g/N5rsnz9C+pyl9oP5qLUwoiPC+5wyW0mf+Xs6VV9c2My
         zKn49109n7ZRDKr8PrUoR3tpnzA7SrHjpbnkXpQJoORpJzu08+PpQiIMYx0fu+sX+heF
         3NFI6WST0h1C8pKR6lo2nc1xF8OuPHOapAPkIR0UPnoIuvhyLLNTG809O+HIiOKlbz3y
         klIhSVFD98QdLmots/LJNrS/XjOYxCxviiz4CIzWmcF0P79hlNoROhog51LMWpU0hJAN
         ECIZVRjM/fvV1mokhC3uJkeiwu68B169SKyc3sj3ncDtlhUDUcjiA2WOJcLGNjsWnqgR
         XwnA==
X-Gm-Message-State: AOJu0YyT3weWN3FfpQj+v6JKjYf8pBtuBf5DVEy5Eo5ohgO3yHwehIiK
	Hf0rYjmpbMHaJ2vcWUg+9dBDpz3nFq7VjqNamnE6+yRt9VPg8bR0V749GCzuNCt6
X-Gm-Gg: AR+sD1355RxSjslfay8eiS5LssEqrxfRaq2wHr/G8Ao6gpk136Pkoi5S+4QtuRKnCLs
	LfvFzam0Wprs7d4GpwsSiAl+kleCC+Q6ZPVvIc2ZnlG4Eez02DGVzLrvWwP+0uDJj42oS6iwxRS
	4mDlTOX5iQaS8612iWfB3wyORkLAoXzsAQ0H+LQHPcv1lfsaGxaEYolC+/oGs1vjUr5C0Qhzbg/
	avgpTZZ9KTCyFpI/75p0PLD6AJbIxZiJrBm4ZVDmq8UiAFPWCVWqh3VDq03+2WxPGM7WaICDqiC
	cc/5YFZcLDXZzLRA+kX0/VX1LolsgLBbhfDeP9XPFiGecZd9CrqssJcGqsiP/NGwDe5deFtmKin
	BuvlkjYhtadS2oGJTKpjNv5U4khrUYqnfey6a3F9uJP8kkLSkNWlZacqTbE9be5XRw8lWNg91Zt
	nVjq9yeJIJE0xrcdQHQH2ckZs3AfmVdFTu/0exoscZHCDRBUQJyQkuUmI+O1M5DFW8vp38Z1lTJ
	AMmYbq22eQJ1xWGUbM9fCwGlv38HfAYvQ==
X-Received: by 2002:a05:600c:1908:b0:499:5210:c537 with SMTP id 5b1f17b1804b1-499aa17d6d8mr31981895e9.1.1787120531091;
        Tue, 18 Aug 2026 23:22:11 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:810d:ae08:d00:a23e:1b00:ebf4:5b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17f202sm32900085e9.13.2026.08.18.23.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 23:22:10 -0700 (PDT)
From: Thomas Roos <roosesweb@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [PATCH v2 3/5] testexport: fall back to IMAGE_NAME when IMAGE_LINK_NAME is empty
Date: Wed, 19 Aug 2026 08:22:06 +0200
Message-ID: <20260819062208.680468-4-roosesweb@gmail.com>
In-Reply-To: <20260819062208.680468-1-roosesweb@gmail.com>
References: <483e1f11846c0941d287a3a9228bd759a1310bdd.camel@pbarker.dev>
 <20260819062208.680468-1-roosesweb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 06:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243709

copy_needed_files() built the manifest and testdata paths from
IMAGE_LINK_NAME alone, so an empty value made it copy ".manifest" and fail.
testexport_main() in the same file already falls back to IMAGE_NAME.

AI-Generated: Uses Claude Opus 5
Signed-off-by: Thomas Roos <roosesweb@gmail.com>
---
 meta/classes-recipe/testexport.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe/testexport.bbclass
index 12b7e17..a0be7cd 100644
--- a/meta/classes-recipe/testexport.bbclass
+++ b/meta/classes-recipe/testexport.bbclass
@@ -134,7 +134,7 @@ def copy_needed_files(d, tc):
 
     # Copy test data
     image_name = ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
-                            d.getVar('IMAGE_LINK_NAME')))
+                            d.getVar('IMAGE_LINK_NAME') or d.getVar('IMAGE_NAME')))
     image_manifest = "%s.manifest" % image_name
     tdname = "%s.testdata.json" % image_name
     test_data_path = os.path.join(export_path, 'data')
-- 
2.55.0


