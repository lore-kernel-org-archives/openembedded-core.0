Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BBFC46CA0
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 22:02:32 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.8313.1701381741659884616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 14:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=obCcP7Li;
 spf=pass (domain: baylibre.com, ip: 209.85.128.43, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40b4746ae51so13830815e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 14:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701381740; x=1701986540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0A2Csb82tyO8jIYeTdUPimOl0tZexdazW6BsrJplSs=;
        b=obCcP7LiG68tto7xmzZSyVOqylNdq0Ys5OFGKV/KHLWrYzjTWShhCoKoL054shbBgN
         pePPgzFoq6el3icGYsvcYKN12Yy6lb4+LEFbQyhJB8GWnHDkzdyq+vLN1+2NES1/JUt+
         GjGOKWF6K7BTEE6WLD8ijqLCmSHfkymf9+4OcGbJcqoUvRDeuo5UJcUw+D/pJrTNUC6m
         BKauSxaWfmQ0QPTf+ABgMd/f0lqMuX2C6eKmrKskQAT64pYauKmufrmskGhJd/fr6giV
         25N6ZFF+4gLUMPAi10GAngt40Gc9z7/xp5vthH3lYoF9SMkV7bjUY4YmipeCQqSkkLBz
         fUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701381740; x=1701986540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0A2Csb82tyO8jIYeTdUPimOl0tZexdazW6BsrJplSs=;
        b=BRkZzbDWX0Gh2WEpq6XjsxsiIuo8tm/WXgwAB3MqTKmqPjKC9eqsfLroDhNSaw2N2c
         CjEWmGF078m4iqZ6lJhoZQV9Ig2KEQ3QQZcx2RTtfi3FenyqmbyUW0XuYq9sD4WEzwem
         8qXgcUp4bEZZhN6C8Ker9bgyvVcY0SC/tq45iz0GlVlJQvTAvGBLIxVyZw41WmCVTfv1
         NyDQJJiVfUZ4QuVGhOMqdvNpaGupjeQJ7RZCIibBD2Lxf+tAfgZTZpteWYp0xuuXutht
         SCud0+JR8EYnBxZUkn0qJFvGFfJoIzRQcqX+WSjZEjroCu/yArhPYGMfuZ1/1uwo22xC
         9ajw==
X-Gm-Message-State: AOJu0YzaOqgvZLKvazaR1hY2WJEjLDBDhtYXGKYG71Kqm88dTA03Mve0
	70yjutH30imWumhb27E8pxTDAWACiwTB5Q5i83yZcA==
X-Google-Smtp-Source: AGHT+IFcOf6rUclu3RVmFZ5RFai5rJfxggQ+ZCuz30rlDBXhkqo8BZztDxrDt2PwJ6UHtHzJiGzuMg==
X-Received: by 2002:a05:600c:3582:b0:40b:5e1e:cfe with SMTP id p2-20020a05600c358200b0040b5e1e0cfemr83848wmq.57.1701381740008;
        Thu, 30 Nov 2023 14:02:20 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600c474300b0040b36050f1bsm3231372wmo.44.2023.11.30.14.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 14:02:19 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 5/8] recipeutils: bbappend_recipe: allow to patch the recipe itself
Date: Thu, 30 Nov 2023 23:01:53 +0100
Message-ID: <20231130220156.726263-6-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130220156.726263-1-jstephan@baylibre.com>
References: <20231130220156.726263-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 22:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191549

Add a new parameter update_original_recipe to allow to patch a recipe
instead of creating/updating a bbappend

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oe/recipeutils.py | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 9784ae3b031..c768c5a4582 100644
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
@@ -803,6 +813,8 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
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


