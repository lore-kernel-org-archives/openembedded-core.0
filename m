Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F95AC7EE2E
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 19:39:06 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.3682.1686253144800114845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 12:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WndfXyN5;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-75d509d425eso96877185a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 12:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686253144; x=1688845144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k4/SfOvPt7lO093Ot2fn3+yrQJFzCpUdCRi3ZefZS9Y=;
        b=WndfXyN539vn7ti7KEtaCIpuQYjXgT+dfUzyvndGqMUMXFGHZE2J5rgxW2pVzuB9uX
         RUNi4TdOwOqaRDaJCR1ye1SF/7TtnyO75CeG0bhQ4tISDJK2DqcX7Dg5KAt76ZI0KEyD
         4agCS0kAZJiOqpHr1KTvm7IVNG67nKO4bqG5pNSMTLMkXM3CkM1jp9EZ79ncnJ6UWZhk
         NKPM6NlrEh77xlQ9uvO7/qWzYt/9bhk+lZn4IpWkBAj1JXHlhIBMiehqeJL5nykUrXwy
         YlYDnYbsxAeMBJEwuzYGD1ZbnbQ0W+G/cX6Itsd3NYwB4bfC+UkOyEXaCX0E7d6EyGuY
         fXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686253144; x=1688845144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4/SfOvPt7lO093Ot2fn3+yrQJFzCpUdCRi3ZefZS9Y=;
        b=bO3ZumEFN88J/oF8hAg+3i1OFw6+XHGlYXve1FiSlNbziSyVAzzOKfiBoToohD3JPm
         DVyiQa8oL/rFJ9dOKqQlR36vFkVCHm5USys1JcHOHHYJY24XoILlzrR6kA7mctrzHWrs
         lDRU+xZ1E305Yjg5qM4o3FeU52/GpLl97kl1y9OV7jIHqbVYmuW7MvCqb/iXZS3SAIJd
         +T5TvjM7TIaJlXPM6HUINYEaRH8PTErh/WnWau6Bj3XdhVCbqDiIwpSSaE0Cawj1NFMB
         3PGLZtymvbO5YNqZkLJxasLvANww3gKTgnVvRISUdHlcPKbpVSNIQhkIqri7FgzO+XuC
         O9xg==
X-Gm-Message-State: AC+VfDz9UrPI9c62jHdTHxz8p1yufZXFf4mHbK6rnU2v92aM63pEiqJA
	wuA4vlFdKCL688Vxx6+f5nI=
X-Google-Smtp-Source: ACHHUZ6qlFGAllQoYZCHoCJ0Gb5g4xLV0PkuWRaPgeHObDjmSQj6g9LoaVRzRSOnNsS1WDmrCV7d2A==
X-Received: by 2002:a05:620a:6548:b0:75b:23a1:44c with SMTP id qc8-20020a05620a654800b0075b23a1044cmr5576143qkn.18.1686253143794;
        Thu, 08 Jun 2023 12:39:03 -0700 (PDT)
Received: from build4.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id c24-20020ae9e218000000b0074df2ac52f8sm555893qkc.21.2023.06.08.12.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:39:03 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] qemux86/conf: TEST ONLY. Drop smp boot
Date: Thu,  8 Jun 2023 19:39:00 +0000
Message-Id: <20230608193901.363242-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 19:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182520

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We are seeing intermittent boot hangs with x86. Once of the last
messages in failing logs is secondary cpu startup.

Dropping us down to smp for testing to see if the hangs start to
go away with smp removed.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/machine/include/x86/qemuboot-x86.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf/machine/include/x86/qemuboot-x86.inc
index 6ae03633ae..54a12119a7 100644
--- a/meta/conf/machine/include/x86/qemuboot-x86.inc
+++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
@@ -1,6 +1,6 @@
 # For runqemu
 IMAGE_CLASSES += "qemuboot"
-QB_SMP ?= "-smp 4"
+QB_SMP ?= ""
 QB_CPU:x86 ?= "-cpu IvyBridge -machine q35,i8042=off"
 QB_CPU_KVM:x86 ?= "-cpu IvyBridge -machine q35,i8042=off"
 
-- 
2.39.2


