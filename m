Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.1220.1590530252618407659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 14:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CU9IlejS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id r9so1161267wmh.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 14:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JoP6UQRKk4Tchu/tb1YOUFQPVRsyUyBGR2nV+QiOlPA=;
        b=CU9IlejSoqdJZzgT3tydfX9MQn3tTAIfsK+gcW9Fsq9+TjjZccwUY1Zcl9xmWVMn7+
         5H1S5KxeEk3RIbDYqB4oGPuXtlvu7tU0nrJcgT94fGyTx/kLdlwpTd75gGgEJxsBheq8
         SG1HU6b3dGDjkXugTWVRmjOUehTojZ8p5wSMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JoP6UQRKk4Tchu/tb1YOUFQPVRsyUyBGR2nV+QiOlPA=;
        b=hs+HAi1v7MRuqxT2ZBM9RkP282z60ZswY2JnYy6GXDi8XnvD103fVXBlWh7kmI8YcM
         pHsnLkOwn774Oii6xYmE0Txf8cVhWW+QosA6E2PI2W5MPPGnot1HGCwM/8+fBB4o1wJO
         od+9cbtN2/fF5M8bzk/fFs5UrHW5NH6RyK0nU8EfuTUgyNCWvQRoiQM5oH1mtyG8qEWw
         SfKYIRB4OcUxlwexJjtMmurTDLQ4ZyCU3udN1ZmFAIJPqKLcuMpl6bYBd1iSrovWEVLA
         K9FweF+KMnuPi23XuLYVMb6AncQ5XZHJqx6a0fRfvS5Z3819hROZE/JDaq5o6P20njXK
         6gJA==
X-Gm-Message-State: AOAM533miA1yJz1tHvZS3V+dFFUm90Ivx8BHF/0EdKVUtV/YuMdLRgUv
	i4kimlP6c61UCiysgoJdjJkHThzatoyVog==
X-Google-Smtp-Source: ABdhPJzqtBzdEfuurQv5yc3uqZJeTbAbhRODrkNW3L5+LimSuQnwy9iXzq5AtiUUE4IUt2WWhPkpDw==
X-Received: by 2002:a1c:408:: with SMTP id 8mr1117624wme.15.1590530250934;
        Tue, 26 May 2020 14:57:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z132sm901291wmc.29.2020.05.26.14.57.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 14:57:30 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] resulttool/log: Add ability to dump ltp logs as well as ptest
Date: Tue, 26 May 2020 22:57:24 +0100
Message-Id: <20200526215725.992258-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526215725.992258-1-richard.purdie@linuxfoundation.org>
References: <20200526215725.992258-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently only ptest logs are accessible with the log command, this
adds support so the ltp logs can be extracted too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/log.py         | 21 ++++++++++++++-------
 scripts/lib/resulttool/resultutils.py | 22 ++++++++++++++--------
 2 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/resulttool/log.py b/scripts/lib/resulttool/log.py
index f1bfd99500b..eb3927ec82a 100644
--- a/scripts/lib/resulttool/log.py
+++ b/scripts/lib/resulttool/log.py
@@ -34,13 +34,17 @@ def log(args, logger):
         return 1
 
     for _, run_name, _, r in resultutils.test_run_results(results):
-        if args.dump_ptest and 'ptestresult.sections' in r:
-            for name, ptest in r['ptestresult.sections'].items():
-                logdata = resultutils.ptestresult_get_log(r, name)
+        if args.dump_ptest:
+            for sectname in ['ptestresult.sections', 'ltpposixresult.sections', 'ltpresult.sections']:
+             if sectname in r:
+              for name, ptest in r[sectname].items():
+                logdata = resultutils.generic_get_log(sectname, r, name)
                 if logdata is not None:
                     dest_dir = args.dump_ptest
                     if args.prepend_run:
                         dest_dir = os.path.join(dest_dir, run_name)
+                    if not sectname.startswith("ptest"):
+                        dest_dir = os.path.join(dest_dir, sectname.split(".")[0])
 
                     os.makedirs(dest_dir, exist_ok=True)
                     dest = os.path.join(dest_dir, '%s.log' % name)
@@ -49,10 +53,13 @@ def log(args, logger):
                         f.write(logdata)
 
         if args.raw_ptest:
-            rawlog = resultutils.ptestresult_get_rawlogs(r)
-            if rawlog is not None:
-                print(rawlog)
-            else:
+            found = False
+            for sectname in ['ptestresult.rawlogs', 'ltpposixresult.rawlogs', 'ltpresult.rawlogs']:
+                rawlog = resultutils.generic_get_rawlogs(sectname, r)
+                if rawlog is not None:
+                    print(rawlog)
+                    found = True
+            if not found:
                 print('Raw ptest logs not found')
                 return 1
 
diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 5fec01f6f34..8917022d36e 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -130,23 +130,29 @@ def decode_log(logdata):
             return data.decode("utf-8", errors='ignore')
     return None
 
-def ptestresult_get_log(results, section):
-    if 'ptestresult.sections' not in results:
+def generic_get_log(sectionname, results, section):
+    if sectionname not in results:
         return None
-    if section not in results['ptestresult.sections']:
+    if section not in results[sectionname]:
         return None
 
-    ptest = results['ptestresult.sections'][section]
+    ptest = results[sectionname][section]
     if 'log' not in ptest:
         return None
     return decode_log(ptest['log'])
 
-def ptestresult_get_rawlogs(results):
-    if 'ptestresult.rawlogs' not in results:
+def ptestresult_get_log(results, section):
+    return generic_get_log('ptestresuls.sections', results, section)
+
+def generic_get_rawlogs(sectname, results):
+    if sectname not in results:
         return None
-    if 'log' not in results['ptestresult.rawlogs']:
+    if 'log' not in results[sectname]:
         return None
-    return decode_log(results['ptestresult.rawlogs']['log'])
+    return decode_log(results[sectname]['log'])
+
+def ptestresult_get_rawlogs(results):
+    return generic_get_rawlogs('ptestresult.rawlogs', results)
 
 def save_resultsdata(results, destdir, fn="testresults.json", ptestjson=False, ptestlogs=False):
     for res in results:
-- 
2.25.1

