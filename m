Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web11.5819.1591152857052345612
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 19:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gw/zz+4H;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id l6so1023086ilo.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 19:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lqAmIo86Ed4JiIeOuhDNYAfD/xpaF28tHKUVH9i5PT0=;
        b=Gw/zz+4HaQ2OSk/OuANx8rh+Th9sjhD5GltoXNpTvtPxEwyYpSyBpfkdVzbudst6c/
         Dx7UyMsaCkgNnbTG/QS4Nt8fzVEPg3UOIC47HPYw5+Sj5/TRCnQPl3eP7A4fGDTKiwwO
         LD1doop0XMn5FEKY00GLaDOecthI6IDsCCHCScXBk39wtgPA0yeAEohC7daICAfnBLwL
         WruXQNGMBpTZjssgizrz1WpAznpI4gG5tUIV3VzJzFnm0PbFEf8DYOB6sfKAGtbPGNx9
         zLlTVjXIVEhQIKqzHOHe2oCuk7b+tuNkgNLEGgTewX1ZBE6DggiFgigNrViPQ1p0Sy/C
         vX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lqAmIo86Ed4JiIeOuhDNYAfD/xpaF28tHKUVH9i5PT0=;
        b=XCp32zFZ6riS2o+Z27QXalSkE91O3AGB0xj+6j6+mk+0Mda0AwhXAgWuIQrEuFASEK
         DnOJHdNl3fUMSHSZ8NS8K92Qqns+YhrEakDnr27750lFiyGRvPH+GLbcQQpliUXjN69T
         A1iCjSQfKKqt0KnLUcsJ9w+uFN0VwkAdv9myeDmxWNW/FNVI9MKVx/gobf92YZJshLU2
         0CjfOyGHU6OHol4SunaWwU8x/0rqoe78LQAqCztI8O/6kSADGQIvrjTxQuTWUsr3T4zg
         BJ/iX7v38LI7A13mJOs/+vBgsrl3sWe7xkEn6/ym5RKDOQZGJt/iN1pJ9utQCdVJuBPH
         rgfg==
X-Gm-Message-State: AOAM533pxGHwktCNRqNmHaFdbyHYDXUaMxiiJoLbNuyuE7U2N18TA0+x
	XL/6K2UzLnxRTtWi6PVw8lJRcrxGN48=
X-Google-Smtp-Source: ABdhPJzXlNWOpKve8E9Xgf79/Zc/4VZX6OVPtJRFUatSubhW6I5XUOj04oLcriDvaY+TmwbEiPVO8g==
X-Received: by 2002:a92:d151:: with SMTP id t17mr2093487ilg.101.1591152856235;
        Tue, 02 Jun 2020 19:54:16 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:b01b:daad:c850:7bb9])
        by smtp.gmail.com with ESMTPSA id x15sm355643ilj.78.2020.06.02.19.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 19:54:15 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 6/8] bitbake: cache: Cache size optimization
Date: Tue,  2 Jun 2020 21:54:03 -0500
Message-Id: <20200603025405.26885-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603025405.26885-1-JPEWhacker@gmail.com>
References: <20200601202807.26357-1-JPEWhacker@gmail.com>
 <20200603025405.26885-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that there is a cache object per multiconfig, it is not necessary
for each cache object to parse all other multiconfigs. Instead, each
cache now only parses the files for it's multiconfig.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 bitbake/lib/bb/cache.py  | 22 ++++++++++++++++++----
 bitbake/lib/bb/cooker.py |  8 +-------
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/bitbake/lib/bb/cache.py b/bitbake/lib/bb/cache.py
index b34bfa9b5a..df78d5b701 100644
--- a/bitbake/lib/bb/cache.py
+++ b/bitbake/lib/bb/cache.py
@@ -328,7 +328,7 @@ class NoCache(object):
         bb_data = self.load_bbfile(virtualfn, appends, virtonly=True)
         return bb_data[virtual]
 
-    def load_bbfile(self, bbfile, appends, virtonly = False):
+    def load_bbfile(self, bbfile, appends, virtonly = False, mc=None):
         """
         Load and parse one .bb build file
         Return the data and whether parsing resulted in the file being skipped
@@ -341,6 +341,10 @@ class NoCache(object):
             datastores = parse_recipe(bb_data, bbfile, appends, mc)
             return datastores
 
+        if mc is not None:
+            bb_data = self.databuilder.mcdata[mc].createCopy()
+            return parse_recipe(bb_data, bbfile, appends, mc)
+
         bb_data = self.data.createCopy()
         datastores = parse_recipe(bb_data, bbfile, appends)
 
@@ -500,7 +504,7 @@ class Cache(NoCache):
         """Parse the specified filename, returning the recipe information"""
         self.logger.debug(1, "Parsing %s", filename)
         infos = []
-        datastores = self.load_bbfile(filename, appends)
+        datastores = self.load_bbfile(filename, appends, mc=self.mc)
         depends = []
         variants = []
         # Process the "real" fn last so we can store variants list
@@ -720,8 +724,18 @@ class Cache(NoCache):
         return bb.parse.cached_mtime_noerror(cachefile)
 
     def add_info(self, filename, info_array, cacheData, parsed=None, watcher=None):
-        if cacheData is not None and isinstance(info_array[0], CoreRecipeInfo) and (not info_array[0].skipped):
-            cacheData.add_from_recipeinfo(filename, info_array)
+        if self.mc is not None:
+            (fn, cls, mc) = virtualfn2realfn(filename)
+            if mc:
+                self.logger.error("Unexpected multiconfig %s", virtualfn)
+                return
+
+            vfn = realfn2virtual(fn, cls, self.mc)
+        else:
+            vfn = filename
+
+        if isinstance(info_array[0], CoreRecipeInfo) and (not info_array[0].skipped):
+            cacheData.add_from_recipeinfo(vfn, info_array)
 
             if watcher:
                 watcher(info_array[0].file_depends)
diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
index 50526d52b2..effd02442c 100644
--- a/bitbake/lib/bb/cooker.py
+++ b/bitbake/lib/bb/cooker.py
@@ -2199,13 +2199,7 @@ class CookerParser(object):
             if info_array[0].skipped:
                 self.skipped += 1
                 self.cooker.skiplist[virtualfn] = SkippedPackage(info_array[0])
-            (fn, cls, fnmc) = bb.cache.virtualfn2realfn(virtualfn)
-
-            if fnmc == mc:
-                cache = self.cooker.recipecaches[mc]
-            else:
-                cache = None
-            self.bb_caches[mc].add_info(virtualfn, info_array, cache,
+            self.bb_caches[mc].add_info(virtualfn, info_array, self.cooker.recipecaches[mc],
                                         parsed=parsed, watcher = self.cooker.add_filewatch)
         return True
 
-- 
2.26.2

