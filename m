Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F78E6917C
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 16:23:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.28284.1732292628763829115
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 08:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AM4ubfuB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so20174615e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 08:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732292627; x=1732897427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/3uLvWi/Vpo/vDkQ3bt9lwleyws6yVLbPS9TeKLpac=;
        b=AM4ubfuBR02OuGso4IAazoYtK+iP+nEEF7fzb4N98Px5NhNMNSx9TfOiOGCwM0MTb7
         +2GMTEn2rkSaGGwVfVaEhf6/m18fEE3rJmbrNlkcZNMZ7pL8i6kV5r0nDYn5PsuAtHZq
         2jMZgXBDXDKEP9mKOFv4AKzjK7jt5FoQqfwLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732292627; x=1732897427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/3uLvWi/Vpo/vDkQ3bt9lwleyws6yVLbPS9TeKLpac=;
        b=iQp/NeW8P+smS62IbUFQ/t9yiCT0jXMiOQwQxSeLebF0mEy4PI4C7RCrRzecfbpcS8
         qowBpf4+nChHyP459VePmdRNkpPHt2G2YNEaEgAhGDB+DN8B1OrcWDOo8Q6BwZonlI3h
         MT++/4vhNmdGvBtvSopqSC+o7KiINfe/dhQGJDE/jsPqlNENClIOrLXBYnvA8v1VvrnA
         WnrrrDBFAAxnoWEugjW0c+95oL37yCNPMLRvc7wZGm20p956u/tp9bIbKsu+4Yl9nRL9
         J978h6RdTBjdtEsAeswJEMuGmGAxKOOWguWo4862mRJO/I07MwOE/9xv60owwdgGDSRn
         rHzA==
X-Gm-Message-State: AOJu0YyEWRwshpX0fmyNFnNaoLgKHU46CFu2kC+AANivrxaifU3FxJCD
	hL3ommUYDin+Kp6m7x4dco7JAj6trpxunL+0Im/IjfyAbNbdN5rHPfCh7B1nmnYi+ng1mLpQwwq
	X
X-Gm-Gg: ASbGnctZdj6JjVSBIItx6R5YhuF+oC+YONuYMc7lw1ycQVGHvYH8APM9Ips+9feruo7
	ed7l1zjuV5M3L6hGl/JXzOprBWNlGfFCvd3T17ZlLMDTT5rRab3DqcrGmSRmQL+IYel9zjP1iSL
	MoqXatULI/6QZTrw00uspW/PocX2HIipVdeo6iSmut7RcHqNPeCyL8tl1c4mhRZiVM84eUp1Jkc
	IY9I8Bujk4lj14fM+goRt36RBcEEQZl3+06Vm792jun4onCTbWBJaiLIuM6KRHNePf3iiB123AH
	y/w=
X-Google-Smtp-Source: AGHT+IESyHB3aPQ3GbCBm0ciI9gVT+ETemMDkeHhol0lzvP0mlmZ38+7gHdquVroS7VAZc8nYyMlBg==
X-Received: by 2002:a05:600c:5115:b0:430:57f2:bae5 with SMTP id 5b1f17b1804b1-433ce4ae4e1mr29967315e9.27.1732292626719;
        Fri, 22 Nov 2024 08:23:46 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:87e7:ee61:98f2:6cd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45d4dd6sm100686595e9.24.2024.11.22.08.23.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 08:23:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] resulttool: Handle ltp rawlogs as well as ptest
Date: Fri, 22 Nov 2024 16:23:37 +0000
Message-ID: <20241122162340.2770780-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241122162340.2770780-1-richard.purdie@linuxfoundation.org>
References: <20241122162340.2770780-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 16:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207633

Improve the rawlogs handling to include ltp logs as well as the ptest ones to
reduce the size of the results git repos.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/resultutils.py | 33 ++++++++++++++++-----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 8fd4e0a9cf0..b9b93afaa6a 100644
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

