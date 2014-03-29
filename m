Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7B639610CD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 03:12:23 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hu19so6831907vcb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 20:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=CCkKj/Se/n3ZBqkgAmxDdtxTGN5NaMfFPjxxsWdKbf4=;
	b=jT5UxjGg9sE88stqCzUIKQ+7szl2O49Awp7teiSbePyhm1ma4vUnj0h13aaZHyoIOp
	rNmnaOtaGzZtqoJgKcCHXbnOO5Xx7t/1ko1NQ0f0abW7ZQsmPn0fAr2gIw8bLrhaTpN1
	xte53KI9JlzIusrJJxsvlyzdWwmA9YpWWIpWnUZf0PwGhtDNhMB8/+5r75ijwAUiqWRd
	1gNJXRn7yCV6ldhmLaDTwplrs0EOcGMYfeQylbtulNyy5amme1bHSqbc7639mhOP1e0C
	l3UcUe3T3sYOPZAsqyCDesFjOmaD+MYRAWWI90Uwm4xIBIwFUJodJwOgvL1Nwk3KjzlP
	0bDA==
X-Received: by 10.58.23.6 with SMTP id i6mr10204446vef.12.1396062744267;
	Fri, 28 Mar 2014 20:12:24 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id
	ha7sm12869708vdb.17.2014.03.28.20.12.22 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Mar 2014 20:12:23 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Mar 2014 00:12:03 -0300
Message-Id: <1396062728-9140-3-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1396062728-9140-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1396062728-9140-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH v4 2/7] wic: Hook up RootfsPlugin plugin
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
X-List-Received-Date: Sat, 29 Mar 2014 03:12:23 -0000
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


