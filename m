Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAA2C433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 11:12:04 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.10706.1636456324123869822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 03:12:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fo9ppBYl;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id b12so32320454wrh.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 03:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BFMeESYu+CzIMuWBYMeIN78x6UVyAyedy36l/Mz3Dr8=;
        b=Fo9ppBYldjTnRvX/s0SUz28yT7LEOzJWVRO3H2Mub9JZ0BjAe5T1rQOjxpxioNlXMw
         3ibIaKRN8FZJt01+S86BmcLW16KsQUnHVDSPSQPqm+5BxsnMzbBFFa9i3mA+tCZVr02R
         zP13h/S32rhea2EWjVCEJ33Q10rBlb3EsyT2JLp7GSHQWaDM2Ogg++yAfUpco1FIL0kD
         iZ6/Toi2eeg+HLO7z94RR7DdLI8o4i8tz+mW6x6UVOBFzwGZQuluGhif2kOwGHyTMihd
         IgsAiyQOhfaB0mbRkncvnMaIFXdOH7nLpLLmr5e4wfOsbiK6f9m0FYc3Gw+3MMTt3MAk
         LPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BFMeESYu+CzIMuWBYMeIN78x6UVyAyedy36l/Mz3Dr8=;
        b=rSs7PGxhxJKx0yYXvVw3DcjLiusA7PoxY6wk0h649u6DSo0fOoxs7d+J3yf52viL3E
         lVyAMjpqhQQCxoLS/+euLmb8/DQB+JUNEK0C5ACj5rfGBOhZEpijmGJLgj0geSC6Qjs1
         l2rWS7Xk/4Vf6v1cnsHkL7OdLFMsk+BUNnPSXNkPq3/w0MROLPXEbJPEH43Qq6/Pl1Qy
         qQyMc3uB+4oA0NP5Lkv7BdWsnxS1m04Om0rbRYa3/R6S8P+A3mJ8JXDSDyHl9lQE7c0I
         enMAM1wX+x3Q9byoZE7orIYZMBZwBFsisMJB7GXltT6TJJm3SHJ8JVRwAS+7vzJU3hnG
         MJAw==
X-Gm-Message-State: AOAM530IG2KaqwV0WBeOT1R2X9QCzoWs/0o2uCBmtRqz5m0h6Qd08ebi
	UQtYRAnTbQe/PjAUTgEuqg8A5ORUuz4=
X-Google-Smtp-Source: 
 ABdhPJzUdCEzP3e4cDeioyFgNjcb9l8EG/ZS+BhYamXECVznBuza9T0eX3Th2Nj1Z3oT+r1MHQMM0A==
X-Received: by 2002:a5d:5244:: with SMTP id k4mr8406207wrc.77.1636456322411;
        Tue, 09 Nov 2021 03:12:02 -0800 (PST)
Received: from CTW-01195.. ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id
 c16sm19043389wrx.96.2021.11.09.03.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 03:12:02 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 3/3] sstate: add a function to get the sstate file name in
 sstate_checkhashes
Date: Tue,  9 Nov 2021 11:11:48 +0000
Message-Id: <20211109111148.136675-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109111148.136675-1-quaresma.jose@gmail.com>
References: <20211109111148.136675-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 11:12:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158013

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 88bd84a06c..0a78a2fb69 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -934,12 +934,13 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
 
         return spec, extrapath, tname
 
+    def getsstatefile(tid, siginfo, d):
+        spec, extrapath, tname = getpathcomponents(tid, d)
+        return extrapath + generate_sstatefn(spec, gethash(tid), tname, siginfo, d)
 
     for tid in sq_data['hash']:
 
-        spec, extrapath, tname = getpathcomponents(tid, d)
-
-        sstatefile = d.expand("${SSTATE_DIR}/" + extrapath + generate_sstatefn(spec, gethash(tid), tname, siginfo, d))
+        sstatefile = d.expand("${SSTATE_DIR}/" + getsstatefile(tid, siginfo, d))
 
         if os.path.exists(sstatefile):
             found.add(tid)
@@ -1000,8 +1001,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
 
         tasklist = []
         for tid in missed:
-            spec, extrapath, tname = getpathcomponents(tid, d)
-            sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(tid), tname, siginfo, d))
+            sstatefile = d.expand(getsstatefile(tid, siginfo, d))
             tasklist.append((tid, sstatefile))
 
         if tasklist:
@@ -1028,12 +1028,10 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
     if "toaster" in inheritlist:
         evdata = {'missed': [], 'found': []};
         for tid in missed:
-            spec, extrapath, tname = getpathcomponents(tid, d)
-            sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(tid), tname, False, d))
+            sstatefile = d.expand(getsstatefile(tid, False, d))
             evdata['missed'].append((bb.runqueue.fn_from_tid(tid), bb.runqueue.taskname_from_tid(tid), gethash(tid), sstatefile ) )
         for tid in found:
-            spec, extrapath, tname = getpathcomponents(tid, d)
-            sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(tid), tname, False, d))
+            sstatefile = d.expand(getsstatefile(tid, False, d))
             evdata['found'].append((bb.runqueue.fn_from_tid(tid), bb.runqueue.taskname_from_tid(tid), gethash(tid), sstatefile ) )
         bb.event.fire(bb.event.MetadataEvent("MissedSstate", evdata), d)
 
-- 
2.33.1


