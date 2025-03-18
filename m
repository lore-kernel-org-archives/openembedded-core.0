Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6ECDC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:00 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.4274.1742272739738701938
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PO5Jr+72;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2235189adaeso87914555ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272739; x=1742877539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPSfqcsFYCmDEIEBHfIYCnL+AQbT8jQB7KG0eCEwLOk=;
        b=PO5Jr+721nAyniCtTiDkH/nuh3YyUtPeI2O/DIFLmuJStV9/zo4vagmv6i0/7yLzq6
         uuN/yUxPCflqDPrwKU2L9l98LXksXyndirvRY/9eNSije2mvQa2fXyZD4gOTxhwIntd5
         ZCAx8iWVxpI9bTpRWqQGNynXr0a3G+ZUPjp9ISp1DnF28oHuf13mNHsGoQsXxeJAD7tc
         tsPySLM5agPWYL4nyOpD9tBX95WydfP6C5p6TtKyR7WMtdxa4qdC5qmEE/PCwo5BSYG9
         ifC2cuzCFntpnyXbQy+ALyIns7vYD0VFo0vBDUslLyzMvMfFowAMz0keShUVi24lPnwW
         kyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272739; x=1742877539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPSfqcsFYCmDEIEBHfIYCnL+AQbT8jQB7KG0eCEwLOk=;
        b=gloApW9Zblrp2c4j7kr4F3UELrwzfjBhy78xXqZK0RKRwsXyNfQgL9EW8/De55nWW8
         +G1YL6Q40robWMO+1BBcebAe7Wv1eBLHU5hwDurtw4Ag7BkZi5nKw9bkzYeWLq/JvTjg
         MG8kbdRBpWbS5EkMGKyhqdq+E6JQDk/uGRwzaRfg6tZk/qyUu5W+G10GVO4hOpqje+Rf
         NBHZ6nrbeVpca1UQbTR85wWFIDkAcx3Qu+/H2HajDRmcojYYfzKJdDUG/kadVpvvUUrx
         QfrPQByTFS4q5Zed8SfxR9nv3RbVEvTcbhmD5ClPXTFFV0s/3KIfTZHTo8HplJNibjyO
         aKWg==
X-Gm-Message-State: AOJu0YxQsBlYvYUVOv9A6gFBAsdqzEcB46istjbKUiAP2ZNQZ7JLszOk
	p3dYeLuT25n6e3YcH7Z1cd9nOGUWuu2mzfjRrc3UhzlrYVwN+sDYOBsrAtR2
X-Gm-Gg: ASbGncuyHUwyAUl05/AGRg5Csb2xzhh4QAELAFdlAeuBUJA9F31VdxG71qtYQS6hs2D
	OKQ7Dcc/w/fQHQOwcAk+XiifyfU6aTFja4PAunJN05N7hDbU06+J9g0lW7W0UMyJgrL9G9kJOcj
	8gVoa6mEfVnLg5iWpNvu9kMSzqIHYcD872JnhK11tKMm+D9Gbftx1gutbfui7+eAX4cVXjZTih6
	FG5YP6ikHsU7PmVYTL/hyYF/9gviEkkpE+vHmd0PtoFaJbK3iZe+PtxrdHa9KRfy3zelQLBhRw+
	9GVyfIynDNkWXfsf3trXPoexU3sHTmQn27l9
X-Google-Smtp-Source: AGHT+IH4Bmd7Sfp30Ci2JTsZ3iTTAYBdfxb38Jn5TSkAnjriRZPicsndCgmOX+qObSd/fUGburaY8Q==
X-Received: by 2002:a17:902:f546:b0:220:ff82:1c60 with SMTP id d9443c01a7336-2262caec34bmr24086325ad.14.1742272738705;
        Mon, 17 Mar 2025 21:38:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:38:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 10/24] tcp-wrappers: Stick to C17 standard
Date: Mon, 17 Mar 2025 21:38:30 -0700
Message-ID: <20250318043846.2422141-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213144

GCC 15 has switched to C23 by default and tcp-wrappers is old code
pre-c99 and would need to be fixed all around to get to work in C23

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 8cf927153f0..05644b7db95 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -55,6 +55,8 @@ SRC_URI[sha256sum] = "9543d7adedf78a6de0b221ccbbd1952e08b5138717f4ade814039bb489
 
 S = "${WORKDIR}/tcp_wrappers_${PV}"
 
+CFLAGS += "-std=gnu17"
+
 EXTRA_OEMAKE = "'CC=${CC}' \
                 'AR=${AR}' \
                 'RANLIB=${RANLIB}' \

