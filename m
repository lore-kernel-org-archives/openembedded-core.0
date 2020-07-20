Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web11.940.1595267804039460086
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 10:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gqUzasRN;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id e64so18529485iof.12
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2020 10:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tXcUfD9jazXpM7eJJYXsZF83E+ZhDGToCMoLis1OTXs=;
        b=gqUzasRN5ovBlkAq8P8FAW02jOrJvsuNhW2rwyBY4YEnqb447DbjRpLbyTjVzJ4D4U
         2bOjG/UTSRu2uY/QqowrdpE6gOFS5iJhbsFkKLIEVntUil5wda0QJ1jj/dsB2fUvDgtM
         TxNIZT0rMW2+6HpDCQxV3Ua1Yg5u+2h7eIqP9WRSvHv24UBMYAd1S0SyeZadQhq2vsqC
         An2yZ71GExVtXPliujr9jmgaVrAnE91rUg6kLZoRdm9rVPlV3Jcev8ia93xk4Wj/PkUM
         /68z5yLJjGUmxKakgkoiA7BAgSJPyTACsBfanTIGnGMLa+EI7SGhTUd0MjdTC+jNkfR2
         OPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tXcUfD9jazXpM7eJJYXsZF83E+ZhDGToCMoLis1OTXs=;
        b=p7zxy6ueaWHzvLZ1J5SjoJtItQK9ASXPm9RZtHAJthUoQhvmFMuvB5QrCkvIvuHQ9T
         xH+AduDneyqLW9cCGjcpCG5aCRNipEjPV0gY1BsdNi5zNRBqGBxMJ8LYQQCO/v3WZRD8
         9WTuRv+jATLCoPyncGsybPg8/oZKT6TsB8ml5H39U4ptVdhzKZePZMFc9bbSEMeqGPTZ
         F+iCTPyi050TGwMDpI77tJBqq1PV2NxB/w6YNvgmWhRIJBEAbDOS/NXXh0Q7aiFVmib0
         awJ+fnF10gx6kuL8Sy+82vSMc7k4lso47EgT/Lyd+eMi7M4DwVXemSrUh+22sE2+hbGF
         jewg==
X-Gm-Message-State: AOAM5300++OQ1SYAbVJZ34q/BDftYgkMFq2YZDwz2AiGaDDsYrbfaDxv
	l1oHVg3f8ZycmDt8uzfxM2nHnfEynUg=
X-Google-Smtp-Source: ABdhPJzTM/tArVh+ns2OOQA9XMAMBi17sn5FYaO5v0Ib/PwR5H/Bh6X7IYgytV+bx62rQnufQvwliw==
X-Received: by 2002:a05:6638:22d0:: with SMTP id j16mr26901278jat.92.1595267803141;
        Mon, 20 Jul 2020 10:56:43 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:c488:d9d1:f30d:969e])
        by smtp.gmail.com with ESMTPSA id c7sm9400006ilo.85.2020.07.20.10.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 10:56:42 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/2] lib/oe/reproducible: Fix error when no git HEAD
Date: Mon, 20 Jul 2020 12:56:32 -0500
Message-Id: <20200720175632.25568-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720175632.25568-1-JPEWhacker@gmail.com>
References: <20200720175632.25568-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes an error that occurs when attempting to get the timestamp of the
latest commit when there is no HEAD in the git repository. The easiest
way to trigger this condition is to use the 'subdir=' option when
specifying a 'git://' SRC_URI.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/reproducible.py | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index f80a85ddef..f4f58dd952 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -47,14 +47,23 @@ def find_git_folder(d, sourcedir):
     return None
 
 def get_source_date_epoch_from_git(d, sourcedir):
-    source_date_epoch = None
-    if "git://" in d.getVar('SRC_URI'):
-        gitpath = find_git_folder(d, sourcedir)
-        if gitpath:
-            import subprocess
-            source_date_epoch = int(subprocess.check_output(['git','log','-1','--pretty=%ct'], cwd=gitpath))
-            bb.debug(1, "git repository: %s" % gitpath)
-    return source_date_epoch
+    if not "git://" in d.getVar('SRC_URI'):
+        return None
+
+    gitpath = find_git_folder(d, sourcedir)
+    if not gitpath:
+        return None
+
+    # Check that the repository has a valid HEAD; it may not if subdir is used
+    # in SRC_URI
+    p = subprocess.run(['git', 'rev-parse', 'HEAD'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, cwd=gitpath)
+    if p.returncode != 0:
+        bb.debug(1, "%s does not have a valid HEAD: %s" % (gitpath, p.stdout.decode('utf-8')))
+        return None
+
+    bb.debug(1, "git repository: %s" % gitpath)
+    p = subprocess.run(['git','log','-1','--pretty=%ct'], check=True, stdout=subprocess.PIPE, cwd=gitpath)
+    return int(p.stdout.decode('utf-8'))
 
 def get_source_date_epoch_from_youngest_file(d, sourcedir):
     if sourcedir == d.getVar('WORKDIR'):
-- 
2.27.0

