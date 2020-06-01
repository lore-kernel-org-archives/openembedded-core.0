Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.37936.1591020724927261796
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 07:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MXDPYWuy;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id u5so3555736pgn.5
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 07:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=0qyWs0/i+oG3TTJ1L5CbfKpiwy6cslU3W8kTtHq04K0=;
        b=MXDPYWuy0Nk4XCnYCqly63pQrt82BzGnHIEfH8YOhhzuvrEX99IkF3CTw71qlK8wVZ
         rMhFbiDd6Ot+wPL/SqTgfKroZ1ei2wc+D/2l8KgYjw04RZe6CCMFr6evpAdcPPyslfCL
         BX+SCAwx9jOTqanK1urX0O1PMa/MAvWMFTauRjnx0yL0cVycZhF6MmaQ2tRf9bqfxHfX
         +wGJg5uU6svrntRcN6D68oAbzQvKFw+VxYVFOwh/iXYzkb5076jlk2yYr+iKlwlapAEi
         1ArmEMwovHEhSwt9W4vuGnzAPBrSmqlE7Wj9ygI29bH5jb3pzPWDdupg5jHD/lrWbDwi
         uzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=0qyWs0/i+oG3TTJ1L5CbfKpiwy6cslU3W8kTtHq04K0=;
        b=NgqtZqW0KtkmP8ZP5D0Arg9j9fgbdE/wt/m7bvQKTWqcKOwaJvreHFDKLP9NREC8Xk
         9yJnHtUxly2+Hd1wYkxcGUy4NCFcQk6zD9t3rzbKxYP5Mt4FzLZrVdh4AewjioknbCyh
         r5i/aDZhy3/c6vuTXDjja0AmvpWSV/wGHjgK1NS7+H8zm9Ox2YhR6O7G9DESmuJrv7VW
         o0yS9mYdpTRp16JGU0SrtuZO4he/tbT7CL2f09ClJBVq2+eiCARQL1S00z0pL+6vKyJv
         5Ykx6SYYFOeAjfPooCfEFggjgnuhdr75H2w+tt9qQxu6fBdc9Z9FE61XezAlsmb8x1v3
         timg==
X-Gm-Message-State: AOAM532Tyv4QB5p02rH4rFMTPfh1SFXnAJZm7rE9YRIDtoWtmpIEY84C
	zTw+Pi8hBGf5dHH17cjV3iivKaBf1G4=
X-Google-Smtp-Source: ABdhPJyOFqJv/w+9a8XbhjbunVEigtbN47mmWPb03yHpe0cETDutlxGdlQ5NviFphODlapTYcy5JcQ==
X-Received: by 2002:a63:30a:: with SMTP id 10mr12521424pgd.167.1591020723910;
        Mon, 01 Jun 2020 07:12:03 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u19sm5509859pfk.98.2020.06.01.07.12.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:12:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/16] resulttool/log: Add ability to dump ltp logs as well as ptest
Date: Mon,  1 Jun 2020 04:11:15 -1000
Message-Id: <0b513274a0ae722065cf1a605090000e854e2f81.1591020366.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591020366.git.steve@sakoman.com>
References: <cover.1591020366.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently only ptest logs are accessible with the log command, this
adds support so the ltp logs can be extracted too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 64a2121a875ce128959ee0a62e310d5f91f87b0d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/log.py         | 21 ++++++++++++++-------
 scripts/lib/resulttool/resultutils.py | 22 ++++++++++++++--------
 2 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/resulttool/log.py b/scripts/lib/resulttool/log.py
index f1bfd99500..eb3927ec82 100644
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
index 5fec01f6f3..8917022d36 100644
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
2.17.1

