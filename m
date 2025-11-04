Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5911DCCFA04
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 14:48:13 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19635.1762267692814140831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 06:48:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Jn0dOBHQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-340ba29d518so2836403a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 06:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762267692; x=1762872492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYCcwOnS+Ui/7nymb78KDWKTCTrVcNW1FiL5++R9qXo=;
        b=Jn0dOBHQZGDTehqIEP6QWSQV/MyT+H0Tb2gSFO5BKXw6O50NSP365yK5pfR7htgPQ5
         iMb+nk+VkXFYU7Yyh/sjSvYyTvXyWc0+w/KHRTeinnGz84BuIRJUEBN7V1BxAeWqVgd7
         JkRSD1xKIr9lZJoQSoFVi3LntBZBMQNbBaLJrDDbp2e9GUxPcg3HPGsoZ99AkE2VwqwK
         kvpOQS6NRBoku4XDqRrSVmcH5cCgBHMvhaZeDPslcVH4MNppFfucihqojDIuPHtcoaoe
         h8Cn1osirYO1zWUqozg4ecw88yHNR+GhK9MnrblkrsqBAGGX1/6MbK4V3XqrQgHNyjzs
         xJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762267692; x=1762872492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYCcwOnS+Ui/7nymb78KDWKTCTrVcNW1FiL5++R9qXo=;
        b=hKYq1yib4Rqk/v8Cu7Ra3eLruzGfLF5UHB232V+GpUS3pkgG/z28g+l0Dui6QUM9GP
         he7UobYOArOS/LvfRghBAbhcAQbzGQIZR+YOBWLhCgpReCDD1/jbQkcMUk8Q2LkNYDZb
         5ZB1U3Vt4J95ZD8J2EHCeKKKxNBI/30jlDZHAeFU2BLy0R+cuPnn/HI03Fjk2+muvXJ6
         78AlMyuoiyz8SNgTzRVKWT7E3+gPwZpqieakvtuOrG1bY5o7sXtA9TD+aIGyywBWATZA
         3g/Vgy8TF+nXQnu8RDNplawqiXW1vV/zkTSPR9UpTD4W7CNEgsovM9Ccq17Ac6wuL7Tz
         m2Ug==
X-Gm-Message-State: AOJu0YzW5OQ3bLe9st6/toaXPHQtWzg/Wn7hHf+HhfNpl+RXevxwhr0M
	FP9F0wEYhOMu6d2PO+j6La5R/Ll/43AX5pEHbGIcG3sB60uHCGazmFjgQdKWt63plQHThklCrkL
	9YCpl2eM=
X-Gm-Gg: ASbGncuDJFqCnqtgMSfy3VCJqKiA52UGxYw/nEmzTn9hr7wQICoR7IVujGLAYevNMwa
	rF/g2h86Zz+DhnkRZN4HvSfzgqMCry8Y/D8BkJIzhrigud7ChIoxvLU5B3aBHGH4nJ+d0XZtunh
	JzgpnhQK0MNjnKUg4vOPLoTqyaFdS5UeGNQwXEWNlIydayfwAgZqy9rv+9Wak3+g4e3jThT015i
	sa86fOzcrmYhjrn8T0uT55vYwilt4gfriuhegujXmBVXGNd8bW8GKC73Jj/QdJZgKQgAkHbJmby
	ZMBDLgiCXGTzTF7U2HuYAUxZ8l8o1y0Ta59I5ep9oQe2r4nReVZL64yQYgXmpXtWbVdVQqsTyRz
	4xJIUpfyaD9E2bqk7Arih1Zx4cxd9UfD6u73ggXKLhNSTgWe/UVmfiGb/LxTUiK02T4ILE20/I0
	t71w==
X-Google-Smtp-Source: AGHT+IG+CVgy3L6RuLly0Pb82XfaupChlUU2/MbS9ZxJNZOaEFYcRlzdCGoZstdc1Iif7hFR9ZjPHQ==
X-Received: by 2002:a17:90b:350a:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-340bc2799c2mr15145673a91.9.1762267692103;
        Tue, 04 Nov 2025 06:48:12 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1f4f:a6d3:d9bf:780d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417d40da83sm1341481a91.14.2025.11.04.06.48.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:48:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/7] Remove empty file
Date: Tue,  4 Nov 2025 06:47:56 -0800
Message-ID: <0539a7869c4a3e28b3e7d0ab93fe07bfb9462d13.1762267481.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762267481.git.steve@sakoman.com>
References: <cover.1762267481.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 14:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225731

From: Michael Haener <michael.haener@siemens.com>

An error occurred in backport commit
649147913e89cd8f7390cb17cd0be94c9710ffa6. The test file
is empty and has no functionality at all.

Signed-off-by: Michael Haener <michael.haener@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 test | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 test

diff --git a/test b/test
deleted file mode 100644
index e69de29bb2..0000000000
-- 
2.43.0


