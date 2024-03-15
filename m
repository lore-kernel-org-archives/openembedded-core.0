Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B690C54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 08:19:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16403.1710490737153432369
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 01:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JgVWachf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3804dd61df=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42F7oOAF005709
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 01:18:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=el4iL
	PppikfMMgsXe8FTMeWNNAQDroSUdbcrBamPidw=; b=JgVWachfJzZaCxYgH2XzJ
	Xa9kpQJ7h0ayIDX/CWWHyu49qNXmbL8HvlhoPBlZ6gLL1igQMJiRwCSNGu4iKUQJ
	yXJloU3XDOHf4F0jpKij9WLyVwGsJW9ICKNB+T7tpypOhryjXH0VeJiUDByiREGp
	duMNCgvHv//N5NkBMrj6qkqX6BOWe/KO9ljO94jZQ0i9HS7hd91YkMjgj51MFy/W
	oNglbDBz1Mkb0YULXZitJk2aeSKuY8K35nlJ/AvQvFFJsdftY6o+ofqnbL8p/YBp
	uXv7xeFEK4i+YJGNYzpaGpgx/Qk4Xf1FRhE+djQ7XPEn3xSgJI4H8D8N9uoIIlb+
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wv9x70c3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 01:18:56 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 15 Mar 2024 01:18:46 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Fri, 15 Mar 2024 01:18:45 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] weston-init: Add --system for useradd
Date: Fri, 15 Mar 2024 16:18:44 +0800
Message-ID: <20240315081844.3075049-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ShUtcLr8kNkDWxbLL5sxheU7gKa20TAj
X-Proofpoint-ORIG-GUID: ShUtcLr8kNkDWxbLL5sxheU7gKa20TAj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1011 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403150067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 08:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197129

From: Mingli Yu <mingli.yu@windriver.com>

Add --system parameter for useradd to avoid intruducing .bashrc
and .profile under home dir to fix the below error.
 $ bitbake core-image-weston
| DEBUG: Executing python function set_image_size
| DEBUG: 352679.600000 = 271292 * 1.300000
| DEBUG: 455079.600000 = max(352679.600000, 65536)[352679.600000] + 102400
| DEBUG: 455080.000000 = int(455079.600000)
| DEBUG: 455080 = aligned(455080)
| DEBUG: returning 455080
| DEBUG: Python function set_image_size finished
| DEBUG: Executing shell function do_image_tar
| tar: ./home/weston/.bashrc: Unknown file type; file ignored
| tar: ./home/weston/.profile: Unknown file type; file ignored
| tar: Exiting with failure status due to previous errors
| WARNING: /buildarea1/test/yocto/builds/poky-build-weston/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/temp/run.do_image_tar.1972897:150 exit 1 from '[ $? -eq 1 ]'
| WARNING: Backtrace (BB generated script):
    #1: do_image_tar, /buildarea1/test/yocto/builds/poky-build-weston/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/temp/run.do_image_tar.1972897, line 150
    #2: main, /buildarea1/test/yocto/builds/poky-build-weston/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/temp/run.do_image_tar.1972897, line 156
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing python function set_image_size
| DEBUG: 352679.600000 = 271292 * 1.300000
| DEBUG: 455079.600000 = max(352679.600000, 65536)[352679.600000] + 102400
| DEBUG: 455080.000000 = int(455079.600000)
| DEBUG: 455080 = aligned(455080)
| DEBUG: returning 455080
| DEBUG: Python function set_image_size finished
| DEBUG: Executing shell function do_image_ext4
| DEBUG: Executing dd if=/dev/zero of=/buildarea1/test/yocto/builds/poky-build-weston/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/deploy-core-image-weston-image-complete/core-image-weston-qemux86-64.rootfs-20240315032140.ext4 seek=455080 count=0 bs=1024
| 0+0 records in
| 0+0 records out
| 0 bytes copied, 0.00136946 s, 0.0 kB/s
| DEBUG: Actual Rootfs size:  268184    /buildarea1/test/yocto/builds/poky-build-weston/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/rootfs
| DEBUG: Actual Partition size: 466001920
| DEBUG: Executing mkfs.ext4 -F -i 4096 /buildarea1/test/yocto/builds/poky-build-weston/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/deploy-core-image-weston-image-complete/core-image-weston-qemux86-64.rootfs-20240315032140.ext4 -d /buildarea1/test/yocto/builds/poky-build-weston/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/rootfs
| mke2fs 1.47.0 (5-Feb-2023)
| Discarding device blocks: done
| Creating filesystem with 455080 1k blocks and 113792 inodes
| Filesystem UUID: 2031373e-63cd-4711-968b-4023ff7d6a90
| Superblock backups stored on blocks:
|   8193, 24577, 40961, 57345, 73729, 204801, 221185, 401409
|
| Allocating group tables: done
| Writing inode tables: done
| Creating journal (8192 blocks): done
| Copying files into the device: __populate_fs: ignoring entry ".bashrc"
| .bashrc: File not found by ext2_lookup while looking up ".bashrc"
| mkfs.ext4: File not found by ext2_lookup while populating file system
| WARNING: /buildarea1/test/yocto/builds/poky-build-weston/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/temp/run.do_image_ext4.1972895:178 exit 1 from 'mkfs.$fstype -F $extra_imagecmd /buildarea1/test/yocto/builds/poky-build-weston/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/deploy-core-image-weston-image-complete/core-image-weston-qemux86-64.rootfs-20240315032140.$fstype -d /buildarea1/test/yocto/builds/poky-build-weston/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/rootfs'
| WARNING: Backtrace (BB generated script):
|   #1: oe_mkext234fs, /buildarea1/test/yocto/builds/poky-build-weston/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/temp/run.do_image_ext4.1972895, line 178
|   #2: do_image_ext4, /buildarea1/test/yocto/builds/poky-build-weston/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/temp/run.do_image_ext4.1972895, line 150
|   #3: main, /buildarea1/test/yocto/builds/poky-build-weston/tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/temp/run.do_image_ext4.1972895, line 215
ERROR: Task (/buildarea1/test/yocto/poky/meta/recipes-graphics/images/core-image-weston.bb:do_image_ext4) failed with exit code '1'

Before the patch:
$ ls -a tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/rootfs/home/weston/
.  ..  .bashrc  .profile

After the patch:
$ ls -a tmp/work/qemux86_64-poky-linux/core-image-weston/1.0/rootfs/home/weston/
.  ..

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 024e400665..542b86818c 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -101,6 +101,6 @@ FILES:${PN} += "\
 CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"
 
 SYSTEMD_SERVICE:${PN} = "weston.service weston.socket"
-USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,wayland weston"
+USERADD_PARAM:${PN} = "--system --home /home/weston --shell /bin/sh --user-group -G video,input,render,wayland weston"
 GROUPADD_PARAM:${PN} = "-r wayland; -r render"
 
-- 
2.25.1


