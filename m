Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AFDEE57ED
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:24:07 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.35259.1726097038281798227
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iDQymzIx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-719270b7c94so140445b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097037; x=1726701837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vsRQIlqGQjbYSPOFrLaK7z4cWVc+Ysl9Oo4A7di/f8=;
        b=iDQymzIxvzNbam2RutlVaaIJXuRJfqNxMo8KZ2Fiqf2IFlkr9U6JjziwxSIfCzhy+n
         LQ+sV4V23l6EhM72R3WF4nRhwIaAG7+8c3N5sU/2X84jqqpPgHGlIt7BTbYsEUL7M9ZL
         HZkUgOkBbOhLN/RzJsnnmcn/TvnJ00An/HNjK1mOuII/dU3BHqEBsVxDTUNyI6B5SYPo
         CY/ueE36VL8EKj4AFRAEoRtBe5y3yUviClCSvKtdb/ZbE04gCdb6YqH5dg1rWbzgfNep
         hbvhd2bLVLZmJJV+F7/JVHHZ7IViGDZgHLYdLoc4/IaYs4oY/z2MrWq2ozllfsc3oYs3
         iw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097037; x=1726701837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vsRQIlqGQjbYSPOFrLaK7z4cWVc+Ysl9Oo4A7di/f8=;
        b=nNRbSzLiB7hhq+UvCvEwswudEvp1YRe2WWopavKzDrGsUqT+gBDTOU9wL7j7NdIBp5
         T4eJZ18tkHiBTYbq+Irl8lUAHZKUmj9BSvt8SYMb8Tj92zIiCHEWgDpKd8ST1sEpAZTQ
         TMmLy4exYIEF3K2fnS4DJNKsO+9GaOKtGUtw872JjxaRaMjuOQws9yRtMH+VBebVUDaZ
         0+FkpYhoxzZJT7eaAgGn6/OEuhS7+P+sC8FJE+xFzQ7A/mS8AAf/0Ao+604LUW3KLtF0
         yk0fldoFZxIIoOLXGqOl/tzGKVb4P4epS1mfuwD6rg9PrLYM7455ogQW5wtyPojcIs0g
         pmEg==
X-Gm-Message-State: AOJu0YzzBgfW5Hf55vK/76VYjy3hlYrPVj7C0xGluU+FIrXbA+otDHrC
	hdB/ZUxlKdUebyc7bby72U7+btXiSjZ8J3nCvLgIww+XqYJHt+MArbdqZhkqeBOV9N+xkDygTJe
	o
X-Google-Smtp-Source: AGHT+IFlrytmR+3wX6Rtmuf0FOWfN4O94+Jk8N3aQ+NtoxL+iOlaM/SzYPVLi+POeJVJuUGmJS651w==
X-Received: by 2002:a05:6a00:2348:b0:706:b10c:548a with SMTP id d2e1a72fcca58-719261d0b27mr1531330b3a.22.1726097037509;
        Wed, 11 Sep 2024 16:23:57 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.23.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:23:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/22] dejagnu: Fix LICENSE
Date: Wed, 11 Sep 2024 16:23:13 -0700
Message-Id: <cdedb408247e48f59c948e8c57918b88baf304b4.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204410

From: Niko Mauno <niko.mauno@vaisala.com>

The contents of the COPYING file included in the current source code
package match those of GPL-3.0-only license, which seems to have been
the case since 2008 commit
http://git.savannah.gnu.org/gitweb/?p=dejagnu.git;a=commitdiff;h=9bebe7b9bfb9b02e5e4d86ad74e8ce3eb32a36b9;hp=50fbdd118dba066e201c73a8b0155381cd65a32d
("* COPYING: Update to GPL version 3.")

(From OE-Core rev: 26b71cfb7815a096c5962629801cc3bc85147284)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb b/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
index 895f6d3b36..c6002d5e45 100644
--- a/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
+++ b/meta/recipes-devtools/dejagnu/dejagnu_1.6.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "GNU unit testing framework, written in Expect and Tcl"
 DESCRIPTION = "DejaGnu is a framework for testing other programs. Its purpose \
 is to provide a single front end for all tests."
 HOMEPAGE = "https://www.gnu.org/software/dejagnu/"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
 
-- 
2.34.1


