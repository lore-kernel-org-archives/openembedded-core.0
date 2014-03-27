Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6585A60DFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 22:08:14 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id il7so4964038vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 15:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=CCkKj/Se/n3ZBqkgAmxDdtxTGN5NaMfFPjxxsWdKbf4=;
	b=m8laC6jmLUN/uzyZxs76k+a7iC2EIUYzcGSVjI7izfSVUHiMR3ThvycFFr2bsqjJBX
	2E/GVtaWr7LeIrAC7aXAMoZIDZc0iJTfS6X/u47RXX9iyVND71aHHLwSnsGW73rRmSdR
	PYGX9mLD/xUOzdebCj3qxYZhhWxxn1wn01es4v2Kp5o87GD6YXEYS3SCMPkfQ2dO7DhW
	S3T6LNirvDkqTVVF+lbTQ6YFeuOCFASFgkY9ihx2ISR7m5JB4J9F62aKldGNsXTywtDX
	/4p0NSTJFCPs/ncZxHvzLw2d6AD1sUiTz6vYfxs6fzIbow+8WI6I9BTYvfkbbPt9M9W4
	c1LQ==
X-Received: by 10.52.191.100 with SMTP id gx4mr3068532vdc.4.1395958095835;
	Thu, 27 Mar 2014 15:08:15 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id am5sm5771903vdc.15.2014.03.27.15.08.14
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Mar 2014 15:08:15 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Mar 2014 19:07:53 -0300
Message-Id: <1395958078-5191-3-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1395958078-5191-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1395958078-5191-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH v3 2/7] wic: Hook up RootfsPlugin plugin
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Mar 2014 22:08:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the 'rootfs' case when internal call code is used and
replace to call the general-purpose plugin.

For now RootfsPluing class continues to invoke prepare_rootfs()
method from Wic_PartData. However RootfsPlugin could implement them.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 .../lib/mic/kickstart/custom_commands/partition.py | 28 ++++++++++------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index e15150b..c3bb9a5 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -114,24 +114,20 @@ class Wic_PartData(Mic_PartData):
                                              native_sysroot)
             return
 
-        if self.source.startswith("rootfs"):
-            self.prepare_rootfs(cr_workdir, oe_builddir, rootfs_dir,
-                                native_sysroot)
-        else:
-            self._source_methods = pluginmgr.get_source_plugin_methods(self.source, partition_methods)
-            self._source_methods["do_configure_partition"](self, cr, cr_workdir,
-                                                           oe_builddir,
-                                                           bootimg_dir,
-                                                           kernel_dir,
-                                                           native_sysroot)
-            self._source_methods["do_stage_partition"](self, cr, cr_workdir,
+        self._source_methods = pluginmgr.get_source_plugin_methods(self.source, partition_methods)
+        self._source_methods["do_configure_partition"](self, cr, cr_workdir,
                                                        oe_builddir,
-                                                       bootimg_dir, kernel_dir,
+                                                       bootimg_dir,
+                                                       kernel_dir,
                                                        native_sysroot)
-            self._source_methods["do_prepare_partition"](self, cr, cr_workdir,
-                                                         oe_builddir,
-                                                         bootimg_dir, kernel_dir,
-                                                         native_sysroot)
+        self._source_methods["do_stage_partition"](self, cr, cr_workdir,
+                                                   oe_builddir,
+                                                   bootimg_dir, kernel_dir,
+                                                   native_sysroot)
+        self._source_methods["do_prepare_partition"](self, cr, cr_workdir,
+                                                     oe_builddir,
+                                                     bootimg_dir, kernel_dir, rootfs_dir,
+                                                     native_sysroot)
 
     def prepare_rootfs_from_fs_image(self, cr_workdir, oe_builddir,
                                      rootfs_dir):
-- 
1.8.3.2


