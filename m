Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BF2C369A1
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 20:57:37 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.7102.1744145847054735720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 13:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PRzgq7Ph;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c54b651310so811346185a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 13:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744145845; x=1744750645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QcCDxUanIbq8441LRtl4g/QhlmAZaUDVSi44UQ5POWc=;
        b=PRzgq7Ph3cHYz1l7NJ9W9lIXnI5XzCEVo+EIaTDY5rlHfs5w2wlXLdwXVOVs+2ZjwH
         /pqK4vxXxJSlVX5K0GPRP4OVWXEEFxQCNH4Y3bGm2W/Z9AeXh1DLkU5F3isSBOM6Zqjp
         bZtC1OkfZSuyKdIWSXaei5hSwVSz7cSPO2r2OC1hK19lBI5ZDaT2U/Xi4f/HMyKojnVh
         OII5vU7mVYo3+ZMLjkksDOgxTw6V1qsW+RWwge8lpmcGo+SfKtHdV2nMvT60tmDKhZRI
         X7lrPBUsOwSs7HK7YR5R+dhcrDxAmojzoZC1T5hH3xEjA4iGqq0eCY6iSRgdW7MD7UpQ
         BXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744145845; x=1744750645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QcCDxUanIbq8441LRtl4g/QhlmAZaUDVSi44UQ5POWc=;
        b=eRJE62cbpc/kwbqltczZU3rneFcoHF50gBM72hgCI0x4G7AogUpxSSXHigN/iyN7kN
         p6UtI8fF5WcRfEH8iesh+4KS8iRrRSxmiIeGfDHTkgARKNA0BiiCzTXNlKsqF/rf3X28
         Ua19nYJpQf3t+bkLotpB4hVW7rO4WzchIpsKAhyERC74+FdW9tuFEnzDnamxYPURKd+K
         YyM+vAZtoCd5iB1TWpoe9K9yjqEjxWPFu4L8uxVqsnT84Wg33lRydKFRXPejApD2a6ia
         Hfb2jdtZK4mU5se847EyTEHTnM8s3vy7oRxw09ChsYwvKFIW/9Sv+17kjTlD3IKaS2La
         POsA==
X-Gm-Message-State: AOJu0YzqksBPPC/lRMOO+NAKfQORg+nYqK73NSzCebv00Dib2oo4LIf6
	+MxLtCwWJO+KVyIu1Q9rrNIG2KbxidMUapvEVGpzAoILvDNrQqb0RxjXsA==
X-Gm-Gg: ASbGncvtEocTja9deKHIub4EO7/MpfdHh81GmvakiLierDfMt8l3F+MMBaOdUKHm0zr
	N/T78/1i76vQ5M+hppw8b2igB027xfdeSAWnCls8xRQLBaGcUo1rwW/znQy9rqgSEErDPtsHDwm
	p5kt52Cn9an2R8qRMdJULJ6388bB6zUPyNwO5wtve14EW/sixnqQAqXwo6uKhrFei3gyt4VwqHJ
	tQ7HQvC4OSUWwDaYVJ6sxILmf8Ro+aTsN4XTpjun7SgDkhRi7olz6SQvfF/0eELfHXdce/fLGEc
	NvneBD4tJkdy/G8W7QnyvaN3JW9f02KQikW/9dfvCLpiB2IA2APVeRtj7MmI9NUL0/zfmVclDJD
	W95RkxNNUoSbf
X-Google-Smtp-Source: AGHT+IGyW97IEbyg0+l9HdnzObnveDtqYagiXPrplXRJgUwQ0kmiwp94xtBd+esTt9FQqc3oEdfnHg==
X-Received: by 2002:a05:620a:280d:b0:7c5:994a:7f62 with SMTP id af79cd13be357-7c79cc49098mr93012685a.41.1744145845333;
        Tue, 08 Apr 2025 13:57:25 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e7354a3sm805232785a.10.2025.04.08.13.57.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:57:24 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: do not ignore ROOTFS_SIZE if the rootfs is modified
Date: Tue,  8 Apr 2025 16:57:09 -0400
Message-ID: <20250408205709.7013-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 20:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214566

If the *.wks file contains a "--source rootfs" then
lib/wic/plugins/source/rootfs.py will be invoked to generate (what is assumed
to be) the rootfs partition. If the rootfs partition needs to be tweaked or
modified, the "rootfs.py" plugin will make a copy of the filesystem and then
perform the changes on that copy. In other words, if the "--source rootfs"
line of the *.wks file also contains any of:

	--exclude-path
	--include-path
	--change-directory
	--use-label (i.e. modify etc/fstab)

then the rootfs will be copied first, then the copy is modified.

If, for example, the unmodified IMAGE_ROOTFS is:

	.../tmp/work/qemuarm64_secureboot-oe-linux/core-image-base/1.0/rootfs

then the copy would be made at:

	.../tmp/work/qemuarm64_secureboot-oe-linux/core-image-base/1.0/tmp-wic/rootfs${LINENO}

where ${LINENO} is the line number where this "--source rootfs" line appears
in the *wks file.

When it comes time to make an actual partition of a specific filesystem type,
lib/wic/partition.py::prepare_rootfs() is called. It is in this function that
wic figures out if any extra size needs to be added. The bitbake variable used
to specify the ultimate rootfs size is ROOTFS_SIZE, and since this variable is
only valid for the rootfs (and not any other partitions), the code also
verifies that the partition being created is ${IMAGE_ROOTFS}:

	rsize_bb = get_bitbake_var('ROOTFS_SIZE')
	rdir = get_bitbake_var('IMAGE_ROOTFS')
	if rsize_bb and rdir == rootfs_dir:
		<use rsize_bb>
	else:
		<calculate the partition size using "du -ks $p">

As noted above, if lib/wic/plugins/source/rootfs.py has made a copy, then the
"rdir == rootfs_dir" clause will fail and the code will assume this partition
is not a rootfs since the strings do not compare equal.

Therefore, in order to determine if this is a rootfs, retain the existing
"rdir == rootfs_dir" comparison, but also add another one to check whether or
not this is a wic-generated copy of the rootfs.

STEPS TO REPRODUCE:
	- start with the following *wks file:
		bootloader --ptable gpt
		part /boot --ondisk=vda --align 64 --size=100M --active --source bootimg-partition --fstype=ext4 --label boot --sourceparams="loader=u-boot"
		part /     --ondisk=vda                                 --source rootfs            --fstype=ext4 --label root
	- and the following extra variable in conf/local.conf:
		IMAGE_ROOTFS_EXTRA_SPACE = "500000"
	- build an image
	- run it in qemu
		$ runqemu slirp nographic serial
	- verify the root partition has extra space:
		root@qemuarm64-secureboot:~# df -h
		Filesystem                Size      Used Available Use% Mounted on
		/dev/root               721.5M     67.4M    600.6M  10% /
		devtmpfs                477.7M         0    477.7M   0% /dev
		tmpfs                    40.0K         0     40.0K   0% /mnt
		tmpfs                   489.3M     92.0K    489.2M   0% /run
		tmpfs                   489.3M     68.0K    489.2M   0% /var/volatile
		/dev/vda1               120.4M     19.9M     91.4M  18% /boot
	- modify the "/" line of the *wks file to be:
		part /     --ondisk=vda --exclude-path boot/            --source rootfs            --fstype=ext4 --label root
	- build image

	when it fails:
		root@qemuarm64-secureboot:~# df -h
		Filesystem                Size      Used Available Use% Mounted on
		/dev/root                73.4M     41.9M     25.8M  62% /
		devtmpfs                477.7M         0    477.7M   0% /dev
		tmpfs                    40.0K         0     40.0K   0% /mnt
		tmpfs                   489.3M     92.0K    489.2M   0% /run
		tmpfs                   489.3M     68.0K    489.2M   0% /var/volatile
		/dev/vda1               120.4M     19.9M     91.4M  18% /boot

	after this fix:
		root@qemuarm64-secureboot:~# df -h
		Filesystem                Size      Used Available Use% Mounted on
		/dev/root               721.5M     47.4M    620.6M   7% /
		devtmpfs                477.7M         0    477.7M   0% /dev
		tmpfs                    40.0K         0     40.0K   0% /mnt
		tmpfs                   489.3M     92.0K    489.2M   0% /run
		tmpfs                   489.3M     68.0K    489.2M   0% /var/volatile
		/dev/vda1               120.4M     19.9M     91.4M  18% /boot

Doing the math we see that the /boot partition is ~20MB and in the first image
the / partition contains this ~20MB in addition to the rest of the rootfs.
This ~20MB is completely wasted since it is used in the / partition, but then
the /boot partition is mounted on top of it, making the /boot directory of /
inaccessible. After the fix the / partition has an additional ~20MB since the
/boot portion is excluded.

Fixes [YOCTO #15555]

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 32 +++++++++++++++++++++++++++++
 scripts/lib/wic/partition.py        |  2 +-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 59fd99a78836..67f938351bde 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -535,6 +535,38 @@ part /mnt --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/whoa
         finally:
             os.environ['PATH'] = oldpath
 
+    def test_exclude_path_with_extra_space(self):
+        """Test having --exclude-path with IMAGE_ROOTFS_EXTRA_SPACE. [Yocto #15555]"""
+
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.writelines(
+                ['bootloader --ptable gpt\n',
+                 'part /boot --size=100M --active --source bootimg-partition --fstype=ext4 --label boot\n',
+                 'part /     --exclude-path boot/ --source rootfs            --fstype=ext4 --label root\n'])
+            wks.flush()
+            config = 'IMAGE_ROOTFS_EXTRA_SPACE = "500000"\n'\
+                     'IMAGE_FSTYPES += "wic"\n'\
+                     'WKS_FILE = "%s"\n' % wks.name
+            self.append_config(config)
+            bitbake('core-image-minimal')
+
+        """
+        the output of "wic ls <image>.wic" will look something like:
+            Num     Start        End          Size      Fstype
+             1         17408    136332287    136314880  ext4
+             2     136332288    171464703     35132416  ext4
+        we are looking for the size of partition 2
+        i.e. in this case the number 35,132,416
+        without the fix the size will be around 85,403,648
+        with the fix the size should be around 799,960,064
+        """
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'MACHINE'], 'core-image-minimal')
+        deploy_dir = bb_vars['DEPLOY_DIR_IMAGE']
+        machine = bb_vars['MACHINE']
+        wicout = glob(os.path.join(deploy_dir, "core-image-minimal-%s.rootfs-*.wic" % machine))[0]
+        size_of_root_partition = int(runCmd("wic ls %s" % wicout).output.split('\n')[2].split()[3])
+        self.assertGreater(size_of_root_partition, 500000000)
+
     def test_include_path(self):
         """Test --include-path wks option."""
 
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index bf2c34d5940f..b18431d8fb84 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -244,7 +244,7 @@ class Partition():
             # from bitbake variable
             rsize_bb = get_bitbake_var('ROOTFS_SIZE')
             rdir = get_bitbake_var('IMAGE_ROOTFS')
-            if rsize_bb and rdir == rootfs_dir:
+            if rsize_bb and (rdir == rootfs_dir or (rootfs_dir.split('/')[-2] == "tmp-wic" and rootfs_dir.split('/')[-1][:6] == "rootfs")):
                 # Bitbake variable ROOTFS_SIZE is calculated in
                 # Image._get_rootfs_size method from meta/lib/oe/image.py
                 # using IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT,
-- 
2.44.0.501.g19981daefd7c


