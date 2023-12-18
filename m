Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116F9C4706C
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 08:44:24 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.40233.1702889057294171911
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 00:44:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PiIlKsdu;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a234205785dso119417866b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 00:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702889056; x=1703493856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKH98MYBC6ceZUzA3zyk4IIY+pdooUGAOo7iJfRaySc=;
        b=PiIlKsdup0Auz0ieTJUa/3XkvjdEZx+YjDnoFiYdtsukYP/TNhcpkAs+z2fb844mU6
         tzHN81UJLSX+eePoBO36K0Zwe7KaTAGlwZ1AIonUC3sCkT/m4wyyjDqbxs3CdD8yS0X/
         ybxRLzPUABG14mI34xUnSRgoOyfBID6haxRbI+B0oJS8758cJpTMwC9x1tYZeMU7ylYS
         I1swZjVak0dZ+yeFNCd5rswqOSIoG8o3cHTEo1oozRyX5btaHckSWjOTwfF6PYdVyNGp
         MmyQgk/1i+cXqqsOfNuR18cHZp6yBPkk4VJbBKk0o4m9VoNc2PT+tI9afs3seyV96dgs
         OFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702889056; x=1703493856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKH98MYBC6ceZUzA3zyk4IIY+pdooUGAOo7iJfRaySc=;
        b=AA3SJm/LjLwxQ4mC+PhBKFhYogom1WMTdNKGShcoTvn0e/RFtnXoiEv7kw4wjDCnA9
         Z5e7hxWgxpKf5ZkmJU0ON2y4GgFRnLGUE2K96xIVDnonyVSzp1Ze8BZpETxalSjzlhLk
         Y6CuDJqjLkZ39ViP92YmzX/X96+u+WzYUTogCIZssRUA1OXqb3vkIGY4Qz6ymEidok0a
         8uiH9vg3c7XJvYAoMtepbPWKUMK2uZWO0iqyBLbixZIueT4uaJ8EZ4cHNrwsH2uU2YWX
         CFxWg2E6pE0Qd8aY2dyKVWwnt8Vtk1FOWjApBcaK+LNzZZG9lBhIpLRLx8Z5Utj29nA0
         CqGA==
X-Gm-Message-State: AOJu0YzEYv4MzUBJuKjMIy4xjU4XHeYhqhA7BOzy5GNOaLYTglESpiEz
	Xg9dRYIRRtwQ2EfixdCL/qiFYQ3HLVw=
X-Google-Smtp-Source: AGHT+IH9Ypp6oK2aWfYqEDqzUqTWpDbnaOUIYJ6C5uiEnzKtUnUZMg723g1DM0xrPOUWyXnGhKv2HQ==
X-Received: by 2002:a17:907:720d:b0:a19:d40a:d222 with SMTP id dr13-20020a170907720d00b00a19d40ad222mr4798625ejc.238.1702889055555;
        Mon, 18 Dec 2023 00:44:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id vt6-20020a170907a60600b00a1ce98016b6sm14016299ejc.97.2023.12.18.00.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 00:44:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/7] bitbake-diffsigs/runqueue: adapt to reworked find_siginfo()
Date: Mon, 18 Dec 2023 09:44:00 +0100
Message-Id: <20231218084403.599015-4-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218084403.599015-1-alex@linutronix.de>
References: <20231218084403.599015-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 08:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192614

In particular having 'time' explicitly used as a sorting key should make it
more clear how the entries are being sorted.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 bitbake/bin/bitbake-diffsigs | 11 +++++++----
 bitbake/lib/bb/runqueue.py   | 10 +++++-----
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/bitbake/bin/bitbake-diffsigs b/bitbake/bin/bitbake-diffsigs
index fe0f33eea17..a8f49191b0c 100755
--- a/bitbake/bin/bitbake-diffsigs
+++ b/bitbake/bin/bitbake-diffsigs
@@ -72,13 +72,16 @@ def find_siginfo_task(bbhandler, pn, taskname, sig1=None, sig2=None):
         elif sig2 not in sigfiles:
             logger.error('No sigdata files found matching %s %s with signature %s' % (pn, taskname, sig2))
             sys.exit(1)
-        latestfiles = [sigfiles[sig1], sigfiles[sig2]]
     else:
-        filedates = find_siginfo(bbhandler, pn, taskname)
-        latestfiles = sorted(filedates.keys(), key=lambda f: filedates[f])[-2:]
-        if not latestfiles:
+        sigfiles = find_siginfo(bbhandler, pn, taskname)
+        latestsigs = sorted(sigfiles.keys(), key=lambda h: sigfiles[h]['time'])[-2:]
+        if not latestsigs:
             logger.error('No sigdata files found matching %s %s' % (pn, taskname))
             sys.exit(1)
+        sig1 = latestsigs[0]
+        sig2 = latestsigs[1]
+
+    latestfiles = [sigfiles[sig1]['path'], sigfiles[sig2]['path']]
 
     return latestfiles
 
diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index f54d9b85541..72d2feab27a 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1768,7 +1768,7 @@ class RunQueue:
 
             recout = []
             if len(hashfiles) == 2:
-                out2 = bb.siggen.compare_sigfiles(hashfiles[hash1], hashfiles[hash2], recursecb)
+                out2 = bb.siggen.compare_sigfiles(hashfiles[hash1]['path'], hashfiles[hash2]['path'], recursecb)
                 recout.extend(list('    ' + l for l in out2))
             else:
                 recout.append("Unable to find matching sigdata for %s with hashes %s or %s" % (key, hash1, hash2))
@@ -1782,14 +1782,14 @@ class RunQueue:
             h = self.rqdata.runtaskentries[tid].unihash
             matches = bb.siggen.find_siginfo(pn, taskname, [], self.cooker.databuilder.mcdata[mc])
             match = None
-            for m in matches:
-                if h in m:
-                    match = m
+            for m in matches.values():
+                if h in m['path']:
+                    match = m['path']
             if match is None:
                 bb.fatal("Can't find a task we're supposed to have written out? (hash: %s tid: %s)?" % (h, tid))
             matches = {k : v for k, v in iter(matches.items()) if h not in k}
             if matches:
-                latestmatch = sorted(matches.keys(), key=lambda f: matches[f])[-1]
+                latestmatch = matches[sorted(matches.keys(), key=lambda h: matches[h]['time'])[-1]]['path']
                 prevh = __find_sha256__.search(latestmatch).group(0)
                 output = bb.siggen.compare_sigfiles(latestmatch, match, recursecb)
                 bb.plain("\nTask %s:%s couldn't be used from the cache because:\n  We need hash %s, most recent matching task was %s\n  " % (pn, taskname, h, prevh) + '\n  '.join(output))
-- 
2.39.2


