Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A2AE7D0B6
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 22:37:17 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.9342.1695335833232882533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 15:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WM7UeYgY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-401d6f6b2e0so18412895e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 15:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695335831; x=1695940631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxzmjkC+mxFn1LXcYm749SuvK01tUewcTeYYjV1m6qo=;
        b=WM7UeYgYgWu4CXtKCpR9zyefS//84aCQZZ8zdSEkxuYINSj0hC/yz4tCLEX1DZ6lnq
         6n8HLO0N/GuTr8u3TATwyc5TNVFCZ1T0Z92seAk71aA8A+jrgiMRiRUjXps/5eQ9UiIt
         gUJ2BSSVZZqO+EP39C8ptCULwiEnjtfqIZaW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695335831; x=1695940631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxzmjkC+mxFn1LXcYm749SuvK01tUewcTeYYjV1m6qo=;
        b=uvhJRurI73G0r+xYwOwCRbu/a0AVtwQD8OA1289E3UyLKHBp7el6aNBMa0aRiVvGYz
         4hRWLKVFLrQlZPN/Mz0Gk+i7Mzcf+0whUx3qlnb3lMKpaMRt4oy5/sxoyBCbhRxXOmX3
         ZAYVJircQoPtVB+qiZOcPUABxgkDCRl+5mSaQAKosw+Zz+knKoEIgxyXbkjtAqvZ4BS2
         RiNZyLD0EQYClnqizp9aXffSQCcizErZg7wNYK0p/rAEu8tg+ZOKsJoNPX+3+4y8bSAD
         6dWGfQobC7Tm5B7O+0XNMF0O2NU6DOhMNuAFJ/FFBOTbSc8nra8UxxG7AZn3OQcmgV9E
         fpDA==
X-Gm-Message-State: AOJu0Yxz+l8dsgqnx7Gd/DDelvSMBxOqF5RqbROqsbJYPmOTOUHfVy7l
	Sqw3r4pEsesLommQk1Lxn7YaUirkJaNyWjtvN64=
X-Google-Smtp-Source: AGHT+IFIsCOIVsQHKLcvj6URp3p+aBkPteIHbqK9qhOYmsrmzQO5AbbaWCq4BNBzRFmwmFE3xYp8qQ==
X-Received: by 2002:a5d:60c8:0:b0:31f:ecb2:d774 with SMTP id x8-20020a5d60c8000000b0031fecb2d774mr488903wrt.19.1695335831365;
        Thu, 21 Sep 2023 15:37:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c05cb00b003fc06169ab3sm947410wmd.20.2023.09.21.15.37.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 15:37:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] lib: Import packagedata oe module by default
Date: Thu, 21 Sep 2023 23:37:07 +0100
Message-Id: <20230921223708.1333390-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230921223708.1333390-1-richard.purdie@linuxfoundation.org>
References: <20230921223708.1333390-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 22:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188032

Variable dependencies for functions in the oe.packagedata module were
missing as it was not present in BBIMPORTS. Add it as the fact it was
missing is likely just historical oversight from base.bbclass history
and the dependencies are useful.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index 47be7b51d79..da7cbab3086 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -7,6 +7,6 @@
 from pkgutil import extend_path
 __path__ = extend_path(__path__, __name__)
 
-BBIMPORTS = ["data", "path", "utils", "types", "package", \
+BBIMPORTS = ["data", "path", "utils", "types", "package", "packagedata", \
              "packagegroup", "sstatesig", "lsb", "cachedpath", "license", \
              "qa", "reproducible", "rust", "buildcfg"]
-- 
2.39.2


