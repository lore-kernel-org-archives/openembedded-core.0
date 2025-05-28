Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11669C3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 15:34:01 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.940.1748446438041914897
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 08:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RFt2PHHO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-742c035f2afso2924676b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 08:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748446437; x=1749051237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ES/7dnEcrBx6GVxPd5oRAXaECbbzpRK+LMJM7OVCzg=;
        b=RFt2PHHOg1r9wVLb45UzObed7TpV7a9vlBkcnlOti5L2uCJ6txTEJL+lilRuLfJOJ+
         a8QAKkPbOHus8gvJcCef3oHWfYByZxgolIBEYIeTN5LnN/tWwIR2qgOTj8kv+ZAAXuyr
         LZn2XFnFUtOoqjNVXgtDwAgrd5Xk/iUl4TvYUfzFPbUhUZp3EOi5YvAMOW3dYoomiGH/
         4HEIOKdS69lNos62+lj587YCIVmhGwTHo1Em98BMXFv78foWyh/KBIiqkOrS/7GD5OmZ
         Jhoz0cQcWOQFArafEtQMjoJKp9RUJ5FdQakdBWUReKve08gjTwsIWir5KpFFltYxkCVD
         6XtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446437; x=1749051237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ES/7dnEcrBx6GVxPd5oRAXaECbbzpRK+LMJM7OVCzg=;
        b=FqMxI9Sdazqt4tYzI3KRmxIWdsk3Ddrm17oQxqSlDIRAJu0QEnS/WLmALUepCO8pBi
         wThKcr0+4myhYPBM14tWhL7GwP55ep1A247LI3FCsAMkdyQDiH1fTfF1eY6NTrPn88bw
         PZ21yQ558dhVEtcy/DF091zOQUiOko1Ie91CavdxFr1P5EKJ/MYNMuHFwVbrwNjkJy99
         XJearsrE6CkMGjG06zsLoHLFYiHUh0QNnj0Rb10RkZodI7iSvDdtYX9CUb2ihsmk2qtS
         BYm2Bp5bLZZo2xh5lUFLY1ume4AUdAwpmxPxBJodifFbD7hFSqSS/89rLrmDPW5TCQsx
         eYEA==
X-Gm-Message-State: AOJu0YydzcjjrsS2WI36elDkJxTwgnFlDUW4By3ExDuGY9jPvOUF95HN
	eF2kVDC8SzhXSe9IZn1OylqWsnqgSWpxm99tE2xHm9HZwmpdlaESjRf/hGoNmTFA++7Z9DTrerg
	d4fYk
X-Gm-Gg: ASbGncsaJi3R8AXeo5SjlD6Pt/tua13vELj+LNKlMz6iohQxOW3O2V03MejxCO039Cu
	qxqyh+NBMPUUFcOaWrqcPDq+2Afv92lbe7sWgsVa0J5amE267A7IdUtmWpQp7/kNAlLokGL3Jqp
	gRMfZoqVXmCOONCPsRQ3bIX7QXt9rg7B5b+UQnxjCE5e03fcANeg2mZy1c/pT99kteJwNh5ehQ6
	ajEMZvvmRU/T4qEb/Lc84hbEmEhDWNuD3+HgI4CgQyx21lM8jz9f9QOPuZc/EtGheErEjBdt3jo
	koIFwZbcZQqpdgLppIr+cNdmplzn/vxqHfbPCe2o558=
X-Google-Smtp-Source: AGHT+IFrAFQacDHdFZgt5ah8TJqxasCfLoPqFY1Usa4LBG9/rP6WACRPqGsGroQ66FhDFLTWcJm1jw==
X-Received: by 2002:a05:6a00:2e84:b0:736:53ce:a32c with SMTP id d2e1a72fcca58-745fe0382a7mr22996801b3a.17.1748446437251;
        Wed, 28 May 2025 08:33:57 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c1basm1400268b3a.132.2025.05.28.08.33.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:33:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 10/14] libarchive: upgrade 3.7.8 -> 3.7.9
Date: Wed, 28 May 2025 08:33:19 -0700
Message-ID: <5219998cde17542ae02622de29c5b4a1258772b2.1748446235.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748446235.git.steve@sakoman.com>
References: <cover.1748446235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 15:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217374

From: Peter Marko <peter.marko@siemens.com>

https://github.com/libarchive/libarchive/releases/tag/v3.7.9

Libarchive 3.7.9 is a bugfix release
Important bugfixes:
* a regression in libarchive 3.7.8 regarding GNU sparse entries was fixed (#2558)

Also remove CVE_STATUS which was obsolete already before this upgrade.

(From OE-Core rev: 670f3fa028f3e873acf4c5265d3f5e4a3aa0ec89)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/{libarchive_3.7.8.bb => libarchive_3.7.9.bb}   | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.8.bb => libarchive_3.7.9.bb} (91%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.8.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
similarity index 91%
rename from meta/recipes-extended/libarchive/libarchive_3.7.8.bb
rename to meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index d78b38d3e9..9d134f7d38 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.8.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -33,9 +33,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "a123d87b1bd8adb19e8c187da17ae2d957c7f9596e741b929e6b9ceefea5ad0f"
-
-CVE_STATUS[CVE-2023-30571] = "upstream-wontfix: upstream has documented that reported function is not thread-safe"
+SRC_URI[sha256sum] = "aa90732c5a6bdda52fda2ad468ac98d75be981c15dde263d7b5cf6af66fd009f"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.43.0


