Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3657EE77175
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:45:47 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.25354.1733345143921797409
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:45:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NlEK0c8z;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-215b45a40d8so1390965ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733345143; x=1733949943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtuWPgKG1m/lXgBoTFH110ylMSID9Co7KmbKiVOkaz4=;
        b=NlEK0c8zlDBPKvqzJKo3y6872VOgxvL6C3OKf8J7Gmmu56sUGVT8OH7+PBDQdze4Ok
         Z1Ed6Hi7SVrcOhl7v9cF0Q+b0bSZsF3aZBdJdNKX+LOdw8B7bnIHtS0/PkiIzocSDx80
         gz95Qbng25z7Pu1y4jxJiy+uy66pS746I12oRgBmmqESLDbyohNn/qUoGWcHXnXuKRdB
         KphioY/ojcBFA0M8Hj7Q5BUdr/UBi+ql2oColCgwHsXuGqfinrmEf/0MEsgBvDOtz6ZJ
         XvlmUr5yYtxRi19mp6ga1PLSewRL7FyMhH95VIP+dOSnflypwWZLvGMw/kB+dP5qqaS6
         BrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345143; x=1733949943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtuWPgKG1m/lXgBoTFH110ylMSID9Co7KmbKiVOkaz4=;
        b=NRcaAlAOfHmOS42/FAQcA2dV+SpGwGK4LY9GqIZp2K/F19LCte6ZrttZlR+c0Sff7A
         xwEskXu6yeAc/ptIVSAbWXvUyjJwO3Pg3epdMKWOXKwRdlsdPep4vOg//RXg6ZMwZNwa
         +NW8n8kYBWzqz1Hjv+OtpqVlZJGYOjUTEvXn5yMWtxUKzWYSAAcg10bgdUAjE7Igz6ZA
         CwlRnOhdms3qgilWhNna35LVoW5V3kEZHujFEyMpyv8R7IA9dTu1bp5/fwUiCXKfVQyf
         F+Xxymj7r4orOVG1gArNSfUHoPM3QFd1JUz3V/rKFE1R4wmiU5d1vbmb+igF8gznrtBD
         KDFw==
X-Gm-Message-State: AOJu0YwfhU2Sk0ySGZB0Fj4tr1OlobbUvxytDIVQozicqb3Fp0dRT18S
	BuMm73FRZcQIFsZfhC3jK6p8XRBGCZCXIIwVkn2bIXUOHoxjwo+xxjfgMtdYvuVfTgAtz2UABM9
	r
X-Gm-Gg: ASbGncuGvjSRg67/Xd2wn99Xhu8Co0FmAU7CIPDEsfXSucpYF29eTpkDT/bhR6OcoS3
	VJr0qH3JwYqyIZH6qQRH/wPl8Y36kFi+mdeb8UKc+U/jGirmxw1Xu3v9Pa7mEIR217E2yY3qBk5
	2xTpa8FQ/DNqHedsrIf7ZckERrxG+1Ev0VCyJc4Jj1KaDtDGAiQLGpNvp4LqnMiwA2PHG2txvaz
	+ICKlbqH5RGh3LlSBuhwi2bB3q2qyKhK/HJHBE=
X-Google-Smtp-Source: AGHT+IE4+iOT+XjrixPvEuclgWwbms3q8tm+9GIN8aJWUmBuyzGJrO50iwC7lWW2IjYwCEAuZShZ3w==
X-Received: by 2002:a17:902:c94d:b0:215:9091:4f57 with SMTP id d9443c01a7336-215bd1606f8mr104235135ad.43.1733345143240;
        Wed, 04 Dec 2024 12:45:43 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154dae56e8sm91387575ad.19.2024.12.04.12.45.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:45:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 11/14] resulttool: Handle ltp rawlogs as well as ptest
Date: Wed,  4 Dec 2024 12:45:20 -0800
Message-Id: <8a34083bf097bf6a8362ce7f9b86fba5662a27bd.1733345023.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733345023.git.steve@sakoman.com>
References: <cover.1733345023.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208355

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


