Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03E1C10F04
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 22:02:21 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.8242.1701381740115858589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 14:02:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=AH55iMZV;
 spf=pass (domain: baylibre.com, ip: 209.85.128.49, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40859dee28cso12956795e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 14:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701381738; x=1701986538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irohkeROhDHpKcZ2gm6k6FhrCsg9HzIhgY6tdZIIu4E=;
        b=AH55iMZVFBhBOaQKselkECs1kigIIj4F+s+0m3CM0RVSNti4F2OyySkzJMJSFk5aQu
         K5tprLa42SgLzF1KAZUCp5o9PYIHPhBMoPLo3tmDTcnQYNY127lAAMEpAxwkzOTSNG2b
         tGoreXJlUrtoO9/TFahTgn+C3RSP/A4OslspbbcpkrI9IbljdonPnVscQvJP5iIAqVdV
         h48f1RUaLoFRa4tcoSGy8pZJanrroDdabMsy97ItuEPqiv8tz9qIiTgrBYRaV7SyTZL/
         /1b8HW0Jb2gbBtaKjYyvy1l86ooi3C7yxHzgGI6OF7IEwZ0wDROOuh+eX5upyTnATnHW
         e1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701381738; x=1701986538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irohkeROhDHpKcZ2gm6k6FhrCsg9HzIhgY6tdZIIu4E=;
        b=GZM2IZYWbGvS6a2XM14WF2m7puh1Wnk5MH/YMdsK3t+JbiTMQKjFQFjf2L0+yEJM8C
         qyEIE/WZ6h8ZT7Vkb8IKIrhWOM7+WaxhTUmzr93CUVYfZS6cnzmSaSps8M2WUckYqVXX
         btUVpGWp/NElg+P7rpQoeglNOzEqC3Pbm2vtwLERKpMNCm+AG8nEhILdMH0gWHer/GVS
         IjbBduJiGz2fz0pju34oENsCpm5rOAupWBKoeZTDvWBIYcyfh+KOLgnCRg+AlCnaAWMA
         nIPSU4kS9CY0ftjUX5VG9/jm97wMxfNtjGvx+ZsPk6dakOLAyzsdQ5VEDv2oo+Z52YAg
         tFjw==
X-Gm-Message-State: AOJu0YyBVrZghpb6HrbISTYvjYTAqbbYZq5CJndW3aJaRWYwGrFEBTqN
	H+AtGWmxcvJ40JzZjcAqRADSd3cHhsXpBSAz4GpuWw==
X-Google-Smtp-Source: AGHT+IFTqtqHaSJHqPk+hxKrHUFmOI36nsQzBYNIVvlCb27fRCLH+/z+edtPwgBFbjZ6dh8NOBR9Ww==
X-Received: by 2002:a05:600c:6908:b0:40b:5e22:97d with SMTP id fo8-20020a05600c690800b0040b5e22097dmr116095wmb.108.1701381737795;
        Thu, 30 Nov 2023 14:02:17 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600c474300b0040b36050f1bsm3231372wmo.44.2023.11.30.14.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 14:02:17 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 3/8] recipeutils: bbappend_recipe: add a way to specify the name of the file to add
Date: Thu, 30 Nov 2023 23:01:51 +0100
Message-ID: <20231130220156.726263-4-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130220156.726263-1-jstephan@baylibre.com>
References: <20231130220156.726263-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 22:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191547

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


