Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0866ADA2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 03:12:25 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id la4so6573704vcb.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 20:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=dQZKubPMcJQeq1IO+/VVio8kEep/iQXQ01PgGpLmKq8=;
	b=evtLnZDN/URN36o9nsRc05zVKAAYynZXcGlDMEkkHiIxNpdzn+P9FwjummgCaLlHIX
	W/Aqa5H2jIQGMctOQ411paaETXnp9+JDiqqvVuuIH02yi6i5m/xlz++X2qUfCDnV0e3j
	jENwn5m9fEeb97WH9jrKoVHE+tkRibRAkI3osrrQJ3uKMgzXRvisu/eLEZUZdjWmchTk
	i5di1Th/wy83zhf9NuCUXM3zFrY9jE3aIDWLs3m4Gg7P19w8IVNoa3eKofNBPuez7+5O
	kigz+IqfJmHffyRg7gks77C7C5JArAdArDOxCgg2RJyYtmk5CUoP/WZeUDVyxKvJJuDi
	69Ew==
X-Received: by 10.58.126.4 with SMTP id mu4mr10627020veb.0.1396062746459;
	Fri, 28 Mar 2014 20:12:26 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id
	ha7sm12869708vdb.17.2014.03.28.20.12.25 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Mar 2014 20:12:25 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Mar 2014 00:12:04 -0300
Message-Id: <1396062728-9140-4-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1396062728-9140-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1396062728-9140-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH v4 3/7] wic: Add rootfs_dir argument to do_prepare_partition() method
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
X-List-Received-Date: Sat, 29 Mar 2014 03:12:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The do_prepare_partition() method from RootfsPlugin class need
to know what will be the rootfs_dir. This makes sense when .wks
file has a partition set up like this:

  part /standby --source rootfs --rootfs-dir=<special rootfs> ...

then do_prepare_partition() will work with the correct rootfs.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 scripts/lib/mic/pluginbase.py                    | 2 +-
 scripts/lib/mic/plugins/source/bootimg-efi.py    | 2 +-
 scripts/lib/mic/plugins/source/bootimg-pcbios.py | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/mic/pluginbase.py b/scripts/lib/mic/pluginbase.py
index e26b525..9cf4c62 100644
--- a/scripts/lib/mic/pluginbase.py
+++ b/scripts/lib/mic/pluginbase.py
@@ -126,7 +126,7 @@ class SourcePlugin(_Plugin):
 
     @classmethod
     def do_prepare_partition(self, part, cr, cr_workdir, oe_builddir, bootimg_dir,
-                             kernel_dir, native_sysroot):
+                             kernel_dir, rootfs_dir, native_sysroot):
         """
         Called to do the actual content population for a partition i.e. it
         'prepares' the partition to be incorporated into the image.
diff --git a/scripts/lib/mic/plugins/source/bootimg-efi.py b/scripts/lib/mic/plugins/source/bootimg-efi.py
index 1974b06..2cc179a 100644
--- a/scripts/lib/mic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/mic/plugins/source/bootimg-efi.py
@@ -96,7 +96,7 @@ class BootimgEFIPlugin(SourcePlugin):
 
     @classmethod
     def do_prepare_partition(self, part, cr, cr_workdir, oe_builddir, bootimg_dir,
-                             kernel_dir, native_sysroot):
+                             kernel_dir, rootfs_dir, native_sysroot):
         """
         Called to do the actual content population for a partition i.e. it
         'prepares' the partition to be incorporated into the image.
diff --git a/scripts/lib/mic/plugins/source/bootimg-pcbios.py b/scripts/lib/mic/plugins/source/bootimg-pcbios.py
index fad150f..1211e5c 100644
--- a/scripts/lib/mic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/mic/plugins/source/bootimg-pcbios.py
@@ -124,7 +124,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
 
     @classmethod
     def do_prepare_partition(self, part, cr, cr_workdir, oe_builddir, bootimg_dir,
-                             kernel_dir, native_sysroot):
+                             kernel_dir, rootfs_dir, native_sysroot):
         """
         Called to do the actual content population for a partition i.e. it
         'prepares' the partition to be incorporated into the image.
-- 
1.8.3.2


