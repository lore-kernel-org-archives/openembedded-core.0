Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C4DCDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 11:25:50 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.25238.1697714748942075768
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 04:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JcrMpXSQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53da72739c3so12910321a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697714747; x=1698319547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nw8y6/W9Mq6OTNjIsqd+rz+wY7jEa9Lk8Lv+ScMRYJc=;
        b=JcrMpXSQVxdIPF3QJ4DqKCEUPb13MN44WZKLQSqE5O3b4FOcSprBFwnY5jTS+s4lWy
         L6qImKkIKSwAfkjseEHTpRoq05+USrCb6HOXA8St8SRhwdWyrcuhFsU/cn1ZHfhjDB8b
         G4nW9mG2Nn9BhhORzPopOtVsCM9DlRkAywlYLdv9VAePT5yoFD/14LZGJBXRwVQtuefW
         lUk2B9p3zAHictbyHyuCuK0SNVcg0Q6Yw/t18u97Fa3s+GwuXgFvGPEliOaqauGCOhsc
         e/OLfVOMRPZFxEK/7iU4K8jJpu6qWaFx3p/m6zTGh8EhR+Ro21IY/XmYuAPW5bL7/A4r
         g/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697714747; x=1698319547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nw8y6/W9Mq6OTNjIsqd+rz+wY7jEa9Lk8Lv+ScMRYJc=;
        b=j8mamKRz/aMiQTfd2EbgtWq9BEkLPnud4bcuxrNyqZp6sJl8tKshABpOkKpMHlDqHv
         om1sjymPrKVUdi6eDYEYvxNNkUpwtvtFVBjDfh9WOG14B1HZ+O6g4/Atp7OlMZ05m1af
         pWTcqHuU8fzqfWCRunrmTwKt/iQ5EaNC/uRommhDGzHc7+DGSjWLEoDRjD6U6GQ+Hj7z
         w6G6zG8liaXxVEdzyB6aPPingtpzbZk/Q8q4KzucvzXX+EIjHIviaQmOvnucyvH3U+BU
         UG5M9upvEWCSMYO4Qz14cb3xcXsiXvk9W7i8L5SkByi2zA9N4wFlOT6ephJ7Wu6Wb3hM
         phEA==
X-Gm-Message-State: AOJu0YwH/NljHkF5LQJjSViaPKlKeUgV7MbzGDPycol7MGMgVdqNYYb8
	8ifjSTRx40877uk3eLw7JS6uAKn6vT8=
X-Google-Smtp-Source: AGHT+IFeIe2cvQsI6SsQlLdkl+bn+l06y9Cq3lL5Iz4fw2xhAU1wc6yjsYoDQRO/uiOnCFv6Si+0Zg==
X-Received: by 2002:a17:907:706:b0:9be:bf31:335b with SMTP id xb6-20020a170907070600b009bebf31335bmr1549795ejb.73.1697714747037;
        Thu, 19 Oct 2023 04:25:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bt10-20020a170906b14a00b0098884f86e41sm3276642ejb.123.2023.10.19.04.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 04:25:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2] selftest/buildoptions: tag the download mirror test with 'yocto-mirrors'
Date: Thu, 19 Oct 2023 13:25:42 +0200
Message-Id: <20231019112542.2905746-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 11:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189447

This will allow bundling all yocto mirror tests together, both for
the purposes of running only them specifically,
and excluding them from 'general' oe-selftest runs.

There is an upcoming test for sstate cache served over content
delivery network which will use the same tag, so it can be run
together with this.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 104448442ad..31dafaa9c50 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -14,6 +14,7 @@ from oeqa.selftest.cases.buildhistory import BuildhistoryBase
 from oeqa.core.decorator.data import skipIfMachine
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
 import oeqa.utils.ftools as ftools
+from oeqa.core.decorator import OETestTag
 
 class ImageOptionsTests(OESelftestTestCase):
 
@@ -204,6 +205,7 @@ class ToolchainOptions(OESelftestTestCase):
         self.write_config(features)
         bitbake('fortran-helloworld')
 
+@OETestTag("yocto-mirrors")
 class SourceMirroring(OESelftestTestCase):
     # Can we download everything from the Yocto Sources Mirror over http only
     def test_yocto_source_mirror(self):
-- 
2.39.2


