Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CD2C3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 12:21:10 +0000 (UTC)
Received: from smarthost01a.ixn.mail.zen.net.uk (smarthost01a.ixn.mail.zen.net.uk [212.23.1.20])
 by mx.groups.io with SMTP id smtpd.web10.46724.1748002867481004438
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 05:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=XGXYB2nQ;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.20, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01a.ixn.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1uIROc-00ATAE-7I;
	Fri, 23 May 2025 12:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=EvsYX26TpDXVXMcnjDDpEydrI8J69BtVr8P5Yg4xpto=; b=XG
	XYB2nQfq4QM+KphrFRUD5icmUyU4QHj6YvVJQZwQGsywZnQSHDJE2X1ypFRkmhIw8s6piP7/4QC34
	KIlOdt2ru3YQhtJ19njPX9Uvbn0aZ1m7y6/Y93/eQ4AqURX+g0N1F7zXi1bHGcOjokoaSwxUnzYIz
	h90fU/cstSXl5H71Es36lkwV2RR7D6BG6keDIUOvRXGHPnOdEESDIvUiKslMXKvmUIhjxBEXmB8WH
	S3DebigY5OHp4cMj+2J6uE7CxwGXGhKiLgOaTIFMJxyu3fjCx2sKoJ/GCWKNZYh/qkC9QdQqPo67b
	23QJPT2HtdGhH3iT6HyoYMsXx7ftMajQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1uIROa-00DVRV-1A;
	Fri, 23 May 2025 13:21:04 +0100
From: mac@mcrowe.com
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>,
	Jack Mitchell <jack@embed.me.uk>
Subject: [PATCH] rootfs.py: Don't create modules directory for all kernels
Date: Fri, 23 May 2025 13:21:02 +0100
Message-Id: <20250523122102.3097109-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-smarthost01a-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 12:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217207

From: Mike Crowe <mac@mcrowe.com>

efa88e1c227d695319197f511701e0230d301f39 arranged for the versioned
modules directory to be created and depmod to run for every kernel
package. Unfortunately this happens for every _built_ kernel package,
even if that package and/or its modules aren't installed in the rootfs.

Let's assume that there's no point in running depmod if the modules
directory did not already exist.

(This problem was observed in Scarthgap and this fix was tested there.
It doesn't look like any of the subsequent changes will have affected
this behaviour.)

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Reviewed-by: Jack Mitchell <jack@embed.me.uk>
---
 meta/lib/oe/rootfs.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 6b56adaf03..14befac8fa 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -362,11 +362,12 @@ class Rootfs(object, metaclass=ABCMeta):
 
             versioned_modules_dir = os.path.join(self.image_rootfs, modules_dir, kernel_ver)
 
-            bb.utils.mkdirhier(versioned_modules_dir)
-
-            bb.note("Running depmodwrapper for %s ..." % versioned_modules_dir)
-            if self._exec_shell_cmd(['depmodwrapper', '-a', '-b', self.image_rootfs, kernel_ver, kernel_package_name]):
-                bb.fatal("Kernel modules dependency generation failed")
+            if os.path.exists(versioned_modules_dir):
+                bb.note("Running depmodwrapper for %s ..." % versioned_modules_dir)
+                if self._exec_shell_cmd(['depmodwrapper', '-a', '-b', self.image_rootfs, kernel_ver, kernel_package_name]):
+                    bb.fatal("Kernel modules dependency generation failed")
+            else:
+                bb.note("Not running depmodwrapper for %s since directory does not exist" % versioned_modules_dir)
 
     """
     Create devfs:
-- 
2.39.5


