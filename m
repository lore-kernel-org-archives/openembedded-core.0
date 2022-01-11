Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422FBC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:03:08 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.12370.1641927787671615326
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pTR9cAos;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso7019081pjm.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PKEFiw1hj2ORgUMoroOlwILhOrUZq5EyNzSLItZN9+Q=;
        b=pTR9cAos2IZ47B6MMAiWDUCqGzMV97azmZhvY+ZNPbbRpUgUAK5ibmS5cMiRljhuWn
         ufH3XN9tj87L9nhP3DnIdlPb0iUaFI+GT7nLGgZ3LJH8GCz//nSwEhc+gFf9jBG639J5
         STsLWDRsd9uU5CfBaMFWgWwrmjXGm6EmwfN43tgxYqWYxf33KVnmAsHVYc2Nq3Y/0PmP
         m/a6ikv4gono33lcODiYZ5ypUBi9lvGYuvVfI2DTWLWCcjLocom+ur596Et51AnRRV2U
         8ooFl8UIdFutA193cdLOPU9YwoDMgvGc40D3OksmEpx/H786V83vBg6vs/BQqz92zeCj
         iKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PKEFiw1hj2ORgUMoroOlwILhOrUZq5EyNzSLItZN9+Q=;
        b=lswmiB4s04dUUqMDVlEKBSymHBRyzsQDjtrz06W0wkQskB1HAvTvpha5Z2UYxWfjBH
         MZSIvRlnc/1YRRgLSbdXF8QgBdz/d9LuOobEhTvvPwklcCEiws+wy34FthguCt2mN25/
         OxU9j15JQMaD9qgBNqnHnTAzVwNRKm2/S6y24DwL/6np0ugzRPZ5/Pg9pFbZ7gJ7WsNe
         bnwfUihVIOWUXsMiGi3IEZkIn3NpDQVOCfSpghe4+sxxdPCUVRr6YF007Tovi2S3EEj3
         4N8fNTE9Q+xhDAMpaL6nq/t6g/j5Bxaxk3k6G7znhuJ682WmIqIrV2WARZqowHoyWlWZ
         0Kag==
X-Gm-Message-State: AOAM5326toJ4/IQzKE1/lquThgevpD4l6Za6TkDabgJ4q1vcAvrofn+1
	3HJrve4kokGxN80rYYFSV0Z8wZxhTMo=
X-Google-Smtp-Source: 
 ABdhPJwUPzdsl+Fjqvdk4cGjdKnPiOv+uNohqoK6fN6SO9hPrIiR4kz7kKz6DtvT85kw/ZYkR+muNg==
X-Received: by 2002:a17:90a:4089:: with SMTP id
 l9mr4662372pjg.14.1641927787000;
        Tue, 11 Jan 2022 11:03:07 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.03.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:03:06 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 21/22] python3native.bbclass: distutils -> sysconfig
Date: Tue, 11 Jan 2022 11:01:30 -0800
Message-Id: 
 <952f37dd06c31b1ddf86afa27d8dcf786e2e312d.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:03:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160457

In the comment it says we patch distutils modules, but we now are
patching sysconfig and not using distutils.

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/python3native.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
index 13fbaa5f9c7..3783c0c47eb 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -4,7 +4,7 @@ PYTHON="${STAGING_BINDIR_NATIVE}/python3-native/python3"
 EXTRANATIVEPATH += "python3-native"
 DEPENDS:append = " python3-native "
 
-# python-config and other scripts are using distutils modules
+# python-config and other scripts are using sysconfig modules
 # which we patch to access these variables
 export STAGING_INCDIR
 export STAGING_LIBDIR
-- 
2.30.2


