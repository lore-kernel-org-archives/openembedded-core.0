Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6AEC3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:14:02 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.43682.1721740435570424408
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sOw8nJAy;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-75a6c290528so3194214a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721740435; x=1722345235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySQ77M3ZX+4lsTvd+QcLZv1BsP4R6MCb6BZCTUy/i2g=;
        b=sOw8nJAyMue0PRkFbWkrjKGkKlaWmjWRvZItYrDqhiVqK6KIS9q9lUQvrU/u1xSxL4
         snSbOp7gJA2beJXTrDwTNDyoqX7f0f6maRW8ikjVIWbtqxSMqCviAqff+UH7+KOCceQA
         O1qErAHbWlhsP0WQIJIdErRfGfz8WY0wUiiTFYjAiUYIBbbNbm1tg6n8NUZAmMqUDVZs
         a7dReBAuT51YkPsp6IoGtJnT5Az3/0Gukie0XbbsuuWJZh7NqTymO8OT04xGL1hdgdVb
         gzbVXOXlHBoXviHIDj9Y5rTgl3wrD8MmCo2ESZbtpo7dt1rJcCXonZvXLnWNTsunCUim
         4Mxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740435; x=1722345235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySQ77M3ZX+4lsTvd+QcLZv1BsP4R6MCb6BZCTUy/i2g=;
        b=MMDLIy/dQNCnDSSGwM3JK4F1zWdl1WDJq+8xobmQoJ/Md7dAuChLzCy6a9bPUag7I7
         OMTiKq1OSNJwgHn11bgfFq/VpJnD75CzYm7TrhP3Inv1gWTnr//rXFNlOnQcwaMo/WsR
         wCt8/V8bru1EnQlXaas+3JJxtjMOM10nhLJ8056bnV/vdFY7xqrtwpgmMKqtv6pMQ5WS
         jhoReWz6XAoRShH3xfopljGD0t4EuUjgJo4BR8s4BCPzJqXzd7dsbArQW2Sc4IknPOwc
         SGLy2SFY3iMWCqKPT79bfYU1E6+IvBmBQ7S1vexUzJ/yHqI3ENsaBN1PQRF76vurfkiI
         D6sQ==
X-Gm-Message-State: AOJu0YxbXZ2wPE60jQknADEdqaUDgBBKMegoZvIFQPqb1lSXoERwxd4p
	U2YjdTonP3eZR5qQ7wlOsGpNaHsS5dJ8U3lHjkrzM4jSLEASxIm2wpbuoHD9KgpR/jv8wx/sAgH
	5GMk=
X-Google-Smtp-Source: AGHT+IHHhYyl491b9P/Tc8/ineAjVDKmNKM7I0glXmtUa9FZHASGZRz3+xBKbYOuWT6/CTnUzP9IMQ==
X-Received: by 2002:a17:90b:33d0:b0:2c9:6f06:8009 with SMTP id 98e67ed59e1d1-2cd273f16f3mr6240825a91.1.1721740434809;
        Tue, 23 Jul 2024 06:13:54 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm10091540a91.57.2024.07.23.06.13.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:13:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/17] insane.bbclass: remove leftover variables and comment
Date: Tue, 23 Jul 2024 06:13:16 -0700
Message-Id: <c00a9a8f25b0042b0723a5d20b88e92d473d22bf.1721740245.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721740245.git.steve@sakoman.com>
References: <cover.1721740245.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202362

From: Emil Kronborg <emil.kronborg@protonmail.com>

The code that used these variable and the comment was introduced in
commit b44d32ef41ef ("insane.bbclass: Portions of code were not running,
fix this and sync with OE.dev. Also add tests for bad sysroot rpaths in
binaries"). Later, in commit 17dae13fabe2 ("insane.bbclass: Fix ELF
bitsize comparison"), some of that code was removed again, but not the
variables and the comment.

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 730d00b0d1d1d617b62900be12fa034bb41fc48b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/insane.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index bcc179fe26..9004a9dce2 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -835,10 +835,6 @@ def prepopulate_objdump_p(elf, d):
 
 # Walk over all files in a directory and call func
 def package_qa_walk(warnfuncs, errorfuncs, package, d):
-    #if this will throw an exception, then fix the dict above
-    target_os   = d.getVar('HOST_OS')
-    target_arch = d.getVar('HOST_ARCH')
-
     warnings = {}
     errors = {}
     elves = {}
-- 
2.34.1


