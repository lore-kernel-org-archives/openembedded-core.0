Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02365C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 11:31:06 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.9338.1707478259404979152
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 03:30:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PH7ngB9Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-410585542b3so6547335e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 03:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707478257; x=1708083057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEVujIALxGeSe1p4U7N1MQZkCBSI25IWJxUrRX+zMPQ=;
        b=PH7ngB9ZQR06rcfQ/G/68xrGTem//Nxg8ydccjJFHLh+coGu2GXU3BmAs4whqeQDcM
         WHACjpQ3AdrT4lXf++pJYM1mfqBulKm20Ewo6B40voexPrJmDY6z/oQyYrR0ofFF6AYD
         xJEdmumFgqp8Z5MaREifo4ELBjPdXlNHWbF0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707478257; x=1708083057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEVujIALxGeSe1p4U7N1MQZkCBSI25IWJxUrRX+zMPQ=;
        b=vdz+kNEXNbTJoeP/AymA6LbgNHQAhCIoiHIdphyKGDgkJcFFMt/FQDB8DTDdKluNqF
         otnlEz8GKh6RtuJE4QKOYnC1m4c7odmZoSUYJCwPu/OQfWBdhY9mpM/yx6oNdMKXyqul
         14IMGEaRdozsUdYnc9ZQ3KiG1Yx5MNQTYxp+laXFqg6VglJAL2z1gHJY6Cr4BZQ3WykR
         iZQ1410b+PlRdH01lnDiZk3w41UgtInMIB8qYe77aH7BCsrlLB/uxH7DHsBs9tVdxqx6
         6H9PIXYDqgF+AbU8j2NHX1aEk87gAowTZMv8OblmPwvM2frXo/VE+6Zc01ijsoz+5yR/
         VumA==
X-Gm-Message-State: AOJu0YwbKHZ7d4c1gMnQFjBcWBPXh4pmDS7VFWOeedmWsLSN2clYNVhV
	TXsMwofyC890OWsn553aeKU9lBnryZg50XURu4cU2Xlxf8UjHqPVhFCa9OPp7knxu0AzHkEn1I6
	1
X-Google-Smtp-Source: AGHT+IHtCnMIuOg0xPBags6/1AX4jMMrGCTvFLOnCWJQxlb3usRwByFpCdka5KFCkgL4bY3Y8LFbzA==
X-Received: by 2002:a05:600c:3ac9:b0:40e:fbb3:f67c with SMTP id d9-20020a05600c3ac900b0040efbb3f67cmr1002721wms.38.1707478257675;
        Fri, 09 Feb 2024 03:30:57 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:47e1:ee11:154c:e6b3])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c450600b0040fc56712e8sm359282wmo.17.2024.02.09.03.30.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 03:30:37 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] gcc-runtime: Avoid python dependency for mingw
Date: Fri,  9 Feb 2024 11:30:35 +0000
Message-Id: <20240209113035.3372683-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240209113035.3372683-1-richard.purdie@linuxfoundation.org>
References: <20240209113035.3372683-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 11:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195201

We can't add a python dependency on mingw since we don't support building
python there at this time so avoid that dependency for that case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 004deb6e41f..9dd399d1b14 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -191,7 +191,9 @@ FILES:${PN}-dbg += "\
     ${datadir}/gdb/auto-load \
 "
 # Needed by libstdcxx pretty printer
-RDEPENDS:${PN}-dbg += "python3-datetime"
+PYDATETIME = "python3-datetime"
+PYDATETIME:mingw32 = ""
+RDEPENDS:${PN}-dbg += "${PYDATETIME}"
 
 FILES:libg2c = "${target_libdir}/libg2c.so.*"
 SUMMARY:libg2c = "Companion runtime library for g77"
-- 
2.40.1


