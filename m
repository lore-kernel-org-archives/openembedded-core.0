Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC00AC5321E
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:40 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.9392.1724319340180436516
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XmWSGg19;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f3ffc7841dso5211651fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319338; x=1724924138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kW0ew9inBqp4bcFZjlwDJvV7CE/HxuABtJohZO2ZOc=;
        b=XmWSGg19B3y3FbV//BUd7RJJ47rUw00pwrKGiQfNwXdvsATCjmXaKewmNxa3jm7bwI
         kknFiIDTHs9gTUpzDznPp+nS+z7qlkuqWLNDO7KUjsUErvoRE6mNOTfYItLbMLBxBNL9
         FoguAfvo4VRa5QREkHro6B3IacOWWPANMKro++RjQ5jdCNwB1/QZozOmOMjesV1+R0zL
         r4qe3dH3B/2HUCSJR9TF3z9mREgW4q2sWvdl4VpKF3upBhsL9KOEbuzYc92FxtXkGAZZ
         pvmA74V9dMkbAoPXJjsamVX+Zs9y4Urr3UbF72M6IajiFrZ36R1PfC/oU5/XVTz7t6Uj
         0fPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319338; x=1724924138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kW0ew9inBqp4bcFZjlwDJvV7CE/HxuABtJohZO2ZOc=;
        b=KWTem8X9fAwyXoLMqzgUBIqPXHyIe0z93NrukdMyQ3xYU0leSUkpQ4BuHm2Q0BG9aS
         ZlQ+UWIvrhza8G6sgRmFbhyRAvqb+PvJGdbk6pZ/yehrAPK76xTv2tg0C9lga54staRt
         UX0OTVjC1L4WSTu6X7D9PoScbaBx2neGClX/Yc5vlGxHSRvReTUe9LjQ7P/oz9zPpVvf
         ORzve6k9MvzFZJZL+VCzc3i8gJZhSMyNaoMs6h27thQRIFwKdYPH9GC1Du2glSnSOch8
         0HllD1yK3xaQ031GcaMy7o5wGNtl4ai0O9xCI2zPJ7Xkw7VddmQZqP8dDzS0XHrq8SLi
         wMbg==
X-Gm-Message-State: AOJu0YyATINDx+a33wFNOKrpSrEfm33D4NP4ypeZVGc5hSdSermbgbYS
	DK4Kehpl5JphL8Jni/X599lGb0h16T6zO5FPK7LRVISm2aC9r8n8IFLQEA==
X-Google-Smtp-Source: AGHT+IFdUXhuqwyn1JW+1T+7OzU2qDiAIrFZp/92UMglt67Mq/ru6Efd9IAkP8uF3Rcdh4rPiY7bnQ==
X-Received: by 2002:a2e:be9e:0:b0:2ef:2016:262e with SMTP id 38308e7fff4ca-2f3f8721e0fmr43786181fa.0.1724319337899;
        Thu, 22 Aug 2024 02:35:37 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/32] mpg123: upgrade 1.32.6 -> 1.32.7
Date: Thu, 22 Aug 2024 11:35:09 +0200
Message-Id: <20240822093521.36790-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203635

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mpg123/{mpg123_1.32.6.bb => mpg123_1.32.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.32.6.bb => mpg123_1.32.7.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb b/meta/recipes-multimedia/mpg123/mpg123_1.32.7.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.32.7.bb
index f7786e8588e..5a9a2a0943c 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.32.6.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.32.7.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "ccdd1d0abc31d73d8b435fc658c79049d0a905b30669b6a42a03ad169dc609e6"
+SRC_URI[sha256sum] = "3c8919243707951cac0e3c39bbf28653bcaffc43c98ff16801a27350db8f0f21"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.39.2


