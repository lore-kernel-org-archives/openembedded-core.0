Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FD3C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:42:30 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.9434.1715258549173505263
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KgsK9zkM;
 spf=pass (domain: linaro.org, ip: 209.85.222.180, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-792b94301eeso68577085a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715258548; x=1715863348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bcbKB/tKTfeV7/ZJ+QnMCmUgVEokOrXFGvH9eaiIfqY=;
        b=KgsK9zkMo0M42qXyWNOqeZvxdou6bAFlRdQ8cXV0w1EjlY31UsCKfFD6zhWfhPU+YY
         5QFMmqCvpPXzH0RAu1s6ow00Jky7sYexz4M0uiPjzjpK+cKBQP+QT6ort0kzpt5jcTvy
         RChIDt9TmLKMA8icGhNakpaEs5wajilPVley4KCX74AYsmNFn2curq4UBDjSeyPuxKWV
         ly2Mn+TAtF0QjdhXga+ojy4cbUnCKgJR8xtWOKZmNEUquLPdxuRQIuJOSW4gkRl8R8+n
         n1fuBsQuKecdbG/0mmdm1NJVB3C6mU1WbuRezmdRz61zAcWYVzb7Aedhu5xG8im75nwG
         4m+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715258548; x=1715863348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcbKB/tKTfeV7/ZJ+QnMCmUgVEokOrXFGvH9eaiIfqY=;
        b=TdkZFyAKeYYOGdDEMdU1zkYwk+nFbH1GHz9Fv82SWYbjX89KORb8V8/CbB1lTvaZuS
         4M2OOAHnQjfc4+SlAgL4VRPF7iH5MTxYBd1hg6YqNXYUy6Z4a5R5/lV5zhi7zBKDCOGm
         srNSvIF6mMQ+pGuuzDPOhd+0DtAWfAx7QnnGVAkgZvGU8yZqkymVRTdELKKP0RVNrh0a
         S9K5QZgbsIYujgpwSPPRd62RKVtNogHPgclWLgeqPmcQHPpW7q6LxGGQv0REwX+WG8On
         n5NWcuWVT9v7hD3N64iCb33+QyCW9zO8RWb9UVrdEj+pGOIzhYV/LOER0TQ5AhzpdsOy
         xYRQ==
X-Gm-Message-State: AOJu0YykTa+0Ij6XsdKrM4EPWNWloXhhVSnkGpFy2lt9BbCBvyqByvcW
	0UEA4MSiHY6V/KqRzyKuiKBhjwqBzezmfoxpB7V0WW/t2v8RqGCmkiMYSCX2SKE0OMOA+CugrEo
	D
X-Google-Smtp-Source: AGHT+IE7zwwUooffiQ9z5Cd2EBzem5fkfK9tOq/VZoWR+lmrXMZqy2svMLP1Aop9ucCEwSoFlSyygA==
X-Received: by 2002:a05:620a:8218:b0:792:989e:7c4e with SMTP id af79cd13be357-792b2769696mr582502685a.72.1715258548184;
        Thu, 09 May 2024 05:42:28 -0700 (PDT)
Received: from maple.home ([76.69.90.99])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf31171esm62779985a.116.2024.05.09.05.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:42:27 -0700 (PDT)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] uboot-sign: fix loop in do_uboot_assemble_fitimage
Date: Thu,  9 May 2024 08:42:04 -0400
Message-Id: <20240509124204.2436895-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199171

When using multiple u-boot configurations in UBOOT_CONFIG, the helper
function uboot_assemble_fitimage_helper() was not called with all
combinations of type & binary, due to a copy-n-paste indexing error.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2d338548a4b745a71eaf6c29231adc93c4165778)
---
 meta/classes-recipe/uboot-sign.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 7a0b8047e4..c8e097f2f2 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -367,7 +367,7 @@ do_uboot_assemble_fitimage() {
 			done
 
 			for binary in ${UBOOT_BINARIES}; do
-				k=$(expr $j + 1);
+				k=$(expr $k + 1);
 				if [ $k -eq $i ]; then
 					break;
 				fi
-- 
2.25.1


