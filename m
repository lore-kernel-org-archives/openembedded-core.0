Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6720D767DE
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 11:36:18 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15006.1766144170503081815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 03:36:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NLJct5DB;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42e33956e76so705642f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1766144169; x=1766748969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jehs/+SvFYY5GvjC7H6J/zAgN0xaZG98RwtnE+BfuXo=;
        b=NLJct5DBaLCVoOPYEPjULJ9d76pvDjoQPZf2oLkCnTiInoK2cpTQUaVakUqyNF+UdB
         Klkn3mdW2YTKNimFlUqHq6SBtJsrJHX6owtvvqwXZV43VGjL7yVHI9dLZTohSzYBLQec
         9DMevsMF+7mMNsHvqJ/XcogeSA4kgWMmGUk+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144169; x=1766748969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jehs/+SvFYY5GvjC7H6J/zAgN0xaZG98RwtnE+BfuXo=;
        b=MeIJOGEpqbZ2RKrUBRYyitJx3ECqx1h9wEkgUFE/V2Q3JaEj1JbTazTrrH/8lUjYab
         exiN8XetkRBSrTL/4OCaRMrWSihYCGT+oBEkCtuy939UcT5zgJTAlw1vz7GZenHqLVYV
         i09tTQwk0ss8Xg6z6is/WDBxpPXDo1VXGL2ncpar+tmm4YQjVQBw8s1DLnb/eewaqAzp
         Y2o6ibyEwLaXfogcUE432Tjl467ZAmdsG7Py5OVVLfhNRfzCry3ygljae56fYWANqNuK
         eE9ZJpKSuACfV1b42z6oReM6+i2mf7B3+M6SfmjWYtbm1fntqUWq3T7HCBGSqkbQC7BX
         MCFg==
X-Gm-Message-State: AOJu0Yz5KAlX0mVsKoTwxHIbkVeQS3UwdFRkKhExVoSoyPowBZXSmKmf
	1DxWWf86APvqwWQ2o7VN1nRIxb/6GdfQpdRw0sy2zeHypIzmCZAjNfh3ecvc9A5oz970FjZ8fb2
	1FldmU/k=
X-Gm-Gg: AY/fxX7hoTD7Wqh7s7L1FhM6tMV0bNyoTvXzHnzWsxvz5DYZE6CydjwNT77iEZNrWRY
	24lyfwW01S+nX/WgT+A8bme2k5vvA6Tb1RD5XTgWcpSZrJJfNUOJT8BZIynS4bRoODwBKK6zi3D
	AzB1tzPbqdpq9BzpB9a0sIXMYAOM4gPgAZ6jC83Je5oigT5JVt8lYRTiGDTdqiYFmBqBvXtLCBY
	yiLwswR/qSQB6dGO5UeWeQPLHsXq+U4I8Wg8XgWvHXRsenn46rl9GrO6rDVQbnZHLmr8TwkmbZI
	/1R0tRN1BWTxujrRvQ2m2qcwkDFwDMn1/wQpsgnImEhFGh9e7rvtkTrhpQdhVc091JuytNNVJs/
	A4/VJ/qYbQj5DabOJgWTSHRupzXkoqDnJW7KquEsjendO73UAuz2gBjJ3IFTsKbspbkJOMScadn
	yKGWCnV68MohKn8eQLEYuCIbp8+7I0X96aeHByMIndOO9uswKOuv0lbxto+ZDl5CPCDNROpdszg
	JCfkGiRYlRAoXI6usQ=
X-Google-Smtp-Source: AGHT+IFDQFnoDadp5ADPtdkicI4NIktUMuyX4C8yTA+B1KgA6k42IaLohDBflOoJ0cHiZZNqvaUm2Q==
X-Received: by 2002:a05:6000:2dc3:b0:431:26b:5e3f with SMTP id ffacd0b85a97d-4324e7048f3mr2913461f8f.63.1766144168887;
        Fri, 19 Dec 2025 03:36:08 -0800 (PST)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82fa1sm4243906f8f.23.2025.12.19.03.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:36:08 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v3 2/4] layers.schema.json: support 'uri'
Date: Fri, 19 Dec 2025 12:35:56 +0100
Message-ID: <20251219113558.1573766-2-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219113558.1573766-1-corentin.guillevic@smile.fr>
References: <20251219113558.1573766-1-corentin.guillevic@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 11:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228215

The property 'uri', which is a shortcut for 'remotes/origin/uri', is now
supported under 'git-remote'.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 setup-schema/layers.schema.json | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/setup-schema/layers.schema.json b/setup-schema/layers.schema.json
index 1a0255435..f42606941 100644
--- a/setup-schema/layers.schema.json
+++ b/setup-schema/layers.schema.json
@@ -46,6 +46,10 @@
                                 "description": "The output of 'git describe' (human readable description of the revision using tags in revision history).",
                                 "type": "string"
                             },
+                            "uri": {
+                                "description": "Specifies the git URI, can be used instead of the more elaborate 'remotes' property when there is only a single URI",
+                                "type": "string"
+                            },
                             "remotes": {
                                 "description": "The dict of git remotes to add to this repository",
                                 "type": "object",
-- 
2.51.0


