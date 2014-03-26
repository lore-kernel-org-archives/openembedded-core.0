Return-Path: <joaohf@gmail.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id DBA6F6F6C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 02:43:08 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id jw12so1657747veb.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 19:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=dQZKubPMcJQeq1IO+/VVio8kEep/iQXQ01PgGpLmKq8=;
	b=LSanlGNs4b7Lw7Zc/1V9iKA/+UzpNLFnKucBBRmXF00LSsjCYrVl60UCGaiezNk7Xu
	NmhYUgm0XgwbJ7DYom5uZZpLnigdjuC5TOLaQMXozOi0bPKx0Evp98eAM85v55GREHpF
	EBXRdIRer5Eo8bsC4Dm2+E4fZifRkRJLg7fgUcbud0fVU1F10xSehYjhXsgtWs24drSO
	07uuQYM67trs86B7dRqguW0+rC9WXOqlTcumXhgsJhO6v37XwNxZmm7S+k6zS4Itw8Ks
	CHykCqmVaiEb7kt04ncnaQ5T2o5ZnH8fwGT5aNX/tase3LrgQecTqiwhtFAqb+nKnzPJ
	mpgA==
X-Received: by 10.53.1.69 with SMTP id be5mr8174882vdd.27.1395801789566;
	Tue, 25 Mar 2014 19:43:09 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id ay4sm35813974vdc.6.2014.03.25.19.43.08
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Mar 2014 19:43:09 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Mar 2014 23:42:45 -0300
Message-Id: <1395801769-13042-4-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1395801769-13042-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1395801769-13042-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH v2 3/7] wic: Add rootfs_dir argument to do_prepare_partition() method
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
X-List-Received-Date: Wed, 26 Mar 2014 02:43:13 -0000
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


