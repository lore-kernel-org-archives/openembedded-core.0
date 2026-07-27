Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F85C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 08:34:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26610.1785141294066655478
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 01:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PI5pV8jD;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5CFB34E40F93;
	Mon, 27 Jul 2026 08:34:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 32159601BE;
	Mon, 27 Jul 2026 08:34:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E476811C12296;
	Mon, 27 Jul 2026 10:34:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785141291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UwOonLbUz9x75wk9WT35OzCYJP4x+wUYc8xubS8LWxY=;
	b=PI5pV8jDB/FmcLJRlsXCJbvzijH0XBg/H2YOJBUxyaTwZbfgF6jV0wNoOMK8SvPpteSkp2
	vR8H9DHqs2MaH9AnJ6X4fpp9+Wmx9aIxZ1b0aqN8vDaLDqyygqY+8r1qBdLJm/gl/MnSgO
	FMzl84Erw9SDWvnzBn0GXPWBJT+r4vm/Pc6hHoyNH+A+aRb6ivI/df3LOTcLZfXQ9QyZ/O
	Tn6R2TJXYWcueQuUtOsSLKz4oOZp5n90trny8XgulJ1Xls7ZZFgjCA2WH8GEk6OwjilKYp
	yuAfs05Ak6x0aAlsjE+Ie4TpT7QFQ0R6EVsnPYnA1Ifenylh+qtJUEN9yl0tYw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Mon, 27 Jul 2026 10:34:30 +0200
Subject: [PATCH RFC 3/3] spdx_common: In get_patched_src() ensure kernel
 dir name to be ${BP}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-fix-get-patched-src-v1-3-f5054ca10e14@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 08:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242066

If a kernel recipe is using a tar file instead of git repository, it is
necessary to override `S` to point to the unpacked tar archive.
In this case `${S}` is not going to be in work-shared. So we must handle
this case in get_patched_src() to ensure that the kernel is extracted in
the following path: `${SPDXWORK}/${BP}`.

For a full detailed analysis see [1], but in summary this change is
necessary because:
- In `save_debugsources_info()` the sources are extracted from the debug
  symbol. For the kernel Linux the source file path is modified to look
  like `${BP}/init/main.c` (`${KERNEL_SRC_PATH}` is replaced by `${BP}`).
- In `get_patched_src()` the sources of the recipe are extracted (again)
  in a sub-directory of `${SPDXWORK}`. If `${S}` is in work-shared and if
  the recipe inherits the kernel class, then the sources are extracted in
  `${SPDXWORK}/${BP}`.
- In `add_package_files()`, with topdir equal to `${SPDXWORK}`, all the
  files (recursively) found in topdir are listed. For each source file,
  if the file path (relative to topdir) is in the list of source files
  retrieved by save_debugsources_info, then the file is added to the SPDX
  SBoM.
- If we are using a tar archive, `${S}` is set for example to
  `${UNPACKDIR}/linux-${PV}`, so in `get_patched_src()` the sources are
  extracted in `${SPDXWORK}/sources/linux-${PV}` since
  `UNPACKDIR = ${WORKDIR}/sources`. `${BP}/init/main.c` is not in
  `${SPDXWORK}`, but `sources/linux-${PV}/init/main.c` is.

[1] https://github.com/bootlin/yocto-kiss/pull/26#discussion_r3626224833

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/lib/oe/spdx_common.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 013f23ae7c65..e40cf36bba18 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -187,6 +187,14 @@ def get_patched_src(d):
                 bb.build.exec_func("do_convert_crlf_to_lf", localdata)
             bb.build.exec_func("do_patch", localdata)
 
+        if bb.data.inherits_class("kernel", localdata):
+            # For kernel source, rename suffix dir to ${BP} (${BPN}-${PV})
+            dir_name = localdata.getVar("BP")
+            kernel_dst_path = f"{spdx_workdir}/{dir_name}"
+            kernel_src_path = localdata.getVar("S")
+            if not os.path.exists(kernel_dst_path):
+                shutil.move(kernel_src_path, kernel_dst_path)
+
     # Copy source from work-shared to spdx_workdir
     else:
         share_src = d.getVar("S")

-- 
2.55.0


