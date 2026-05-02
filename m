Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AFFCD13DA
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:09 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9478.1777739404777884035
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P4O9w2G+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44a14580111so1447455f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739403; x=1778344203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmPoO4VzXFdW3mM9qvau3ODoaOJY3Y7CV/4xgvYH30s=;
        b=P4O9w2G+Poa2tZYxzMVTvtFfpwRxnbkLfAnxhcsXZ09A2XXzxR9kw1xRUvwVwFFWeo
         VShDh4hBQRb/h/IQka0q50usVsuT0d+eKmLm72QvLcST4GVc95efb1Q9iggY3OpbL7h6
         +vAcgy7UDFEGIcNKljhINEJ6Sy6bR7LZ6AJwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739403; x=1778344203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JmPoO4VzXFdW3mM9qvau3ODoaOJY3Y7CV/4xgvYH30s=;
        b=A+fE9gXY8w6NxRNpQEM3CDhIGn1gz8uHRDqCv019rCseZ/GXTQSLuUDndS3JIQ2foH
         RuXEYkqMrDTcHOJHa+//HUyK/qkmv3sX0oC8ewjIDwDPC7oN8fIj5zuSi6SUwv9KfViB
         iCMJV0IbaM2qQA3d8rVkwunVtGqUi1tIKKULaU/20vU0D7mVhGe2tCs0Vg7QC1xQ3wfZ
         PK+zdoSEmDSpKJtX/I6VvjGq30FxXVycbvL6hUQVnaOu+T5ej4SQtcWKPuPrz9rsyrW7
         VdgOe7Otb0JbOy2o4iL6/xFHi1iB+2/2h+dDemsiWdMqytnR9MGSv3ejk0rsuwcfISKw
         OVTA==
X-Gm-Message-State: AOJu0YwHSE0WP6esePeftEbeNBozylr6fBRnHkbcXHiTfxHCrpMHZTCK
	OZNJHGnT+iivsaOdhzbmkOBWRCyGV09D4YseD0l3mqKgeCnfYbIh//8mDIyWa+WDWC0jLvhyCyn
	OCNKJWqJzOQM94sh5fCxN3LvqMlKLXqFTgi9mZzooVS3ZDyBUd6hHTCaT3d+2/I6CUAKOFulErM
	dLo7CxEOADi3gmnto=
X-Gm-Gg: AeBDieufd0mgDk2Y8NjP8AayDiCLWN3fOj+XDAC71XWUrxWg/dsU67Z32EdH0IMNMNb
	G8PP7Xh/dUL0GEHXHgMwtcogc+qwDqs03C3j0Kv7n1MzWDa/1OW6VQVC9TjsVeNxWqPDDbzUvk1
	DjNmVYNfqoWbzJvoQpldcrM/zctVmZ+D861xFiRFQqpMnxWBgmbQ6ZpPMdDC/JJ/ChLGsXUMpfl
	wb/2nGCzecGsynTtHNJbuvlpw2lkUDxXg2a+rY34RP/QcTr+Kkore/BTvi3Y+JEdhqDNEC9ImKd
	ye8KhDygLoeUiW1HkNSwjRhvKfVXPIjgdqV7SZtAG79lV4adwhM5DljfKl2mmT2nGbsnKViuhVm
	2L9CYSCsIZN4oegf5Wq2mSFvDDvKB12uO5o0uFjbeKHLnB7H8fGatMsAkZpQykegmsSLpuOWd3N
	l6AssCuBMx3zN7hbAXc3Why6MkrdhvLLOhYsF6hlfjEKq1oLnBfdZVj+7syEf5+Tc=
X-Received: by 2002:a05:6000:200f:b0:44a:75e2:558d with SMTP id ffacd0b85a97d-44bb68c7a73mr5207847f8f.41.1777739402623;
        Sat, 02 May 2026 09:30:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/62] libjpeg-turbo: upgrade 3.1.3 -> 3.1.4.1
Date: Sat,  2 May 2026 17:28:38 +0100
Message-ID: <20260502162929.1377831-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236327

License-Update: Copyright years change

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../jpeg/{libjpeg-turbo_3.1.3.bb => libjpeg-turbo_3.1.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_3.1.3.bb => libjpeg-turbo_3.1.4.1.bb} (94%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.4.1.bb
similarity index 94%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.4.1.bb
index f3e1ff59a6a..bb8d1207f29 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.4.1.bb
@@ -3,13 +3,13 @@ DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructi
 HOMEPAGE = "http://libjpeg-turbo.org/"
 
 LICENSE = "IJG & BSD-3-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=52fddabc7e8e79233150ebda95c3fc1f"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5e22220994831d7f0b91d09d94c89a63"
 
 DEPENDS:append:x86-64:class-target = " nasm-native"
 DEPENDS:append:x86:class-target = " nasm-native"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "075920b826834ac4ddf97661cc73491047855859affd671d52079c6867c1c6c0"
+SRC_URI[sha256sum] = "ecae8008e2cc9ade2f2c1bb9d5e6d4fb73e7c433866a056bd82980741571a022"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+\.\d+\.(?!9\d+)\d+(\.\d+)*)"
 
 PE = "1"

