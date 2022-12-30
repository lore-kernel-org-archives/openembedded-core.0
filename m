Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6A1C3DA7D
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:45:24 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.22322.1672418717913481871
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=afma28Ot;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id v3so14509048pgh.4
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBuUmjbv5wzumA/hm8QxSZZWPFJ2mpL88DDWyPa1tDA=;
        b=afma28OtY7iuv8SLkE3r3B4X/2+KbpDiq6yYiohaI99fndZ+Vl/N2oKRW//ltnpeBM
         92HuASU+jlrpctafVDYFEXZ6wYSefwgj4ffE9R0A+8cX2DS9eEQgfUvaCnExu66F6KUz
         Xo8JaAuk4PCTQRdt2g3XY/A0vPp764ljhT6YzewHH73CD8rRHBbsQYd6Jfd4bd+X17T/
         l97S+Ob2Web9XdZENuhlZSKEbGUo7rtQ7t4jr3F0w8hSsdmuq0Hb3cH9nqJGzl79jeoS
         RqmNXoP5rQPSR2fp/TX4l9OWLlkVF11BxTZkC7lc4UqA7gKjrz5/iV1EHdCYStxdcja3
         I4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBuUmjbv5wzumA/hm8QxSZZWPFJ2mpL88DDWyPa1tDA=;
        b=6l788k54RZJdtulNi7SP8TWWtWMFotkFP6FF5+FbjRdAbdes+tXIXRPMYS1XCpbno/
         3ovq21YdCcfKdcwm557eQ3aD1JfdEwkWZYsDa+TNBcALWfAUBF1QaGCX/te6gaPMp5nf
         ZwXXPLSReL2pw78d/oCsVXdnnXpgrTkDqzrksR7UdZ9DNG9Vd0XWqSNOC3taCrmKiZiC
         CsPEDTAT2el5weNvUZq9VOFipd9bdJ+JqpWfa1qkHYID4RlcpEBmeHZkrjN5viqM0tP5
         LEUnbINdUw5iRCI/8UEWO7n7BF5OcucK771hQ/w0KhgxyS7n7ReyXSZjG9G508d1ltxi
         dKFA==
X-Gm-Message-State: AFqh2krOYCmw+KsfN3LvsR2bLdB+0EjeH8lvxnsIDiwqagg0CBjRRTVL
	1jiDpi/qDVgcIht7iRjayWL2NJdejhYN5RY1ul8=
X-Google-Smtp-Source: AMrXdXtRoHCbhy/JWzBsNFuxL/KJOYq6b9bFTOkRgW0QBx2lbsAt/E6Y6nKFP5mIYX2iDfjij9w8JA==
X-Received: by 2002:a05:6a00:1a01:b0:580:8d40:cb9d with SMTP id g1-20020a056a001a0100b005808d40cb9dmr37545386pfv.27.1672418716891;
        Fri, 30 Dec 2022 08:45:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.45.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:45:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 17/22] devtool/upgrade: correctly handle recipes where S is a subdir of upstream tree
Date: Fri, 30 Dec 2022 06:44:07 -1000
Message-Id: <aff17302907aee683cfd2c2eefeee539d3093810.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175158

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
2.25.1


