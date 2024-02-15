Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C340EC48BEB
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:02:18 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.19226.1708016530713463316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UZ2PjUws;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d51ba18e1bso11002585ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 09:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708016530; x=1708621330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rg+AQsNf8VbJRo9SgZB++L+o/kMY61huqiq0ox4brlg=;
        b=UZ2PjUwsWzc3wueh8qKN3RPVUWm7Og2Gs1JVcL8flOAj/w2oo21ZZiTbIRGwzDdf9o
         3CVsuWWzQfmQpgtij0gBfZHjURg+fzICxZJUccR13woJF0cp2FT2ocPUCob6CKDzFQ5j
         uBksTF1muVF2qvJCHOm8/gX5ZHqyYRTa+XLMZC6KCHtMnUVPdp/Sz//9ivqUQw9dyKpJ
         DWDt7VV0zkBFnPemvQ/GD0u+G3HBeduSK4KwqaklZqBP2Aazx5qpDdsj9rTjqmBGTycC
         lKHTT55y7dJHt8O5VqOivEEK6sWewTX6VI7+H79AgIbWZt3qEJhP+JMsfn+46BCF5eqQ
         hGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708016530; x=1708621330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rg+AQsNf8VbJRo9SgZB++L+o/kMY61huqiq0ox4brlg=;
        b=No50TcgHMQ/HnUWfTXR8aQg36nkfjT/SOOwnbPF6X4Fy/KH7xdf+EYOTv2ibl71t+8
         /QwROv/Bcz0JYQSVZv6TT8ZggsxGmdSN9X+fxcCldRR7bynOi4pin6HRUE+kD8saVBRP
         PmuNf7mxcPqfiQoudhdHm9MYeISk2lcfZiiQhWkmJwG9aZ854Xh2L9BleGBfFGEpVfZJ
         59G8joy0ndIKrAaLARo99MMLo812wqX0zE/+U7MBW+jz5ms925DQuzUsvB/oa9Z6Aswu
         vkW2ySZbEXuwsZpi6dyzNNErwoyHUDrmwMI61MievawFsNiw9fGHJ+rQEdcNl9wDCuMo
         EZ9g==
X-Gm-Message-State: AOJu0Yx1j9Fnf3T5mGI/GZwB0PepqV9N6gy7vSZ13nFsi/7s5YfpjDL9
	OYK/+ltjvxT5GgUJZeeMbvJQNYRmq6GKhMF7SoEXxSFTHd1Zyq0z7COQ+JFhXF4=
X-Google-Smtp-Source: AGHT+IHFIHU3AcEuFa0m1sywdQ9t8KQbpef5ceF9BMzqyGap+2gy5sBl1+xfF6Jqdc4GTAKCy9k91w==
X-Received: by 2002:a17:902:7d84:b0:1db:2b8b:49f3 with SMTP id a4-20020a1709027d8400b001db2b8b49f3mr2102222plm.38.1708016528316;
        Thu, 15 Feb 2024 09:02:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::fffa])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902c74a00b001db715d3bf2sm638087plq.137.2024.02.15.09.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 09:02:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] musl: fix strftime crash
Date: Thu, 15 Feb 2024 09:02:01 -0800
Message-ID: <20240215170201.1044011-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240215170201.1044011-1-raj.khem@gmail.com>
References: <20240215170201.1044011-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195547

Apply a patch proposed by Rich to fix the init crashes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...akage-in-last-commit-uninitialized-p.patch | 41 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0001-strftime-fix-breakage-in-last-commit-uninitialized-p.patch

diff --git a/meta/recipes-core/musl/musl/0001-strftime-fix-breakage-in-last-commit-uninitialized-p.patch b/meta/recipes-core/musl/musl/0001-strftime-fix-breakage-in-last-commit-uninitialized-p.patch
new file mode 100644
index 00000000000..b6ef5423de6
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-strftime-fix-breakage-in-last-commit-uninitialized-p.patch
@@ -0,0 +1,41 @@
+From 46562816d15ecd66fab7ee916a3684de29b9789a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 12 Feb 2024 14:40:53 -0800
+Subject: [PATCH] strftime: fix breakage in last commit (uninitialized pointer
+ access)
+
+commit f47a5d400b8ffa26cfc5b345dbff52fec94ac7f3 overlooked that
+strtoul was responsible for setting p to a const-laundered copy of the
+format string pointer f, even in the case where there was no number to
+parse. by making the call conditional on isdigit, that copy was lost.
+
+the logic here is a mess and should be cleaned up, but for now, this
+seems to be the least invasive change that undoes the breakage.
+
+Upstream-Status: Submitted [Rich Felker (musl maintainer) is the proposer of this patch]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/time/strftime.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/time/strftime.c b/src/time/strftime.c
+index ef590903..c40246db 100644
+--- a/src/time/strftime.c
++++ b/src/time/strftime.c
+@@ -234,7 +234,12 @@ size_t __strftime_l(char *restrict s, size_t n, const char *restrict f, const st
+ 		pad = 0;
+ 		if (*f == '-' || *f == '_' || *f == '0') pad = *f++;
+ 		if ((plus = (*f == '+'))) f++;
+-		width = isdigit(*f) ? strtoul(f, &p, 10) : 0;
++		if (isdigit(*f)) {
++			width = strtoul(f, &p, 10);
++		} else {
++			width = 0;
++			p = (void *)f;
++		}
+ 		if (*p == 'C' || *p == 'F' || *p == 'G' || *p == 'Y') {
+ 			if (!width && p!=f) width = 1;
+ 		} else {
+-- 
+2.43.1
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index fb2b188e010..190e16a6e1d 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -13,6 +13,7 @@ PV = "${BASEVER}+git"
 SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
+           file://0001-strftime-fix-breakage-in-last-commit-uninitialized-p.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.43.2


