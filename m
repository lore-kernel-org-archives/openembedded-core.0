Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A59C53210
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:56 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.16031.1672594729508806800
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=g7KAxaMU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id d10so17127172pgm.13
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6qF9wCVMB5ToKe7AQODOsozGDAV5P/XrqQ4aUoBCvc=;
        b=g7KAxaMUCeRh//dV2tT9/E6sYvVzyyWBlybgXl8ZSq/VKQp0LTPFlByGsnXJdXQ2QM
         PhYpUf9WtlLFo0jQmjlTVeVjHitjx+DehijBrluleqhoC2AEWhZh1KIdCrUuIMsqa/U4
         6E47PoS0pPyt4OyASAtjQUcruUfnA6ymYXvpLojjO9x7WFdGkBGu7o9zqarJ5umWu1rl
         Z8ub04rkqhdhm5CnLwsvDUVXDLd8MeKXem3QnsR7ZG8gbIsJNb6tq4V8p1teMqODo7cP
         Ail92ABock+tAoCKTl1IaapW/JFoNqWUUtHPY7Ka2fURUzio3ZHE8RDP8WnLMrM5FbAu
         vvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6qF9wCVMB5ToKe7AQODOsozGDAV5P/XrqQ4aUoBCvc=;
        b=OH4DqULOf+kkN/6d+ix3tkvKNW3RuTAoiLsD7kl2/BqnxGOiYm8QsS69/GsvUmXFgJ
         dOLJVMwq7oXFWHD5Re99Hhy+8pXYblXVKZbdcUjn/LguTWclNJf/FTz+MMAoWqzSGnH3
         i0v/HKZerfwZDl1XasoGET48940cw5gMRWjBbRlUKyBT64g/thQ17aNC8tAn/b8DO6ZL
         dDISN9KKCi2kugPn2X5PXd6q++Aq3GlSIXj6qzgj1bsciA6/yitG6TYimJdi5XfMkILj
         1RZx4YxGQleA2GemMSddXjAtTTopUz+L+L2n7Y23IqAWMLz2nvEgmlYbmQMJ9p8uBvGq
         XQ4Q==
X-Gm-Message-State: AFqh2kqVLxz55zDstLY9nHPDiQAqEoXs00wB8IBKUumz4rTl3vjEQnYN
	bS8+nzdIwln0MMWjEgZ/Y+rIBMI+GX9v5qajsGg=
X-Google-Smtp-Source: AMrXdXtqo63i6VnrY/wcEdbUao9YOQuaiydhuJxTE5t7CygfpndVa/hRia1t6IrDkygWwSfE29oc8g==
X-Received: by 2002:a05:6a00:1d23:b0:57f:faa9:2de with SMTP id a35-20020a056a001d2300b0057ffaa902demr37348944pfx.27.1672594728554;
        Sun, 01 Jan 2023 09:38:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/29] devtool/upgrade: correctly handle recipes where S is a subdir of upstream tree
Date: Sun,  1 Jan 2023 07:37:48 -1000
Message-Id: <580bf549500dbbc2bb794272d8d139e54972002e.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175214

From: Alexander Kanavin <alex.kanavin@gmail.com>

'devtool modify' writes additional settings to workspace .bbappend so that this
can be handled correctly, but 'devtool upgrade' does not. This adds the missing
settings.

In particular, local files should not anymore mysteriously disappear from
SRC_URIs on upgrades.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0817aa5537a8d7cc9591c53dfaa1d225f4c327f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 19 +++++++++++--------
 scripts/lib/devtool/upgrade.py  | 18 ++++++++----------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index c98bfe8195..4bbf9dd5a5 100644
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
2.25.1


