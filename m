Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.4011.1632401508066539861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 05:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fTjrEDcw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id t7so16771526wrw.13
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 05:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wxh6HzXCJ6HXYAyvkMESQ9UOPirdwD8OSTcvHMJ+JJY=;
        b=fTjrEDcwmA8ZhpGZj/OAH8mrLDhwTvC+rGOfV8+qhLpGoG8J+pR8RvdRCi2bHjZxOA
         6oVQOP44XZyDGoBFae6ly6PmOzfhCAfm8rP3T9q4FkgJKUrgbvTX7ukRLymDa0H8Uj+G
         lnh++7RDE/Avbqt3B2sL3AsTt1GQVhJwGvaLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wxh6HzXCJ6HXYAyvkMESQ9UOPirdwD8OSTcvHMJ+JJY=;
        b=7zRDrVdUtaW2p+v3+cHOFfyy3BseYQm00+BJ7FRhz1fPvPtUKCurZEq7lhEo22sz4D
         21uZZ4GlG3SFv7FMZdmWCNVhuKE/Ey8hwLXRYGHckIibJum/IQPcVBx8fToE9orca7sE
         G8QANKbbKgmYCrqw5RVl5pY15yxwMmSSoNp4E1o4xjWjdvqFxfLeGT36HkwcNujRlAXh
         hFLYVxwP0DCgPHOsWNcPGO4dfI+C0U2dByJDiKTIU4R7LPpsIXG1xYR8NcFbxF8WVsif
         sE7fyqC6CXbf/owcvUuRS6Zu4e2pe+TJD/QXbTnEXjh4t0PrcYH5gZqN0B0O250PwI/z
         H/TQ==
X-Gm-Message-State: AOAM533qG0yo1ilq7d/s2gE+JRObDooOkgTi/SWLSpcvErtkjZAvalez
	qO09iiTRoAlH4vm2rGI1Rw4JTDEB9ucvCgVz
X-Google-Smtp-Source: ABdhPJwT5AJpZHaA3ButpvL2SKt/LIFbGF3aDc1tKZ0yJlSVYbqQu1Qfp5WRH1K7L2G4LueAQZQnDQ==
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr4964942wrs.190.1632401506100;
        Thu, 23 Sep 2021 05:51:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3a36:9e9a:ccb5:f067])
        by smtp.gmail.com with ESMTPSA id k22sm5520169wrd.59.2021.09.23.05.51.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 05:51:45 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ssate: Cleanup directtasks handling
Date: Thu, 23 Sep 2021 13:51:45 +0100
Message-Id: <20210923125145.1712562-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are several tasks which should only be triggered by direct
dependencies. Some are listed in the dep loop, some are not. They
should all be in both cases.

Fix this by making a list and using the list in both cases to fix
various inconsistencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 5accc13a89b..92a73114bb5 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1059,19 +1059,13 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
 
     logit("Considering setscene task: %s" % (str(taskdependees[task])), log)
 
+    directtasks = ["do_populate_lic", "do_deploy_source_date_epoch", "do_shared_workdir", "do_stash_locale", "do_gcc_stash_builddir"]
+
     def isNativeCross(x):
         return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x or x.endswith("-cross")
 
-    # We only need to trigger populate_lic through direct dependencies
-    if taskdependees[task][1] == "do_populate_lic":
-        return True
-
     # We only need to trigger deploy_source_date_epoch through direct dependencies
-    if taskdependees[task][1] == "do_deploy_source_date_epoch":
-        return True
-
-    # stash_locale and gcc_stash_builddir are never needed as a dependency for built objects
-    if taskdependees[task][1] == "do_stash_locale" or taskdependees[task][1] == "do_gcc_stash_builddir":
+    if taskdependees[task][1] in directtasks:
         return True
 
     # We only need to trigger packagedata through direct dependencies
@@ -1143,13 +1137,9 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
             # Target populate_sysroot need their dependencies
             return False
 
-        if taskdependees[task][1] == 'do_shared_workdir':
-            continue
-
-        if taskdependees[dep][1] == "do_populate_lic":
+        if taskdependees[dep][1] in directtasks:
             continue
 
-
         # Safe fallthrough default
         logit(" Default setscene dependency fall through due to dependency: %s" % (str(taskdependees[dep])), log)
         return False
-- 
2.32.0

