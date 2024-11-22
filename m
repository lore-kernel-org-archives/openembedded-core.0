Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8CBE6917E
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 16:23:57 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.28285.1732292629910717021
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 08:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M6o9Cfav;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso20687175e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 08:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732292628; x=1732897428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xoGUqlWhu2l3C2nY20GjuXu4cJ4EM7OwgwDZ2DG7Rro=;
        b=M6o9CfavM6+1E679UlBkZvGLZL43YNyX048bdkwky9qYAu8zyZi8F2R9IHnB3VvdCk
         KZcjsKUJtU5nWOKckBrcvb+MCy1IOTa0bq+Fxd4McVRcWnve9p8JF5XFKjXWJQF89GPQ
         4PJU3slfIXckxRTVMbSk8jfEp2FtJz/Oc9g2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732292628; x=1732897428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoGUqlWhu2l3C2nY20GjuXu4cJ4EM7OwgwDZ2DG7Rro=;
        b=uRoRFvrslRHrQc6aSfTjYkOWBfmkq1wV8uyDzVLKBvIi0o2xs+t7JVWUqAsQHWfHM4
         J+FkBy8Ws9NM3caiRkxssM6LxO/Q/cTyoTKSCeLr/77YKfRjoWCIDj98f+mc9higQFnk
         f9ZmwobCEQ58F7xbKbbYJX5Nfuln3t8wQ42E4VKhVYqLFLvz/sWwowsEvuuKOIVXHh+i
         p1CY10HIdrPyOgmvDq9w3AUcz2OWI8Ju4sTJLHPkBS3iNvih7zL/UOZthf9BYvnMoja/
         ZfQ0cirwYVtZmF0SBvZvh5EtQ4j9MJfCVaAV/dEJghElf730mVVFM68sb7JYI2yvVbYs
         Lxww==
X-Gm-Message-State: AOJu0Ywe/ZRErBvalEALBNiaQXUPSGL57jsnDy4TWi1/P5TeOfQW5S1H
	glvtxv+5mIw4twJBDJmy1kbbXDazWbhSaBn3PYtKteyoqmdAPZnW58K0GqeaabU3W94ZmotRV2v
	D
X-Gm-Gg: ASbGncuFJUiEZSQST8/mqWaLfMykPUqZaEJWUz2zeb1o4tQcItJQQHDyGCiVZikJI50
	atuDIjp/iIl+KmKbJELUhQ4hXdBjSHxmkhLxsLZGGajapmCaJN8xmwEDMWBtWCPcgMb60O9j1g8
	3PyyTiQWQvFeGsShp0neN0cf4+KvfllgSkF2jL7RX/P7rVLexGO6rTXsOI2VXMB2drxIfz3gEQ+
	fy+E7yx2/Gh7WdhTai5YeibZ6WibSOYlr8bXfkK1K/JDdIi/5onRnvRLtNiBJU3kFW67CiMwCdz
	zKQ=
X-Google-Smtp-Source: AGHT+IGrCun365POISXXeIiZzo5oH8sBdwaAhLiS5GZTslzxEpo8txN69uKEXdaCGPDZJBeLN3vwpg==
X-Received: by 2002:a05:600c:46c4:b0:432:cbe5:4f09 with SMTP id 5b1f17b1804b1-433ce411003mr32653725e9.4.1732292627852;
        Fri, 22 Nov 2024 08:23:47 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:87e7:ee61:98f2:6cd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45d4dd6sm100686595e9.24.2024.11.22.08.23.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 08:23:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] resulttool: Clean up repoducible build logs
Date: Fri, 22 Nov 2024 16:23:38 +0000
Message-ID: <20241122162340.2770780-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241122162340.2770780-1-richard.purdie@linuxfoundation.org>
References: <20241122162340.2770780-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 16:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207634

We've improved the data stored for reproduicible builds. Teach resulttool how
to apply those cleanups when reprocessing data so we can reduce results file
sizes and make the data easier to process.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/resultutils.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index b9b93afaa6a..9cba8639a39 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -131,6 +131,27 @@ def strip_logs(results):
                     del newresults[res]['result']['ptestresult.sections'][i]['log']
     return newresults
 
+def handle_cleanups(results):
+    # Remove pointless path duplication from old format reproducibility results
+    for res2 in results:
+        try:
+            section = results[res2]['result']['reproducible']['files']
+            for pkgtype in section:
+                for filelist in section[pkgtype].copy():
+                    if section[pkgtype][filelist] and type(section[pkgtype][filelist][0]) == dict:
+                        newlist = []
+                        for entry in section[pkgtype][filelist]:
+                            newlist.append(entry["reference"].split("/./")[1])
+                        section[pkgtype][filelist] = newlist
+
+        except KeyError:
+            pass
+    # Remove pointless duplicate rawlogs data
+    try:
+        del results[res2]['result']['reproducible.rawlogs']
+    except KeyError:
+        pass
+
 def decode_log(logdata):
     if isinstance(logdata, str):
         return logdata
@@ -173,6 +194,7 @@ def save_resultsdata(results, destdir, fn="testresults.json", ptestjson=False, p
         resultsout = results[res]
         if not ptestjson:
             resultsout = strip_logs(results[res])
+        handle_cleanups(resultsout)
         with open(dst, 'w') as f:
             f.write(json.dumps(resultsout, sort_keys=True, indent=1))
         for res2 in results[res]:

