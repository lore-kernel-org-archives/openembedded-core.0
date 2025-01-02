Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37651E7719C
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:17 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.5191.1735810874038744235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bJWLupYl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436281c8a38so80013925e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810872; x=1736415672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InmTUrQRMWKghHNGz9WetS7Ppqm29VNbQMygPUkWZ70=;
        b=bJWLupYloqmGoaUhVaJGBECFJTeBUB2OOOsJ1TuwB07K90za9ixZRqp/5K5Z63qt2w
         4le6nXbTGr6hfnkHvrKGRkA0l3oIebt0lC7xOCnCgWWQgn/wCsp7iB87mDVctTYIW6Uh
         lDo7ug9phzbMh2Yg26cuqo80PKOTa3giPirX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810872; x=1736415672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InmTUrQRMWKghHNGz9WetS7Ppqm29VNbQMygPUkWZ70=;
        b=kgiJP6GGAL+BjEWYlTFWb92CfgUsGe+R/1BZhXEl9akuMsQzKjZjRoF4GNrOujfZ1W
         2uF2E+LpnknRowUZj6oVPpemQflYnMWDWUStV5SJ+QnFPedelkQqckMbwu/bm5LTJ0nK
         fWfI/VXpYtReeWljYn5PXR9nz1oHI0K9+wHJ4NxeJ91b3p1qJrMy8X9vuisOKoYLgQqd
         GoY13k6880FXxOQ8rv0dJwWJNfu5wsJmudazslGr8YffHA8ZtMd/AU3PqCDFwJRNr/L3
         q/w/Tpht5TxX9jISxLHoYgq3KgnYMq/D7hGEvTJp4ALL+MFZ8fUHNrcrt1K0FO/7cWdt
         qg7g==
X-Gm-Message-State: AOJu0YxyQHgxamRIfhTkUjIzFdQRjjbyzccgSy8JHMsBpaCb0DGjATG1
	P/bLVz0rjqoflXvwnvLCp0JuA1oRwMqO+KKCRGT0YOgTR+qP7CxB96LBbcnDo1P68tSXP3hWKAT
	ABs0=
X-Gm-Gg: ASbGnctk6xp5RehLMVxXbfPf/JoeFC0fU193XmYFI9oWmRfvzoqiqBL/t+b9lsvyENx
	tFwE1X3FV7aTcneLuNuXWjI68QG87z8MMNfRRzFTFMfd5ikDqFeuzRJJaSFhiyeYysBGKAL81Xo
	+jRZRLzve3eVEVmeKxTESB0YRnkqoU/+YglPe038matcug4pwU5pOEagnr9y8ucvcPRas5hojVp
	M7htCsZOXiJy3694siDHzsEFOOF23SCnZ23HMb2lWunwoMWsyiqks2jsuvdTt3fAftWuNny6H9z
	qIV3Ed2coA==
X-Google-Smtp-Source: AGHT+IGvNp3QSpwQsot4UAk7nRmq/Dl4ymNincZV9FWWwwR2RWVbKZJvPfANukO7ST0gpr1qYMv6ow==
X-Received: by 2002:a7b:cd98:0:b0:42c:de2f:da27 with SMTP id 5b1f17b1804b1-4366b2f9323mr340802035e9.2.1735810871787;
        Thu, 02 Jan 2025 01:41:11 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:10 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/21] init-system-helpers: upgrade 1.67 -> 1.68
Date: Thu,  2 Jan 2025 09:40:39 +0000
Message-ID: <20250102094059.322187-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209268

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...{init-system-helpers_1.67.bb => init-system-helpers_1.68.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/initscripts/{init-system-helpers_1.67.bb => init-system-helpers_1.68.bb} (96%)

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.67.bb b/meta/recipes-core/initscripts/init-system-helpers_1.68.bb
similarity index 96%
rename from meta/recipes-core/initscripts/init-system-helpers_1.67.bb
rename to meta/recipes-core/initscripts/init-system-helpers_1.68.bb
index 1576f89a8c7..036c86a536e 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.67.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.68.bb
@@ -16,7 +16,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=c4ec20aa158fa9de26ee1accf78dcaae"
 
-SRCREV = "7b1a5359d99c1667f7b81380c06686ddc57b8e71"
+SRCREV = "78486a4a2a305170b66ce4d907bedadbaed10daf"
 SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))(?!_exp)"
 

