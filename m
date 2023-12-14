Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CD9C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 13:46:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.22367.1702561568431675765
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 05:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E2/BNBuH;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40c317723a8so72267825e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 05:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702561567; x=1703166367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSIOQHxTW7Q1ug0nYc2sFbb8sNYhkwypp10lmfNd4UQ=;
        b=E2/BNBuHjWTb/2semOz2A1nJBKY3MQeK/eUUP7xrJSu1oGwJ9dOtWkkS0rCrMH/SB5
         MyD5wCPbY81A4jPn2EGEoQluuX3YYQbweLzs/NcszIpTOMTka4AWVe5gkeQN5nDqoldN
         AgaUkCKpuNIK1l6SMjwkTsSANCVgMbWQCuZmM7zR8jIp4eQkqXYZEssz/nBvkeYtYuFR
         s1X1KPcXEvDvFY0XLkxI6Ty98MP0G7lRvgQKlrDsHtnXyhVFoSYADHvAv4B16B2EE407
         p5NjitiJaMSCtgedkAHoSONy1LBDYEc/cMi0WwPjQN5uN4ZfBOOzBGoa+bFSvtzZVup2
         2bxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702561567; x=1703166367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSIOQHxTW7Q1ug0nYc2sFbb8sNYhkwypp10lmfNd4UQ=;
        b=Ka1YnzmTzxMEVXuZQiN1zOyRgeg/oU1MhuCSu02tftxr9j03lYbj/5wuoCG5utCqQj
         sK0ifLiR/zqC8s4CtXaWdqgkDGiB56PKop1H1p281BbcL2kzEX2XQ1/6czHUOE6ZSZj1
         /nBdnLe383YnqLJgdkc5G4L7c7YBMZ4VbvMzimERebQkDXdGucZ1oxNTC0VkdB/+uRjU
         hYacNsSjesKonxjeA8LYVXUGvsEsHyBqqsxemc+n6ZRCi/7gSz47zE822MFjE/qdeATB
         i+DDeuzRzF7Nl3JelCnoY477P8TU3RXymVhkHP9UKT9O5Um50L50wPYxInnntiOSuO/x
         Z3WQ==
X-Gm-Message-State: AOJu0YwkukoOAoLHgNUo115sisctvhqwVROJ1oJjY/4jzgSHoVEtHDMO
	6HLZaT85JUUKRk6K1ip1DL8ckpHJwpM=
X-Google-Smtp-Source: AGHT+IHOIjbFvMof4RT0277Qyg++xwfrHR819JEo8d6KdBIWdHkfjKd6pwfRDNjHA7rDnp6faPrKYA==
X-Received: by 2002:a05:600c:21c1:b0:40c:78c:f864 with SMTP id x1-20020a05600c21c100b0040c078cf864mr4685164wmj.16.1702561566871;
        Thu, 14 Dec 2023 05:46:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c1d0f00b003feae747ff2sm27293710wms.35.2023.12.14.05.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:46:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/9] bitbake/runqueue: rework 'bitbake -S printdiff' logic
Date: Thu, 14 Dec 2023 14:45:23 +0100
Message-Id: <20231214134528.1973602-4-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231214134528.1973602-1-alex@linutronix.de>
References: <20231214134528.1973602-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 13:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192374

Previously printdiff code would iterate over tasks that were reported as invalid or absent,
trying to follow dependency chains that would reach the most basic invalid items in the tree.

While this works in tightly controlled local builds, it can lead to bizarre reports
against industrial-sized sstate caches, as the code would not consider whether the
overall target can be fulfilled from valid sstate objects, and instead report
missing sstate signature files that perhaps were never even created due to hash
equivalency providing shortcuts in builds.

This commit reworks the logic in two ways:

- start the iteration over final targets rather than missing objects
and stop at the first invalid object (1)

- if a given object can be fulfilled from sstate, recurse only into
its setscene dependencies; bitbake wouldn't care if dependencies
for the actual task are absent, and neither should printdiff

(1) there's a further improvement I'd like to make here: instead of
stopping, recurse into dependencies, with the goal of finding and reporting
the 'root' invalid objects. Otherwise tracking down the difference to its root
relies on finding the most 'recent' signature in stamps or sstate in a
different function later, and recursively comparing that to the current signature,
which is unreliable on real world caches. For the sake of fixing the test failures
I'd like to not delay the patchset any further for now.

[YOCTO #15289]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 bitbake/lib/bb/runqueue.py | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 1f59d18b71a..61effe24fae 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1717,35 +1717,34 @@ class RunQueue:
                     valid_new.add(dep)
 
         invalidtasks = set()
-        for tid in self.rqdata.runtaskentries:
-            if tid not in valid_new and tid not in noexec:
-                invalidtasks.add(tid)
 
-        found = set()
-        processed = set()
-        for tid in invalidtasks:
+        toptasks = set(["{}:{}".format(t[3], t[2]) for t in self.rqdata.targets])
+        for tid in toptasks:
             toprocess = set([tid])
             while toprocess:
                 next = set()
                 for t in toprocess:
-                    for dep in self.rqdata.runtaskentries[t].depends:
-                        if dep in invalidtasks:
-                            found.add(tid)
-                        if dep not in processed:
-                            processed.add(dep)
+                    if t not in valid_new and t not in noexec:
+                        invalidtasks.add(t)
+                        continue
+                    if t in self.rqdata.runq_setscene_tids:
+                        for dep in self.rqexe.sqdata.sq_deps[t]:
                             next.add(dep)
+                        continue
+
+                    for dep in self.rqdata.runtaskentries[t].depends:
+                        next.add(dep)
+
                 toprocess = next
-                if tid in found:
-                    toprocess = set()
 
         tasklist = []
-        for tid in invalidtasks.difference(found):
+        for tid in invalidtasks:
             tasklist.append(tid)
 
         if tasklist:
             bb.plain("The differences between the current build and any cached tasks start at the following tasks:\n" + "\n".join(tasklist))
 
-        return invalidtasks.difference(found)
+        return invalidtasks
 
     def write_diffscenetasks(self, invalidtasks):
 
-- 
2.39.2


