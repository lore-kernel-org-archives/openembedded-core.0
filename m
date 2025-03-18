Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7115C35FFB
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:38:55 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.2935.1742323131992189497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ku7WPy7/;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fecba90cc3so8534747a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323131; x=1742927931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8le/Z1ps8+P5NGFWEipToC9oMxO784khj5mFtyqm+8=;
        b=Ku7WPy7/Fo6XE3l8hFajLfB331VG7eoWm3oSq8D2TCvSTGwL+pm9vuZ3eg64QbxxGn
         boJTi0gfeAftJqJVmDmKRV9rgZ45yCzfgVb7vG4L3bZboGPugiPKxEAoW9bumweaZN0U
         jE9WQdL1JbSGFOK1pqyOJ5qGlTWuXBh7rd23Ubbi5/Cm/1EySBnaQ84Rk1eiDB6hIf0X
         QM+jEr5n46BqnfuD92Jan5V3EOXf5dKvqa9ggsJ5QAnoiM9WG7p2vC0EL8uPIHRk/GvG
         TRPczUZXcDlhPzj4noYoUWc67Y9xRT7A1iyOCbHOKR1NwAVsw5dCN+odYKi2EYbHbsXC
         v8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323131; x=1742927931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8le/Z1ps8+P5NGFWEipToC9oMxO784khj5mFtyqm+8=;
        b=Rb/8Cq2P2wSYg9vVK/5NdN5dBhNReC6+54wXKY48V5S3qQdKjPPZ8/hsHGgouxHiI8
         jBn1Evs5vG+1sVGPk0euKdWkWD8h6YjhU22+6XWo4y/bH80+RWIJp71mv/1kCo28QRVp
         tOcBqe8i9w5cMlWd65yKjU2jVj8qeMO9sESaPPrB6sat9bX+OpgSDPcv4gfzLU3YIU8B
         IpOyn56eNP1hx6TREYuIumK39EUG8l7/vFxn4LvTvzKQSpKkL8F99M9HfkdVAq0RB95C
         8skNbC3dfpvIMJn8pKNvGSGYi9R1GwQ8p4DUcubMIuokSbZctwHfWMMSMl0jMlw/WNFW
         3ETg==
X-Gm-Message-State: AOJu0YzZQy/tGVA/ve0Uuc+hmfu2mlo+IppnqZ98i7WZGOV2JtjQuhzN
	G340fM3WXyNMbtoaXior1zcsoYCsGX7SRFZifundC9COk4LgH6HsveKOQ6AU
X-Gm-Gg: ASbGncu9fsNnzuzl9FbykqyPaeRgKNfrhR6J1qYPoIJiRAwQGHbxb+0eWkiIj/Jur1K
	BmqoXI3pUz/B4KA4gNXuGmesHgLWCeP7RT2Cn7aFZL6cm/dIaMZtAxW0ioHfgPQicASUxN+aalh
	oqbeOPEy5FcuuHScAnW1am1dr7p8YACnL06Bxog7odsF7CuYPKi0AcC+8+2wwbycS0ZtAwa2u72
	LJ3fo1f3p7djxs/dMixulXDwSbW4XoSZYMHf9OhiYvdfN75a+RTJiJZt1aOnao5qPpWa0Ha/TZZ
	1lzbRV+gawMSXsTK53YLgoZnouZjtYGFh41o
X-Google-Smtp-Source: AGHT+IGaLqCNWYziDXyVgEMIsAQsE+5T11acQKQfxww+CWBnHw4BLvhheZpn0cIUPaldRtFOwVkIkQ==
X-Received: by 2002:a17:90b:2743:b0:2ff:6aa6:47a3 with SMTP id 98e67ed59e1d1-301ba144363mr409060a91.25.1742323131157;
        Tue, 18 Mar 2025 11:38:51 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 08/25] bash: Stick to C17 std
Date: Tue, 18 Mar 2025 11:38:23 -0700
Message-ID: <20250318183842.2256284-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213234

GCC 15 defaults to C23 and bash is not yet ready for that
so keep using C17 like GCC 14 for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/bash/bash_5.2.37.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_5.2.37.bb b/meta/recipes-extended/bash/bash_5.2.37.bb
index 20c51ecdbc9..9f02ea17b5b 100644
--- a/meta/recipes-extended/bash/bash_5.2.37.bb
+++ b/meta/recipes-extended/bash/bash_5.2.37.bb
@@ -20,4 +20,6 @@ SRC_URI[tarball.sha256sum] = "9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1e281175dd1
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 
+CFLAGS += "-std=gnu17"
+
 BBCLASSEXTEND = "nativesdk"

