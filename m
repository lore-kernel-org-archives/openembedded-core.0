Return-Path: <joaohf@gmail.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 45DDF6E757
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 21:18:18 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id pa12so4302116veb.29
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 14:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=CCkKj/Se/n3ZBqkgAmxDdtxTGN5NaMfFPjxxsWdKbf4=;
	b=klxyGinhpbusAIDi47fbWP3Iiy8HZdvdx2RXHw42i878p/DcCHsizuQ9EaMf+G52Rm
	6UuzQEUXjoKZGb+3xikdo8jQ8mEXMM1pw80gCus0QILwbV0H5F9mID8IIkghLLzxgEmj
	pnL1hewjcucyYxe5Dof+PJkJpEQGMQ6E988xdtjDaS3V7povEB9s+pinH1V1RTC/6i27
	RHjfUSKiTowz/Oo99vW5DhoPlZluOzzBzN/0zSfu8VzWxP3cgTaj4sjMZIOJzIVV9yNy
	RkjLS28JUFv7JYwjWrmkRl0EUCvVmQ8MQTC5T5o5SqADFa9gtr2FxUFmFPzK2WnbU0rP
	8vvw==
X-Received: by 10.52.171.68 with SMTP id as4mr10755612vdc.0.1394918299964;
	Sat, 15 Mar 2014 14:18:19 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id am5sm4382714vdc.15.2014.03.15.14.18.18
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 15 Mar 2014 14:18:19 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Mar 2014 18:17:48 -0300
Message-Id: <1394918271-14153-3-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH 2/5] wic: Hook up RootfsPlugin plugin
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
X-List-Received-Date: Sat, 15 Mar 2014 21:18:19 -0000
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


