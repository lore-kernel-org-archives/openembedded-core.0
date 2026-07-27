Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CF0C5321C
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 08:34:55 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26960.1785141291634822164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 01:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uxmtR+A5;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 02F381A1283
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 08:34:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBE73601BE;
	Mon, 27 Jul 2026 08:34:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8F9811C12291;
	Mon, 27 Jul 2026 10:34:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785141285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HK7u+3x1oJ1O2SaNcLkpaf/VYKpwjkI+NByxxoF0DXs=;
	b=uxmtR+A5t+LS4HUT3gP64feuBybZJz5yXiPkjFDqjJ2UW1jzxVwtsiV3U/EWy3jYBGTshe
	U74GDVqRUpltHD51zc1fRA97JcMeDjviGBnug2PF9lTBIHsLeR4K1h91bvpKP41G92Zi89
	d1W7KdEp0PADJ+QqmIoC9hxFgbkxbVEy79iXyltYomB0BF59tNHe59Lho4l/A0bZZWBqvY
	xoPurVEmWVyuPkTm3OpB5Wsv4aXbAA1l2N10QgXU5JX48fUHmoTnawRm5ri/9ryHiLbteA
	lDpOi/SsqIDV4IKc4R1ZSUg7jQ1n/100ensQ/TXFZ41/eq75Zk2bZFdKbpt8HQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Mon, 27 Jul 2026 10:34:28 +0200
Subject: [PATCH RFC 1/3] spdx_common: simplify get_patched_src()
 implementation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-fix-get-patched-src-v1-1-f5054ca10e14@bootlin.com>
References: <20260727-fix-get-patched-src-v1-0-f5054ca10e14@bootlin.com>
In-Reply-To: <20260727-fix-get-patched-src-v1-0-f5054ca10e14@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 daniel.turull@ericsson.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 08:34:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242064

The behavior remains unchanged:
- Instead of saving and restoring the values of various variables, use a
  copy of the data store via `d.createCopy()`. This prevents side effects
  for other tasks.
- This allows removing the `try ... finally` block.
- The function `is_work_shared_spdx()` no longer needs to be called twice.
- In the work-shared case, there is no need to modify `WORKDIR` since no
  task is executed from that branch.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/lib/oe/spdx_common.py | 81 ++++++++++++++++++++++------------------------
 1 file changed, 39 insertions(+), 42 deletions(-)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 6b1a409c40c2..9d1e22629b21 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -172,50 +172,47 @@ def get_patched_src(d):
     Save patched source of the recipe in SPDX_WORKDIR.
     """
     spdx_workdir = d.getVar("SPDXWORK")
-    spdx_sysroot_native = d.getVar("STAGING_DIR_NATIVE")
 
-    workdir = d.getVar("WORKDIR")
+    # The kernel class functions require it to be on work-shared, so we don't change WORKDIR
+    if not is_work_shared_spdx(d):
+        spdx_sysroot_native = d.getVar("STAGING_DIR_NATIVE")
+        localdata = d.createCopy()
 
-    try:
-        # The kernel class functions require it to be on work-shared, so we dont change WORKDIR
-        if not is_work_shared_spdx(d):
-            # Change the WORKDIR to make do_unpack do_patch run in another dir.
-            d.setVar("WORKDIR", spdx_workdir)
-            # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
-            d.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
-
-            # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
-            # possibly requiring of the following tasks (such as some recipes's
-            # do_patch required 'B' existed).
-            bb.utils.mkdirhier(d.getVar("B"))
-
-            bb.build.exec_func("do_unpack", d)
-
-            if d.getVar("SRC_URI") != "":
-                if bb.data.inherits_class("dos2unix", d):
-                    bb.build.exec_func("do_convert_crlf_to_lf", d)
-                bb.build.exec_func("do_patch", d)
-
-        # Copy source from work-share to spdx_workdir
-        if is_work_shared_spdx(d):
-            share_src = d.getVar("S")
-            d.setVar("WORKDIR", spdx_workdir)
-            d.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
-            # Copy source to ${SPDXWORK}, same basename dir of ${S};
-            src_dir = spdx_workdir + "/" + os.path.basename(share_src)
-            # For kernel souce, rename suffix dir 'kernel-source'
-            # to ${BP} (${BPN}-${PV})
-            if bb.data.inherits_class("kernel", d):
-                src_dir = spdx_workdir + "/" + d.getVar("BP")
-
-            bb.note(f"copyhardlinktree {share_src} to {src_dir}")
-            oe.path.copyhardlinktree(share_src, src_dir)
-
-        # Some userland has no source.
-        if not os.path.exists(spdx_workdir):
-            bb.utils.mkdirhier(spdx_workdir)
-    finally:
-        d.setVar("WORKDIR", workdir)
+        # Change the WORKDIR to make do_unpack do_patch run in another dir.
+        localdata.setVar("WORKDIR", spdx_workdir)
+        # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
+        localdata.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
+
+        # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
+        # possibly requiring of the following tasks (such as some recipe's
+        # do_patch required 'B' existed).
+        bb.utils.mkdirhier(localdata.getVar("B"))
+
+        bb.build.exec_func("do_unpack", localdata)
+
+        if localdata.getVar("SRC_URI") != "":
+            if bb.data.inherits_class("dos2unix", localdata):
+                bb.build.exec_func("do_convert_crlf_to_lf", localdata)
+            bb.build.exec_func("do_patch", localdata)
+
+    # Copy source from work-shared to spdx_workdir
+    else:
+        share_src = d.getVar("S")
+
+        if bb.data.inherits_class("kernel", d):
+            # For kernel source, rename suffix dir 'kernel-source' to ${BP} (${BPN}-${PV})
+            dir_name = d.getVar("BP")
+        else:
+            # Copy source to ${SPDXWORK}, same basename dir of ${S}
+            dir_name = os.path.basename(share_src)
+
+        src_dir = f"{spdx_workdir}/{dir_name}"
+        bb.note(f"copyhardlinktree {share_src} to {src_dir}")
+        oe.path.copyhardlinktree(share_src, src_dir)
+
+    # Some userland has no source.
+    if not os.path.exists(spdx_workdir):
+        bb.utils.mkdirhier(spdx_workdir)
 
 
 def has_task(d, task):

-- 
2.55.0


