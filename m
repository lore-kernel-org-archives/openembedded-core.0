Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE23C46CA3
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:07 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.91941.1701080281948514879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SEFu5qXb;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5482df11e73so5335213a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080280; x=1701685080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xlDfQbiq4+FgLzsxvLlZ6IiT7sBqSGXHvk6gVCJG6GU=;
        b=SEFu5qXbamGkLJYmfxCh3jWyaqNRRGKcunEIvOtmYAytrZBSh2/Z+JhoV38gRKN4at
         L0Jf9P/Np7yAEpsOw0/IwPMk8mRvftutTCWj1WcLXW0u5JQMBK3e2Zo3wM2aOk/Pol8p
         v+Gla1rFoCNAym5EOSHe+7M7AZI1C1BOvWOdlO2MT2I0JQZ7a/wP3KGo+IxS0j3jVy54
         W88uR3txyT7TpjjbwdjHaNxWiy70RuGaOw7Ukdbqs1/Pw0FPFjIbSva3kSQPcX2DAh7D
         KoUy/Je3hpQoG5X6iW1P8SzB34pjPpTJ8w6mtRzbGXbKIilfGYPfEyblYOF+IiQdRcwe
         PU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080280; x=1701685080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlDfQbiq4+FgLzsxvLlZ6IiT7sBqSGXHvk6gVCJG6GU=;
        b=slKfsiMY021q2rUAtQd8JCyuQpokvhK/t5qFu3HGQE6WsDBnjbzeGFPy5vHofrCCR+
         tuPqfyfR0LTQys6wwc7wVUVa1vSgw/IbsBxgDWsScpsB7Ixqalm3obvSrC4w32awdWUQ
         TP5TuYoh5iJRlG5KAU86aYzTLSE15J18V5fgIBId8l/McmhEOx+AjyQTHzZF/l7La1D5
         88KN5Ql51Q13p9MZhtHfFrF4iOh9KmNd4uGjzcj25LuzHnRtotiBkdB90tSJ0eYKPELq
         +sX2Uh7XLHjm4w4h3VSFqGbp7ZRWfTQ4DIQ88oI7tVektx2/pwAPjWCVZAoB7BHg+FVU
         DNEQ==
X-Gm-Message-State: AOJu0YzNkWxPSrryDybVM4V8gn2L3WuQBrdifF5KQNKpg2O1aNKVIdm9
	q0GCHGflE/zMaG7PEBuei4+vB2vmGfQ=
X-Google-Smtp-Source: AGHT+IE2VUOizSYnzd2XKAySjqqhWwhVaSPE0UgPmFnmny8UU/vOnIdPRHxsPa6Jd5jBrc7ChbP2cQ==
X-Received: by 2002:a17:906:2b42:b0:9dd:7ccf:77f8 with SMTP id b2-20020a1709062b4200b009dd7ccf77f8mr6744150ejg.20.1701080280102;
        Mon, 27 Nov 2023 02:18:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:17:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/19] sstate.bbclass: setscene_depvalid(): do not exclude shadow-native from task dependency resolution
Date: Mon, 27 Nov 2023 11:17:33 +0100
Message-Id: <20231127101751.3187950-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191268

This results in executables from shadow-native, such as useradd, falling through
to host libraries instead of using native ones that they were linked with,
because the native libraries would not be installed because of this dependency
exclusion.

Until now that could be coincidentally fulfilled with host libattr (which is
present on all hosts), but latest useradd also wants libbsd and libmd, and those
are not typically installed.

The original reason to add this exclusion was:
https://git.yoctoproject.org/poky/commit/?id=0d2a301bca4eb9d43243f1a03c1cd1ab3f27f30a

While I can't be sure the reason no longer applies, sstate and sysroot handling
has changed massively since early 2013, testing on a-full revealed
no issues, and avoiding incorrect fall-through to host libraries
is better than pulling unneeded dependencies.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 5b27a1f0f98..4f49d8f9f8c 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1119,7 +1119,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
 
         # This is due to the [depends] in useradd.bbclass complicating matters
         # The logic *is* reversed here due to the way hard setscene dependencies are injected
-        if (taskdependees[task][1] == 'do_package' or taskdependees[task][1] == 'do_populate_sysroot') and taskdependees[dep][0].endswith(('shadow-native', 'shadow-sysroot', 'base-passwd', 'pseudo-native')) and taskdependees[dep][1] == 'do_populate_sysroot':
+        if (taskdependees[task][1] == 'do_package' or taskdependees[task][1] == 'do_populate_sysroot') and taskdependees[dep][0].endswith(('shadow-sysroot', 'base-passwd', 'pseudo-native')) and taskdependees[dep][1] == 'do_populate_sysroot':
             continue
 
         # Consider sysroot depending on sysroot tasks
-- 
2.39.2


