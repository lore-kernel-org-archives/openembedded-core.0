Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761B9C3F6B0
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 02:43:35 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.50675.1660876985505791286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Dx10mETZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id w14so3024619plp.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 19:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=uMW2M/2geN49NJjvEnLIB10wRRAIgt6Nto3AOeItF/k=;
        b=Dx10mETZAH1FozkexcjiF5FI1hAizanXPB314KqWftsuGOR9Mg3VoVeA0eC1c0bHfa
         WZO7Hca43yXtWseiVlbjvP8IL/THk34AncENMBa3sek4Y6UVMo5r0hdY2t3H5087czRT
         3CprxLE+ntuLvTJU9A9kpwvBoeqTBInpVQGdyjefPnRLmvpl28tYwHLwxSV4MsTAh/yS
         oeEKn3PYDxsiBOZbdfOEoMr3trg+918NDgcBHftzyGRE1Td38GlthMl4Erjh1DLKTqnP
         OfHZar5AAhO3cip1N7Munbg6YD2rZ+gbuJR/IO4S3UX01M8RQFN/N8G1mqKc2GzpSu7o
         m45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=uMW2M/2geN49NJjvEnLIB10wRRAIgt6Nto3AOeItF/k=;
        b=J454cVdEgXibLkpi3wMM6D0E1+U+yndG2WzR6mjIbzH3+V2IMLYN3sorML+uk2hshJ
         Cjj/23FuGdbX1oJfNgyRJWiS//g/vExoH1D6VvBKLgZfJqYTuCk+M2eySAoM2/9wA72d
         gy0kpSLl0HeICimK83njhYLsOhYJ3C+WkZ8M8FWBAJ1qTPkHaiMb0uHvrQfS/iM79I/W
         gFLKpjWdMQuHQsEGQZ0sWZcX4oVwcROgUiWanMK0pJBxr7U9tifMTYjlLbFF3tElp4UJ
         Ku+68hPuMqPAWPBxtIYvGUx+p/fRCLfuBLTytOLhqLQgmWF6dl7kC5L3LYRPJTHs6n2R
         LOMQ==
X-Gm-Message-State: ACgBeo181+0d/dUVCYMfMMLtH/e5qXODWxFsK7j1FsGxnCiogYti+928
	mYKPHg+b8esJ3oNZLk1AzmNb8nGv2N/F2Jwe
X-Google-Smtp-Source: 
 AA6agR556CBkqGV7uPrhQQ+pXt23dbneVxmX1czLdYaFFFfPuXhCr9TqSAebdKGFCipTvtsXRz5QLQ==
X-Received: by 2002:a17:90b:238b:b0:1fa:d833:30dd with SMTP id
 mr11-20020a17090b238b00b001fad83330ddmr3596614pjb.147.1660877012950;
        Thu, 18 Aug 2022 19:43:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a4e4c00b001fa80cde150sm4150145pjl.20.2022.08.18.19.43.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 19:43:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/26] devtool/upgrade: correctly clean up when
 recipe filename isn't yet known
Date: Thu, 18 Aug 2022 16:42:34 -1000
Message-Id: 
 <a7d406dce577192f98d76dbae411c72a8b7f07d4.1660876844.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660876844.git.steve@sakoman.com>
References: <cover.1660876844.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 02:43:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169555

From: Alexander Kanavin <alex.kanavin@gmail.com>

There is a coding error in the second invocation of _upgrade_error:
rf is passed into it before it is initialized in the try: block. And so
bogus recipes are left behind in the workspace, causing breakage.

Instead, rewrite the functions to take the recipe directory name in the
workspace layer, which can be calculated in advance.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit e653996369c1d2b5ac8367ad85f4816d679b6c98)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


