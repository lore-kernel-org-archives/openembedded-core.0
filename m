Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DE710A62F9
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:30:42 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49669.1774535437907187425
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lCiaXvaH;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so960810f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535436; x=1775140236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2XCD+evDEDj7+bfxUGa9bK9PncTQN+DcrjsaPrGX6s=;
        b=lCiaXvaHCYlhl45vachoXv/2Ie7i78jiLKnqimiA/b8DXGiby2ge7boLJtmBJOVnnd
         yXCkPxT3H2Aq6zmvZ55M8AojrcYznBoCFl7Isla+OJb9be719wQRqMIQFniFb34gsSXp
         aU7LoFRPaBtDlV/7/mp9KouuS/hfSYKFuI0YctLlAVhGoqW2aewk/V0tkaL63l66aoUg
         n5JkmXZob6iP4nivaRsKvPJ9Z0bTfWIz781Zj5cPRD8nmI9XBEL9jrp4vvIpsl5TXPOO
         33pzljhQ/z2YwYI7BYVIQ+2qp0V57XtLO/CnCaPH7bleXGrIBAC9CEkYYghcMrHImQCK
         Qqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535436; x=1775140236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y2XCD+evDEDj7+bfxUGa9bK9PncTQN+DcrjsaPrGX6s=;
        b=lUsUu0iNeKHkUnofnWnuBmf8EnKcsdoeoey+suZGs4uyp5yKI6h3qEiZ3RHDW1kij4
         NQ8Rydd/j1tKLMQGzfVavC75w6uJmcz7S7OMsHnfxWTJe2qQcwYYLbSbMMy7oUhCMxCv
         7gkGTpWxKg1/ASWb1qbIZmmcCcTMuTx6+rQvatrbP55yzYcI4lSgJd6zH0O02KpYfNP9
         wgOaUdMdlxx2hUp/PEClJDKCN0Ti0lMPZuLKSVxcF9fpYgMm3ClsKPDfSKos+EAQE8Ym
         pzGww31yO7dBM1UbPf5OtkRDj4Z5hiesH0hjLGqhUQHqy1/+TWXuhIzGG+Zokr8eXuFI
         RY6g==
X-Gm-Message-State: AOJu0YzYHQFG1/cNZdZvE5Ofsp6fxFC1CFGfo/4BG+xYJezD+117VJl/
	5WwybiVIZsXk4E2FBgmU8ArW9MQBM+PGtwPoFLka4Aq1Zqrx2ampAiPkgyU5hA==
X-Gm-Gg: ATEYQzz2A9572qlPSMaEbRx3QVU07ZpKUNHSwK8SLSu0jqPD3WA2mBoJ4gaCkzS9N5Y
	VS/56ys8SendVBKBAULDAyQeCBKfvMzm1XJE0MsLWd1haU5u1KzMyYheuS7nUh8txcDvG+CxEHw
	V3RPdpyM9wYtR2Ucp5GL8FGHtxzOj2KSaRght+x6noCwKWOLeBT0PdNEkhdlBBYhSAvXRNjH6Yz
	wSznUjLtukE514uv4sH4oTbpm2dblL18106r2QHln2ye++MMw1GrJD7/sZftySodagP7AXLPuOf
	mRgc+BTmNErOIM5/sakePgWBSia1XwVFM6PAJWQLy85dykXX2IHM3PJsSvTtOF0GRo2aXsL99Bm
	lf8nrbcsZAm/VwHMirmHKbbPlnwJPppj6zll8HQk53skm0KhsQMlvrvN0PrZHs32kaNGHYzJ5Lu
	eDYlv4XfxG1eGToA==
X-Received: by 2002:a05:6000:3101:b0:43b:3b80:6776 with SMTP id ffacd0b85a97d-43b889e34edmr12984880f8f.30.1774535435927;
        Thu, 26 Mar 2026 07:30:35 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942f24sm9162880f8f.11.2026.03.26.07.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:30:34 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 06/12] clang: Use PYTHON_MAINVERSION for python module versioning
Date: Thu, 26 Mar 2026 15:30:14 +0100
Message-ID: <20260326143020.2083293-6-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326143020.2083293-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326143020.2083293-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 14:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234009

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


