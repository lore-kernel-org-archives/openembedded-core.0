Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.6507.1601503947940907514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WgYSAk2/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id b17so649208pji.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=O9SqiUNfMVOQkWTA2FTVgmrQyxB6Yw8fszFRJozxmJo=;
        b=WgYSAk2/F0dP7UKrIXvEifh198LDV7R8+iseEulxfJXiMUlOdqeje/4LCBdF1kk+7r
         7jfNgXD4z57g8C9G8XEosBzOSSckGFyI5Kwa9qhSyX3Np1IPgw9derOgt2o+a83xXytb
         1J/2bEPX36NYHSpvc1pBrcp5mUHRbYZo4h39IBsAIa2sYppfxo6yFCBiZgADpo3q6NBy
         PahaTIk29nhRIQC3t0pWmdTO8lRFDbz6oojBSgWlBtxfsQlX9369sJG6UBI6KJ/Kjgdj
         4bI1imWM7vNOsWVfJX+Yrn1O/rRRqdezcD81EFe8HiSq8YVLVhIWPoipfpe4LGfi5zR/
         inRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=O9SqiUNfMVOQkWTA2FTVgmrQyxB6Yw8fszFRJozxmJo=;
        b=U4Moi3lmt0wxW8hao7kagAZe9hSHlDABogs+3qt1vyC8iN5y/RNFzAMaE2wW3cEAxk
         n9uolTY/FxucbIcsUHOVx2Ycg0QZzJeukZAastQUWmvtzHge/UR4z7kvyLuOIxkIPjDC
         6ik3w1SoTf+/dETUiZNx4KxG5d7RYnQWyAtPZHHFoFk3K4gXz8TqGhFBfozmxRZqND94
         /N5zbHkYhmME8wFmrm3IxxxAcYUKTKG11YCtBHDa6w3mFncGTF0bEUywo5YohmOX5LbS
         a5FfkS4vquvqBXbNGYIjbK7b+Pv6dWD2yIFYYjk+lE1cC19cSpVMslHKOTEGH++QcMOT
         6aSw==
X-Gm-Message-State: AOAM530bSZEhzi8E6VIZMj8EyvPfpiSctVWW9WbL0lSMRYMsDSEAq2Ob
	JVpJ1+xgH3Sq1/jcdCv8OZC3UcGU4YHqGAVCjI0=
X-Google-Smtp-Source: ABdhPJz7nwfjFvoy7y00pMldwBg8QiaTcRL+hc1wV995u7CUnlbU9Of6DRKgrGfFYTTZfpP+qww3cA==
X-Received: by 2002:a17:90a:c686:: with SMTP id n6mr4473200pjt.51.1601503947070;
        Wed, 30 Sep 2020 15:12:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/41] cve-update-db-native: move -journal checking into do_fetch
Date: Wed, 30 Sep 2020 12:11:12 -1000
Message-Id: <0e11c37e49272b967010df7dcebbe73a76f70edb.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Chris Laplante <chris.laplante@agilent.com>

It was always questionable to do this in an anonymous function, but now
with multiconfig it is a critical mistake and leads to more strange
"Exception: sqlite3.OperationalError: disk I/O error" errors.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fcbc9d0e8421a3a559db05005ba042337cd5d864)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 2c0e508e32..73da8ae6a2 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -15,12 +15,6 @@ deltask do_populate_sysroot
 python () {
     if not bb.data.inherits_class("cve-check", d):
         raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
-
-    if os.path.exists("%s-journal" % cve_check_db_file ):
-        os.remove("%s-journal" % cve_check_db_file)
-
-        if os.path.exists(cve_check_db_file):
-            os.remove(cve_check_db_file)
 }
 
 python do_populate_cve_db() {
@@ -41,6 +35,14 @@ python do_populate_cve_db() {
     db_dir = os.path.dirname(db_file)
     json_tmpfile = os.path.join(db_dir, 'nvd.json.gz')
 
+    if os.path.exists("{0}-journal".format(db_file)):
+        # If a journal is present the last update might have been interrupted. In that case,
+        # just wipe any leftovers and force the DB to be recreated.
+        os.remove("{0}-journal".format(db_file))
+
+        if os.path.exists(db_file):
+            os.remove(db_file)
+
     # Don't refresh the database more than once an hour
     try:
         import time
-- 
2.17.1

