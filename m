Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A00C53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 08:34:55 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26609.1785141293345590302
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 01:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aIPcVs/L;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 741B21A1284;
	Mon, 27 Jul 2026 08:34:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 49858601BE;
	Mon, 27 Jul 2026 08:34:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C09511C1228F;
	Mon, 27 Jul 2026 10:34:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785141290; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jyeNRReNFsNLkNVHSUFhnIlW7EcP92Zk9cs7H8tPbZI=;
	b=aIPcVs/LFLq4ZdnDQa3V6SiuO+s4l180MIOtrYPT/vzdJNE3HaRUSgHE7H5bU4C2B7KHBw
	ph4mN0sNhNQ8AuTsLAa0fv+fhRdTppUpsE+btTxlNg+X6DqHlsvWuVqaYxf4kP3v8XBi4F
	Ax752dhTzGWjEjs/lYeywPNgGLO79uM8PVY9+om0Bq6VFjPNhFkotyMzBy6ksAoikxgn6Z
	IkUVFjFAkC3/KrThPuc5+z2TJB+VA5djf51SgyAjJWJiAimbVkf+fnIuUEa4CuLRngzVfl
	kOCYdqdlWt9IRQsMdDZ9xJooxqZMwwDtJcM4VTeXkj/X9ZM/VUw7nsQNHTIGWA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Mon, 27 Jul 2026 10:34:29 +0200
Subject: [PATCH RFC 2/3] spdx_common: modify UNPACKDIR instead of WORKDIR
 in get_patched_src()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-fix-get-patched-src-v1-2-f5054ca10e14@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242065

This change will affect the SPDX output: the source file path will no
longer be prefixed by `sources/`.

The rest of the changes are safe because:
- `S` should reference `UNPACKDIR` and not directly reference `WORKDIR`.
- After analyzing all public layers, no `do_unpack()` or `do_patch()` was
  found to reference the `${B}` variable. The comment mentioning the
  `${B}` variable traces back to [1] (though no further explanation was
  provided).

Additionally, this ensures proper capture of sources if the recipe
modifies `UNPACKDIR` outside of `WORKDIR` (though such cases should be
rare).

With these changes, SPDXWORK is no longer a working directory which is
"temporary" replacing WORKDIR, it is now a "temporary" directory containing
unpacked source files.
The run.do_patch.XXXX and associated files are now stored in ${WORKDIR}/temp.

[1] https://github.com/doubleopen-io/meta-doubleopen/blob/
e84f0c32663da9c743e4f1802042b733df0e36d7/classes/doubleopen.bbclass#L285

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/lib/oe/spdx30_tasks.py |  1 -
 meta/lib/oe/spdx_common.py  | 18 +++++-------------
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index ef12e638ae85..4da9e8bb7e24 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -843,7 +843,6 @@ def create_spdx(d):
             lambda filepath: [oe.spdx30.software_SoftwarePurpose.source],
             license_data,
             ignore_dirs=[".git"],
-            ignore_top_level_dirs=["temp"],
             archive=None,
         )
         build_inputs |= files
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 9d1e22629b21..013f23ae7c65 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -169,28 +169,20 @@ def collect_package_providers(d, direct_deps):
 
 def get_patched_src(d):
     """
-    Save patched source of the recipe in SPDX_WORKDIR.
+    Save patched source of the recipe in SPDXWORK.
     """
     spdx_workdir = d.getVar("SPDXWORK")
 
-    # The kernel class functions require it to be on work-shared, so we don't change WORKDIR
+    # Do not unpack the sources again for the recipe using work-shared
     if not is_work_shared_spdx(d):
-        spdx_sysroot_native = d.getVar("STAGING_DIR_NATIVE")
         localdata = d.createCopy()
 
-        # Change the WORKDIR to make do_unpack do_patch run in another dir.
-        localdata.setVar("WORKDIR", spdx_workdir)
-        # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
-        localdata.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
-
-        # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
-        # possibly requiring of the following tasks (such as some recipe's
-        # do_patch required 'B' existed).
-        bb.utils.mkdirhier(localdata.getVar("B"))
+        # Change the UNPACKDIR to make do_unpack do_patch run in another dir.
+        localdata.setVar("UNPACKDIR", spdx_workdir)
 
         bb.build.exec_func("do_unpack", localdata)
 
-        if localdata.getVar("SRC_URI") != "":
+        if localdata.getVar("SRC_URI"):
             if bb.data.inherits_class("dos2unix", localdata):
                 bb.build.exec_func("do_convert_crlf_to_lf", localdata)
             bb.build.exec_func("do_patch", localdata)

-- 
2.55.0


