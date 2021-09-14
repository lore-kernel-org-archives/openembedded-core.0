Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.7262.1631609831028476610
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 01:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SNMO0brR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id d21so11244680wra.12
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XYqMqtrj3JZJ9FbJQys9ztC6RZpN4dYujdtYFk6ix5c=;
        b=SNMO0brRJ2eTUB8hyShKpTVhmrybIGgoqTxAnI2en8jRNW5iK/xPrombUxXP/JKKbD
         cSt+VzG/wx4LqDbtky1gi6zPKojGVGAeY37U3UEbuHMBHObSuIO7fKUJGqXA7fewsR6P
         LTzkswdOLZmsRPj1Vmh2SNsfj+gSJkGhg6npQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XYqMqtrj3JZJ9FbJQys9ztC6RZpN4dYujdtYFk6ix5c=;
        b=5MgpN5uXOOeRA9C91B5hW2BN2sk/tn2RfKVJT/90g7Y2na4+kizt+o/tlYfd72cbna
         H07VO5c3QH8nYNgRWaQuDyR0uLSWRt0+OlB065JD72srqqZOQcsNmsCaFN10q8wPWO1Y
         Vyx0wGBhZWntYnrmEmFhISDR8/3PsmRXyfiHgH+1lqY1WeFllTE54uymY1n9YeX7TycA
         TUxxn9PPwI62epg/uA2tMlQWNGZnP/4gxjwLxzrkX7O4qovT93cGn48ZpSEN2REvpYZg
         /n33ycEov+ZcsU76qFtLOOtU9CkJUUh/3uo/407QgaWxWZZ8nPmjYN4wLDLpUEGPFr3H
         hAhw==
X-Gm-Message-State: AOAM5329/naQ2oosrzvh3JwjB42nOibvMJEazRZsDfy8OssA1a7w0DVJ
	OL4iLYE4eb9LrH/h/00J3QbLpTXOGB/e+eCh
X-Google-Smtp-Source: ABdhPJynlvykNk9ZEXCFPHWOg/tMIssZSDSfsBmSOaOstNlmRBSU8veE3nRbU6vaJm45C6SVVJZCGA==
X-Received: by 2002:a5d:6503:: with SMTP id x3mr10811670wru.76.1631609829528;
        Tue, 14 Sep 2021 01:57:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2da1:111a:66bf:1f1])
        by smtp.gmail.com with ESMTPSA id k19sm484683wmr.21.2021.09.14.01.57.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 01:57:09 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] sstatesig: Allow exclusion of the root directory for do_package
Date: Tue, 14 Sep 2021 09:57:07 +0100
Message-Id: <20210914085707.1367456-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210914085707.1367456-1-richard.purdie@linuxfoundation.org>
References: <20210914085707.1367456-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The package task references WORKDIR at it's top level and we can't
easily make the timestamp for that determnistic due to writes to files
there and in other subdirs. We could try and force it to a specific value
but it is easier to just remove it from the package task, we don't need
it there or care about it in this case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 78cdf878f18..dd6b9de7bbd 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -491,8 +491,10 @@ def OEOuthashBasic(path, sigfile, task, d):
     if "package_write_" in task or task == "package_qa":
         include_owners = False
     include_timestamps = False
+    include_root = True
     if task == "package":
         include_timestamps = d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1'
+        include_root = False
     extra_content = d.getVar('HASHEQUIV_HASH_VERSION')
 
     try:
@@ -603,7 +605,8 @@ def OEOuthashBasic(path, sigfile, task, d):
                 update_hash("\n")
 
             # Process this directory and all its child files
-            process(root)
+            if include_root or root != ".":
+                process(root)
             for f in files:
                 if f == 'fixmepath':
                     continue
-- 
2.32.0

