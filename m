Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4A5CD98EF
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 21:47:43 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4370.1763070459136668307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 13:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2t6glQbl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29853ec5b8cso13943525ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 13:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763070458; x=1763675258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZ1sZBAOtC7YhxxfBOMxIhMSmABJODBVBTcBL8HW4Sw=;
        b=2t6glQbldRUxkkqJ0y1nD6nQa2myIg5riY9GSe6I4a95IGwXDrrso62ezZkwFjF91r
         m+Ui6a0EUvcFudxZgWgxd9TvZm1Xzh+LaDzxIx0fa9a8ru2/NY0sDT4PEYRPJJcbn7DT
         CLFAMbX4YmNUbzbTJWpF9HmNgNW1+3EXkCXnLGVYBMuflFB1jXk8u8eW6kwKoxRE0GtK
         dXcnmiWnR8vYX3cA8DFAMuz1HIJMo6Z0uw66Tn/kdiBCjQnUHxz+5ROUiewl5cUJnxj2
         HMf50u5UgGp7pARmVPkpSquMmJFY+fUeiVQjldLUsXGJiDZI8aYMLQS4eleIiL44sEK7
         0YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070458; x=1763675258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YZ1sZBAOtC7YhxxfBOMxIhMSmABJODBVBTcBL8HW4Sw=;
        b=fUn6mSMfacTYjE46UTDyix0bxWRk0FAzp0UFmoN9/QpoklIXHak+PwS1cYk0MgOpjd
         WZtFwhHeYRJUbEbTXwi6CwXw9yWAw03+/oC8ESAKOxRRnauB//wQmf/f9l9h3xfWJzRC
         Hwy/MSR6RXNo12FB2OHmZeMg8bIe/qGIBIC9GdNwgx/SvS2qZHd697QppSgZpGcFLhUT
         UZwXosvBJj4nOi7x0seAIb0oPhBHYbVRQRm4XQ9tbfWStwSz5Tm/hF39QTf4j8ulwFZg
         Ja1UuhQakVuzCtmWXy5nixmdf7rWBt+tH9W/hudw+w8SrWtMUv3vOQs5jvAUuey3Xufd
         q6+A==
X-Gm-Message-State: AOJu0Yz2554JUo0b6IIugigbEngiwl4gmuo4GJkjNNpsHgS1mWEetr1w
	ZgDHJboMJQeR4H10t6k5J9U+d/KSpG/Wm9qEVlAxEEYFLoU0NcQcAsSLPFSKKmITw2c4GSA4mjN
	5bP8l
X-Gm-Gg: ASbGncs3wCcTCvAkcwKxLdIzkAhq7LhuTbwG93hxYgWfbIZzVDDOifHCjAmYzTScleh
	f2ZS3EIpmuity6UrUmzh5Z5wj0xlNraiRRm1FFLt0g9VxE2Fg6ziYnin5TgDk+BJOm7Bgm9oX8m
	8ZY1iK3om0k6yEk+LamJ7ZYdJCYM+elA/Y57qmXnvTUV/Zg+do8pbTPs5WGWIv7fWUeUrT6rOoG
	47Ab3SkVEakA/r+pOGC1Q7hmDrwqPiQcfID+8gosqC2gYCov/FO85h6Cy3mIeY10AJlypVwrEG4
	oYI3isGLMMwB1lpdKBGgmh3Q+nK0iwbFXKhOXRwKzzVC8b2BNLwoRW9EyoFYzTaJ/CqIShl5EZT
	5mGcYvjqZH2juOYTVxkuZ7a8w6ie8+n6HI4O4DnEOzovQnKJcjDkUsxeFakW8uYHygQ==
X-Google-Smtp-Source: AGHT+IHBgGmCBFcm4ZV4PgavUGzhReYX8Wou3tt+SqCbOHj4kFk5POURRXV7y1i5tHaTb+m9sPooqA==
X-Received: by 2002:a17:902:fc86:b0:295:f1f:65f with SMTP id d9443c01a7336-2986a7414c9mr5289705ad.31.1763070458262;
        Thu, 13 Nov 2025 13:47:38 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:70b:f91f:acd9:f6d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d68sm34639815ad.61.2025.11.13.13.47.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:47:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/10] rust-cross-canadian: Ignore CVE-2024-43402
Date: Thu, 13 Nov 2025 13:47:21 -0800
Message-ID: <3044ae9e6e84faada8c1425238e9e9c3060b1a3a.1763070333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763070333.git.steve@sakoman.com>
References: <cover.1763070333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 21:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226274

From: Saquib Iltaf <saquibiltaf@gmail.com>

Ignore CVE-2024-43402 as its not applicable.

CVEs are specific to Microsoft Windows.

Signed-off-by: Saquib Iltaf <saquib.iltaf@kpit.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 8bbbd61bdc..044df5123a 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -76,3 +76,5 @@ SUMMARY:${RUSTLIB_HOST_PN} = "Rust cross canadian libaries for ${HOST_SYS}"
 SUMMARY:${RUSTLIB_SRC_PN} = "Rust standard library sources for cross canadian toolchain"
 SUMMARY:${PN} = "Rust crost canadian compiler"
 
+# These CVEs are specific to Microsoft Windows
+CVE_CHECK_IGNORE += "CVE-2024-43402"
-- 
2.43.0


