Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1934DE77180
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 17:44:31 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.62666.1734371062530288639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 09:44:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B4uaNlFb;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385e3621518so2188693f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 09:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734371061; x=1734975861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4shF/IcXSQb7qKeXDzWXNpx/W3qqFEV8vsY52mCf2SM=;
        b=B4uaNlFbnDV/UABOWM7LkRLc390SNwsvs4sqwpwgtiGEayv7HKZdNcGi1hOsr35GSl
         xNWwwCxKAO1wBypr1J+D4cvSUUsH+meKeFwOE1C/MpBt5w+YBog6Zti55+SH3H/MBySN
         MSBGd/yR+Q8RZrvg9xDB7j6eY6fVXe1mIraO2/77Ks1yUDEzzvvx8Tqh89wCCLEx6OCN
         8hodPR8f9p2+O2si1tfocTZtf2QU6cfo3VhWT/dffRovdYVpO3YapFOUae6I32u1HSkG
         +6jIfqJqAxchjfXLS1PRn2UQqcIM43V3J6fiOMPAxw9+di3jOGWCWa4fyOkp9xEkk9A4
         GVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371061; x=1734975861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4shF/IcXSQb7qKeXDzWXNpx/W3qqFEV8vsY52mCf2SM=;
        b=VmgiAIZeJ5FME7QsjNK88/tTC2OFUZCEJzFZMMts1Zh4Zvi4TBnsZ7mtY5/6nowo9M
         nog0WThuGBPQM48g4D89AhEFPZG3b02nygQUE9uxATkNZ4LCCh4smDrCso09jAKimSlY
         ri8JPKjL8Hw4CGeSvBlB/JFvC0KaZR7lXCtWOhMSMAr6yAuDsnGYNd3VHtT2biox96yh
         aJ5bg005BbEdDNfbGNopCyqaeLhFiNOs7WdLAVzoHafjmE7j7yv2UA4N/04aTad0OTXF
         bVuBv2ZSb5OVjsgzVGFEAlcGrw/K/BvrQogdsyDe0urvUI2DukQJdA0HIEIqH8VA6Nrf
         Qt6A==
X-Gm-Message-State: AOJu0YwI0jyMCpE86bwAvMrn810q8VkhF7RfdNRPFZlN32OXZxyeTBcI
	44OUogbM+2F1b48iEensosdKlaUKtcqQ39+j626qsaVjpWu65DxZw7kRgQ==
X-Gm-Gg: ASbGncvhlsaQW+HAs37toY9w/M/b5cPCSmmG07IHHmn/lb/hGlMaAKN3MapYs3omeFe
	IeC/UG8rMjeYRqqhTP8GEd7E36w0Iys+Ypsyr+BOKyGu2P3FY9cDZQ3xps9R8nPnLR1jLnJtBbj
	Uv/hzwKD6AHvvAe5AOlOof7p54w5yaTBBykLnyoQFhHTu3H9oDSeIqvhgmrOBGM8HNc4mdzRfGC
	PP7G2Z+c8FGyPqFEBalZI95LqMUrEZObT9oqQ9ZO97mOuQ5YBTG9n737cObAnswRZcwF7DqwHZK
X-Google-Smtp-Source: AGHT+IHudL5kC67csMLNZB2bffQ/Lq/ibH42iK3ds7u9s619ONhrj2GzU6ldND6fyb3BAaXgS41WOA==
X-Received: by 2002:a05:6000:4b0c:b0:385:df44:12cb with SMTP id ffacd0b85a97d-3886c72506bmr12319621f8f.0.1734371060378;
        Mon, 16 Dec 2024 09:44:20 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8046c46sm8892338f8f.71.2024.12.16.09.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:44:20 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/4] devtool: ide-sdk sort cmake preset
Date: Mon, 16 Dec 2024 18:43:04 +0100
Message-ID: <20241216174406.3128556-3-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241216174406.3128556-1-adrian.freihofer@gmail.com>
References: <20241216174406.3128556-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 17:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208787

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Sort the keys of the generated CMakeUserPreset.json file to make it
easier to search and compare.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 2f6eddec2a0..42ee13b3e54 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -493,7 +493,7 @@ class RecipeModified:
 
         vars = (key for key in d.keys() if not key.startswith(
             "__") and not d.getVarFlag(key, "func", False))
-        for var in vars:
+        for var in sorted(vars):
             func = d.getVarFlag(var, "func", False)
             if d.getVarFlag(var, 'python', False) and func:
                 continue
@@ -545,7 +545,7 @@ class RecipeModified:
         cache_vars = {}
         oecmake_args = d.getVar('OECMAKE_ARGS').split()
         extra_oecmake = d.getVar('EXTRA_OECMAKE').split()
-        for param in oecmake_args + extra_oecmake:
+        for param in sorted(oecmake_args + extra_oecmake):
             d_pref = "-D"
             if param.startswith(d_pref):
                 param = param[len(d_pref):]
-- 
2.47.0


