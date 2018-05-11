Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id C551A754A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 14:32:34 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id p85-v6so8236819lfg.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 07:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zXcfBkH9w14yEemD1Zq7jvLlHYnV49RD9kumKc2G6HE=;
	b=kpQPN00sUJLsoaqHSXHCtbI+EQzQpZtgRkkMzDJLHKXLZukuJMlgi0fToqe/vOK3aa
	3WEVzAXEXzURr4xTohw0OfOdDBrhvRdZ0aTye0FNniXHetH4nA8cbIVSy8fw4SErwawH
	yXHxLxzV9BGf5s4+TfTHZYSdWAvIm3SADTJMtSRxq+A90lkTnAz8USnCizfkeMifUtp5
	/8SXulR0lFm8+P7n1fyYKYSD8UYRQtrQ/Vkb6YDv/chZm8S9npBA/kLKvl7RnThhdKZP
	VwbSeWlJEM77op5nlQuyTRTpvZzFAVY3w7PNR6bZCempJy+Vf78XcMSdpvj4VzCeyk4g
	+zHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zXcfBkH9w14yEemD1Zq7jvLlHYnV49RD9kumKc2G6HE=;
	b=OPgvdSBbmEsf9hlMoBL6n0boGf915seT48+eoAjA7Q9y+1jg7krn2MVm1OFj/FGV+r
	rn1PeRaS0N/W9whGPhg+Yu6uN7O613Z5f4MSVb19FczLQi58MhJVbMErg2EfjuNkJwTg
	Zjzz/cG9f74JUsNJ1g/6h1OcuX/+TyEhd5BkWp/vzSMmQa2kvpRtF0TOTMzGXNvSvssu
	dkqQJ+Fjs6szUxqUtNzVEyinsDse7q4m1S01eNTiYCGdfrDDM3gnB1gq6K0HoCUI4nCT
	ElRVOhEqKOcd00ArJNQ9LrAFmFLnA5aemRbLR/hBmmZhJS3ihJnA049xvmY5KACqFrKt
	mGug==
X-Gm-Message-State: ALKqPwe0cv547cNyreyihOs8hfPFpQnH+IxSsloB5zYLtLdPCEXzqfqq
	63gln2NFQtD7zzeqJHCjIIg=
X-Google-Smtp-Source: AB8JxZqZsfM9Y2z/mRtSvWsn2gMV42+sY1n5u3+lET4OcahXRcoByRtx60HMd+BQOSHZIX7wSCZ5HQ==
X-Received: by 2002:a19:a9d4:: with SMTP id
	s203-v6mr1844667lfe.37.1526049155155; 
	Fri, 11 May 2018 07:32:35 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	c1-v6sm690635ljk.80.2018.05.11.07.32.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 07:32:33 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>,
	ed.bartosh@linux.intel.com,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Paulo Neves <ptsneves@gmail.com>, Ross Burton <ross.burton@intel.com>,
	Tom Rini <trini@konsulko.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 11 May 2018 16:32:31 +0200
Message-Id: <20180511143231.15292-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] wic: Fix partition files UIDs on multi rootfs images
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
X-List-Received-Date: Fri, 11 May 2018 14:32:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a wks makes reference to multiple rootfs, libspeudo data is not
properly chossen. This results in filesystems with invalid UIDs for all
the files.

This can be tested with this .wks file:
part / --source rootfs --fstype=ext4 --rootfs-dir=core-image-base
part /mnt/data1/ --fstype=ext4 --source rootfs --rootfs-dir=core-image-minimal
part /mnt/data2/ --fstype=ext4 --source rootfs --rootfs-dir=core-image-minimal

And this script

$bitbake core-image-minimal core-image-base syslinux
$losetup --partscan --find --read-only --show test*direct
$sudo mount /dev/loop0p1 /mnt
$ls -lan /mnt
otal 40
drwxr-xr-x 18    0    0  1024 May 11 16:11 .
drwxr-xr-x 25    0    0  4096 May  6 06:31 ..
drwxr-xr-x  2 1000 1000  3072 May 11 15:51 bin
drwxr-xr-x  2 1000 1000  1024 May 11 13:59 boot
drwxr-xr-x  2 1000 1000  1024 May 11 13:59 dev
drwxr-xr-x 25 1000 1000  3072 May 11 15:51 etc
drwxr-xr-x  3 1000 1000  1024 May 11 13:59 home
drwxr-xr-x  6 1000 1000  3072 May 11 15:51 lib
drwx------  2    0    0 12288 May 11 16:11 lost+found
drwxr-xr-x  2 1000 1000  1024 May 11 13:59 media
drwxr-xr-x  3 1000 1000  1024 May 11 15:50 mnt
drwxr-xr-x  2 1000 1000  1024 May 11 13:59 proc
drwxr-xr-x  2 1000 1000  1024 May 11 15:51 run
drwxr-xr-x  2 1000 1000  3072 May 11 15:51 sbin
drwxr-xr-x  2 1000 1000  1024 May 11 13:59 sys
drwxr-xr-t  2 1000 1000  1024 May 11 13:59 tmp
drwxr-xr-x 10 1000 1000  1024 May 11 14:54 usr
drwxr-xr-x  8 1000 1000  1024 May 11 14:55 var
$sudo losetup -d /dev/loop0

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 scripts/lib/wic/partition.py             | 2 +-
 scripts/lib/wic/plugins/imager/direct.py | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 3fe5c4e26c..c73af9d427 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -211,7 +211,7 @@ class Partition():
         """
         p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
         p_localstatedir = os.environ.get("PSEUDO_LOCALSTATEDIR",
-                                         "%s/../pseudo" %  get_bitbake_var("IMAGE_ROOTFS"))
+                                         "%s/../pseudo" %  rootfs_dir)
         p_passwd = os.environ.get("PSEUDO_PASSWD", rootfs_dir)
         p_nosymlinkexp = os.environ.get("PSEUDO_NOSYMLINKEXP", "1")
         pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 1fa6b917e6..81583e97b9 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -122,6 +122,10 @@ class DirectPlugin(ImagerPlugin):
         if self._update_fstab(fstab_lines, self.parts):
             # copy rootfs dir to workdir to update fstab
             # as rootfs can be used by other tasks and can't be modified
+            new_pseudo = os.path.realpath(os.path.join(self.workdir, "pseudo"))
+            from_dir = os.path.join(os.path.join(image_rootfs, ".."), "pseudo")
+            from_dir = os.path.realpath(from_dir)
+            copyhardlinktree(from_dir, new_pseudo)
             new_rootfs = os.path.realpath(os.path.join(self.workdir, "rootfs_copy"))
             copyhardlinktree(image_rootfs, new_rootfs)
             fstab_path = os.path.join(new_rootfs, 'etc/fstab')
-- 
2.17.0


