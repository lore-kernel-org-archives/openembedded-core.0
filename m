Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67B8EB64DB
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:33 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.7346.1686734969411356479
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=V6ThY1VD;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-97454836448so72550766b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734968; x=1689326968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/TrUODDJpXSULdhri5dHcY5JetMnL/jI9BDyTjnGXw=;
        b=V6ThY1VDV5ovIos8vPawOoZBjBjqN7PMW89uRjojeBI3CAPHHwmsOG/vYXaHUXir9t
         SQvevrAWJaWZZaIZ52cT5eXgHNqxtigXU/DV+EHET3Qxk1hLNOhoybFEkKdOsoQ7RYUe
         SeTb6tAzXj4taq8n/sGqGGEK6pLt3ySp7v/wDskonTnFvGyLmXX3EYasEtdNyGCsvEgo
         qiq3RlDYQp8p5GngAHVs8HxPvUJP5MlBrOfG5pa2x2VFuLwC9KV59ayPhs7KrX8Q8ALZ
         qqqCHQK2yhy1sgERqo987Z6a7HjzIDVdJy9NoRbTtMNAqZBM599/Xm2L6UHDFOBIk7/t
         jamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734968; x=1689326968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/TrUODDJpXSULdhri5dHcY5JetMnL/jI9BDyTjnGXw=;
        b=DVBf0dAWrALTPkwpME/mVHfGCIV959c4vh1mC728Z/qsxtkThMtFEgVbyeIg3K1zn5
         cuHxkor4ZS8FkybBSHrH4zH7lBSTp1DDBVpfbvuZ8Hqx6CFinaQQABqkc7+nqI+CakDE
         ebH9/++pk9xO8KD3KkHahmqcJWOChf5WDp8wx6vbm7Ljm/ki36gOBqUtVX9rHiN2n5ko
         WNPUALzyQTs3nJHV71sj0YXvek9foflZQ25K8FPWBUIjdP+lG3/9dg1Ly1XKepFUful9
         3c5dcTFR+k0Qcj/+Au0ZJKKz7aLOWB5JPvQMabD+weXfgMC5gZUcudL258mpCmzjYy1c
         Rk2w==
X-Gm-Message-State: AC+VfDzxm9FtsrcCwlCwkrT/jjM6Yq9U52e33Agy1e5SEyYA/9mT/ybV
	V5VeCX3gBBsYAl4MiToPuMX6sPZX5Sc=
X-Google-Smtp-Source: ACHHUZ57hC904RVn9x55tdVbpIBsmCkIgns/9QevYIb2wIGbVJPNf+5ILaJtq7dD1ii3ljvTLB277A==
X-Received: by 2002:a17:906:ee86:b0:978:9223:6630 with SMTP id wt6-20020a170906ee8600b0097892236630mr14329095ejb.37.1686734967790;
        Wed, 14 Jun 2023 02:29:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/55] ghostscript: remove mkdir-p.patch
Date: Wed, 14 Jun 2023 11:28:31 +0200
Message-Id: <20230614092918.4065570-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182753

The scenario where things break down without this patch is not clear:
it's a make rule, and so make itself will ensure it's not run several times
in parallel.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ghostscript/ghostscript/mkdir-p.patch     | 50 -------------------
 .../ghostscript/ghostscript_10.01.1.bb        |  1 -
 2 files changed, 51 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch b/meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch
deleted file mode 100644
index 3e6d3e3c48a..00000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 2b23026f8e2a352417fb1c4da94bf69b19bef267 Mon Sep 17 00:00:00 2001
-From: Joe Slater <joe.slater@windriver.com>
-Date: Thu, 29 Mar 2018 16:04:32 +0800
-Subject: [PATCH 05/10] ghostscript: allow directories to be created more than
- once
-
-When doing parallel builds, we might try to create directories
-more than once.  This should not cause an error.
-
-Upstream-Status: Pending
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-Rebase to 9.23
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- base/unix-end.mak | 17 ++++++++---------
- 1 file changed, 8 insertions(+), 9 deletions(-)
-
-diff --git a/base/unix-end.mak b/base/unix-end.mak
-index 9ce599a..feff5a6 100644
---- a/base/unix-end.mak
-+++ b/base/unix-end.mak
-@@ -17,15 +17,14 @@
- UNIX_END_MAK=$(GLSRC)unix-end.mak $(TOP_MAKEFILES)
- # Define the rule for building standard configurations.
- directories: $(UNIX_END_MAK)
--	@if test "$(BINDIR)"    != "" -a ! -d $(BINDIR);        then mkdir $(BINDIR);        fi
--	@if test "$(GLGENDIR)"  != "" -a ! -d $(GLGENDIR);      then mkdir $(GLGENDIR);      fi
--	@if test "$(GLOBJDIR)"  != "" -a ! -d $(GLOBJDIR);      then mkdir $(GLOBJDIR);      fi
--	@if test "$(DEVGENDIR)" != "" -a ! -d $(DEVGENDIR);     then mkdir $(DEVGENDIR);     fi
--	@if test "$(DEVOBJDIR)" != "" -a ! -d $(DEVOBJDIR);     then mkdir $(DEVOBJDIR);     fi
--	@if test "$(AUXDIR)"    != "" -a ! -d $(AUXDIR);        then mkdir $(AUXDIR);        fi
--	@if test "$(PSGENDIR)"  != "" -a ! -d $(PSGENDIR);      then mkdir $(PSGENDIR);      fi
--	@if test "$(PSGENDIR)"  != "" -a ! -d $(PSGENDIR)/cups; then mkdir $(PSGENDIR)/cups; fi
--	@if test "$(PSOBJDIR)"  != "" -a ! -d $(PSOBJDIR);      then mkdir $(PSOBJDIR);      fi
-+	@if test "$(BINDIR)"    != "" -a ! -d $(BINDIR);        then mkdir -p $(BINDIR);        fi
-+	@if test "$(GLGENDIR)"  != "" -a ! -d $(GLGENDIR);      then mkdir -p $(GLGENDIR);      fi
-+	@if test "$(GLOBJDIR)"  != "" -a ! -d $(GLOBJDIR);      then mkdir -p $(GLOBJDIR);      fi
-+	@if test "$(DEVGENDIR)" != "" -a ! -d $(DEVGENDIR);     then mkdir -p $(DEVGENDIR);     fi
-+	@if test "$(DEVOBJDIR)" != "" -a ! -d $(DEVOBJDIR);     then mkdir -p $(DEVOBJDIR);     fi
-+	@if test "$(AUXDIR)"    != "" -a ! -d $(AUXDIR);        then mkdir -p $(AUXDIR);        fi
-+	@if test "$(PSGENDIR)"  != "" -a ! -d $(PSGENDIR)/cups; then mkdir -p $(PSGENDIR)/cups; fi
-+	@if test "$(PSOBJDIR)"  != "" -a ! -d $(PSOBJDIR);      then mkdir -p $(PSOBJDIR);      fi
- 
- 
- gs: .gssubtarget $(UNIX_END_MAK)
--- 
-1.8.3.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
index 5d4b8cdc913..250b4ba9981 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
@@ -32,7 +32,6 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://ghostscript-9.16-Werror-return-type.patch \
                 file://do-not-check-local-libpng-source.patch \
                 file://avoid-host-contamination.patch \
-                file://mkdir-p.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.30.2


