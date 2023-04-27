Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74AE7C7EE23
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 07:35:41 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.14867.1682580937290441352
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 00:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=f6PilRS2;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-2fddb442d47so7395965f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 00:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682580936; x=1685172936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDYJVna9fwgZouc742hq3janvmGHmyu/RZqxVMr7O4o=;
        b=f6PilRS23P/Ns7FEIDfglyYXGXb0nwmyCe/C3Deu65+dGZ57kjbDIruHhipbjb+05d
         0Jk9aXNy2EiRxoV3d/xakbBh4lXh9nBtA5zVsZtZLWqB5IWi4Fxh9ymYQrEY8BZgHIr1
         7paCPvCha3gvmTdMrhoK3OM1z6Zs18kPN5fwvYT7TUwNs7eGM74gse5EG7SkU5xx3tUI
         MfbAhJxvRueVwhv5pecQipFeqt4fMlx3qZ0ZX2nubrV4wGlHuEGCLPtqDgsm6h2Twm9h
         7UGCnx+a2QNbstEBncu8NYLJYa0syWDlbg3W4ENWK8mVIxTTj7iIDeFFHGUjSAI69tsa
         zugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682580936; x=1685172936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDYJVna9fwgZouc742hq3janvmGHmyu/RZqxVMr7O4o=;
        b=VaFrd/mPA0miMNRs4BQZBDDxG1TbDdGSNP83rvisWPyytIgXoDQNAOaPM/ETTNeV/o
         s6NRMMaAPgp6yCXUidV2an6wX9fzXXSa3MxhtjMk49ZyFtCP/FxRieoYAFMZVH/cy6Mf
         ML9Qias+SU9FbJaQ2b52j5+kHASznCwfPsYA6WLrZpAv0PC/pk+TZfU4ghbJrBByER+J
         qur0Q1eQxQgkatDUZ6hTaWt3b7YHa6RkwRhTFldyKHFh/zrSykWx+8wxnU6tq/9w+uqd
         qaoLlWIGhOnKUys8Stx7SbmKf2VJUMJq9wZl0iVQSudpo+voMCwddye6zj8Gb2Mn5SFq
         5B4A==
X-Gm-Message-State: AC+VfDz8nQzBtwHTGtdxFM9olTBGrfi80ijbgvvdqLrJ5VhwIgg+gaC0
	PFhZ3cuqE6iag1XWCdBPVeQIRwASTP8=
X-Google-Smtp-Source: ACHHUZ5bDxiutF/XwJNTYr7AtzQNcZBBf6rXHuTdFqmM0J9JwUcgoldZmvwpSYFMEXZdPkEdLyRpiA==
X-Received: by 2002:adf:efca:0:b0:2ef:eba4:e208 with SMTP id i10-20020adfefca000000b002efeba4e208mr520789wrp.45.1682580935635;
        Thu, 27 Apr 2023 00:35:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id r4-20020adfdc84000000b002f598008d50sm17678411wrj.34.2023.04.27.00.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 00:35:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/5] insane.bbclass: add a RECIPE_MAINTAINER check (oe-core recipes only)
Date: Thu, 27 Apr 2023 09:35:26 +0200
Message-Id: <20230427073528.3956414-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230427073528.3956414-1-alex@linutronix.de>
References: <20230427073528.3956414-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 07:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180477

Absent maintainer entries are as well a frequent source of friction, as they are checked
only in selftest, and so aren't revealed until autobuilder runs.

The selftest is retained as it also checks for obsolete entries in maintainers.inc
(not possible to do in insane class).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/insane.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 64ad76c48e9..0847fb0807a 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1499,7 +1499,19 @@ python do_qa_fetch() {
             else:
                 oe.qa.handle_error("missing-metadata", "Recipe {} in {} does not contain a HOMEPAGE. Please add an entry.".format(pn, fn), d)
 
+    def test_missing_maintainer(d):
+        fn = d.getVar("FILE")
+        if not '/meta/recipes-' in fn:
+            # We are only interested in OE-Core
+            return
+        pn = d.getVar("PN")
+        if pn.endswith("-native") or pn.startswith("nativesdk-"):
+            return
+        if not d.getVar('RECIPE_MAINTAINER'):
+            oe.qa.handle_error("missing-metadata", "Recipe {} in {} does not have an assigned maintainer. Please add an entry into meta/conf/distro/include/maintainers.inc.".format(pn, fn), d)
+
     test_missing_metadata(d)
+    test_missing_maintainer(d)
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.30.2


