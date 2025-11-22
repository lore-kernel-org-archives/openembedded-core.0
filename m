Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CACCFC52F
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 12:20:30 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8115.1763814026227300084
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 04:20:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nqLRZXt7;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b73545723ebso541091966b.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 04:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763814024; x=1764418824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJDIuL88T2sTakHWDh9eV0YZa/1Mt3cI7QVLHLT2vKs=;
        b=nqLRZXt7SRVqQlt0ZbYv5rnIQHSqw2hy1T1DVyumB4xNo1qxtZIf5P6WZco2JPRIHe
         ZnP9Mf8Egh2jGUeeSgv+5RW73RUbLnzpXgdyVQ9NJZEN+1ewhdwQQhqCvC3mr1xu2xLV
         pta71/Lu8dJWK37t5qlTsRuXKzlO8lyIys/Z91UsMoJL5F1OBxTjH83bgcIvU2sBcgTU
         6LAeRzr/gqrQJegJA32k7FwOlCFHZ4Fq0OrOYDSXUI6eNyuFkA+2Nyq1VKu/pwKkZZrp
         VpCRlQdryNjVjB4FceTTMPq0JeAm4mxo/UKX577viGBHU/nSkyIqqgEJd3NUz74+Ygo4
         wkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763814024; x=1764418824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SJDIuL88T2sTakHWDh9eV0YZa/1Mt3cI7QVLHLT2vKs=;
        b=Y7tQN2gOO5D5WWMjj+2Q+0GHC4YsIXV/5kZBlP1Bq6HZ4e2fzW3nFrIbX7rotuOjR2
         r9NOni6lHaeBT7/FPA19ISeaKaJGMSleplBT9MVeC6Lak7fLIGiFwgg95GUmoHUQ3KVZ
         Agv8YySgGlDx8F7kUVCBRVuxnWy61/Oa4WVpBBDUmhm4sL4E9UiW646rOxWkAfK7zh3Q
         khxE+pCIKSTJoAJM4iQFn7Ijq3lg6YpvTfjhZ3cW4Lterxb0O7HJwB4fNDy2Fw7+8Ctb
         U0TuQOsd+OGkQStSEpfOnGHRSHmYuG6MjVFDKsQ0FPfHeNAjXZG2o1eZhTqQYNWb0i4s
         Kgqw==
X-Gm-Message-State: AOJu0YyL4zO4asNattBWAAsYG4P9PrPzzC4ReELy7TmecVIo3oSovFXo
	+SiR57fpIyqoy+7a7McpbqwC2+ZSWVwI5G6R+jMJCaoj/QcpZ9SrfYf4oT3UzA==
X-Gm-Gg: ASbGncvMn/fDv6sbnRWkFY+Pp0Jyb0uEXwPb5qi407iyiJPohvYogNVQT2s3ljORSVA
	gE8/gl2ipgJ/02QOmGmLRAJDExzsakk+L2MjPu5tylaH6g7vVpMtbGkgqHRNNtaKZ6pAgMyXbG8
	gmodDmxTBLM3wton9VaE6jP8+JSsmWFVceyzdMCuEzr6n5oc+rtuDEzpgtFGXt5oVQ4VJbi4RtT
	DRwelkT0w3xtbL6/xBpZ2bwlwhW9UEkJ81eTT+s7MefwX0W33ZADve+fvkF/l+KU8mQDq0DW8tB
	kkuasgiY8vkjef5+Xwjm/LXWYRmRf0GO3N82x/xisqMPwVciLnXeTq7HtJ+Wbp0O9D+byTaZs47
	yIFRLx6KngBDUtZfZc6EJ0MsFY5agrKOQr+7XgUYihae/8+ntxiFTyTC0VDd56lASMegvaH14PG
	JJnYxfN4UhaDV/gRVBY8TdiN85sqOBQqP29E0Cy+KnioQP4mCH0b9fC6lmKXrYUr/rwlFD7YPCI
	ANUt3fA9RVBtGW35tMraoawY5gBMgUaUl2OmO0pWz+53bk76IA=
X-Google-Smtp-Source: AGHT+IE+xhnNV60QqFdOSKJqoFbRMPXYF54T5HLIgH7yq9mXZtT+6FaEYO9l5e5ZGvel+aH+OeGTnw==
X-Received: by 2002:a17:907:7fac:b0:b73:36fb:5fcb with SMTP id a640c23a62f3a-b7671b12c63mr492924866b.55.1763814023964;
        Sat, 22 Nov 2025 04:20:23 -0800 (PST)
Received: from peterliu-Precision-5680.atlascopco.group (static-212-247-106-195.cust.tele2.se. [212.247.106.195])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b765504828esm708694066b.64.2025.11.22.04.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 04:20:23 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org,
	peter.kjellerstedt@axis.com,
	Ross.Burton@arm.com,
	richard.purdie@linuxfoundation.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V3 2/3] iproute2: use "+=" to set PACKAGE_BEFORE_PN
Date: Sat, 22 Nov 2025 13:20:12 +0100
Message-ID: <20251122122013.1960798-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251122122013.1960798-1-liu.ming50@gmail.com>
References: <20251122122013.1960798-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 12:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226692

This avoid overridding the original PACKAGE_BEFORE_PN value could be
set in bbclasses.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb
index dc7106902c..019f82a196 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb
@@ -80,7 +80,7 @@ IPROUTE2_PACKAGES =+ "\
     ${PN}-rdma \
 "
 
-PACKAGE_BEFORE_PN = "${IPROUTE2_PACKAGES}"
+PACKAGE_BEFORE_PN += "${IPROUTE2_PACKAGES}"
 RDEPENDS:${PN} += "${PN}-ip"
 
 FILES:${PN}-tc = "${base_sbindir}/tc* \
-- 
2.43.0


