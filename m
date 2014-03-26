Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9761B6E8A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 02:43:14 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id ij19so1665097vcb.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 19:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=z8aONrav37wgLmGrEHi8SNva6IbdSqlxXfQGasnBwZk=;
	b=geYucoW38Db5/4vvXfBjkwL9PekZxzg3BUWeE2S0vAGQgW1M72tmHSHiDyVLq7hFJO
	Anb64yObjzSXz1CXwyHHAKS66tYjNCgwMlR+GptU0lpcfmEQjW+CvAmLXkPBvNLFSqGT
	Z3QELvzynX6BO256D2QuHHBriUoHbV4HP3HB2Yie0de413BVDPgww3kIWqJ7JOdnOgYX
	AQTAqBnDVlc/5fcFIJ6JzMzjlBAi25QsvuKVvdg0aPRdKM9BJ8uHrLZg16uhyaWfE26S
	vxKgYfej/4Y3/cluJMsGj0ad2Hvg0gfLcVP6TD8mZFre5HkbaR7daUGQ0wjnaIhkJjpR
	Y1mg==
X-Received: by 10.52.171.68 with SMTP id as4mr49926409vdc.0.1395801796077;
	Tue, 25 Mar 2014 19:43:16 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id ay4sm35813974vdc.6.2014.03.25.19.43.14
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Mar 2014 19:43:15 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Mar 2014 23:42:48 -0300
Message-Id: <1395801769-13042-7-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1395801769-13042-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1395801769-13042-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH v2 6/7] wic: Report all ROOTFS_DIR artifacts
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
X-List-Received-Date: Wed, 26 Mar 2014 02:43:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a .wks has more than one ROOTFS_DIR it's better to report
all ROOTFS_DIR that was used to create the image.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 scripts/lib/mic/imager/direct.py                       | 18 ++++++++++++++----
 scripts/lib/mic/kickstart/custom_commands/partition.py | 13 +++++++++++++
 scripts/lib/mic/plugins/source/rootfs.py               |  1 +
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
index f8c300c..07a47ea 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/mic/imager/direct.py
@@ -321,15 +321,25 @@ class DirectImageCreator(BaseImageCreator):
         """
         msg = "The new image(s) can be found here:\n"
 
+        parts = self._get_parts()
+
         for disk_name, disk in self.__instimage.disks.items():
             full_path = self._full_path(self.__imgdir, disk_name, "direct")
             msg += '  %s\n\n' % full_path
 
         msg += 'The following build artifacts were used to create the image(s):\n'
-        msg += '  ROOTFS_DIR:      %s\n' % self.rootfs_dir
-        msg += '  BOOTIMG_DIR:     %s\n' % self.bootimg_dir
-        msg += '  KERNEL_DIR:      %s\n' % self.kernel_dir
-        msg += '  NATIVE_SYSROOT:  %s\n' % self.native_sysroot
+        for p in parts:
+            if p.get_rootfs() is None:
+                continue
+            if p.mountpoint == '/':
+                str = ':'
+            else:
+                str = '["%s"]:' % p.label
+            msg += '  ROOTFS_DIR%s%s\n' % (str.ljust(20), p.get_rootfs())
+
+        msg += '  BOOTIMG_DIR:                  %s\n' % self.bootimg_dir
+        msg += '  KERNEL_DIR:                   %s\n' % self.kernel_dir
+        msg += '  NATIVE_SYSROOT:               %s\n' % self.native_sysroot
 
         msger.info(msg)
 
diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index 887195f..6b575c0 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -59,6 +59,19 @@ class Wic_PartData(Mic_PartData):
 
         return retval
 
+    def get_rootfs(self):
+        """
+        Acessor for rootfs dir
+        """
+        return self.rootfs
+
+    def set_rootfs(self, rootfs):
+        """
+        Acessor for actual rootfs dir, which must be set by source
+        plugins.
+        """
+        self.rootfs = rootfs
+
     def get_size(self):
         """
         Accessor for partition size, 0 or --size before set_size().
diff --git a/scripts/lib/mic/plugins/source/rootfs.py b/scripts/lib/mic/plugins/source/rootfs.py
index da7aa0b..83aec45 100644
--- a/scripts/lib/mic/plugins/source/rootfs.py
+++ b/scripts/lib/mic/plugins/source/rootfs.py
@@ -54,5 +54,6 @@ class RootfsPlugin(SourcePlugin):
         if part.rootfs:
             rootfs_dir = part.rootfs 
         
+        part.set_rootfs(rootfs_dir)
         part.prepare_rootfs(cr_workdir, oe_builddir, rootfs_dir, native_sysroot)
 
-- 
1.8.3.2


