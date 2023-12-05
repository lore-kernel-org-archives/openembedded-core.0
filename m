Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACDFC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:57:01 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.102651.1701788211249722619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=NzmvXtqM;
 spf=pass (domain: baylibre.com, ip: 209.85.221.46, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3316c6e299eso5026770f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701788209; x=1702393009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVPsC0HTKfjpGujZfVkG8OPHgXuOSbDa2N5RmWsNBTU=;
        b=NzmvXtqMtPfc9uoExit+6z+uIiAQucdrO3BRHQ+cpzdtqwq+na9MDUxvRRNGPmc+qj
         0kafpIkCjotEO3cq0qJXZ7+hItJWraoH+PgTiREdISlAXsAY6O+GMI1Sg3q58WbWoqGh
         MSG2A9CR+JeS1CG9KMCLMv/FkLqn3/fvpcjgC+XwElSOVHnnWYsaFpbc12jt1sNO/6qv
         McmSjiUp1Dh21/pTX91aMKkx0e+Nr93Sc1Mag9UElYT7VgpYX6zMrK7tdPOKdu6zT7HS
         iVzplDFe6wFv2MHDTSfcrtrFa2ICPatQR5hn2+fAj4HkEPSW4vFObSPFAfxIELj3JxJv
         KxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788209; x=1702393009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVPsC0HTKfjpGujZfVkG8OPHgXuOSbDa2N5RmWsNBTU=;
        b=AeXe2H3BqEvJG7w9eVuaWrMlv9SnBNBJmEg0OGRYiIbNGseTJR/DiB6w+iZtZHgRBT
         aNg+Aumano2/vHrL3DjsUA/pvVP5874UgluaWCRvxCdSWlek99YrYcb0QW0cgz2az1QP
         UqBAMikEuga76MCdzkaleNG11Ji5YTnsI+t5ZLKhHwaJ3g0fTlzq8eNz7Eo+1+ciYUX8
         lIOeq7lRGlDE22aNdj8aRpvD+WIwYWyMHd19srsAh/Fz+6/LoukSB7Pjd3pQS4i99Lqg
         aJGSDVnsrC4pBK9PKrqORnHqc15+N8OHOVgvilDoJfXR6IcMET3+3QqIJHybItYCI8Yr
         au2g==
X-Gm-Message-State: AOJu0YzobHV7j7LLrLCOcqYnkrNWiKyJGMAXfGtg92bGr9ezWmokhCTP
	4b7T3df5xW8t23xi3WWCuBZ1kq/hvdujhFi7W8coXA==
X-Google-Smtp-Source: AGHT+IHqO0a2grsLQA4l4pOF4Xfqs4E6wl0QjnP6sicoMPudNlaS1RFTzrYll9vCOuR6JTbgD9aT9w==
X-Received: by 2002:a5d:50c2:0:b0:333:2fc4:456 with SMTP id f2-20020a5d50c2000000b003332fc40456mr2660357wrt.79.1701788209206;
        Tue, 05 Dec 2023 06:56:49 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id cp6-20020a056000400600b003334520e49bsm6750082wrb.53.2023.12.05.06.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:56:48 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 07/10] recipeutils: bbappend_recipe: allow to patch the recipe itself
Date: Tue,  5 Dec 2023 15:56:33 +0100
Message-ID: <20231205145636.960819-8-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205145636.960819-1-jstephan@baylibre.com>
References: <20231205145636.960819-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 14:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191836

Add a new parameter update_original_recipe to allow to patch a recipe
instead of creating/updating a bbappend

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oe/recipeutils.py | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index d86873056fe..ae02af0feeb 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -664,7 +664,7 @@ def get_bbappend_path(d, destlayerdir, wildcardver=False):
     return (appendpath, pathok)
 
 
-def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False, machine=None, extralines=None, removevalues=None, redirect_output=None, params=None):
+def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False, machine=None, extralines=None, removevalues=None, redirect_output=None, params=None, update_original_recipe=False):
     """
     Writes a bbappend file for a recipe
     Parameters:
@@ -701,19 +701,29 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
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
@@ -758,7 +768,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
             bbappendlines.append((varname, op, value))
 
     destsubdir = rd.getVar('PN')
-    if srcfiles:
+    if not update_original_recipe and srcfiles:
         bbappendlines.append(('FILESEXTRAPATHS:prepend', ':=', '${THISDIR}/${PN}:'))
 
     appendoverride = ''
@@ -791,7 +801,10 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
                         appendline('SRC_URI:append%s' % appendoverride, '=', ' ' + srcurientry)
                     else:
                         if oldentry:
-                            appendline('SRC_URI:remove', '=', oldentry)
+                            if update_original_recipe:
+                                removevalues['SRC_URI'] = oldentry
+                            else:
+                                appendline('SRC_URI:remove', '=', oldentry)
                         appendline('SRC_URI', '+=', srcurientry)
                 param['path'] = srcfile
             else:
@@ -816,6 +829,8 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
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


