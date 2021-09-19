Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.3202.1632084705510138447
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Sep 2021 13:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XZFh8dd1;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id d6so24993486wrc.11
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Sep 2021 13:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1oiWJzDCfsSbDPa3Frsx4quzviZtspDDxublwH+RqNk=;
        b=XZFh8dd1Z4dzTs+7xSAHNXn+YMk7IKjIgFaQlRt1AdHTPQnt34EdnGwW1s9aZVjD23
         ht9EH/PSc/Nt9t1n2811bIi9rhOkWkyngtzRr4xp3KVFxU19y6uZ2RYN+MCf4HONsOhl
         n/03DVLpnQB3yZQNaBEfylEjeD/dxnUd0cQkph6XNFDK34uZU5hiXoRt0P7mjM/+DIyE
         fSug8wuiCkUNUtN6Ej9un99nFZYBDRspsx4Y/9AUsEivnpZzh3tXtVVpZQb8wbZM8zIY
         nnCS8xNQVUJzpriXTnto8PzgE37jDIBoAG0J5t7Bc9p0jhQ+0F4m47bHfBJC/tbCTD5x
         kGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1oiWJzDCfsSbDPa3Frsx4quzviZtspDDxublwH+RqNk=;
        b=SYMdigsJlvDldFhf/NoXq2S+p0iMCvB2kNokohW4fy7+PbH5YoNyJtGBJ9YHNBsOLk
         TU+y17s5QNJr9Xof5Xzhj/Jdf54sk0tcQalXm244P+RnkT0i8Me1UX6KSoeorz/OWNKC
         jagtc8/VXE56R/GKCpS4iZiS7HvAB63JP3jR90OOZ+KreTwGzs7cAS6xdWgeBBzldZEd
         Zc2+UFY0+4e7WDFdLq3IjDVZS5a+eQ4VDAei4Vz250as0xyX8qzFa366yoBTIeUYG19y
         4O9wFJoq9OINMWj2DyP7guk0PISy2aQEgHT4yVyjvxDAztMlk66OjqcJdMG+TY7rw7jn
         DE+A==
X-Gm-Message-State: AOAM5311Y1r+gTTOvkFwJbl4AXq+/vSoEZzhPLp69nnsVj0Ckak+yTyo
	msAV39ksGYAlA/SFa4EDRGzJ/m7VYwKdzA==
X-Google-Smtp-Source: ABdhPJzY9bAathNJSCeSQ1w7N3PZtLMEW0UnqXCopRN1xcn0WKmWl8LS/DKKE/CJEQRiI+DphTpg4Q==
X-Received: by 2002:a05:6000:1a89:: with SMTP id f9mr3899348wry.19.1632084703705;
        Sun, 19 Sep 2021 13:51:43 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id v18sm13075423wml.44.2021.09.19.13.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 13:51:43 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/2] sstate.bbclass: track found files on mirrors with a counter
Date: Sun, 19 Sep 2021 21:51:11 +0100
Message-Id: <20210919205112.183447-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We don't need extra python collections to count the found files
on the sstate cache and sstate mirrors.
The main found collections provides all the files that were found,
then we only need to count the files on sstate mirror

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 29679e6a5e..fc156ac81a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -893,8 +893,6 @@ BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 
 def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True, **kwargs):
     found = set()
-    foundLocal = set()
-    foundNet = set()
     missed = set()
 
     def gethash(task):
@@ -927,12 +925,12 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         if os.path.exists(sstatefile):
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
             found.add(tid)
-            foundLocal.add(tid)
             continue
         else:
-            missed.add(tid)
             bb.debug(2, "SState: Looked for but didn't find file %s" % sstatefile)
+            missed.add(tid)
 
+    foundMirrors = 0
     mirrors = d.getVar("SSTATE_MIRRORS")
     if mirrors:
         # Copy the data object and override DL_DIR and SRC_URI
@@ -972,8 +970,8 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                             connection_cache=thread_worker.connection_cache)
                 fetcher.checkstatus()
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
+                foundMirrors += 1
                 found.add(tid)
-                foundNet.add(tid)
                 if tid in missed:
                     missed.remove(tid)
             except:
@@ -1034,7 +1032,8 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         match = 0
         if total:
             match = len(found) / total * 100
-        bb.plain("Sstate summary: Wanted %d Local %d Network %d Missed %d Current %d (%d%% match, %d%% complete)" % (total, len(foundLocal), len(foundNet),len(missed), currentcount, match, complete))
+        bb.plain("Sstate summary: Wanted %d Local %d Mirrors %d Missed %d Current %d (%d%% match, %d%% complete)" %
+            (total, len(found)-foundMirrors, foundMirrors, len(missed), currentcount, match, complete))
 
     if hasattr(bb.parse.siggen, "checkhashes"):
         bb.parse.siggen.checkhashes(sq_data, missed, found, d)
-- 
2.33.0

