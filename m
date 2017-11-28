Return-Path: <prvs=4980545f9=Martin.Hundeboll@prevas.dk>
Received: from mail02.prevas.se (mail02.prevas.se [62.95.78.10])
	by mail.openembedded.org (Postfix) with ESMTP id 07F4C719B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 12:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=1894; q=dns/txt;
	s=ironport2; t=1511873780; x=1543409780;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=fno1+K/gzR6BiDmIGFSCP5tPeT7XhSNT50Sow084tg0=;
	b=XXXpy3wF54nxMpjdJ5QxO6S8PsZIHmNySqWHwNyq6SmDSj4XnAEwnVjJ
	XrhK4EEMeBqWRjZgG/Ma0iNRw9SWDldER47f5typzMYZW9aIV68jD6rnU
	2lCje/iUWoJDj2woDKxE168LP8N4gDqy3y9ICCoTRc+yVwSaq5+qSlahE k=;
X-IronPort-AV: E=Sophos;i="5.44,468,1505772000"; 
   d="scan'208";a="2737323"
Received: from vmprevas3.prevas.se (HELO smtp.prevas.se) ([172.16.8.103])
	by ironport2.prevas.se with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Nov 2017 13:56:18 +0100
Received: from mnhu.prevas.se (172.16.8.31) by smtp.prevas.se (172.16.8.103)
	with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 28 Nov 2017 13:56:17 +0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <mnhu@prevas.dk>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Nov 2017 13:56:11 +0100
Message-ID: <20171128125611.3338-1-mnhu@prevas.dk>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [172.16.8.31]
Subject: [PATCH] wic: support filesystem label for rawcopy
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
X-List-Received-Date: Tue, 28 Nov 2017 12:56:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The '--label' argument should work for '--source rawcopy' as it does for
'--source rootfs', so add a method in RawCopyPlugin to update the label
on the temporary filesystem images.

Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
---
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
2.15.0


