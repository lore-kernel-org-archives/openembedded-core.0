Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E264C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 19:32:20 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.150930.1719257536929332045
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 12:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PgPG9n4c;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3d2299e6650so2200417b6e.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 12:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719257535; x=1719862335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7T3ggPzHzoJxsuweGARlduUC/tLeCFRcx8gbgl85F/k=;
        b=PgPG9n4cnmTgG+MrpgTFJ+i+QyHl00IHSnBSKZF9WJSMlJ3Z5dg73+nJ/gyjahfZLP
         xBNJCCKsnG5HftVtEVzHkClE+GyUVsG/QiTjq59guomhevDS029JsJY7EM5dhOkm9n11
         pv7Nf+RjyBFPobUDYeTARTc0yXbfUkML5tAS32gALN5YpBzfIGBFbV9Z84Wm4rIib46X
         eA2z0cS8OCoSpTRcRtpf3J6oyLwFMs6RvDnsae9+1GLO/g/zMXW4Wzrp5Qqc4276qZZp
         087u79lvkYZLPlueKnONNU6PXUPQPQ6oqzTxYaRWnAIAQNtnaPXY7tUqGGiFIzVao9rD
         VlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719257535; x=1719862335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7T3ggPzHzoJxsuweGARlduUC/tLeCFRcx8gbgl85F/k=;
        b=EVdKk7Kxfsbry0S+//BnRYfbNNcNHFmL7ZHSvmcpS0Qrj7SQFXaaeug6oVI+vIHUi+
         /jvtY6wgm75UbO2SDTodEaODH6C4Nfyp0YBUUBhR8AFiG9YkHswOIePzTS9G9+vwRexH
         1LwGMx8kfyADWjLrsRLW1rdG/KPF3wCFeYnZwx8fZpLTb+cusZ5K0QJBAvKWsn25OG5/
         DL5hficoXc2Rtl+yuIa6VlMg9/UqzLo1yIemt/ReeqyWiPiQL7BIYwRKOS80F4A0MZrf
         DbM/AccvfVMBBAVgPSekcCOSnc2vMHsp+9ZzKlXc+2Q5WilrPQweEFNNCP74shQAKSdK
         CiYw==
X-Gm-Message-State: AOJu0Yx0X86tE8jj3CvQSwRA9Z2AA9kpubUVxU+KAKsxyTqvnF2TO+ty
	rYFZkYHhUPG+tM0vrHfqWMEBZLU9Ru95zOgMLF0FGe37or9bp8izXgeLGg==
X-Google-Smtp-Source: AGHT+IFgznTPv+UML255BkqRN7KmikifmImOgfd33A/JFyghLzSyU2xvqa8MzQGQAuQBWFjjLk85iA==
X-Received: by 2002:a05:6808:14d2:b0:3d2:21a7:8620 with SMTP id 5614622812f47-3d54594d8e4mr4810522b6e.12.1719257535420;
        Mon, 24 Jun 2024 12:32:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d5344fa91csm1586711b6e.19.2024.06.24.12.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 12:32:14 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 10/10] Switch default spdx version to 3.0
Date: Mon, 24 Jun 2024 13:11:00 -0600
Message-ID: <20240624193151.1645802-11-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240624193151.1645802-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624193151.1645802-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 19:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201112

Changes the default SPDX version to 3.0

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 19c6c0ff0b9..b604973ae0a 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -5,4 +5,4 @@
 #
 # Include this class when you don't care what version of SPDX you get; it will
 # be updated to the latest stable version that is supported
-inherit create-spdx-2.2
+inherit create-spdx-3.0
-- 
2.43.2


