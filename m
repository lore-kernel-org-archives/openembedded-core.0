Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B296AE77171
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:55:25 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.21229.1733334916082331540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:55:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qieUdapU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fcfac22a30so53223a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334915; x=1733939715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtuWPgKG1m/lXgBoTFH110ylMSID9Co7KmbKiVOkaz4=;
        b=qieUdapUrPktdj/ZMqYl5PwkEyiwlxjA5MNzOa9MjcVfn/toRdt7sAzmlf7S8SmFIG
         Kf0vPWlgWXnsm1SxSN6riZVkjgfJBZ0hrtXaOK9d2F8v1V6aouf0qfge6X1oR1qsobNI
         7IcT1YiqsglI826f1phMALbJDe1gdslpEUWoZJKQA9vBATiJ/c6ovA96figjyjJ6sGNs
         ERNXs1HyKBjQmf5+ISmmfvddKhqfg/gJCKbYt3pthRlYnpg29sr5Z2yNIcPECUPCcYbc
         feic4TgPfSzhX3orhRZIiv81CN5NvEC9s+uksbxgIKEMGHZ3h28HUOlxXXLWf3PAAtR4
         ZqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334915; x=1733939715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtuWPgKG1m/lXgBoTFH110ylMSID9Co7KmbKiVOkaz4=;
        b=QUYaQHehAiRjjEBnmoLpEz5m0SbieJjB1OOVaLsX6gA9tXnMDvhOjvtrOVIVymC2Dx
         96NJltMxDV8QjEYtQw5W4aLV7sMwlQ+v0B9NMDruEx9oGueatbV8zrsw7nEC1wYrMIX9
         ZLNcVyKFSBkGrtYvdTsl7OgxiUzA79P08bo4H29b1m3oR1rG4GvjOlgoP17VXkih+j5o
         dcduna/7NpqRWCWmtUrWZ37kUu7KslLupyVHkkwa62kVMbfibwIQq8HAFYA+p2xPRyEU
         xWPYyvLj7eXxJQMDeBJ0+57h4xP/tcH40JJdwtynZjQwfMFXKps2oXK1hAmA78zP+Puz
         JORg==
X-Gm-Message-State: AOJu0YzV4eCoGo1Lm3GemISRLJdxJj9h15/ejBHhACo/3s2FDyl/GeIZ
	A3vbRewQsvfnbnSg1OeoOIC0iukLPrjZnTWlZo02jD9MhxJmXVOWyI3axGfjj8U7a8HRNZ+e5/V
	c
X-Gm-Gg: ASbGncvcY76R0nmyl4ekJ11arWtMqahkEkrUWK+p0u3MdfbghRp6hOVnPE4lSni32as
	4Mrl2c+Z6G0KQUZoRenrldtuu4UNSTf1vZ+uNWTFKZ+OMN5002OgAF6ih9s44qOOLaTfFK3zklv
	i2pq1qNHgC9zKt/FQYJa5kR/KDoYEuuGAjsVPovY4Qq/FxMHY91hp9KsWDBWDCaeFuQJ7+LEd+U
	omg1kljKNjHuJhW56GIF++PpNJAr2B6WUrTIII=
X-Google-Smtp-Source: AGHT+IHR3LvuXzPbnrxJshW0H8vz+orojlnPaJHWLuXmV92w/iCX79r3ivTJdCbhFee6keXDcjc0LQ==
X-Received: by 2002:a05:6a20:7f8e:b0:1e0:d6d5:39c3 with SMTP id adf61e73a8af0-1e1653a796bmr11606689637.8.1733334915360;
        Wed, 04 Dec 2024 09:55:15 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.55.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:55:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 35/38] resulttool: Handle ltp rawlogs as well as ptest
Date: Wed,  4 Dec 2024 09:54:02 -0800
Message-Id: <0309366b04dd2d0819c4af409269995c08c7abb3.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:55:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208318

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Improve the rawlogs handling to include ltp logs as well as the ptest ones to
reduce the size of the results git repos.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a0a1954d559609c2c1ca16936d0d68eb3c4c6b45)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/resultutils.py | 33 ++++++++++++++++-----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 8fd4e0a9cf..b9b93afaa6 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -14,8 +14,11 @@ import scriptpath
 import copy
 import urllib.request
 import posixpath
+import logging
 scriptpath.add_oe_lib_path()
 
+logger = logging.getLogger('resulttool')
+
 flatten_map = {
     "oeselftest": [],
     "runtime": [],
@@ -38,6 +41,12 @@ store_map = {
     "manual": ['TEST_TYPE', 'TEST_MODULE', 'MACHINE', 'IMAGE_BASENAME']
 }
 
+rawlog_sections = {
+    "ptestresult.rawlogs": "ptest",
+    "ltpresult.rawlogs": "ltp",
+    "ltpposixresult.rawlogs": "ltpposix"
+}
+
 def is_url(p):
     """
     Helper for determining if the given path is a URL
@@ -108,15 +117,14 @@ def filter_resultsdata(results, resultid):
                  newresults[r][i] = results[r][i]
     return newresults
 
-def strip_ptestresults(results):
+def strip_logs(results):
     newresults = copy.deepcopy(results)
-    #for a in newresults2:
-    #  newresults = newresults2[a]
     for res in newresults:
         if 'result' not in newresults[res]:
             continue
-        if 'ptestresult.rawlogs' in newresults[res]['result']:
-            del newresults[res]['result']['ptestresult.rawlogs']
+        for logtype in rawlog_sections:
+            if logtype in newresults[res]['result']:
+                del newresults[res]['result'][logtype]
         if 'ptestresult.sections' in newresults[res]['result']:
             for i in newresults[res]['result']['ptestresult.sections']:
                 if 'log' in newresults[res]['result']['ptestresult.sections'][i]:
@@ -155,9 +163,6 @@ def generic_get_rawlogs(sectname, results):
         return None
     return decode_log(results[sectname]['log'])
 
-def ptestresult_get_rawlogs(results):
-    return generic_get_rawlogs('ptestresult.rawlogs', results)
-
 def save_resultsdata(results, destdir, fn="testresults.json", ptestjson=False, ptestlogs=False):
     for res in results:
         if res:
@@ -167,16 +172,18 @@ def save_resultsdata(results, destdir, fn="testresults.json", ptestjson=False, p
         os.makedirs(os.path.dirname(dst), exist_ok=True)
         resultsout = results[res]
         if not ptestjson:
-            resultsout = strip_ptestresults(results[res])
+            resultsout = strip_logs(results[res])
         with open(dst, 'w') as f:
             f.write(json.dumps(resultsout, sort_keys=True, indent=1))
         for res2 in results[res]:
             if ptestlogs and 'result' in results[res][res2]:
                 seriesresults = results[res][res2]['result']
-                rawlogs = ptestresult_get_rawlogs(seriesresults)
-                if rawlogs is not None:
-                    with open(dst.replace(fn, "ptest-raw.log"), "w+") as f:
-                        f.write(rawlogs)
+                for logtype in rawlog_sections:
+                    logdata = generic_get_rawlogs(logtype, seriesresults)
+                    if logdata is not None:
+                        logger.info("Extracting " + rawlog_sections[logtype] + "-raw.log")
+                        with open(dst.replace(fn, rawlog_sections[logtype] + "-raw.log"), "w+") as f:
+                            f.write(logdata)
                 if 'ptestresult.sections' in seriesresults:
                     for i in seriesresults['ptestresult.sections']:
                         sectionlog = ptestresult_get_log(seriesresults, i)
-- 
2.34.1


