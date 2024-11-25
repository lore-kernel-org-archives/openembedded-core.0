Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B737D58083
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:53 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.17227.1732536110881017811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q0hOsfC+;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43497839b80so12638185e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536109; x=1733140909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQy2UcqE350mB/1lUAcqO9gInjbfSYkJ/hWUNociUIM=;
        b=Q0hOsfC+eB17MQU3eeIgeH5iG0D1GIxVBtqtXv9ylVeXav0jrjcM2QKWa/X6WPLdq9
         i3bH1ILUAT9+g7jbV/ClwBgrdgyWoslcs0KhaCbEcdJz8rlvLJAfJ7n7HdZTSl5gpQsy
         kGwdZuQO3qxNvYH68yTKzdFBG3AYfNE6N2PWgQsiWyVb8F8ci8j19Zi6aCdyvS+2xjVG
         3EcSOmummWxGLrqa4TqdkIdFsVWcjC+pfs2/BLKugDZ4FOPDykRXnBe0krhxadpRrqoj
         ptBRCnsbXnhwvhNbAWISxNti3qwywOhaxns8Dwmlrgmn20Z5eFcuGzI63tefbHPO7m1F
         poGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536109; x=1733140909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQy2UcqE350mB/1lUAcqO9gInjbfSYkJ/hWUNociUIM=;
        b=CAcQFvrCliJaM2o/9/7Cyy11qHRvEsHzqvw3FCFV9KLXY7VzUIq0vZZ/WOxFr4hqDm
         aEWZEqlpQNsT3/bx6Ukth3/FrrSff+9/eV67ott0ADThnF8Tm9sT3aEHoH9kABYGRfwc
         QDFUMq/ozy+XWwIAB+7+pNoonFNXFcMYzIsmkuD4wQ9BtHMRLzZE7fJVSn6ftnK1+0Op
         8pSmkv8bcziBmmLiLNR0oyHHirEICkcexXfrTiOihrkqqtc/KVdd2yS6ycvd8prG23du
         zIWVJEpkHsEwjf8txHJ8hbj0ORW4xljy6RPxQpH5poCZFGfRmT5dLdNg0hF1ygMVfZx9
         f9Vg==
X-Gm-Message-State: AOJu0Yx+Rk+MrnIjN0jt/JTKkP+hCswFM79ejIOwRET0mZ+BP+AFliWm
	wVKx3HRcgyOVO8oH5Hc8oxd3088Dz/sITnmrb6P+jNzwsOp7xcjjVNa4LQ==
X-Gm-Gg: ASbGncuK4+0fqGbOokMD71pe/YmdBBWE8KuTvqe8N/saQY6MR2hpL1AI6swHPxnUkAk
	Cyxnh+ddQAiPkyFAREp6Kh1p3TsYAGYZwDhXRhYqlLul5+yJVHClWz5IPP0KW/3M5W+Xj5RPSbM
	BNY0yngi+wQvaHr87mIwRZWbcwur05n+WeEwDoCTMaiQ1FPYgBruaIProseEW0Kz2lYGySNSeus
	+7ZTEPr7wcYB9ZEIYLISuiEn1l7sqtfcmzALTvfrGaEXRuqydqjug8pfUnYKqyplfC4m2BFkf3a
	Xsl37qwhV7k=
X-Google-Smtp-Source: AGHT+IFOHfb5WnJF1lbQM8tpd8GlL9L22APgfgfgK+YQln1Lv8HEVpU9DDytrgtpGtkw3ZHVFMthGA==
X-Received: by 2002:a05:600c:1c98:b0:431:588a:4498 with SMTP id 5b1f17b1804b1-433ce425fb9mr107190745e9.14.1732536109031;
        Mon, 25 Nov 2024 04:01:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/35] python3-sphinx-rtd-theme: upgrade 3.0.0 -> 3.0.2
Date: Mon, 25 Nov 2024 13:01:17 +0100
Message-Id: <20241125120127.2205232-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207773

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...inx-rtd-theme_3.0.0.bb => python3-sphinx-rtd-theme_3.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_3.0.0.bb => python3-sphinx-rtd-theme_3.0.2.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.2.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.0.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.2.bb
index f02f1fe42d6..b2c6b892bb3 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.2.bb
@@ -14,7 +14,7 @@ RDEPENDS:${PN} += " \
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
-SRC_URI[sha256sum] = "905d67de03217fd3d76fbbdd992034ac8e77044ef8063a544dda1af74d409e08"
+SRC_URI[sha256sum] = "b7457bc25dda723b20b086a670b9953c859eab60a2a03ee8eb2bb23e176e5f85"
 UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
-- 
2.39.5


