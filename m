Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E106C433F5
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 21:54:22 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.1445.1633298061319454790
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 14:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fPDx8oyE;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id t2so3350022wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 14:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uYKm6e6y0r7WpwBtib6Yu8Ex5ySxMW3xrBgoW5Q7M9Q=;
        b=fPDx8oyEY2cNHd+3FtxBSwOdCr24scx0kif3lR/EhKR9GhK7skiQLRALA8nOMCDUbd
         j3k0GVxUdYICc9QeF80mXVDFJdovSl/apKTRt2cCDjchIkrFkLXwqLjXFocbfhcTU7xt
         QOX1CqSZ/zNVz8HIXYzNolVujtQ1vlWAXkR2s1Ru4baY5Gj3YWD1nPG5VpgUyaeVH5Jo
         LsPPcB38/GIIU2Unw80dzf9z67Erlt7Tn3C8ElZG/cLy9bOkD/QrmtEXr4oBKu44gwYA
         erajTTbct3STJBL77glaPKrrQQaTG7birtmOym3z78mmglAHEYvJVduASx1fHJ+lSX6Y
         R45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uYKm6e6y0r7WpwBtib6Yu8Ex5ySxMW3xrBgoW5Q7M9Q=;
        b=yaa7AC3mdYEk8mFFtJBdWBHEj2k5PYwkEJ1qdGOcZIz1s2Jrc0YkmFSnyhQ1xwmo2z
         dZUWXKRm4toehifAAzc4ud4lhSllqDzZ8xqZIbp3UFb6AUxPPVATX/sds2KiRxlQP/us
         Fatvq/0t2xWl+ZtYclH67hHEWH5bBXouXvFCUjwbVv4nJb9x6GRcyeB/Q7on0xmxr/rI
         pRZesgNbqKeB49/IJjLgN093BHPnF9GhNzKHxq9Ka+plZXeRgCD530MUjFYNNyyEU8io
         n2Ai9icpl4yInkzQn4O2UfT6IcDZtY4zwBqi2p3A8SNSYHjHfMjZ1EPZBk4PK8iyPttS
         F9Gw==
X-Gm-Message-State: AOAM533N3fbxHg1mscdn4hF6+6g8v6AxSkOYRqm+gH5Ai2fo18dd8Bjo
	LTKviiQum54C3aq7ZovoXcHvuEEH3p+Wtw==
X-Google-Smtp-Source: 
 ABdhPJx4rzZkWmqvBf01OwYxLLo1SXml9lMRWNHMOwr5gXZpS7zeFbnQprcsnkao/oNWQumHmk/w3w==
X-Received: by 2002:adf:a184:: with SMTP id u4mr10551398wru.69.1633298059381;
        Sun, 03 Oct 2021 14:54:19 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 z6sm17482266wmp.1.2021.10.03.14.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 14:54:19 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] sstate.bbclass: count the files on mirrors using the pre
 local files
Date: Sun,  3 Oct 2021 22:54:05 +0100
Message-Id: <20211003215405.935683-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 21:54:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156563

We don't need extra python collections to count the found files
on the sstate cache and sstate mirrors.

The main found collections provides all the files that were found.
Then we only need to store the nunber of files that found on the
local sstate cache and the files that found on the sstate cache
mirror is derived from that.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 92a73114bb..f06778a3ee 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -893,8 +893,6 @@ BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 
 def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True, **kwargs):
     found = set()
-    foundLocal = set()
-    foundNet = set()
     missed = set()
 
     def gethash(task):
@@ -925,14 +923,13 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         sstatefile = d.expand("${SSTATE_DIR}/" + extrapath + generate_sstatefn(spec, gethash(tid), tname, siginfo, d))
 
         if os.path.exists(sstatefile):
-            bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
             found.add(tid)
-            foundLocal.add(tid)
-            continue
+            bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
         else:
             missed.add(tid)
             bb.debug(2, "SState: Looked for but didn't find file %s" % sstatefile)
 
+    foundLocal = len(found)
     mirrors = d.getVar("SSTATE_MIRRORS")
     if mirrors:
         # Copy the data object and override DL_DIR and SRC_URI
@@ -973,7 +970,6 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 fetcher.checkstatus()
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
                 found.add(tid)
-                foundNet.add(tid)
                 if tid in missed:
                     missed.remove(tid)
             except:
@@ -1034,7 +1030,8 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         match = 0
         if total:
             match = len(found) / total * 100
-        bb.plain("Sstate summary: Wanted %d Local %d Network %d Missed %d Current %d (%d%% match, %d%% complete)" % (total, len(foundLocal), len(foundNet),len(missed), currentcount, match, complete))
+        bb.plain("Sstate summary: Wanted %d Local %d Mirrors %d Missed %d Current %d (%d%% match, %d%% complete)" %
+            (total, foundLocal, len(found)-foundLocal, len(missed), currentcount, match, complete))
 
     if hasattr(bb.parse.siggen, "checkhashes"):
         bb.parse.siggen.checkhashes(sq_data, missed, found, d)
-- 
2.33.0


