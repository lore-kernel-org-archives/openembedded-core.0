Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.6051.1626265575442954403
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OSf+quKK;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id g16so2993249wrw.5
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+FEFbWhO/rfID/fFhCtGucpWzw2zqE2dlANWnodr7RA=;
        b=OSf+quKKwL7Ti5LdbKx3VUSkpSdiXbK8zfJkcUDrp0Bh3o4IrT3NF4LqMbjBdPqrzN
         DdkYyIuH8MU1XynwghR7XJFsmG1td1QTmWdhuD+DHC1Q6aQ0XjmJsyTAHGAtIn4vD+SJ
         f2QrLM19KF/b1NCH2GO7iAAZed5FFsxhC0olsoFx6umVFw+528Srm5H+/VTfZmZn/RcJ
         rmeXWjOk4jiJ5ImeWifeSXcrbkrTSyw1gxBUvPJjYzs5tYhUONXe264jxZumS+brXgJM
         yDnf7KZcQ78joUrFb42U/NLwjWqlqzCZqFyzPyA2Yw9dPB6vz2dzjKWYeKvg3ycJkR6L
         ZabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+FEFbWhO/rfID/fFhCtGucpWzw2zqE2dlANWnodr7RA=;
        b=GNtW0FFQYXrODUXAPLmH5nY4OO5dbc62H9KhQDV8S/rjdZxzx2hal6uWfbTKtso/r1
         6nH/VJaJqDy5Gv6lC5LoT42ZCRMcX4Qm7pFNiGP5kplttHvWs8/qSwLchK6hxhID09gX
         /u2Tt+EnFnNoqogIGFbsbjqI7eN5lWayDasjqFGuBHoN4+shg5D5Ql4bc+lL3+aZdfDU
         GLroRFbgmOI1qW8jau/gQq1ZGb/FtemcEzuqtCRKwle3rPjbqDigqVbxDxSjGsXrFV2X
         7Uwgt+Tf4chYS4VJjJveZM8jvkQby42OrNZH2/qK7DAAoW5ohygDp30XoWsM1VJS7OSf
         rweg==
X-Gm-Message-State: AOAM531aUVMT8LMLIRYMUStxDB61TQKwfNfghu73HdeRHtrTUBCt2Cpu
	smB7azgFbsL0siHbOtBFqBlcnjG7I+4=
X-Google-Smtp-Source: ABdhPJz0hfPotMzPdo9IEylm3tXWKwD5182wKs3xfVqmHh1FFeJU6+ClzKEiK85/GOcnZ5MObFCf4Q==
X-Received: by 2002:a5d:5989:: with SMTP id n9mr12323917wri.8.1626265573792;
        Wed, 14 Jul 2021 05:26:13 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:13 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/21] devtool: correctly handle non-standard source tree locations in upgrades
Date: Wed, 14 Jul 2021 14:25:46 +0200
Message-Id: <20210714122606.605142-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When S is set to a sub-directory of upstream source, the license
checks and the bbappend writing (specifically, setting EXTERNALSRC)
need to operate on that sub-directory.

'devtool modify' already has similar logic, and it was copied from there
and adjusted.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/lib/devtool/upgrade.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index c6d98299da..da1456a01a 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -521,6 +521,15 @@ def upgrade(args, config, basepath, workspace):
         else:
             srctree = standard.get_default_srctree(config, pn)
 
+        # Check that recipe isn't using a shared workdir
+        s = os.path.abspath(rd.getVar('S'))
+        workdir = os.path.abspath(rd.getVar('WORKDIR'))
+        srctree_s = srctree
+        if s.startswith(workdir) and s != workdir and os.path.dirname(s) != workdir:
+            # Handle if S is set to a subdirectory of the source
+            srcsubdir = os.path.relpath(s, workdir).split(os.sep, 1)[1]
+            srctree_s = os.path.join(srctree, srcsubdir)
+
         # try to automatically discover latest version and revision if not provided on command line
         if not args.version and not args.srcrev:
             version_info = oe.recipeutils.get_recipe_upstream_version(rd)
@@ -550,12 +559,12 @@ def upgrade(args, config, basepath, workspace):
         try:
             logger.info('Extracting current version source...')
             rev1, srcsubdir1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
-            old_licenses = _extract_licenses(srctree, (rd.getVar('LIC_FILES_CHKSUM') or ""))
+            old_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
             logger.info('Extracting upgraded version source...')
             rev2, md5, sha256, srcbranch, srcsubdir2 = _extract_new_source(args.version, srctree, args.no_patch,
                                                     args.srcrev, args.srcbranch, args.branch, args.keep_temp,
                                                     tinfoil, rd)
-            new_licenses = _extract_licenses(srctree, (rd.getVar('LIC_FILES_CHKSUM') or ""))
+            new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
             license_diff = _generate_license_diff(old_licenses, new_licenses)
             rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd, license_diff, new_licenses, srctree, args.keep_failure)
         except bb.process.CmdError as e:
@@ -564,7 +573,7 @@ def upgrade(args, config, basepath, workspace):
             _upgrade_error(e, rf, srctree, args.keep_failure)
         standard._add_md5(config, pn, os.path.dirname(rf))
 
-        af = _write_append(rf, srctree, args.same_dir, args.no_same_dir, rev2,
+        af = _write_append(rf, srctree_s, args.same_dir, args.no_same_dir, rev2,
                         copied, config.workspace_path, rd)
         standard._add_md5(config, pn, af)
 
-- 
2.31.1

