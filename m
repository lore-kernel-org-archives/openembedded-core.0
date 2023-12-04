Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F9AC46CA3
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:26:22 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.72245.1701703574447889969
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=aaNBgDBk;
 spf=pass (domain: baylibre.com, ip: 209.85.221.49, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33330a5617fso2665062f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701703573; x=1702308373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irohkeROhDHpKcZ2gm6k6FhrCsg9HzIhgY6tdZIIu4E=;
        b=aaNBgDBkcmoV2lnX4Q+WB2nyU6RaToGn3AQE6XcJ4whBTAIKk1F2pYDKTQLDNrrlTF
         qtsX/1Hsh05YA/vrJdgWNHkTQLZmNSYgAF41XQZAsm8HaI5QCx3Y2qWbZr1JFaRwopTK
         hzIfMuJHbzq1IHPteRbBTREljERJfjP/UPZnSPM7b6gGwQg2EYn9Lgja9aET/GNc9p0z
         YfjlCoX0sO7tEaTIEik7+3bwEudiUHdhxEGU8vVQPK6sbB2vZR7pxqaQcErSthohSvEp
         qZQFMb+YAIAYXbTyKiImGRBOYUTM18eCXWubGlQAIllXvXEMr0pYRI7Tu79hP9D0Iy+I
         X+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701703573; x=1702308373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irohkeROhDHpKcZ2gm6k6FhrCsg9HzIhgY6tdZIIu4E=;
        b=uZDQe66GfirYjZLAM/zAKTDEOkh42zfnAekVtum0eGExME4PEwp6VzGhq+7Y9rSrr6
         yJBuoTMazN4CssKLmvVM23e5D0D2P0YI16RMsfC4FVN1hC8F3Nv6GALZ76ka+iVgSSGO
         BWRgSEtmNXc51uya+l2Nu36VDjJVmpXMyZbjcRB2asfAYluSzWtXc2RoIh3meTSaVySa
         MBeZETiDCJXpv5AWO8aZesAnAT6GSkBqEUvxZCurZmhy9yAGIBbGKVn1OswqaJqJDIiM
         71AXCVx7nLcqGn4neV52g2sJTwDmqtjKiPRfXbv6y3aCWi0W3MRnKo8tILeI6xhQ5ZTR
         WqbA==
X-Gm-Message-State: AOJu0Yz+01bwMtyMTJ82wZDIGfxIOBGE6bNvUtaIYID5Xa6Yfcq7oFO7
	oGGwsWlgCxeMk3gkSPMIx3gnaBsX7X/+Y/yBWUkGRw==
X-Google-Smtp-Source: AGHT+IEHIv7gNIHIw4oF6BcUoWco/DTKeYYFVMJJq9VOSU3xwSJQQnxT5w7PWGf4dQF5mOIwu/9PVQ==
X-Received: by 2002:a5d:65c7:0:b0:333:3ffe:dbcd with SMTP id e7-20020a5d65c7000000b003333ffedbcdmr1968939wrw.36.1701703572843;
        Mon, 04 Dec 2023 07:26:12 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id w7-20020a5d6087000000b0033340937da6sm5257341wrt.95.2023.12.04.07.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:26:12 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 3/9] recipeutils: bbappend_recipe: add a way to specify the name of the file to add
Date: Mon,  4 Dec 2023 16:25:57 +0100
Message-ID: <20231204152603.831495-4-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204152603.831495-1-jstephan@baylibre.com>
References: <20231204152603.831495-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191745

bbappend_recipe can take a dict of source files to add to SRC_URI where
the key is the full path to the file to be added and the value is
the original file in the recipe space.

Modify the dict value to use a tupple: (originalfile, newname), to allow
specifying the name of the file we would like to add

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oe/recipeutils.py       | 20 ++++++++++++--------
 scripts/lib/devtool/standard.py  |  6 +++---
 scripts/lib/recipetool/append.py |  4 ++--
 3 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 7465a2d0ab4..9784ae3b031 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -671,12 +671,13 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
         rd: data dictionary for the recipe
         destlayerdir: base directory of the layer to place the bbappend in
             (subdirectory path from there will be determined automatically)
-        srcfiles: dict of source files to add to SRC_URI, where the value
-            is the full path to the file to be added, and the value is the
-            original filename as it would appear in SRC_URI or None if it
-            isn't already present. You may pass None for this parameter if
-            you simply want to specify your own content via the extralines
-            parameter.
+        srcfiles: dict of source files to add to SRC_URI, where the key
+            is the full path to the file to be added, and the value is a tuple
+            containing the original filename as it would appear in SRC_URI
+            or None if it isn't already present and the new name of the file or
+            None to use by default basename(original filename).
+            You may pass None for this parameter if you simply want to specify
+            your own content via the extralines parameter.
         install: dict mapping entries in srcfiles to a tuple of two elements:
             install path (*without* ${D} prefix) and permission value (as a
             string, e.g. '0644').
@@ -764,11 +765,14 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
     copyfiles = {}
     if srcfiles:
         instfunclines = []
-        for i, (newfile, origsrcfile) in enumerate(srcfiles.items()):
+        for i, (newfile, (origsrcfile, newname)) in enumerate(srcfiles.items()):
             srcfile = origsrcfile
             srcurientry = None
             if not srcfile:
-                srcfile = os.path.basename(newfile)
+                if newname:
+                    srcfile = newname
+                else:
+                    srcfile = os.path.basename(newfile)
                 srcurientry = 'file://%s' % srcfile
                 if params and params[i]:
                     srcurientry = '%s;%s' % (srcurientry, ';'.join('%s=%s' % (k,v) for k,v in params[i].items()))
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d53fb810071..fa473014f90 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1568,7 +1568,7 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
                 update_srcuri = True
 
         if appendlayerdir:
-            files = dict((os.path.join(local_files_dir, key), val) for
+            files = dict((os.path.join(local_files_dir, key), (val, None)) for
                           key, val in list(upd_f.items()) + list(new_f.items()))
             removevalues = {}
             if update_srcuri:
@@ -1678,9 +1678,9 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
         destpath = None
         srcuri = (rd.getVar('SRC_URI', False) or '').split()
         if appendlayerdir:
-            files = OrderedDict((os.path.join(local_files_dir, key), val) for
+            files = OrderedDict((os.path.join(local_files_dir, key), (val, None)) for
                          key, val in list(upd_f.items()) + list(new_f.items()))
-            files.update(OrderedDict((os.path.join(patches_dir, key), val) for
+            files.update(OrderedDict((os.path.join(patches_dir, key), (val, None)) for
                               key, val in list(upd_p.items()) + list(new_p.items())))
             if files or remove_files:
                 removevalues = None
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 314ff4e20fd..09e314481f1 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -300,7 +300,7 @@ def appendfile(args):
                 if st.st_mode & stat.S_IXUSR:
                     perms = '0755'
             install = {args.newfile: (args.targetpath, perms)}
-        oe.recipeutils.bbappend_recipe(rd, args.destlayer, {args.newfile: sourcepath}, install, wildcardver=args.wildcard_version, machine=args.machine)
+        oe.recipeutils.bbappend_recipe(rd, args.destlayer, {args.newfile: (None, sourcepath)}, install, wildcardver=args.wildcard_version, machine=args.machine)
         tinfoil.modified_files()
         return 0
     else:
@@ -354,7 +354,7 @@ def appendsrc(args, files, rd, extralines=None):
                 logger.warning('{0!r} is already in SRC_URI, not adding'.format(source_uri))
         else:
             extralines.append('SRC_URI += {0}'.format(source_uri))
-        copyfiles[newfile] = srcfile
+        copyfiles[newfile] = (None, srcfile)
 
     dry_run_output = None
     dry_run_outdir = None
-- 
2.42.0


