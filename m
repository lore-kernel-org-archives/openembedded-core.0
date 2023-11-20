Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C028EC197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:12 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.591.1700498351986890251
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gZsLLyEb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6c398717726so3779077b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498351; x=1701103151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdDvndDseUExXGRZlFkhZEBS+ic/MqYkvuP5qgjhopg=;
        b=gZsLLyEbvqicqzHUDIPuJcIVwkJsXIRcUgRYhXPoskZqnA7kwGm/JOMwuQPP8/rvTb
         YYf+H3joaQw7+87Zx/O1lKowxhxXeZgin3HSP1Rdn43ycmKFE8F/vImPEJq1jAjf/1IP
         xKRujUhLnqjwSYtLrMP3MjpY+ulPiPPpURjoOpmwZvPSuRusl+KWao2RTBQcxf3nLlNr
         COaCFBNgDoa6WJsxkAYvcdWLwIQev9B/fxZ1TDg6Egy9dibIGe3CemFbn+sWbEpkx+cA
         fmBhS1Bqc08CYlJA7ulnPZqtIPtKINOZoYSnR6Zbb0Vw3bFiQYXi/uHoFcC5yC9Y+7Ls
         iVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498351; x=1701103151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdDvndDseUExXGRZlFkhZEBS+ic/MqYkvuP5qgjhopg=;
        b=sUnASyAcN3jrxBmAKv3AtVbGwy3fhwELilRirLOrBL0aHNS675ti0Ippgga0YnVW3V
         jQz0JFrrHtP3DTuS8vrRFohVljU4qIu09Dzs9D0s4ciuRU3ommhiYCk7jChyT18dU4t8
         sNbsbMs3NIOPrLx5GcclrP5eXoU2UX69N6EyRfxGb9yup4jsiu7z/t0dTIjVBLiyxFt+
         4sdcozeLtc3f7CCiYXkls0wGmUZpV9DRIyf0mltbXHL81+sdwdXDo4pH9GdDEC2NlxRe
         tJdDzccGQ9e+ZeOBgFHEyntvwUwbqzLFd0t3ZWlTDLYILMGbAExJkc6wMvT9pG7M/nEX
         iTpg==
X-Gm-Message-State: AOJu0YzmTF17QNkhmYWxlopT+lBDa/h4UxdEL5cSnY4pLEJ6uI2XtgXh
	X/twR5mLQGRN7Y4ijmFDSbeF2nMrxR7jqfdESrlUCQ==
X-Google-Smtp-Source: AGHT+IEQk7cv3AMXntirEMBb48gAGCMGIMGAol6lRhrAFPJNmqFaPGRcON/a00+WmcZEkxXl4OMgLw==
X-Received: by 2002:a05:6a20:c184:b0:187:a75d:29db with SMTP id bg4-20020a056a20c18400b00187a75d29dbmr7595339pzb.27.1700498351150;
        Mon, 20 Nov 2023 08:39:11 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 08/33] Revert "bin_package.bbclass: Inhibit the default dependencies"
Date: Mon, 20 Nov 2023 06:38:22 -1000
Message-Id: <47b436c42ba1ef3b24e8fe48c7ea274b1a53a60e.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190897

From: Max Krummenacher <max.krummenacher@toradex.com>

This reverts commit d1d09bd4d7be88f0e341d5fccbfbefeb98d4b727.

The commit not only removes the dependencies on the cross compiler
but also does not depend on e.g. virtual/${TARGET_PREFIX}compilerlibs
and virtual/libc which in turn makes the file-rdeps qa check fail
if installing binaries linked against e.g. libc or libstdc++.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ababf6ceebe360c5f59a57428566c27b7a97a9e6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/bin_package.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes-recipe/bin_package.bbclass b/meta/classes-recipe/bin_package.bbclass
index 9dd2489725..3a1befc29c 100644
--- a/meta/classes-recipe/bin_package.bbclass
+++ b/meta/classes-recipe/bin_package.bbclass
@@ -20,9 +20,6 @@
 # they would be in ${WORKDIR}.
 #
 
-# Nothing is being built so there is no need for the cross-compiler.
-INHIBIT_DEFAULT_DEPS = "1"
-
 # Skip the unwanted steps
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
-- 
2.34.1


