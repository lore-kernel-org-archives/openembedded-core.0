Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAB9C04A6A
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 04:59:31 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.100878.1691989167176752502
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 21:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mciXzv26;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1bc34b32785so23483555ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691989166; x=1692593966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GRlzyAvaB5cPI1d0hpz85Qm6UFCqhBqvmGB9RAlxgc=;
        b=mciXzv26aK4ilrjp3Hwwoc7EesHNrtpA6OIFKLRByZg4D5LZ1otJb+3vreaSZb+R85
         OXVNVwWjGk9/Q2U+ikIc6IMtiUbQivC1aehkIgtnihxfJboYAJhEHWRy6j5kvqei+nT4
         fPFGtoL4jxyhKSftONdy2/cxC1IJX61gmrTD0toFVX5v3ZCkvjZWWhpy2zmC0CSW6dgv
         6+BOlDu7It9ZIH9zJZMosbFHvEcVW9gV0GtOmVCS5sCbWSAoM/m6W+ovUrSu1wxKecml
         j67DVCoIeziUmxx7U4uL7+sD6pCXCCDSTWlcNUQiySJ5VcvXhwgAHh8Re0FqvoIlqydQ
         +EMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691989166; x=1692593966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GRlzyAvaB5cPI1d0hpz85Qm6UFCqhBqvmGB9RAlxgc=;
        b=Ni2Bm9fLloh1xZMQw128ssfmxgPGzBRwEW8xSpAUVHtHD33ueajm+52REVvEWd2Crv
         AJ2IfajrMyrdd9iIgg1vDTodnzS6Ugc9HP48+O47H2ax1zekZUIIwio74gsTZ6Rd+VYU
         q05yaXPlUwKsijJGrb2zLyD5ZVRlwFe0R9Hjl/qhBC2nGtvXr0yxlixXQnN96eE75F9k
         W5wGN0MvNsoyF3dv9u6kvhZNBVFCzuCsXJ7tbCkpU+RPpKTLGo7s7bpvQt39rcdzQxwc
         dJpgBigDi14cU5/OvD4+XhVTebN8tPHrU+5cA0PMMQd8l8SBkoE33PdxEDcAa9Y5qQ6U
         HTQg==
X-Gm-Message-State: AOJu0YzCpILY7SHpqvRAGbFXE/cKpbNIrWvw6P71H6/TAyhsYpoaD5/u
	NrX059OOzUSyuI3+lcrDklbS9UxMFevbnw==
X-Google-Smtp-Source: AGHT+IEag9308j6/YH/4S1T9kaIdwvrA1uCRjOeSMV8CfuBKKxW8LSIfoNqXDc+c+S23DLL4FSkfkw==
X-Received: by 2002:a17:902:bd43:b0:1b8:9b5e:a218 with SMTP id b3-20020a170902bd4300b001b89b5ea218mr5974719plx.42.1691989166381;
        Sun, 13 Aug 2023 21:59:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id x12-20020a170902ec8c00b001b1a2c14a4asm8242336plg.38.2023.08.13.21.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 21:59:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 3/5] glibc: Drop --enable-tunables
Date: Sun, 13 Aug 2023 21:59:19 -0700
Message-ID: <20230814045921.720515-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814045921.720515-1-raj.khem@gmail.com>
References: <20230814045921.720515-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 04:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185919

Its removed and is implicit default in 2.38+ [1]

[1] https://mail.gnu.org/archive/html/info-gnu/2023-07/msg00010.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebase
v3: Rebase

 meta/recipes-core/glibc/glibc_2.38.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.38.bb b/meta/recipes-core/glibc/glibc_2.38.bb
index 94bff8f4486..c02730bcb58 100644
--- a/meta/recipes-core/glibc/glibc_2.38.bb
+++ b/meta/recipes-core/glibc/glibc_2.38.bb
@@ -70,7 +70,6 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --enable-clocale=gnu \
                 --with-headers=${STAGING_INCDIR} \
                 --without-selinux \
-                --enable-tunables \
                 --enable-bind-now \
                 --enable-stack-protector=strong \
                 --disable-crypt \
-- 
2.41.0


