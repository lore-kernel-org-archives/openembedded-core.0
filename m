Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62572C3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 12:33:45 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.27842.1744547619763858800
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Apr 2025 05:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FjoT+E3G;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso36784425e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Apr 2025 05:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744547617; x=1745152417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0hnAng59brEkR+evwPGY/tMNAXhnTyESosbQJpQnaCI=;
        b=FjoT+E3GZwgTSrghq7QFqgwOvK+FMv0YvTvRgJunuuS5hURy38ggW8fXGZfvSH+J8Z
         duLw7la8juLo7EiAW2mtaYN6u6gZCjRvwgKwD9MsmQk7EeiEcVDsfftziJ1Wn7ocsm1C
         y8MEcnvryUhieVykn6Ey5SaUQ0rrBn2/bpPz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744547617; x=1745152417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hnAng59brEkR+evwPGY/tMNAXhnTyESosbQJpQnaCI=;
        b=DdGnCKb5C1F8CQBUTC98t+u/3knIPcvxijPjUMhD0Nh1ZyUl7hp6x/ADhEJBTBYFjv
         VvdIL7U4SNAFFQCUW+XkhPpI+pZg47LJy19G2HnKYfEJSWgQTFKbuKjJi6YPFiNujcMr
         bZqAYSbiBG7HQlvGaigHs/9jcklX2Puv8jWV3IIGw6yNM1qMxmOwWnldSn4UMhpl+pFK
         EZSY/nil8ioGsniw8JuiGOJYlyFCWlfFYpREopZF1mss8kfASOXdhWcD4PLjsWSR9zO2
         Hdls1GZWhi9qAnpl+IKwfc2AezsFeigxqOI8NcZFWlR/7xKb3bF3qFmqPtbpx8lvYwj8
         Kvcw==
X-Gm-Message-State: AOJu0YysNJjdYnttRbaHae84Ze/MllCkjwfD9AfUQkkLhZlcGuVQPb1p
	DcPkqdvMlIYZT0eI1q6eAClaFUWq0b4yAdIzYXxY6CUtKJsnbAcB+YfrLTdSmWt0PveBzpzdmTR
	Doqpgwg==
X-Gm-Gg: ASbGncvqd00LrVLtwf8EjEZtxX+O/o7hhItUxj3eH+eLPO7XHOZ4/2qvQiD+Q5w6nVC
	VnFx/UjCsvkzUa89oZfrmfvri1BTkanjjKr8PW/UsThvRaDrn9O3xR/+raIE/evlMia/yDVQCVD
	hfeojJSZdhES82Scdz+Gny/Y1Zx5g6h/rHpZ+LKc+wjL3dBIstFI+0idNd3UDPR1o/ePbtVi0rQ
	dZGgZTfHtf/80r8InGZPJKTanafFgCRrG+qm7HUMFjb/45bzkoWuKKEElnNKbgdPZKRn1TD6a/X
	uLFKFkFINK+dEt9Ig5bzebKcjhc564b7Htash6zVUFeTk18f60JSXISAONORDFrs73eKNgDhd+2
	1zTyWTulWC4LeKTr/uWYpxr/EJyBBgFP/7ELl2PkVngxKpe6ADN5Fve0VPw==
X-Google-Smtp-Source: AGHT+IF/5r5JZfjuIZu/TuGEXMgRB4V9SqpZ+M2ZqvpL/z76frKW5LtI9E4H0/L6/4SKQxQQmZpiZg==
X-Received: by 2002:adf:9dc9:0:b0:39e:cbd2:9129 with SMTP id ffacd0b85a97d-39ecbd291afmr4612721f8f.10.1744547616929;
        Sun, 13 Apr 2025 05:33:36 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef0002cff7470e58ff5dc.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:2cff:7470:e58f:f5dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cce3sm7885642f8f.74.2025.04.13.05.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 05:33:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] cargo-c: Update patch Upstream-Status
Date: Sun, 13 Apr 2025 14:33:23 +0200
Message-Id: <20250413123323.611005-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Apr 2025 12:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214786

From: Yoann Congal <yoann.congal@smile.fr>

https://github.com/rust-lang/libc/pull/4382 was merge as
https://github.com/rust-lang/libc/commit/4b439b0953573e0383da7e092b1f516ba21f3398

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...1-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/cargo-c/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch b/meta/recipes-devtools/rust/cargo-c/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
index 3b9936131a..95dcb45e56 100644
--- a/meta/recipes-devtools/rust/cargo-c/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
+++ b/meta/recipes-devtools/rust/cargo-c/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Define more ioctl codes on riscv32gc-unknown-linux-gnu
 Define ioctl codes including `FICLONE` and `FS_IOC32_GETVERSION` on
 riscv32gc-unknown-linux-gnu.
 
-Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/4382]
+Upstream-Status: Backport [https://github.com/rust-lang/libc/commit/4b439b0953573e0383da7e092b1f516ba21f3398]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/unix/linux_like/linux/arch/generic/mod.rs | 6 +++++-

