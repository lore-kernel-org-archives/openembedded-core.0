Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DB8C83F23
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 13:33:05 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.15314.1724938380484014976
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 06:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2fBGntT8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2020e83eca1so6976585ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 06:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724938380; x=1725543180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DuxLmc2PZRfhqePZcsI/aorJOxJBscmA5Iu47zlf9G4=;
        b=2fBGntT87a9CI2z8debRZYSPBZv9cqMJhIv4GCNQYHPBDAqNQdGCuKc3GsyfsXMn1l
         6vHX4Jgo5c3lugynUNaRdILMNRVexMZJ91p/52yabcRWJM3wG7NjAK4ZTO+sXAgDeGj3
         a0EITvmulqnEw388xhNFXQlOUYR4xWnX1xlajMH8CHwV6/F5AfrDbi55KqmGCut9IdTh
         QJ+dQ8oZk2vxBnTp8Zq5BAVgoCSg4zeb3fv4Tq1AyWXpSA/27d4ijT5B7Dx16sqot4A0
         0nnH1WLzCm311GNztyMx+N4vZllfc6zPjglF0U2BOqUlze2enCCx4i1OJPRkFjzAcwTq
         WWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724938380; x=1725543180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DuxLmc2PZRfhqePZcsI/aorJOxJBscmA5Iu47zlf9G4=;
        b=CbNLcdU62ANTE7XhWp8fGiv7G5Dh20N4VGejif8J18/fiLfJTyEIFXPkoTocajsrXa
         K6GnD866KwYAY/soFknU25TXEszxdARdlogCpPMkHKqXygKfvTo+/Lnurc82hvo0sxtY
         X/EmYFSwQIlsS1XuPq5uhYm9y0v9/rdMHz+5uFdCjomCMh1GMbhTXV8Aker3PVzbNcPS
         UyBcSGSlsg4Yyq+jXrxczqIPgguXQJfRFkG2BdeDjXyqE1z3KibHiaEMaarcMRnOJW3N
         rCSVkNh9uU89ZxTC182A9pXjF6RwWJMbh3OfW6JW4PAB5TjVpV9kccPywDuLMJdJMRNw
         19TQ==
X-Gm-Message-State: AOJu0YyG6eWTuMIMefTG6fgT1blCxp7Bl4i3twwUkzJUS3zyyqeBsHtL
	zyIBxL4dQPCYMWStRgAwAnHLqN1y/pIfKwfVM2KFYI4Pm1ucUfXi6kiLbEZaot/N6Bvp3JO4Mhg
	Pz2Q=
X-Google-Smtp-Source: AGHT+IH34ZE2NSUwVj8exjKtvCALF7RYsFU+A2/LSsJ4l+EEqqXImLdvD/r9RGNtOS4WHLLkvZITSg==
X-Received: by 2002:a17:902:c94f:b0:202:883:bef with SMTP id d9443c01a7336-2050c350dbbmr29898235ad.30.1724938379671;
        Thu, 29 Aug 2024 06:32:59 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1446sm11241235ad.58.2024.08.29.06.32.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 06:32:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/12] expect-native: fix do_compile failure with gcc-14
Date: Thu, 29 Aug 2024 06:32:33 -0700
Message-Id: <6974c6548cae62529d96d4ceb3a296707d4adae5.1724938187.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724938187.git.steve@sakoman.com>
References: <cover.1724938187.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 13:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203930

From: Changqing Li <changqing.li@windriver.com>

In native.bbclass, CFLAGS is overrided by 'CFLAGS = "${BUILD_CFLAGS}"',
this make "CFLAGS +=" not work for expect-native, use append to make it
also work for native.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 174b35ec73..158e7af030 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -85,4 +85,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 # http://errors.yoctoproject.org/Errors/Details/766950/
 # expect5.45.4/exp_chan.c:62:5: error: initialization of 'struct Tcl_ChannelTypeVersion_ *' from incompatible pointer type 'int (*)(void *, int)' [-Wincompatible-pointer-types]
-CFLAGS += "-Wno-error=incompatible-pointer-types"
+CFLAGS:append = " -Wno-error=incompatible-pointer-types"
-- 
2.34.1


