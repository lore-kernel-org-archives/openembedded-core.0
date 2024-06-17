Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF408C2BA18
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:44 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.54580.1718625941705465837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IOWZXfn8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70413de08c7so3043848b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625941; x=1719230741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GtulwJcRYu/1wXXl0QNJxpXUdjEtbDcd6meRKORX1qY=;
        b=IOWZXfn8wrZWicgLte0daXfWnXBV9iMI91cs3it1alHkhBTFjIcYuve2Js22sbbBQw
         QZ1zbvul+eh4XDx7dgcuV12EfAg4F16O92CbFkznP/7f4SxVhO6gKa2SeDzE9TlPOYDH
         8BNWt2eyysF+8pyrPXhWmrpYQnOQdkzmBdq034ohAlSELkQQ3IVlSaPkJoioMAvjtYTq
         fb+091HDAdEoegyI+pbWHwnZmiFRsBhhTZMcOJg7Jb/T+BYEEqmQbHlKM2t+LIHudhC8
         Jurs7iEy+WHXm07JcqmvNpCTJEl8NZHJAp8QsqRbt0Se9yiQeZK52I8qXog3rw20IySh
         zs+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625941; x=1719230741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtulwJcRYu/1wXXl0QNJxpXUdjEtbDcd6meRKORX1qY=;
        b=MiC5pGqZsGdHqAIwTN+u+eYxt7Xgg+CRxnAeE7u7klZbggCvKUeyEN+n9zt3GhmU6H
         BmTti3XgwyZpJRudZUucz4KwZ0kVBqjGi0SKV4dnZ7ncQj3ghUGFt1TAEzSrRI6BMrM+
         dSsaD+fF5aZDH4QqhhciQZ0Ckcp4GjfZQ2CQhp18DU0Ler5C7XOyM4jTig5azujNoop/
         9igkE8as6Wl6IgPrJM3xc5ovH1bsjKEnAK7k9MkvChV/m7PBvrU6JjfRO94fPvjv0RUC
         o55WCSZgKquaGam1kaE+AW7+poirYhyxkF3c164glwlUcCLpZOkizb5FSBtRW256EJAw
         OPdA==
X-Gm-Message-State: AOJu0YzTR66BVdr3/jn1+o0i9IL4F8nSAiNt5KYun1cT8kmWwju8gb/I
	dxK3HWjauaUYUAUlWXGUGUpZyBe2bzGfrxQ2kR10PgXkphGAIfWL2Bv+BuxYi0IwRcFZQreGnfD
	5GOs=
X-Google-Smtp-Source: AGHT+IGzv8LEI82MdXKgaR3bTyQeyvXATVM3aTxNgmkMfPft4f99kBAmRV039llA0+GKxHbpm5/6VQ==
X-Received: by 2002:a05:6a20:7344:b0:1b0:1a02:4136 with SMTP id adf61e73a8af0-1bae7e28efcmr10080825637.8.1718625940931;
        Mon, 17 Jun 2024 05:05:40 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/22] libunwind: ignore various issues now fatal with gcc-14
Date: Mon, 17 Jun 2024 05:04:47 -0700
Message-Id: <dface38338ccaa45b2d1202e62adc87d99c3fb49.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200820

From: Martin Jansa <martin.jansa@gmail.com>

http://gecko.lge.com:8000/Errors/Details/821679
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 20b9e9980c6675906ed154df968008f8c9140a9c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libunwind/libunwind_1.6.2.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-support/libunwind/libunwind_1.6.2.bb b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
index 3208785124..c7b1604b61 100644
--- a/meta/recipes-support/libunwind/libunwind_1.6.2.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
@@ -40,3 +40,11 @@ do_install:append () {
 }
 
 BBCLASSEXTEND = "native"
+
+# http://errors.yoctoproject.org/Errors/Build/183144/
+# libunwind-1.6.2/include/tdep-aarch64/libunwind_i.h:123:47: error: passing argument 1 of '_ULaarch64_uc_addr' from incompatible pointer type [-Wincompatible-pointer-types]
+# libunwind-1.6.2/src/aarch64/Ginit.c:348:28: error: initialization of 'unw_tdep_context_t *' from incompatible pointer type 'ucontext_t *' [-Wincompatible-pointer-types]
+# libunwind-1.6.2/src/aarch64/Ginit.c:377:28: error: initialization of 'unw_tdep_context_t *' from incompatible pointer type 'ucontext_t *' [-Wincompatible-pointer-types]
+# libunwind-1.6.2/src/aarch64/Ginit_local.c:51:9: error: assignment to 'ucontext_t *' from incompatible pointer type 'unw_context_t *' {aka 'unw_tdep_context_t *'} [-Wincompatible-pointer-types]
+# libunwind-1.6.2/src/aarch64/Gresume.c:37:28: error: initialization of 'unw_tdep_context_t *' from incompatible pointer type 'ucontext_t *' [-Wincompatible-pointer-types]
+CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.34.1


