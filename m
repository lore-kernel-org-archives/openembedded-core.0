Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0D5C3DA4A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 07:15:29 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.13809.1736320526857973887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 23:15:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b40QyyBO;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: bbara93@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so189420301fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 23:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736320525; x=1736925325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDFdevYbyCntyXalpgJDL0IB2xDS3HGP9H3dZM7h7AA=;
        b=b40QyyBObVcT2y8S5WvTcNSE1iqA9fTL6/Uptu72DWCfP8LUO+MNgwTUlwsFtW77WT
         xAHoB9le6UIi6mi/FtfwWC1xrNWUVoWYHPaY6xCqAtp1WZKK1KxWEPl8fJeeINpYfjU7
         iz2YNhNTR2Mmxjk0lxZziYwDrlcD1HW6Ie/uip3FTAqWUd+nKR8HqZEhADu3C2sidA1K
         erRUh8Lo1Wm5cEcwBl2nn5rBe7B9DjImmGYV+bcuSuOIu9/TXIS1pslgCDzIheKJrcce
         pirise+iPgByRXi7slvA5PuFo4q+Xop0P+AUyQwqfMxxw4NJ8OJ5L12m+Gcz2n+EwnS1
         GeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736320525; x=1736925325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDFdevYbyCntyXalpgJDL0IB2xDS3HGP9H3dZM7h7AA=;
        b=WHmpmLTmIrnFOFdqyBYhHC4IcGiqkDhc5ovFuQpKVrsk+NkqL9njUffh+14TiE4FDB
         RTXf5qaEdSVpeNnFMdO7yEt+Ghch6K5uUMOU1cMXNhnYTftQsu3PuS3qL71lQXQdkRne
         bKxBuJfYcV0zfWqbf+PuvP2Z3UUcqLg1Hlkv0uvl6fvKjZLTBQRrk1ACuThwuAvG/wR7
         NTXCptw209J/X2gBGiLmLiuDYhgmJmf1m0sffRFbVoihb6HEvjOUX5/wiHRbofP95Z0K
         iJn6xOya2A8MCfCuHJBRyCtu1m8Yz1AHN964T6hEfL8vBkfY1/40icJJcYKPsQlW8uP1
         m6WA==
X-Gm-Message-State: AOJu0YzP6ihYe/s/cJhH+DzSHnO+HNgOYz6Dvo+V63ZPLxP3a95JHz3A
	4bHq2bdhFZvTtzeFeoP1xwwQU0iEffUy9PaaL56elIzZf5HQRHMTfqiT4g==
X-Gm-Gg: ASbGncvnD+8UjlNYkxPws+3CQNln1VN0Rqr1uyh3xIakfj2a7W9TMuzkLGN4QyBZNRn
	NH7qOsIsuRc6LykBT0ynKW7YoLP3hTFEqPrMTwf6RYYXfo2v8Vj55SsjaAkqQbaYYVjzYQHt8/u
	9zyYSz1sH3IgUndP6lUaJkHCynF1UxDMDuWiPg0aweMZybdWVcyJFibTcQFflTfdohorOQt2nkr
	IB9ANHO1nzBG1LHn6FMRVBaanIES7rmisKmoCGsYXsB0GOJ/A60fxTFXz+N
X-Google-Smtp-Source: AGHT+IFYXMfE0e/4ZMoAPQlpBH4SLY30TjDXQADHRyQULVJdHfP0Z4+KkLaa/y+UfKGKOhmD4TFuOg==
X-Received: by 2002:a2e:bea4:0:b0:302:4a4e:67da with SMTP id 38308e7fff4ca-305f45d63c1mr3393231fa.36.1736320524639;
        Tue, 07 Jan 2025 23:15:24 -0800 (PST)
Received: from ltbabn.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045adab988sm61765641fa.51.2025.01.07.23.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:15:24 -0800 (PST)
From: Benjamin Bara <bbara93@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Benjamin Bara <benjamin.bara@skidata.com>
Subject: [PATCH 4/4] multilib-example.conf: explicitly overwrite the BASELIB
Date: Wed,  8 Jan 2025 08:15:13 +0100
Message-ID: <20250108071513.2807528-4-bbara93@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108071513.2807528-1-bbara93@gmail.com>
References: <20250108071513.2807528-1-bbara93@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 07:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209520

From: Benjamin Bara <benjamin.bara@skidata.com>

Currently, meta/conf/machine/include/x86/arch-x86.inc sets the BASE_LIB
for tune-x86 to "lib". Instead, explicitly overwrite the BASELIB to
better showcase what is happening inside.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 meta-skeleton/conf/multilib-example.conf | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-skeleton/conf/multilib-example.conf b/meta-skeleton/conf/multilib-example.conf
index 07fd7b6ce4..cddbfc17ae 100644
--- a/meta-skeleton/conf/multilib-example.conf
+++ b/meta-skeleton/conf/multilib-example.conf
@@ -3,11 +3,12 @@
 # or specific in an configuration file like this, then require it.
 #
 # This configuration specifies an x86 64 bit machine as the main machine
-# type and then adds a multilib in the "lib32" directory where those
-# libraries are compiled with the "x86" tune.
+# type and then adds a multilib in the explicitly overwritten "lib32" directory
+# where those libraries are compiled with the "x86" tune.
 #
 
 MACHINE = "qemux86-64"
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE:virtclass-multilib-lib32 = "x86"
+BASELIB:virtclass-multilib-lib32 = "lib32"
-- 
2.47.1


