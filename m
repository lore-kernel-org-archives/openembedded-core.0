Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB919C4708D
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:26 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.70913.1670929885131388622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GxBgx7+e;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id h7so15218975wrs.6
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sU+mpc73mCDzf486CeAFRcps418ERQlJzahCO352uk4=;
        b=GxBgx7+eM54m/1xFcvnhpm8bPa8t/Qu8RROy011w1wfbwMJrAWxjpzoPFunPhk5RXN
         XaAjjDkbP1S7jl9RbpqVZycKiZTz+xVfoffekOmfkDVt3W4Qvga1Fnzfv7RUhogDMzEt
         0liHRF44w6FqdKBAkm1lesf4zpmWWaXiyhaIfcR7EosRw/PIy1rFGHBdnNqK3Dku+6Pm
         u2vtprQDkN0VAYqVBCxIqfBTsAcObwYNVLU7DPGj5wIbEJvEKu2vYnE6AbiVNyQj2rvu
         uQFrSYdupov75Uf5SHNeqyZNDJ4f2mVziPmgBpcEKQI9vu7XxnoiAyJi03HS1oxALClV
         dNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sU+mpc73mCDzf486CeAFRcps418ERQlJzahCO352uk4=;
        b=ZZpyQOb23SdypiDa+U3PnAp5iDyxWu/ienpN5mhZDe46bph2U4Lv4P1XGyDgKB3Iwn
         EtPtfcvYuOTab6cVDNAb/FW90KzwIx+y419sSo+bYw+o4T0ZJ5q+3VkuHcRy/jqIsDMV
         K/p+igam59zU56mZn6CTC2C0qRdRGMDnnD9Unz2XN7yweWFohi5L1hHuUtQTNJiJp0Is
         LDGFz87bge+qDVqgaFUwqRLo2P1BpKr8QosgzIHO3VabMCBk+u1Hpp2tys3z2z4Dop6m
         +gVyFj71P6STAX4moEDFcC0729wxvc9P1r5RizI/J/G2XvIfAZx6CLnkVLA9LapUw6vM
         r61Q==
X-Gm-Message-State: ANoB5plHXtuSP9ROqgVlBZa52A4wQqvaI7YJ2J2FnIenLlTmPN6NT2sG
	cvJ47EoKGa01J74c6SPH38nM1Auct/w=
X-Google-Smtp-Source: AA0mqf4G8Ph3V9mrms4n58I5QhUkVc7eCFP/BgxpNGZoLzDIFLxlAbety8O3kSKGB8SNWyI+M8656g==
X-Received: by 2002:a05:6000:1081:b0:242:4f41:1431 with SMTP id y1-20020a056000108100b002424f411431mr11762033wrw.28.1670929883351;
        Tue, 13 Dec 2022 03:11:23 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/24] devtool/upgrade: correctly handle recipes where S is a subdir of upstream tree
Date: Tue, 13 Dec 2022 12:10:56 +0100
Message-Id: <20221213111118.149697-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174512

'devtool modify' writes additional settings to workspace .bbappend so that this
can be handled correctly, but 'devtool upgrade' does not. This adds the missing
settings.

In particular, local files should not anymore mysteriously disappear from
SRC_URIs on upgrades.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/devtool/standard.py | 19 +++++++++++--------
 scripts/lib/devtool/upgrade.py  | 18 ++++++++----------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index e3b74ab8f0..f46ce34ad1 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -765,6 +765,16 @@ def get_staging_kbranch(srcdir):
         staging_kbranch = "".join(branch.split('\n')[0])
     return staging_kbranch
 
+def get_real_srctree(srctree, s, workdir):
+    # Check that recipe isn't using a shared workdir
+    s = os.path.abspath(s)
+    workdir = os.path.abspath(workdir)
+    if s.startswith(workdir) and s != workdir and os.path.dirname(s) != workdir:
+        # Handle if S is set to a subdirectory of the source
+        srcsubdir = os.path.relpath(s, workdir).split(os.sep, 1)[1]
+        srctree = os.path.join(srctree, srcsubdir)
+    return srctree
+
 def modify(args, config, basepath, workspace):
     """Entry point for the devtool 'modify' subcommand"""
     import bb
@@ -923,14 +933,7 @@ def modify(args, config, basepath, workspace):
 
         # Need to grab this here in case the source is within a subdirectory
         srctreebase = srctree
-
-        # Check that recipe isn't using a shared workdir
-        s = os.path.abspath(rd.getVar('S'))
-        workdir = os.path.abspath(rd.getVar('WORKDIR'))
-        if s.startswith(workdir) and s != workdir and os.path.dirname(s) != workdir:
-            # Handle if S is set to a subdirectory of the source
-            srcsubdir = os.path.relpath(s, workdir).split(os.sep, 1)[1]
-            srctree = os.path.join(srctree, srcsubdir)
+        srctree = get_real_srctree(srctree, rd.getVar('S'), rd.getVar('WORKDIR'))
 
         bb.utils.mkdirhier(os.path.dirname(appendfile))
         with open(appendfile, 'w') as f:
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 39a1910a49..967d157077 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -88,7 +88,7 @@ def _rename_recipe_files(oldrecipe, bpn, oldpv, newpv, path):
     _rename_recipe_dirs(oldpv, newpv, path)
     return _rename_recipe_file(oldrecipe, bpn, oldpv, newpv, path)
 
-def _write_append(rc, srctree, same_dir, no_same_dir, rev, copied, workspace, d):
+def _write_append(rc, srctreebase, srctree, same_dir, no_same_dir, rev, copied, workspace, d):
     """Writes an append file"""
     if not os.path.exists(rc):
         raise DevtoolError("bbappend not created because %s does not exist" % rc)
@@ -104,6 +104,11 @@ def _write_append(rc, srctree, same_dir, no_same_dir, rev, copied, workspace, d)
     af = os.path.join(appendpath, '%s.bbappend' % brf)
     with open(af, 'w') as f:
         f.write('FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"\n\n')
+        # Local files can be modified/tracked in separate subdir under srctree
+        # Mostly useful for packages with S != WORKDIR
+        f.write('FILESPATH:prepend := "%s:"\n' %
+                os.path.join(srctreebase, 'oe-local-files'))
+        f.write('# srctreebase: %s\n' % srctreebase)
         f.write('inherit externalsrc\n')
         f.write(('# NOTE: We use pn- overrides here to avoid affecting'
                  'multiple variants in the case where the recipe uses BBCLASSEXTEND\n'))
@@ -524,14 +529,7 @@ def upgrade(args, config, basepath, workspace):
         else:
             srctree = standard.get_default_srctree(config, pn)
 
-        # Check that recipe isn't using a shared workdir
-        s = os.path.abspath(rd.getVar('S'))
-        workdir = os.path.abspath(rd.getVar('WORKDIR'))
-        srctree_s = srctree
-        if s.startswith(workdir) and s != workdir and os.path.dirname(s) != workdir:
-            # Handle if S is set to a subdirectory of the source
-            srcsubdir = os.path.relpath(s, workdir).split(os.sep, 1)[1]
-            srctree_s = os.path.join(srctree, srcsubdir)
+        srctree_s = standard.get_real_srctree(srctree, rd.getVar('S'), rd.getVar('WORKDIR'))
 
         # try to automatically discover latest version and revision if not provided on command line
         if not args.version and not args.srcrev:
@@ -575,7 +573,7 @@ def upgrade(args, config, basepath, workspace):
             _upgrade_error(e, recipedir, srctree, args.keep_failure)
         standard._add_md5(config, pn, os.path.dirname(rf))
 
-        af = _write_append(rf, srctree_s, args.same_dir, args.no_same_dir, rev2,
+        af = _write_append(rf, srctree, srctree_s, args.same_dir, args.no_same_dir, rev2,
                         copied, config.workspace_path, rd)
         standard._add_md5(config, pn, af)
 
-- 
2.30.2


