Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506C0C46CA2
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 13:46:18 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.22369.1702561570156317089
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 05:46:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GWlrkC27;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c2d50bfbfso3820675e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 05:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702561568; x=1703166368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrjmM/DQ7JA93nfNjkI606RQQXBY6OWU2zVVOo08hWM=;
        b=GWlrkC27tfWrlr0xM0pvDH8kock/RFgFtBXikH9/XxWlA5+560NRBGX6EbVZpsVWyu
         dMQKQe3Yoktl6+LTfbiiicVSAs9HYG7Uv6SXR8t1mGiSoHTYA4kYlfgN0oH6DilHYjmh
         iKUA3QkyciWd41d4mDDJKPnT4ENE7+pWgaYczbD3PTwWaw9HIcgCL4I9BQtVkrnaQG3d
         zVMtSbuKD/MLXDFYqgcQWXcMa6XRyK7OVE3UhSAXvUKQcsRbg1QPaIQrZn/dTbHF1mrP
         NGA6PuvU2B92Z2dr3EUhlMEDK3NWunTHOffvcO/kT+2f8YOCGIv0tsNl7Sa2qKy17iEG
         j5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702561568; x=1703166368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrjmM/DQ7JA93nfNjkI606RQQXBY6OWU2zVVOo08hWM=;
        b=mzEoV50pfPdFTXXxoCwz1Y535jUrevSKOM4vdgDxHFna8U3qtPrbRObIkjqySERgGU
         fBxR9YXP3WR2txZ0ZxRbeRV1SzKitMkz1Rqmgl7/2GWcfSuxrXqrAjWh7Cd6aV6yUgIA
         kmoiaIkzt9ufAyuXx9YQ3wE0stEpoFMnuLh06K+wAPVqz9qzsqD/ZRVL9uQdJMgkhcxl
         XmGYiF/9KCcnZkMVgRShOpUu+EiYAiPbzlN0/I4lME1Sv+nzU1AMFmQDmMvWfS5yiObc
         ZSITa2NRXuRiaW8QnygRLQSonxAAzlbTUSXXAIpLuQY0K+L75zvU+IOMqGZaXyjgG+ey
         RI1A==
X-Gm-Message-State: AOJu0Yz7AxFN14Ql1ZjA1Kz9vwwAfmh+V/7zlsTpNEKCEFIDRLiej612
	Hu+6Js/KljwUAjqBWW/zyOdKI9Egfxs=
X-Google-Smtp-Source: AGHT+IHbwO+eaDPt3ZUaKgpGpoU/EpM3fb9057o3WNqyq7zQDpy+28phas6SPzvuzZiCjlx9t3GzVg==
X-Received: by 2002:a05:600c:3107:b0:40c:29a1:5559 with SMTP id g7-20020a05600c310700b0040c29a15559mr4949855wmo.67.1702561568321;
        Thu, 14 Dec 2023 05:46:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c1d0f00b003feae747ff2sm27293710wms.35.2023.12.14.05.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:46:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/9] bitbake-diffsigs/runqueue: adapt to reworked find_siginfo()
Date: Thu, 14 Dec 2023 14:45:26 +0100
Message-Id: <20231214134528.1973602-7-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231214134528.1973602-1-alex@linutronix.de>
References: <20231214134528.1973602-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 13:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192377

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
index 61effe24fae..ac5222514de 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1755,7 +1755,7 @@ class RunQueue:
 
             recout = []
             if len(hashfiles) == 2:
-                out2 = bb.siggen.compare_sigfiles(hashfiles[hash1], hashfiles[hash2], recursecb)
+                out2 = bb.siggen.compare_sigfiles(hashfiles[hash1]['path'], hashfiles[hash2]['path'], recursecb)
                 recout.extend(list('    ' + l for l in out2))
             else:
                 recout.append("Unable to find matching sigdata for %s with hashes %s or %s" % (key, hash1, hash2))
@@ -1769,14 +1769,14 @@ class RunQueue:
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


