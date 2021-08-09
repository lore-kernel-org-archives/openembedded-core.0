Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.20667.1628502552927345285
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 02:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DCExWwS4;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id l18so20589603wrv.5
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 02:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9k6IHgcE0MxtfKX03olhYF8u8fosM18hhbsTa/5EmWc=;
        b=DCExWwS4yHmi1t+X65N1TosF1wSgsfndIm0Q/0FKnBXQa9VnGbQ7SptPPXKxwGYmWf
         vBKtY1JTXRKpgwVEmuD8JXo6Zan/xWPXNHg52vdEGdBCx+ZIpzxpXSFM2nLn3ZdCmo64
         MQ0zeiRwB/I0B0SgHl9ngYr3B9HFe+khZIEX4ENlvc/J1L/O0hXA8wai/WWDHMRzIYdY
         1mczz3Wttl3U8S0JPXVC10Arij8KPFiqmlKo5GZD5/UvGWvwrsSrneUGMlBfnsaRQ55Z
         s1Srz3Kl5xwTVerfciccplzDc3OTWYJ4zzCP8wICmfTGxxsMs/WQiTZ5Db1pRbE0+RQm
         4v6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9k6IHgcE0MxtfKX03olhYF8u8fosM18hhbsTa/5EmWc=;
        b=XsQnHz3wfebciZ7HKKw9drAp/MpgK8IAS/qkoi64NsgVheTIW3Tv9GsMKM6NVVYM4b
         VW6eDnXb0+TPMDVAyn09cPFJA6K4aYV1tTDxIaSft45Mgd/2EK8HpaftH1nx7XQv2OSN
         xL7S+H1n0QHFSvb7BHEC6BVjylbyA2z/VxABxNIK+Ei5sC2ORmnLWHbfhHHyPt5eA4cj
         rYz9yE97HQK0oSNDHaz6VlKOJXJjFlMjIj8JFNU7YJndwl5P4msNFjf1+7e04Dinb0jg
         zPes5Aj2jjFM8RpB4QJn3kgccyaISRDYJVO1pdG6gVBF/uWqvlLPxDG2B3LkYAvOI6vx
         lpVw==
X-Gm-Message-State: AOAM531vTBtI+oOGMDXwDErUkMh8pfw6b8xkgEcIpo2NHQzI5i7myYl9
	IhYP2sl+ZuRLcsplfXmegRa2SFw5EK0=
X-Google-Smtp-Source: ABdhPJxBNywVkYy0llXOdE6qrDuBzHQsuHyznsQlK3ftSn5vkP3aQspGs7LVNsBUpMZLKLogImkzCg==
X-Received: by 2002:a5d:45c2:: with SMTP id b2mr4409606wrs.188.1628502551194;
        Mon, 09 Aug 2021 02:49:11 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id c190sm17314303wma.21.2021.08.09.02.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 02:49:10 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/5] sstate.bbclass: track found files on mirrors with a counter
Date: Mon,  9 Aug 2021 10:48:49 +0100
Message-Id: <20210809094853.3619155-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We don't need extra python collections to count the found files
on the sstate cache and sstate mirrors.
The main found collections provides all the files that were found,
then we only need to count the files on sstate mirror

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 2175ace4c4..2575750247 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -871,8 +871,6 @@ BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 
 def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True, **kwargs):
     found = set()
-    foundLocal = set()
-    foundNet = set()
     missed = set()
 
     def gethash(task):
@@ -905,12 +903,11 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         if os.path.exists(sstatefile):
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
             found.add(tid)
-            foundLocal.add(tid)
-            continue
         else:
-            missed.add(tid)
             bb.debug(2, "SState: Looked for but didn't find file %s" % sstatefile)
+            missed.add(tid)
 
+    foundMirrors = 0
     mirrors = d.getVar("SSTATE_MIRRORS")
     if mirrors:
         # Copy the data object and override DL_DIR and SRC_URI
@@ -950,8 +947,9 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                             connection_cache=thread_worker.connection_cache)
                 fetcher.checkstatus()
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
+                foundMirrors += 1
                 found.add(tid)
-                foundNet.add(tid)
+
                 if tid in missed:
                     missed.remove(tid)
             except:
@@ -1013,7 +1011,8 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         match = 0
         if total:
             match = len(found) / total * 100
-        bb.plain("Sstate summary: Wanted %d Local %d Network %d Missed %d Current %d (%d%% match, %d%% complete)" % (total, len(foundLocal), len(foundNet),len(missed), currentcount, match, complete))
+        bb.plain("Sstate summary: Wanted %d Local %d Mirrors %d Missed %d Current %d (%d%% match, %d%% complete)" %
+            (total, len(found)-foundMirrors, foundMirrors, len(missed), currentcount, match, complete))
 
     if hasattr(bb.parse.siggen, "checkhashes"):
         bb.parse.siggen.checkhashes(sq_data, missed, found, d)
-- 
2.32.0

