Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D443CE77171
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:36:56 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.25431.1733344607739146930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:36:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=o7GuvWmI;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7fcfb7db9bfso140193a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733344607; x=1733949407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtuWPgKG1m/lXgBoTFH110ylMSID9Co7KmbKiVOkaz4=;
        b=o7GuvWmIjN0xtcNLeC+a/qfDNqQwi9d7n3Pkbc5DA2NeiuLISqQ+2hsMWCt3eK4Lrg
         F4CrnykOLQJ6Xd8W8ZfB6/AZUepKOOFu4lgUIzlDKD6S7Sqsli6NVH1cAQACXNbVLkJz
         nWyk3PakShQ0KyKXxLOoNBCasOZLChDB2sfNVijhRLmM29e7mVUdv/kWGx0DMhxrQ5hC
         CuylcTyE4rbJaiVcnL0a4mFcIs5howX/MeW3o6uZQloNnrHdhfmIdBwod9i07fXECY9T
         iyposrhXovl3hSHBumpW3DgskoQPbrMWG5SXg+wNQlvLBMlyAQId/kMIK9wihnLp7V9n
         b4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344607; x=1733949407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtuWPgKG1m/lXgBoTFH110ylMSID9Co7KmbKiVOkaz4=;
        b=drS/71vl6Lzk0Ja0w5zrU/DGG5WqCoBQdFzNZ4W8JKyN+Lkp1DtxwiAkn50Lsv3mzB
         rKgtG3XhqwqB+u/BIhOjI6Ck8l+7a0agisIpKFVcEhR2cu/LA03AwLr8/Jidy004FsiO
         lwbXV9v4TfFrQDT1++LwIFkRQtriI4unzztBoHO9p9AD6Ij0nP3MRfbgCr/NvR8rl+hT
         2+VJZKjNgJHT8C3rGaPiFfJauPNsq4h0QIuvPzrpRa/iM4ILsZ2o6ABiy2GSPzSu3oAp
         c+Vt855/dryhSZ0d16JmUdsxWjCCyks/uwH5kdS5lmYPVq3JzC6fqMfUyNcDPvS9av06
         qQOA==
X-Gm-Message-State: AOJu0YymrlJMEUIPazDp35XICv+YQ6m818LuRCco/RhbFh7Iok8tORZz
	4NGLHoqJ5QVILsI1GHbm5BcaH9Ohz3PjkxGfbbmlDBq+2Ywp3KkzadTzUuc7x69QMXApLOI9A/t
	A
X-Gm-Gg: ASbGnctAOyVFE7YQtyXyjFoVHUuWnGfU2kBKYk5dUsBiciPT/KrsvCRSq2ekvTpq2jn
	fhvF6q61tTip2miV+wcUQ9iXL9K/PtVSEI16GHHSXzF3cndzJMaxSf49TMtnusPY+j0bbwU/lKb
	pOGHu/VGj4GYTvNGFJtvKw+AKeQv5rjZmlBUbXAkQi+/LsOR0GlBiIeQtqFZYVYExSuA0mjFIo1
	ez1ndV8TppXKjmHPe93PTZEZNooK8VxVfHp4+o=
X-Google-Smtp-Source: AGHT+IGhgTwT5aqDQFNsa6oRY/tIWOwAEhCNfxM0SE6hVsFcZenDqM8bZvOgTSI/xlyxc/4fNaVqlw==
X-Received: by 2002:a05:6a21:9989:b0:1e0:d663:1d12 with SMTP id adf61e73a8af0-1e1653f2f3amr10794712637.34.1733344606951;
        Wed, 04 Dec 2024 12:36:46 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3d7sm12827805b3a.55.2024.12.04.12.36.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:36:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/15] resulttool: Handle ltp rawlogs as well as ptest
Date: Wed,  4 Dec 2024 12:36:19 -0800
Message-Id: <6b164f7fe556824c85873ce2ca4257b3a4956cdf.1733344462.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733344462.git.steve@sakoman.com>
References: <cover.1733344462.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208340

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


