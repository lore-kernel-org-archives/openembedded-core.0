Return-Path: <prvs=5113892fe=Martin.Hundeboll@prevas.dk>
Received: from mail01.prevas.se (mail01.prevas.se [62.95.78.3])
	by mail.openembedded.org (Postfix) with ESMTP id A137978698
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 07:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=2006; q=dns/txt;
	s=ironport1; t=1512976370; x=1544512370;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=7qR90tcqmHWn3hmv/1PF3fcuETUUq/q2dr7k6cSV01Q=;
	b=ccW178dMyIcczE+pgdztxfVdIPN5OOLn8SQMYxcb2zlPj6VRD4v7+LXY
	8CyNcRLTdlMuYaZHvBqm0R3zr5kXtecH0WaE6xGNDSjMCA4rnUN0pMCkO
	/MiIZ4W5XtE7EHxoTtBYGf0++RYaZ7Dgnv8kJoRsGbWULLJKTfxwseayV E=;
X-IronPort-AV: E=Sophos;i="5.45,391,1508796000"; 
   d="scan'208";a="2938842"
Received: from vmprevas4.prevas.se (HELO smtp.prevas.se) ([172.16.8.104])
	by ironport1.prevas.se with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2017 08:12:48 +0100
Received: from mnhu.prevas.se (172.16.8.31) by smtp.prevas.se (172.16.8.104)
	with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 11 Dec 2017 08:12:48 +0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <mnhu@prevas.dk>
To: OE-core <openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
Date: Mon, 11 Dec 2017 08:12:42 +0100
Message-ID: <20171211071242.5675-1-mnhu@prevas.dk>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
X-Originating-IP: [172.16.8.31]
Subject: [PATCH][rocko] wic: support filesystem label for rawcopy
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
X-List-Received-Date: Mon, 11 Dec 2017 07:12:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The '--label' argument should work for '--source rawcopy' as it does for
'--source rootfs', so add a method in RawCopyPlugin to update the label
on the temporary filesystem images.

Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---

Hi Armin,

Please consider this for Rocko.

Thanks

 scripts/lib/wic/plugins/source/rawcopy.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 424ed26ed6..e86398ac8f 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -32,6 +32,25 @@ class RawCopyPlugin(SourcePlugin):
 
     name = 'rawcopy'
 
+    @staticmethod
+    def do_image_label(fstype, dst, label):
+        if fstype.startswith('ext'):
+            cmd = 'tune2fs -L %s %s' % (label, dst)
+        elif fstype in ('msdos', 'vfat'):
+            cmd = 'dosfslabel %s %s' % (dst, label)
+        elif fstype == 'btrfs':
+            cmd = 'btrfs filesystem label %s %s' % (dst, label)
+        elif fstype == 'swap':
+            cmd = 'mkswap -L %s %s' % (label, dst)
+        elif fstype == 'squashfs':
+            raise WicError("It's not possible to update a squashfs "
+                           "filesystem label '%s'" % (label))
+        else:
+            raise WicError("Cannot update filesystem label: "
+                           "Unknown fstype: '%s'" % (fstype))
+
+        exec_cmd(cmd)
+
     @classmethod
     def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
@@ -66,4 +85,7 @@ class RawCopyPlugin(SourcePlugin):
         if filesize > part.size:
             part.size = filesize
 
+        if part.label:
+            RawCopyPlugin.do_image_label(part.fstype, dst, part.label)
+
         part.source_file = dst
-- 
2.15.1


