Return-Path: <joaohf@gmail.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 274D06E757
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 21:18:21 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id oy12so4187010veb.18
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 14:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=fCQGvdW2NXnw/0H9jgDWnmkx6DaYSVS5EVa3N3nW/nc=;
	b=tQ914ZRdqQ2TbNHckyeEt7z+Zm5rigeQhal/SXodJGQNuWjNbxr03VgBidUDanPiez
	1pqDREdc0xBvuNAJ+PnGB9dG2KYFWXOjnCATfh+10zcgZJvmgLeJS3Jvu95N1CY4iAfH
	UKh6D/Jd5/NkM77qaAJlGQ91sg1iZPkErgVjl5jbthoJquBTNc51qqyNgFAiKCbseU2P
	en1rUair9J2lBhy+GVZEGErnEfWESjXVi3rFdMMAs22hfyGbxi/vhAX84bm0I3aa8f2i
	CPi+pbtgXw828GPDt8MU721oaRw+ZB9nOGawkxMVhcgF2gFd652MYZCf8CdPxJBWsZUw
	xgpg==
X-Received: by 10.58.34.101 with SMTP id y5mr12845108vei.8.1394918302377;
	Sat, 15 Mar 2014 14:18:22 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id am5sm4382714vdc.15.2014.03.15.14.18.20
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 15 Mar 2014 14:18:21 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Mar 2014 18:17:49 -0300
Message-Id: <1394918271-14153-4-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH 3/5] wic: Add rootfs_dir argument to do_prepare_partition() method
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
X-List-Received-Date: Sat, 15 Mar 2014 21:18:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The do_prepare_partition() method from RootfsPlugin class need
to know what will be the rootfs_dir. This makes sense when .wks
file has a partition set up like this:

  part /standby --source rootfs --rootfs=<special rootfs> ...

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


