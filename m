Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1A1C7EE25
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:23:54 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.39153.1683653030511985163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PGjTmM4I;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-965e4be7541so944394866b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653029; x=1686245029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6ixIkxc9Do+FmH8KnJ3mBqQZEZPCdXb76jEH42PZog=;
        b=PGjTmM4I1yhzghrrFGvCi9sQlhOO0pAwSLL4ffJHRWFjxQ8ou6UTwkGCTfsHjpenki
         GThrOWnD9mkd7VC1SK8DSJy+pJUVv+OqUD4sIez4zGrPNWgxiNwKiHnTOdgVC+nfmRK/
         pCXHmOtRa3Cg/IklnbN2PSfEgq94jbeInq44EZYbbIcGgysHHQ73iFr0aWWUtmdpBpCn
         J7LFbnRzYTV8z3HuHiajXt+kWawDZMjnm0TLQOalF9kLgutukW+OyZi/IJUH+N5w7/cq
         UBrwXshgmsidEhLCiU/Eiurg+Rc8DWA5F1ICNOiVCAStvJLRpQlwvzWTKDMSycCsjRqp
         pQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653029; x=1686245029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6ixIkxc9Do+FmH8KnJ3mBqQZEZPCdXb76jEH42PZog=;
        b=EKp32vcP5wzrq4riLQHcwI7PIcm+NwM+NPxWqrVRc9IWlKsuDeHHmmCbHr4CM0BMqh
         1mXXQ0/Gx3Ksded7lUled+Q9MWdD7bWQBmQm4qKMREnhDsGSygWA4UsToB6IUHnHI1Bo
         RAbcYam4qTnZzqJ8vfTzxeM3ExCI7Pg5OXL3Up2zQHPEaLqi+OQvyttA6C4rCfxogXIt
         Qlz+sehDM4++8DTlEVDqcVbGz/18SbsqvyZ0798TolDzMN8xDITj2upeTfNTw9sH6Kss
         UAGscKkLuZX1y/ZZks4BYsuGYcla7adRrrZ6fBmrNR5dA/5sskTUkV/BPJe7xCgplCi3
         Y9Jw==
X-Gm-Message-State: AC+VfDzUKZa/6r1msU67M3IbbQzzN/hn6UZB8NQa37CJtuu+wf6R6G9H
	u24seN2liabxZu26RgKgho9leQdwCLU=
X-Google-Smtp-Source: ACHHUZ7+b9iHZxs+N/5NpF9lN4qOHvjJNf0iSaHzxm7pMni5pY113zR4hmMNNrK1S2b92oXwxU57oQ==
X-Received: by 2002:a17:907:36c1:b0:94e:e082:15b2 with SMTP id bj1-20020a17090736c100b0094ee08215b2mr12753893ejc.55.1683653028806;
        Tue, 09 May 2023 10:23:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:23:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/27] insane.bbclass: add a RECIPE_MAINTAINER check (oe-core recipes only)
Date: Tue,  9 May 2023 19:23:19 +0200
Message-Id: <20230509172344.1516743-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181057

Absent maintainer entries are as well a frequent source of friction, as they are checked
only in selftest, and so aren't revealed until autobuilder runs.

The selftest is retained as it also checks for obsolete entries in maintainers.inc
(not possible to do in insane class).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/insane.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 632f738c86d..50f60337cc4 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1492,7 +1492,19 @@ python do_qa_fetch() {
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


