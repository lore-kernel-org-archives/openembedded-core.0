Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88515EB64DD
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 10:33:50 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.3584.1691231622124718235
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Aug 2023 03:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MZ2kuQYe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fe4cdb72b9so7481165e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 03:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691231620; x=1691836420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=py2LaL4nNQbQPDk/zfCBkELq4QMdqMyaBflhG1IIj1Y=;
        b=MZ2kuQYeTIsY3/b4G2bid/X9wOBEDD6A6gGolmWZrVvtP3zGUZcuRzlrUZoM+D0y5P
         sshZpbCOSW+PEaLBZegWGE7rA3/GKDJE6QsEL8o1XD9MDw7QKj86Ur0enAyBOuEX6IJk
         hPfEjFikT4Pvx8m/eWVb48Z1H54tAKtkpCuIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691231620; x=1691836420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=py2LaL4nNQbQPDk/zfCBkELq4QMdqMyaBflhG1IIj1Y=;
        b=kK9WxytzkcveGL2j+MC6NMvVBSvXz1envqM/bKsI2WgU1xnO3WW6icmPRrC7eTOtGw
         KgjTP39MnvmKp1InynUdMPbLHQbzdDe+ML71JkJQnAi8ntrJhkqUdMJNf/KtfimrJXb+
         EjFo5tAOftp16VY/OiyMh4WOnBrbUBogfEshn+Dednoc81yap2sXn0qrkkPG+9svNO7Y
         WHYkLmJ+4cPhamWtUVhHdEzxkb4PN1PxzgfGQecTuedVKMo4BRUvtk4f52704K8z3HOl
         sbhisBkHmqK/ZKr3aYGIAZoDHYi4MryFwmkUzUhg7ugk1Bapi3smHUE/YFG9YHftJ5q8
         6qfA==
X-Gm-Message-State: AOJu0Yxl2SCizsLzNIl1UpShgvu4F884FsAmXbv/TMekeDRsehX0Pb4N
	ytSXciv8qsBrPUd++Pd1LHWmtrozSgcl6k5+xlQ=
X-Google-Smtp-Source: AGHT+IFP39CAnQbcrKFLBytGRP6RvEB7jHrOJp9slvwjLTbZvzof1fOD4fyJ1lHvnAnDz+ydqVUu/Q==
X-Received: by 2002:a7b:c5cc:0:b0:3fb:bc4a:46ad with SMTP id n12-20020a7bc5cc000000b003fbbc4a46admr3140120wmk.9.1691231620097;
        Sat, 05 Aug 2023 03:33:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1adf:6477:9da8:f35a])
        by smtp.gmail.com with ESMTPSA id f21-20020a7bcc15000000b003fc01f7b415sm8905391wmh.39.2023.08.05.03.33.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 03:33:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstatesig: Update to match bitbake changes to runtaskdeps
Date: Sat,  5 Aug 2023 11:33:38 +0100
Message-Id: <20230805103338.2649143-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 10:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185549

Bitbake has changes to runtaskdeps in siginfo files to fix bugs in being
able to locate them for sstate and hash debugging purposes.

This patch updates to match the changes to the format.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index f943df181e6..633a0fd4502 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -215,6 +215,9 @@ class SignatureGeneratorOEBasicHashMixIn(object):
     def dump_lockedsigs(self, sigfile, taskfilter=None):
         types = {}
         for tid in self.runtaskdeps:
+            # Bitbake changed this to a tuple in newer versions
+            if isinstance(tid, tuple):
+                tid = tid[1]
             if taskfilter:
                 if not tid in taskfilter:
                     continue
@@ -321,11 +324,12 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     if not taskname:
         # We have to derive pn and taskname
         key = pn
-        splitit = key.split('.bb:')
-        taskname = splitit[1]
-        pn = os.path.basename(splitit[0]).split('_')[0]
-        if key.startswith('virtual:native:'):
-            pn = pn + '-native'
+        if key.startswith("mc:"):
+           # mc:<mc>:<pn>:<task>
+           _, _, pn, taskname = key.split(':', 3)
+        else:
+           # <pn>:<task>
+           pn, taskname = key.split(':', 1)
 
     hashfiles = {}
     filedates = {}
-- 
2.39.2


