Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3C610A3D96
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:51:36 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46592.1774529485992434113
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HSimwLex;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486b9675d36so8870855e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774529484; x=1775134284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2XCD+evDEDj7+bfxUGa9bK9PncTQN+DcrjsaPrGX6s=;
        b=HSimwLexfrTqJV6CxHUNz9N//twZAlCRu5GO6wScX0ZHxeyXfCbFhThGnVf8CvY2y2
         8KmKXc1Rc/WNvdYK5Z2UstuFFpFPWz/iw9uJcSaRhSstw0K22k8+DBpZHiBbvqgw8lxs
         TNtXYeIWpIS4d+AuHVXbtXaMlupQLYCxSpXsTAcUfY+vkbq3up9ODr8oIh0lxnrz1Uty
         hlDE/JTMGF4xQbYZLteJTWBoiIgMo6AVdDYm8E604Zv4w5nqHKfkNMuxOhciM9b9hRkR
         uEcHH0ougeNGj90T8Q4HDoGv01hQxZkM+osHqpaJzlpZ4Spe5K1fQFXfrHbK+K1FpPls
         dtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529484; x=1775134284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y2XCD+evDEDj7+bfxUGa9bK9PncTQN+DcrjsaPrGX6s=;
        b=lnU2K99HWr3yskoj666yFPHSCsEzHx33mnmUiSG3HfU6oaHtGaQKgs12tOonWSqJzq
         ijlTR4/v7626c158iEKJWzUI1ztAubYsKs6oBi0f87JRdc7BZeWRyHIbBzxZOZTqCkeF
         pXbT5YAiEQPpqS1B3IaMFNvFmw/7nNXJx/BjhaZKs6EVE3eBluUaBXOjd/kdNTSwBXKn
         QQCPjkv8bXGmwzkNPLO8bu3c/RP1hyrYBVeghwdwBMaoO3NGcGt8zFdFYXGgRcvPFNG1
         V935T0eQlG+FE1MS0yxfR9rZBqW43+bHIRCRM1nn3MNU2BjTSLaEPlcfTDW781OyPnCR
         GADA==
X-Gm-Message-State: AOJu0YzMWgeqrFSpK43JOjn4BlZ977/k2WDH0XUCqAZDKoeSjyYOi2x5
	AZhMGLOTPZk9+ksLVzU/+6PCfikV9JTrbSdwXqUzUWXBIVEwnMJW6ZcA0LDY4w==
X-Gm-Gg: ATEYQzyboqWfxJNEf3gzIHXpLirhLE8DAtxF90vbGWIO3UgJfe1QR1ibeQ762OtV5zY
	VVku7XMZW+aioipprAKPFjMUjsXLIjtEyxkl+/5CAblA8GpxtIC1YlB/GQjcAumdUC1yAxTOIlR
	5re1LisPKzHbQxNUsUAkLeOl3gWzvRWryOAlLSO4Awi0UsQjJk1bY7XRbTuOD9TScZs8rknTwDz
	k19NDq9men5ioTw1VY9qeNs2bXNIU2jsebBb7bOCihYDiz9/xHaxqE2ju/fcu+wCJvL41KQqmLk
	rW/v4+ydcnWGCrq8jr/HyauxyJuKxPmA9P/jsvkmtcypx5A38oYPOX0//8ntNgJnmkjELfh75GM
	EoVKpTAdgRD9V0yBa2fsLBzNEJO+kg0YWfD83X3KSbjp04AtqaaveLiIANHEhh7MTs5q5wtBMl5
	lSUkL1dI6h9zN6mg==
X-Received: by 2002:a05:6000:2c08:b0:439:fd13:5c48 with SMTP id ffacd0b85a97d-43b889f5701mr11682620f8f.31.1774529483950;
        Thu, 26 Mar 2026 05:51:23 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm7681326f8f.19.2026.03.26.05.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:51:23 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 06/13] clang: Use PYTHON_MAINVERSION for python module versioning
Date: Thu, 26 Mar 2026 13:42:27 +0100
Message-ID: <20260326125113.1853869-7-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326125113.1853869-1-zboszor@gmail.com>
References: <20260326125113.1853869-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233990

Use the new complete main version setting instead of just
PYTHON_BASEVERSION that does not include PYTHON_ABI.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index e10c327a2a..d5f8aa777f 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -46,7 +46,7 @@ PACKAGECONFIG[lld] = "-DCLANG_DEFAULT_LINKER=lld,,,"
 PACKAGECONFIG[lto] = "-DLLVM_ENABLE_LTO=Full -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[thin-lto] = "-DLLVM_ENABLE_LTO=Thin -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[unwindlib] = "-DCLANG_DEFAULT_UNWINDLIB=libunwind,-DCLANG_DEFAULT_UNWINDLIB=libgcc,,"
-PACKAGECONFIG[libclang-python] = "-DCLANG_PYTHON_BINDINGS_VERSIONS=${PYTHON_BASEVERSION},,"
+PACKAGECONFIG[libclang-python] = "-DCLANG_PYTHON_BINDINGS_VERSIONS=${PYTHON_MAINVERSION},,"
 
 OECMAKE_SOURCEPATH = "${S}/clang"
 
-- 
2.53.0


