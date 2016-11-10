Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3749571994
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 12:18:49 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id c13so187923814lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 04:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=I9khZ+1cOrJJ21R3M9tbk/g4SAb0OsP9HBdU48sCSDc=;
	b=HHs6y1Se4qkmMMWbeXYIQ28U9WqVlwEp5oITsW70yZ6N0UWjAVKu4He9h2Mx0zM5BZ
	HGTNcwQhNP9G51IvzOpJfzb17PnPeTM6Rmm7yAzGcMYHmPUVIAp6tKsZVj0fzfWbpVAd
	lWjN+//pzVxYPCWrPKr5xiUXARMBjIN/H8862qIonFenkwz/L5USOECpyvg0QviAK4D/
	XwZ/TJipBBX9rlp54C/eiBkxZsCpw3lxs2I4+vXWK5e2KkMzzjziA2zjvcftcgigdmre
	sWDg0lZGkto/azZ4aSMPFUvTY3N6QzeTNgvDLdCGu/530AUHJh/6Cp0JhAdhNI7evX+F
	c58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=I9khZ+1cOrJJ21R3M9tbk/g4SAb0OsP9HBdU48sCSDc=;
	b=A5JHWvH/qWsyL9VwbIPzPXnyCDr//Bhq7+Lr4Cuo0C8pyH7mceVDPzukx6nRk2yJFU
	C2LCq0bUvNbKQGfFreo/ezZJtixxOvSBX+r4Kly94+Fc9DsU7+Xt7rbPoimn7Nmkgo6N
	fKh8QXbGA44L0pNQpoc87tDUxjNBOdI3OJd9q+rzToCVQPZ5+YiUnmp6EuzAW0ipiWHj
	1ZhPMBczxUD8YxgqczOhWd8V/efl8ucI8lX07Uq+ObN+PZ6+GSuASOrAPkd6Fxuar8mo
	FBeoy1rIz6/e6GOtqtF1y+JvCzporlg2KN3jbVA0QZlpKeZyl7+Emf1DXiTHbCc983d9
	0Kgw==
X-Gm-Message-State: ABUngvcy5ZLb745JVRvut5x1D6e91Ddw5kjEaQ3xCIBRWoZXBSDEw3KbvIQG1k/Z/LCkuw==
X-Received: by 10.25.28.143 with SMTP id c137mr2680466lfc.149.1478780330416;
	Thu, 10 Nov 2016 04:18:50 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id g5sm934563lfe.47.2016.11.10.04.18.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 04:18:49 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 13:18:33 +0100
Message-Id: <a616f7b0489ef3a9389e79fb8af60a8a02cc1db2.1478779674.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 02/10] wic: use partition size when creating empty partition files
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
X-List-Received-Date: Thu, 10 Nov 2016 12:18:51 -0000

It seems that prepare_empty_partition_ext() and
prepare_empty_partition_btrfs() got broken in commit
c8669749e37fe865c197c98d5671d9de176ff4dd, thus one could observe the
following backtrace:

Backtrace:
  File "<snip>/poky/scripts/lib/wic/plugins/imager/direct_plugin.py", line 93, in do_create
    creator.create()
  File "<snip>/poky/scripts/lib/wic/imager/baseimager.py", line 159, in create
    self._create()
  File "<snip>/poky/scripts/lib/wic/imager/direct.py", line 290, in _create
    self.bootimg_dir, self.kernel_dir, self.native_sysroot)
  File "<snip>/poky/scripts/lib/wic/partition.py", line 146, in prepare
    method(rootfs, oe_builddir, native_sysroot)
  File "<snip>/poky/scripts/lib/wic/partition.py", line 325, in prepare_empty_partition_ext
    os.ftruncate(sparse.fileno(), rootfs_size * 1024)
NameError: name 'rootfs_size' is not defined

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 scripts/lib/wic/partition.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 959035a97110244ffe56e95a886e122c400d4779..f3835339afc5091604ffd7f0d0acf1d1ad4351cc 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -314,7 +314,7 @@ class Partition():
         Prepare an empty ext2/3/4 partition.
         """
         with open(rootfs, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
+            os.ftruncate(sparse.fileno(), self.size * 1024)
 
         extra_imagecmd = "-i 8192"
 
@@ -332,7 +332,7 @@ class Partition():
         Prepare an empty btrfs partition.
         """
         with open(rootfs, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
+            os.ftruncate(sparse.fileno(), self.size * 1024)
 
         label_str = ""
         if self.label:
-- 
2.5.0


