Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF33C52D7C
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 12:22:25 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.82772.1723206141799440924
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 05:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=HVvgMOmd;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-451b7e1d157so11409051cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 05:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723206141; x=1723810941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5N/0oLOeOPfE3U2Rov+u9PWWtzkUlAhKh220XEMhS50=;
        b=HVvgMOmdt3BEhujFGjJcFZ7ASQ6cGYkym7zuJKHwIeDgbB5yS06EJNkF3DU6vB8j1e
         89nHT5gTuSCEODeFydJkfMaX8UesVIg3Sh94YyRLnuhg3nViywq6/3r0PHfVuuE3Coa2
         ZMvWs6iIKQbC7nOC+t6BqS+R/+bXHmiRFlpMhaXk2c7i43qj39Qn34Ic3mdbNDZeXPdB
         bgcp2FWQ1+SYnEEu0fklIXjhYw6lvEKE1dNZ2VrHk8oX4qOSLWQRNIgmWgARW1Wz0Yvm
         5maMr/Q6ccdkkiwyHmde8inw0c5tO2JoKV7lhQdr0du+wCI3FQqLBaVYcFBOQ2Q5wYGQ
         o9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723206141; x=1723810941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5N/0oLOeOPfE3U2Rov+u9PWWtzkUlAhKh220XEMhS50=;
        b=aGXql1OdkrEVlQpkYsJkRgjlcI8LziVa1sodNrbBejLeDupsfvjsvvUQQ+OzslALkf
         CmiY1jaMv6ieud7Nk3xNoM0ltsg1XOvf7Glq4OGLjtbLPMl3r8yCO/qe2h/6xHa4m29s
         8vaUBwy27bpMR2RWFQUjOTaGkS6vuSpLWE/oqsvsPXczZfNORDaV3DwdH8s5MpvoHrRB
         g3uOi6H5Rk7kC+bRBZK4U3BTqW1eoj/+zs5HNRMDmVTbslHJR9uE6/zLePqBz/1DNnk/
         ToGm/qV4ccfQ01+QYh0AF7ZQYZdAFWTZ9UbV6dmfLGCgcqS3Al+EBnY3ZPlk97vVwlFm
         q+Cw==
X-Gm-Message-State: AOJu0YxK6e826DVzldCTVdAxzKyTFZ+2SRLXRAOVWDMYeiEeTxomoQcX
	Fau7JJVRkMVpS1M3liHvPHDhgsfOSm6+5Im7OToJCinVT2FzcHFsoVF4QG86EEpxCHQ6RV5E/dS
	g
X-Google-Smtp-Source: AGHT+IHqvV+FJFdT0Tag+p8C7vRySJHAVajI35HI2gHnKFMsWiS7w3XR1t45N+B8WQhRvIvBOcdSAA==
X-Received: by 2002:a05:622a:420c:b0:451:8d59:9c29 with SMTP id d75a77b69052e-45312582701mr13761921cf.22.1723206140571;
        Fri, 09 Aug 2024 05:22:20 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c87183bfsm21059361cf.37.2024.08.09.05.22.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 05:22:20 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/3] python3-hypothesis: upgrade 6.108.10 -> 6.110.1
Date: Fri,  9 Aug 2024 08:22:17 -0400
Message-Id: <20240809122217.3825274-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240809122217.3825274-1-tgamblin@baylibre.com>
References: <20240809122217.3825274-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 12:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203170

Changelog (https://hypothesis.readthedocs.io/en/latest/changes.html):

6.110.1 - 2024-08-08
  - Add better error message for ~python:typing.TypeIs types in from_type().

6.110.0 - 2024-08-07
  - Support LiteralString in from_type().

6.109.1 - 2024-08-07
  - This patch makes progress towards adding type hints to our internal conjecture engine (issue #3074).

6.109.0 - 2024-08-07
  - This release allows using Annotated and ReadOnly types for TypedDict value types with from_type().

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...on3-hypothesis_6.108.10.bb => python3-hypothesis_6.110.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.108.10.bb => python3-hypothesis_6.110.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.108.10.bb b/meta/recipes-devtools/python/python3-hypothesis_6.110.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.108.10.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.110.1.bb
index ebb82dfd79..29fe7e18a2 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.108.10.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.110.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "8d8b3a57f27bd964b04e58c5731ab9862134fbb5511958c814aaca3120286f28"
+SRC_URI[sha256sum] = "a138bfaea11aba6daadf8effd9065251a6fec1549f25b7d72ac9881a413f76b0"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.39.2


