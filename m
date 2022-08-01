Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B66C3F6B0
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 15:44:49 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.26294.1659368679958336963
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 08:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eNa63/x1;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id f22so3284813edc.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 08:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MivnUz7OQmVBkyyvCu2LQh0SVReWxTM+iwonYZSxZyY=;
        b=eNa63/x1GSyRq/hhTeti1emKRN3HrlgArKvs8RJLQo2ckwtjwZLunWQwfhr1WSG2U+
         11r9rRrDheeyQ9P96hg98sfSZLi/pCZuopz3Y+A5qx+lnHGpI/CAgxUu1V2WHWBl/LOr
         pKZ5okuOUxFJJmq3tyxQR/jZ0y3MrcHZAnCQEFoGKSX2LP7mKkAx4OFHzON4tTkqGZli
         tfbSOdGpRiXeyrneI5VOrCu5oAnpYeL7XD4qKWx8cATyBW6K9pWRvrO6Qgqq3yEDPOTX
         RT203m2XdEIgfp11yDLrMmh73gwwWgFP22ZHWdnEMeUzfTqLXkkG6wn/pvIyLoQxTTwv
         i4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MivnUz7OQmVBkyyvCu2LQh0SVReWxTM+iwonYZSxZyY=;
        b=c2zsqH1ENuUNEHwNl+A4WGl5q6dMqcxrspLQZO6PjzCtlTKqtZja06TMqE99Kndbut
         8cKbBnLIXyOHLsavBOFTEZQm3k/rEBiOD6jbwgQhwEX0E/t8Mdyx81Bm1DTWiJpB2x4c
         ibEYoupYOkkfPoNtEqCZbYdQJ9luGjpRQRtCMhEoCMmSetFJMo8qZR3Bom0sjW5iP7aJ
         C1wpjQWiVSueX3ptSRibx4zZxjhV7HQhfuaQdgGtZKCDuj2WeoUIA1hMSTflL54EuBOv
         Xav5B45vzkk9R/jndj+NNQBlSnxvydzDFDaZ1F55eqCcApHKXAEZm3A84rgwM63Tssnk
         EAaA==
X-Gm-Message-State: AJIora+cY9oBE2rx0desghqWagoRp6YN9gID6QgSY+Jvwgk0x93VYYZP
	kNDTwzgSa/B5Uf55I2aAEfd87zPJhg4=
X-Google-Smtp-Source: 
 AGRyM1tv0gf08V0zfleObZhfFPMp9Oi2VCTKY0CSbHwvi5DBPKq2ipfERQKvk8fRUQl+p28swYQndg==
X-Received: by 2002:a05:6402:2384:b0:43c:fb7d:82a1 with SMTP id
 j4-20020a056402238400b0043cfb7d82a1mr16155736eda.82.1659368678266;
        Mon, 01 Aug 2022 08:44:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 wi7-20020a170906fd4700b0072f03d10fa0sm5290655ejb.207.2022.08.01.08.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 08:44:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] devtool/upgrade: correctly clean up when recipe filename
 isn't yet known
Date: Mon,  1 Aug 2022 17:44:33 +0200
Message-Id: <20220801154434.2673334-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 15:44:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168753

There is a coding error in the second invocation of _upgrade_error:
rf is passed into it before it is initialized in the try: block. And so
bogus recipes are left behind in the workspace, causing breakage.

Instead, rewrite the functions to take the recipe directory name in the
workspace layer, which can be calculated in advance.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/devtool/upgrade.py | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 0357ec07bf..c57015eb40 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -119,20 +119,19 @@ def _write_append(rc, srctree, same_dir, no_same_dir, rev, copied, workspace, d)
             f.write('# original_files: %s\n' % ' '.join(copied))
     return af
 
-def _cleanup_on_error(rf, srctree):
-    rfp = os.path.split(rf)[0] # recipe folder
-    rfpp = os.path.split(rfp)[0] # recipes folder
-    if os.path.exists(rfp):
-        shutil.rmtree(rfp)
-    if not len(os.listdir(rfpp)):
-        os.rmdir(rfpp)
+def _cleanup_on_error(rd, srctree):
+    rdp = os.path.split(rd)[0] # recipes folder
+    if os.path.exists(rd):
+        shutil.rmtree(rd)
+    if not len(os.listdir(rdp)):
+        os.rmdir(rdp)
     srctree = os.path.abspath(srctree)
     if os.path.exists(srctree):
         shutil.rmtree(srctree)
 
-def _upgrade_error(e, rf, srctree, keep_failure=False, extramsg=None):
-    if rf and not keep_failure:
-        _cleanup_on_error(rf, srctree)
+def _upgrade_error(e, rd, srctree, keep_failure=False, extramsg=None):
+    if not keep_failure:
+        _cleanup_on_error(rd, srctree)
     logger.error(e)
     if extramsg:
         logger.error(extramsg)
@@ -426,7 +425,7 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_old, src
     try:
         rd = tinfoil.parse_recipe_file(fullpath, False)
     except bb.tinfoil.TinfoilCommandFailed as e:
-        _upgrade_error(e, fullpath, srctree, keep_failure, 'Parsing of upgraded recipe failed')
+        _upgrade_error(e, os.path.dirname(fullpath), srctree, keep_failure, 'Parsing of upgraded recipe failed')
     oe.recipeutils.patch_recipe(rd, fullpath, newvalues)
 
     return fullpath, copied
@@ -568,10 +567,9 @@ def upgrade(args, config, basepath, workspace):
             new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
             license_diff = _generate_license_diff(old_licenses, new_licenses)
             rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd, license_diff, new_licenses, srctree, args.keep_failure)
-        except bb.process.CmdError as e:
-            _upgrade_error(e, rf, srctree, args.keep_failure)
-        except DevtoolError as e:
-            _upgrade_error(e, rf, srctree, args.keep_failure)
+        except (bb.process.CmdError, DevtoolError) as e:
+            recipedir = os.path.join(config.workspace_path, 'recipes', rd.getVar('BPN'))
+            _upgrade_error(e, recipedir, srctree, args.keep_failure)
         standard._add_md5(config, pn, os.path.dirname(rf))
 
         af = _write_append(rf, srctree_s, args.same_dir, args.no_same_dir, rev2,
-- 
2.30.2


