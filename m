Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1E4D637C1
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 20:42:54 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.21882.1731530567650312346
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 12:42:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uHlnXccE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21116b187c4so59600535ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 12:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731530567; x=1732135367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UD0tpMjzR08rsMBW3pSKtcrG+3qA2maxKenzc5aKv5s=;
        b=uHlnXccE32ro8RmdJ1N2qdFl6FY2ARRXlF5v+r3V95hJdU9pX+2fcMg2Y6uVJ+x/Xe
         BwR5i3UT1T71WR6Uhz2+gaJJtF3SU+lC4iYcs0UYNaSEHKU7OsIdUggsBKoqUfAkaRqT
         DgRICW3gffY0HcnlU47c49gwOkM4RL6CiSnRQHfPBbi1ruzXjtikvg4VAcioMrMiahbo
         pNZEp5mN7oZSXKflFE1+XiKzAg7xNTTytQ8L9Hij7DS5QsMtmp/BPZJ2usjX0J2Jb6Si
         ArNZL+O1YLDKZx157ZpbmVlnyF2eyNk+SLDM/0K2w3esymAGzHuAH/UCWaQmCSvTZ6+k
         7gOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731530567; x=1732135367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UD0tpMjzR08rsMBW3pSKtcrG+3qA2maxKenzc5aKv5s=;
        b=NR17Dlcydu0xIqdCRFkPneHqwLyE8fZ6REGGO7iSvIPlZrchr+R4h4blzl4R7DmUbn
         9UdAha1CyWy7EemmDJI5rSD6hSUeCmKvGCC3UbZ177g81f0wSkT1czqeHg2/Uv0djcz7
         KR/noyr6FfuNSYHbTn/1vUL3T4JE2uH+oP9aeQcgpoubBNwy1y0wAQn5T4ltNjb8j06B
         WpiDWQSFn5U92RQit1lP/N9jl4+btjwxQkmwYFg3K9n12SrFhAyk9yKoOoZYa4X3cOZI
         H2L7v+9WOj4lUllewCxm9fhm8fECuNfAb7bzxlw/7JOH1Br9oow6GZn4ai8JkZu13/SS
         8bhg==
X-Gm-Message-State: AOJu0YyJUp/vqKyJ2w5o2D/Qv9N4qnyLnJkDxIMGzGbr2Wm1O2a/ZXex
	kkNhSTRGWjH6LSa/uGhMH+h8BXA7EW75bAsQEG2/fsbwpbv/PX5p0FLjur8Zyo+pnP2uyxhhptS
	F
X-Google-Smtp-Source: AGHT+IFWCRJGXotYOWvtNUi6J/Xqd36Hzn/S4xB4chBq3yBOQApJJZzOfOH7ZHklSXGQx4lWKvkyRw==
X-Received: by 2002:a17:902:d50f:b0:211:31ac:89eb with SMTP id d9443c01a7336-21183d10a1dmr298907465ad.11.1731530566913;
        Wed, 13 Nov 2024 12:42:46 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e84ee2sm114545595ad.274.2024.11.13.12.42.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 12:42:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/9] pseudo: Fix envp bug and add posix_spawn wrapper
Date: Wed, 13 Nov 2024 12:42:21 -0800
Message-Id: <782fc8c12deaf713a60c62c34914b585ff150ddf.1731530398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731530398.git.steve@sakoman.com>
References: <cover.1731530398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 20:42:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207130

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix pseudo with python 3.13 by adding a wrapper for posix_spawn and
fixing a NULL pointer dereference in envp handling it uncovered. This
fixes issues on Fedora 41.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d80e20d70d170397f9827c5a5fc75ad1f2e8cd94)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 7d8f71f65d..87c62e0678 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "374089f2ed83da4d0d4e58df067142ff99c7eb12"
+SRCREV = "28dcefb809ce95db997811b5662f0b893b9923e0"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 
-- 
2.34.1


