Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00463C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.2266.1743577916612533430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VnOp3V78;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf257158fso44051075e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577914; x=1744182714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMBBjRdUummWsTj/z25OR/IPfzBJEAx5Z3fGeYGOp74=;
        b=VnOp3V78mkJ57usz4k+ZlPC4NSqUnzE+kzPwgMIHryK7H8BjAQ2SrbyYFYaC6lRljb
         7wWnTCtdjRmlfc7taJqlVwAuRfPip2DFlg1lw39jmTxKVbXYK5avQ1dSLZThq2zZgVWL
         DQvfxFEa0hZ6LF1KTnETlADRAKkMgViHrDldg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577914; x=1744182714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OMBBjRdUummWsTj/z25OR/IPfzBJEAx5Z3fGeYGOp74=;
        b=luZ8Za+5AwbMP551Uu13lt5WTuUcXcQPSPF0TIGyDiW06osooOqQvSDhSKi2SKvUff
         mZ6obZO1I5fh9RU8R1H+0ZxZ/P3HTSMbQPzxwJhcXhukvZAJ38XXTwA+BfyUk/mHs9IL
         Jgh9hATiEY50YgGBdE8t8wIRrqZv5Rowz/75tK++933atyXd+JS0zowYPvFGIkf0KBGB
         wlKj+/B6DDRflsrOYHVGZG5h+4FLgilIvoGlizpUGbMG4voqiO0oVO+2SFJ0RwkqfhNT
         fgQF69bUuVOaFvTNAXuLhaxP72tAdtrlmLVEI0B4BZTsCR2CE2Cipyl2JppWLKgcNvHI
         2Yyg==
X-Gm-Message-State: AOJu0YzLZiuqpC0XXxOMzZCMXgLO1govL5Q7JhQio7eGcci/BUDoPxGi
	xw2EJvkA/Fs0HPQM3SOfMvE29/nUvHIwYAcgl5fXVN7dlBv+UPDiss+59CYue4cGFlovQrIH8Fk
	v
X-Gm-Gg: ASbGnct7Zm0bvCbrAQ1x4nQlW2gY7vG3n+NKa2JJMFkJ7tgFeRjBsK2kNYlNONgp5Kg
	IMaUzlCMQjbAeKWG3eVTQlo9U0W6B60q113K+8pL8SxBP/ahJlkc1HymiFMDOmicMn/O7vK/jwl
	pBWU7YAbV559RLDaA7WV8F9prcuKN3bblQagOcFHhFGfO4fFS4t146R/XzwmqKsv6sdTSj+tKYj
	vlsCTrc7OM4hCR6nIbx6d7NxPvDNbdPBDT+pnKo4Kx1naGXulCBPD+tClpVwWLucbMj+H79Qn20
	xTm/kvgKvsxLX+cv4Rn4Gj+TPRCZuR3ZJFQueXLezpyp1srReKuvuYnUbL4y0ZeEqMZEwujY3g=
	=
X-Google-Smtp-Source: AGHT+IFYPzseG3VqMXhZ1TzNTxyO0vxsYEEFUsouGB32Zhkf+Onb9JG+oWvhfQN2JX5kKDIGRpiOww==
X-Received: by 2002:a05:600c:5108:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-43db6247df8mr128998555e9.15.1743577914518;
        Wed, 02 Apr 2025 00:11:54 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 37/48] python3-scons: upgrade 4.9.0 -> 4.9.1
Date: Wed,  2 Apr 2025 08:10:06 +0100
Message-ID: <20250402071017.2157620-37-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214210

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-scons_4.9.0.bb => python3-scons_4.9.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-scons_4.9.0.bb => python3-scons_4.9.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.9.0.bb b/meta/recipes-devtools/python/python3-scons_4.9.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-scons_4.9.0.bb
rename to meta/recipes-devtools/python/python3-scons_4.9.1.bb
index 2163d4b1a34..c8496679707 100644
--- a/meta/recipes-devtools/python/python3-scons_4.9.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.9.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
-SRC_URI[sha256sum] = "f1a5e161bf3d1411d780d65d7919654b9405555994621d3d68e42d62114b592a"
+SRC_URI[sha256sum] = "bacac880ba2e86d6a156c116e2f8f2bfa82b257046f3ac2666c85c53c615c338"
 
 inherit pypi python_setuptools_build_meta
 

