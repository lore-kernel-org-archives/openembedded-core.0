Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.1331.1611863512577692436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 11:51:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZVzfsm6C;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id s7so3642150wru.5
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 11:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=VDMuvTBfWun2xVw40pCA/X+qZd4YzvI6bNdiPl26hDg=;
        b=ZVzfsm6CRcKMAzhyWXTK1S4mJXboaHrCqyRkJ8uBdirUJtG71dk8RfoZoSKZr2Fet7
         B2u1xiAPV7eGCS2Dr19O2lVdCdgR+fwAo6aW5dGPTqXuw+/TceX9dbpfitrcFhpkbwG4
         vJkBCc6fKSDWFK2qfzdttBHV3IwuQoUjYKPEPfKwOUmenhXyvxJzWwTiZDSWk1hnWLUB
         TbxBFUJGkxGKytjh4CbcC5ScYC8f49l4wZGiMWbMJ/0wGrN5K6taHU/opD3LSlCezFTD
         Uz3Y/m7sZchlk57phtU3gFaU2B1yZJ5KDDIxfs77oOpWYvERlx1kZ51DwzQ6X6h/OBd4
         cJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VDMuvTBfWun2xVw40pCA/X+qZd4YzvI6bNdiPl26hDg=;
        b=OEtXkBLlbLiwYYYPFNEYS0cec3SCa/JPhis/FeSkl7YeC+tDQylw1sOZLcPNM1JJdd
         FzqB4JOfceoLr5RZvP3V0Iq44OEbYI5ve9NOKRV+x1o2Mrp/nCVQfH87fy0iBDiRHJ9i
         A/MWDvMk3/6ZfwTWw86OtKkVJxUnflkWPRtRVbCcRB1jOitNWO+RrY4647pmc304N4Od
         GMLQjwwoZnuM5yK0Ep4sQUpMRrw/cCy7U2w0mTHD2D3mWwUySDm6V9jPf8xc5S4mRtmA
         Ze/GuMzv4Xyu4y564IrpZaMdmFpfg/8PiNeALo1DyMLVXZEZsjxZBj+XI93xoY9xukbp
         NWkw==
X-Gm-Message-State: AOAM5312xS19LbM6siYS5mbJSS9ehzqkKsl9QrziEdL1zqSavoVdZy9m
	0kfZcIRYl9KasZK4G7hhHocL6pPEw8qgsw==
X-Google-Smtp-Source: ABdhPJx5UD77GHWBVEb/jWDpw/JT4Er/JYr7qdUTdRNptFF3VpHQ8bhbqnBmx+yv1zFbJrFzhyOTqA==
X-Received: by 2002:a5d:42ce:: with SMTP id t14mr798588wrr.36.1611863510639;
        Thu, 28 Jan 2021 11:51:50 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([105.112.38.45])
        by smtp.gmail.com with ESMTPSA id l84sm7012796wmf.17.2021.01.28.11.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 11:51:49 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH v2] sanity.bbclass: check if PSEUDO_IGNORE_PATHS and ${S} overlap
Date: Thu, 28 Jan 2021 20:51:08 +0100
Message-Id: <20210128195108.5247-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

added a sanity check for when PSEUDO_IGNORE_PATHS and ${S} overlap to avoid random failures generated.

[YOCTO #14193]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
v2:
added a condition for when {WORKDIR}={S}

 meta/classes/sanity.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c6842ff549..63284b7917 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -710,6 +710,16 @@ def check_sanity_version_change(status, d):
         if i and workdir.startswith(i):
             status.addresult("You are building in a path included in PSEUDO_IGNORE_PATHS " + str(i) + " please locate the build outside this path.\n")
 
+    # Check if PSEUDO_IGNORE_PATHS and ${S} overlap
+    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
+    workdir = d.getVar('WORKDIR')
+    sourcefile = d.getVar('S')
+    if (workdir == sourcefile):
+        for i in pseudoignorepaths:
+            if i and sourcefile:
+                if sourcefile.startswith(i) or i.startswith(sourcefile):
+                    status.addresult("a path included in PSEUDO_IGNORE_PATHS " + str(i) + " and ${S} (source files) path " + str(sourcefile) + " are overlapping each other, please set ${S} in your recipe to point to a different directory. \n")
+
     # Some third-party software apparently relies on chmod etc. being suid root (!!)
     import stat
     suid_check_bins = "chown chmod mknod".split()
-- 
2.17.1

