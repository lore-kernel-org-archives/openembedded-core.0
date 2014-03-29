Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC1D601AA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 03:12:32 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id lc6so6674092vcb.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 20:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=vyFsYIxfU6iRG7QOVTUJ0V/hRLaFjlnVAaXT0+fKxsY=;
	b=072LwTB6HY5KhYuJKgiNYUW8DnKQGrW2DiNFnQoP9hAUNbxaeBq21OXL9/FZYcPnD0
	cUGK94clU6WNmNXuSfayXnX+E0hopZI3ne2I7KymNpbGeBfQh5U0FrSfoZonOjfz1n2c
	8i/V0D8DZ/yvhM5km0CT8yYpyWu9U8wNMlAMpZAXTDPEgwGHQ3DLuIuHDxRS7NS0Z8Pi
	M3Ma/BuFsXbWHyReDiycANyVDELyWgrnOuBIZds5m+187y0WpZSsLF9wBvQEh+bpUNV1
	nhnlazmJlocuAvcD8XLeVRxMWy+YJFkDCcSPvt/9dDG9XYkL+pkB2b0/aPpsUp9sOGzX
	WgfQ==
X-Received: by 10.221.29.137 with SMTP id ry9mr10445472vcb.6.1396062753492;
	Fri, 28 Mar 2014 20:12:33 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id
	ha7sm12869708vdb.17.2014.03.28.20.12.31 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Mar 2014 20:12:32 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Mar 2014 00:12:07 -0300
Message-Id: <1396062728-9140-7-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1396062728-9140-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1396062728-9140-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH v4 6/7] wic: Report all ROOTFS_DIR artifacts
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
X-List-Received-Date: Sat, 29 Mar 2014 03:12:32 -0000
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
index 1f2f8fc..ac63c38 100644
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


