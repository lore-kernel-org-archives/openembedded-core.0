Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0286EE69170
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 15:49:37 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.27404.1732290571492201400
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 07:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gaozSOMY;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-27d0e994ae3so1145339fac.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 07:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732290570; x=1732895370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k5kCXf36uaSWxvQuzdXNSbnSbaSwHZGAS85J9VNlzEQ=;
        b=gaozSOMY8/pstOZJVvPt5Y/WyM+CMJT0XtHg/p3m0rBMWcUTcb+Ki+xMdLOPfEqgoe
         uj3bt0Jok9KUrki6Ug8+0g7u6aG2N1ERcovx32V+1Jp/z2dUigm9PUumoo9Wwa1JiSL2
         p5M1vegxkeNqzRmvqYPl535ypeb2iJNTNyZoyCawHpDUzJCbl4bqmRPgubUNJoxPlGys
         1lUnGGolFhNbYWDqLwGh6ERLgSihobebnm3Atl+7T36zwLjbcRO+5on6A4noHeDRKu/C
         dp6AUpEfhrxHfV06r+5QGVu2p3KlzJoOm3KzWmrjBFV1libLAELCswV3aTh2yomPAfmg
         zEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732290570; x=1732895370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5kCXf36uaSWxvQuzdXNSbnSbaSwHZGAS85J9VNlzEQ=;
        b=aepVML14SplDlPvnsh8rnVWHPSBYF0MeWDFpiRyp4u5hJ4YE2kLCGsxnVmCN2VNx28
         R4gpHcsfl549HQKj3oOzB6UE1pT3FK9y1nMiUEqOLpDB5f+DkOvMovxiX59sdpNYGUSO
         nID2AVR0rh58CvLqtWmqTqcuzjM9JHybIwh250ggiH2cPw3yF0NonEe8ZYp//3uF7hgo
         o43tFAc624hh6Tj1ZYsFy5UE0vxQGwwbRgRSUgRP/bhJ6S7kYY6rVPVF9A3iqhsBeofz
         31o06dpabRvlqGFLk8pRU6+eNeVLDQwF+Rq9b4SYAIkYCr7itGJKot8W/Xm04xEDraDV
         ItSg==
X-Gm-Message-State: AOJu0YyEJC1oNeYnQ/Cenz6+ODoiadeAP9VxUiGR0oYygq8RryUepGCk
	FDUSeJe3zzStMU3qED8XhLW63jNl2qNaSnRSiX0hdjfbiVCShaLzW5dXxg==
X-Gm-Gg: ASbGncs6m7P2+ydBL0EHqRLFaHQF39mW8xys1Nh9cUIGjuaqzs9SxFJx/VHHX+22QMg
	xCgAdWI9k4tCWxxe2ZebiC2zSEcEzul73E9wcu5j4ihT33VwZhv5E8I4gfqRVCmnDhxbiQE0sdn
	tx9L8Kj3Z+Yy3ctVPifRX5FoEJXvD/jDgra1Xa93NR4TwEUYzORgZlNz6FTvvh4wpEWYMUEOMz7
	WdS57tb/D2qtb4g05UnL1L/BQUP3LjJVBR0hDoi2oCL3506
X-Google-Smtp-Source: AGHT+IHmBRpM9fLM2goZiebFU4b5zE5sIzw6kODgCgXenyhswfWjNOX+MTcXOAB6EhlWl0SrzY1/Kg==
X-Received: by 2002:a05:6870:c0d5:b0:297:296a:1039 with SMTP id 586e51a60fabf-297296a1851mr2524477fac.28.1732290570136;
        Fri, 22 Nov 2024 07:49:30 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::dc1a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71c03772b01sm452141a34.20.2024.11.22.07.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 07:49:28 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib: sbom30: Fix build parameters
Date: Fri, 22 Nov 2024 08:49:18 -0700
Message-ID: <20241122154918.2133799-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 15:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207625

Fixes the build parameters code, since the build_parameter property was
changed to be singular in SPDX 3.0.1

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index e3a9428668e..8433637de80 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -786,7 +786,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
                 if not isinstance(value, str):
                     continue
 
-                build.build_parameters.append(
+                build.build_parameter.append(
                     oe.spdx30.DictionaryEntry(key=varname, value=value)
                 )
 
-- 
2.47.0


