Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web12.3961.1613634516869168438
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 23:48:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CUw4Dmj+;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: aehs29@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 80so1112985oty.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 23:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cADa9Lws3yfZkOs7TlXSQBED8kIpZhXYFWc+bmtDNVM=;
        b=CUw4Dmj+Uoji87VThKpJ+/e+4Y/2HbTduFYgodqiy06eB6j5k+OKRBqpSVnKh4T+2G
         7a/9adZ/GkniKWqN3cJN8Mq7dwC/K7jvC9dl7/ReSO/EdTX3mdopVSSnslzGORVFhJHr
         9pD2e1Rho5aCK1x0TrzV58BDd6FN/49Oa/jnp0Uu4MoRL5rCBrR9Ga3ubxYj5pjQ4Quf
         Oz9/sTbqyptPRJZiwgOADKPGxYMf2aLhcbjLrLufXlwdd8QBpsVv1XFzy/uiKmJY/f85
         /3BvHeWnRby9Dgs2jZJZyZWLPfaAXFtF8CIJkcW2BnlYZEDiWhNEuQY9HUwpxSB8ac1i
         btzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cADa9Lws3yfZkOs7TlXSQBED8kIpZhXYFWc+bmtDNVM=;
        b=hPrWq02V2pvqaWEKcOXn2M0WSZQDtnkvRcTVIHBT+m9vrQ4xlDSftF2SFYT7PoKX4y
         BeERHjdBLOuVgE1uF10RnIJzotAgHZ/Wfw92QBr65GNm0dlKHb0jEwohDtmX9z69ZtOB
         ITMphV4u13UP1PXbMf7X47Mx+Kap/uzEYToLTCDnq6OBRyncAR6tF5liOyJaAgs8zucC
         zaRV+u/SyH+Co29LWsJRC3oDNPNN8uzLl4ZRqHWgxXGVpjBcXaDqRamew5Dx4ZBckjHD
         y8rwgOSfI7A9xfkCNrPooIxY4kRts2pCCFJiTzj1OQ8S8so6dazVCYYZvr44IVimen/D
         09KQ==
X-Gm-Message-State: AOAM532q5HYWfIhYeXe7WX4YgnVbvVB4ZcVhE7EY3wJAr4oFP9Ip4S9y
	LD62M7WGtagRt5r/IkSWqk8Bu6j0BTBggg==
X-Google-Smtp-Source: ABdhPJw8nD1Wuu0/Ggas478kdjx2aIIsgSsMPo+j5CzE6uRaqVImO2kklQ7mWaPOL5GOTFwNKUF/Eg==
X-Received: by 2002:a9d:6ad2:: with SMTP id m18mr1967696otq.331.1613634515837;
        Wed, 17 Feb 2021 23:48:35 -0800 (PST)
Return-Path: <aehs29@gmail.com>
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com. [68.201.52.49])
        by smtp.gmail.com with ESMTPSA id z30sm918597otj.61.2021.02.17.23.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 23:48:35 -0800 (PST)
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
X-Google-Original-From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH] sstate.bbclass: Split sstate summary into locally and network found artifacts
Date: Thu, 18 Feb 2021 00:48:25 -0700
Message-Id: <20210218074825.3043696-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify sstate class to add extra output, differentiating
between artifacts found locally and those found over the network.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
---
 meta/classes/sstate.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d08d950e76..f579168162 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -862,6 +862,8 @@ BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 
 def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True, **kwargs):
     found = set()
+    foundLocal = set()
+    foundNet = set()
     missed = set()
 
     def gethash(task):
@@ -894,6 +896,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         if os.path.exists(sstatefile):
             bb.debug(2, "SState: Found valid sstate file %s" % sstatefile)
             found.add(tid)
+            foundLocal.add(tid)
             continue
         else:
             missed.add(tid)
@@ -939,6 +942,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 fetcher.checkstatus()
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
                 found.add(tid)
+                foundNet.add(tid)
                 if tid in missed:
                     missed.remove(tid)
             except:
@@ -1000,7 +1004,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         match = 0
         if total:
             match = len(found) / total * 100
-        bb.plain("Sstate summary: Wanted %d Found %d Missed %d Current %d (%d%% match, %d%% complete)" % (total, len(found), len(missed), currentcount, match, complete))
+        bb.plain("Sstate summary: Wanted %d Local %d Network %d Missed %d Current %d (%d%% match, %d%% complete)" % (total, len(foundLocal), len(foundNet),len(missed), currentcount, match, complete))
 
     if hasattr(bb.parse.siggen, "checkhashes"):
         bb.parse.siggen.checkhashes(sq_data, missed, found, d)
-- 
2.25.1

