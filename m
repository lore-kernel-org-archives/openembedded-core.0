Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A43ECD37B1
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:17 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8151.1778224332613028091
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EI0obvYT;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d64313c39so1284472f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224331; x=1778829131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zqj+TJTPvu8UrWH2S5VysZnH2EN4lUIqnoPQlzuZdwo=;
        b=EI0obvYTceDQTpJEx5QWw2qbsi7WUgcy7T8qKN9uEYatsPRlw1opdp2UzFkzizqKZL
         t+zmcZoTRgrZ8jrSeaF5zMxGOQHrmYacttXqpLXe4wUlv6cDBP7sgyD6PLk710nzPwfc
         WGkzrAvcnw+BdUGCemQOLvzRc4QkiC09s26XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224331; x=1778829131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zqj+TJTPvu8UrWH2S5VysZnH2EN4lUIqnoPQlzuZdwo=;
        b=R5MNY5uqVUqwLGG/Vq9JJCboxWiSIbrJLLd2byDb3FlAqTqEgApFaro8VeOLrphXHl
         YRadzB9yOOzwza/1+QUtOk90XANaBaSlEQhdunu15eRd4fKSLcN6Wnzbty1u3VWxydFV
         WBtbTPPCTdG6OEzmUL8EO6mSDa7VYRW5i4QHWWKg/RYEK0YOYx/GBNa25O+axRTYUMCk
         G7G4iPTJ5DLOZclv95lcDOam1TI59bYLOMyESeTjrDZj/cRL+IXrKECba+OrWKH32rFK
         XQkENXJko40/u33jfhQKUagV7cqcMazLVX79PbsvXJ5CB8+W4rW+EPdmavRvNJFTfjJI
         pjww==
X-Gm-Message-State: AOJu0Yw3psVdcUz9pOAv8mD6IZx4fSCd1INiwBxzLPYkXFxP0oLASKgQ
	Jx7Yrh5awTiPiKbclacoN2tFnqyb7eN6Go6eONNFCHj/Gv+YgFP89AIIwUopLkcYvCKgIwtytq9
	fU4C0zXI=
X-Gm-Gg: Acq92OGKOMFQJePAmKuD3/1v56oBjLUtbVT2cOVxt+i9fOlZD/+i1Fn8HX9QEzCc7o8
	w6V3e02bNCUtdW9itU97g5X0C47uxnAe8utXi2VVUjnsQ6NLTAIkxr5m8XOW4Us7qsmisN47plA
	GqER1lZIZ11WColIvTcp7YaRhvxbKpvNwp2mOd/2sXG4x/7QlszqMRIHAeDI1fPTqw9nXmekUP4
	D+VUeULum1dIi4m7IU4mzDhMvYFSF7oJcZvKElVmp2PnW0KWkDnBQuAN9HAGTvVUuxE2A9kAI0X
	LE0qrlZOvdyI5MXGKYDQMUg5GJ/GqBPSWVlnG3LQ1a7UUEGzKXzK2yD9PednWkZRUq00jw5VccO
	uV+BhMIk0hQNPM2zK7CA4YB6syLAHa8x2ANJhVQg1TlghZwmLtY4+V9BgdMomTZQ/cLy37stDUX
	TRea7gmVpUPn5kvBf1l9z//AtLrBmD4x0tAFBur0It1dzS1QYk5B8HzxFTJ4CDzD4q8hB6Md84O
	V+0Bw53VaZ9VGVUxYK88SUrXOk=
X-Received: by 2002:a05:6000:144a:b0:439:beb9:5a96 with SMTP id ffacd0b85a97d-4515d3dc683mr19507165f8f.31.1778224330583;
        Fri, 08 May 2026 00:12:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/52] python3-setuptools: set status for CVE-2024-6345
Date: Fri,  8 May 2026 09:10:56 +0200
Message-ID: <0e2a61f133d5d9a3eb04bad9c4179dd3510b8e85.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236645

From: Peter Marko <peter.marko@siemens.com>

Current version of sbom-cve-check reports this for some reason.
NVD does not have CPE and cvelistV5 ([1]) says "lessThan": "70.0".

[1] https://github.com/CVEProject/cvelistV5/blob/main/cves/2024/6xxx/CVE-2024-6345.json

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8d03ae7b6e25c4ef3953c3fe49ca0c939296d222)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-setuptools_82.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb b/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
index a3943a29c39..c413578faf5 100644
--- a/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
@@ -49,3 +49,5 @@ BBCLASSEXTEND = "native nativesdk"
 # This used to use the bootstrap install which didn't compile. Until we bump the
 # tmpdir version we can't compile the native otherwise the sysroot unpack fails
 INSTALL_WHEEL_COMPILE_BYTECODE:class-native = "--no-compile-bytecode"
+
+CVE_STATUS[CVE-2024-6345] = "fixed-version: fixed since 70.0"

