Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29ED9C10DC1
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:26:22 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.72249.1701703578236799893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=GZt1uYZO;
 spf=pass (domain: baylibre.com, ip: 209.85.221.45, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3335397607dso376943f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701703576; x=1702308376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liqggH+EgGCA3UCpWpXePVLNfUzms3eiOsEddC9yAyE=;
        b=GZt1uYZOL1Fw045WpeiGIZO5hmHy7gCTs9MW4nMvuYLUPEaFgFuijlPOC0TzaUbjfg
         PnFXs1TVVzpQFT+1VbG3ievmsPRKaSRFTSPQiSefBYUfFVNeGa2gqP914QbrfK66sjj5
         KXzQhoLf7eaJUizOvdRCWxHe9oFZT0Lr4aHdvi3ZN8VBOaCRFMfUEP5swggpq2QUeVWJ
         3EN3nIueth1FNUAPDjOMPAmUiQt7PjQPEamsoXMGDohfFE276IOkUsulZyl4KNvi0pp3
         JXfCzdbtnGF4XwXfQfTXj2yH8Gue4JMjGgcHSLfxRLZFZP635/GoE9Z+yUhUtZJc5Waq
         LasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701703576; x=1702308376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liqggH+EgGCA3UCpWpXePVLNfUzms3eiOsEddC9yAyE=;
        b=uS6QPZf7lRANij62JCopaOggVCM8nACcV99Zuw7viAm3P7O/hPWYTMMcSIrhNJx42p
         9EDFa7cJHdMPZ16oMNdLMaIKm/fpSdbUVm1+R+K1UvQiB3Q1rJbXSwRpA+9zcwRj3OHP
         fJhRZqYdASAYNJ8dBTtQZUNP65uQC7e4nN691DWj0OPgMBKeq83UHVoEogVZkb+j+bAs
         7avdLtRBcZTpkmVkgUwTe3UAROGjUtJ3euVqQtrTiIT2rlb/+rQ8xA+S2ShfIOfCZP47
         D91dWZHqjs1HB7Ry4l5SePsxvu6dtL0nzKdcJOORD1hmxP3jAZ1m3/A++CdQ+5z4GukZ
         fb4w==
X-Gm-Message-State: AOJu0YwyvmY//isIm/JCttHT6eQWuvciPc12SRjMkdzPHRe0aD+N86R7
	8/wPjOeT+wlNLphb321jOEM3aHHdBnh3zyCDxBXO6g==
X-Google-Smtp-Source: AGHT+IEwOa6w9gJnqipUZm00LQXQPBCGCOjqcq4eN4HAUasNM5JsXAWS5zGwjBb2BmqPm08yM0oTFg==
X-Received: by 2002:a05:600c:35d6:b0:40b:5e21:bdb8 with SMTP id r22-20020a05600c35d600b0040b5e21bdb8mr2175149wmq.71.1701703576117;
        Mon, 04 Dec 2023 07:26:16 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id w7-20020a5d6087000000b0033340937da6sm5257341wrt.95.2023.12.04.07.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:26:15 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 6/9] recipeutils: bbappend_recipe: allow to patch the recipe itself
Date: Mon,  4 Dec 2023 16:26:00 +0100
Message-ID: <20231204152603.831495-7-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204152603.831495-1-jstephan@baylibre.com>
References: <20231204152603.831495-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191750

Add a new parameter update_original_recipe to allow to patch a recipe
instead of creating/updating a bbappend

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oe/recipeutils.py | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 8aa82396c86..013b7412742 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -664,7 +664,7 @@ def get_bbappend_path(d, destlayerdir, wildcardver=False):
     return (appendpath, pathok)
 
 
-def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False, machine=None, extralines=None, removevalues=None, redirect_output=None, params=None):
+def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False, machine=None, extralines=None, removevalues=None, redirect_output=None, params=None, update_original_recipe=False):
     """
     Writes a bbappend file for a recipe
     Parameters:
@@ -698,19 +698,29 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
         params:
             Parameters to use when adding entries to SRC_URI. If specified,
             should be a list of dicts with the same length as srcfiles.
+        update_original_recipe:
+            Force to update the original recipe instead of creating/updating
+            a bbapend. destlayerdir must contain the original recipe
     """
 
     if not removevalues:
         removevalues = {}
 
     recipefile = rd.getVar('FILE')
-    # Determine how the bbappend should be named
-    appendpath, pathok = get_bbappend_path(rd, destlayerdir, wildcardver)
-    if not appendpath:
-        bb.error('Unable to determine layer directory containing %s' % recipefile)
-        return (None, None)
-    if not pathok:
-        bb.warn('Unable to determine correct subdirectory path for bbappend file - check that what %s adds to BBFILES also matches .bbappend files. Using %s for now, but until you fix this the bbappend will not be applied.' % (os.path.join(destlayerdir, 'conf', 'layer.conf'), os.path.dirname(appendpath)))
+    if update_original_recipe:
+        if destlayerdir not in recipefile:
+            bb.error("destlayerdir %s doesn't contain the original recipe (%s), cannot update it" % (destlayerdir, recipefile))
+            return (None, None)
+
+        appendpath = recipefile
+    else:
+        # Determine how the bbappend should be named
+        appendpath, pathok = get_bbappend_path(rd, destlayerdir, wildcardver)
+        if not appendpath:
+            bb.error('Unable to determine layer directory containing %s' % recipefile)
+            return (None, None)
+        if not pathok:
+            bb.warn('Unable to determine correct subdirectory path for bbappend file - check that what %s adds to BBFILES also matches .bbappend files. Using %s for now, but until you fix this the bbappend will not be applied.' % (os.path.join(destlayerdir, 'conf', 'layer.conf'), os.path.dirname(appendpath)))
 
     appenddir = os.path.dirname(appendpath)
     if not redirect_output:
@@ -755,7 +765,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
             bbappendlines.append((varname, op, value))
 
     destsubdir = rd.getVar('PN')
-    if srcfiles:
+    if not update_original_recipe and srcfiles:
         bbappendlines.append(('FILESEXTRAPATHS:prepend', ':=', '${THISDIR}/${PN}:'))
 
     appendoverride = ''
@@ -789,7 +799,10 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
                         appendline('SRC_URI:append%s' % appendoverride, '=', ' ' + srcurientry)
                     else:
                         if oldentry:
-                            appendline('SRC_URI:remove', '=', oldentry)
+                            if update_original_recipe:
+                                removevalues['SRC_URI'] = oldentry
+                            else:
+                                appendline('SRC_URI:remove', '=', oldentry)
                         appendline('SRC_URI', '+=', srcurientry)
             copyfiles[newfile] = srcfile
             if install:
@@ -811,6 +824,8 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
         # multiple times per operation when we're handling overrides)
         if os.path.exists(appendpath) and not os.path.exists(outfile):
             shutil.copy2(appendpath, outfile)
+    elif update_original_recipe:
+        outfile = recipefile
     else:
         bb.note('Writing append file %s' % appendpath)
         outfile = appendpath
-- 
2.42.0


