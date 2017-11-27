Return-Path: <v.vogelhuber@digitalendoscopy.de>
Received: from mx-relay14-hz1.antispameurope.com
	(mx-relay14-hz1.antispameurope.com [94.100.132.214])
	by mail.openembedded.org (Postfix) with ESMTP id 2076A78235
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 16:21:20 +0000 (UTC)
Received: from host-80-81-19-29.customer.m-online.net ([80.81.19.29]) by
	mx-relay14-hz1.antispameurope.com; Mon, 27 Nov 2017 17:21:20 +0100
Received: from DE028.digitendos.de (192.168.20.186) by srv-msx01.digitendos.de
	(192.168.20.14) with Microsoft SMTP Server (TLS) id 15.0.516.32;
	Mon, 27 Nov 2017 17:20:53 +0100
From: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Nov 2017 17:20:54 +0100
Message-ID: <20171127162055.6612-1-v.vogelhuber@digitalendoscopy.de>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.20.186]
X-ClientProxiedBy: srv-msx01.digitendos.de (192.168.20.14) To
	srv-msx01.digitendos.de (192.168.20.14)
X-cloud-security-sender: v.vogelhuber@digitalendoscopy.de
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
	mx-relay14-hz1.antispameurope.com with CB86158022D
X-cloud-security-connect: host-80-81-19-29.customer.m-online.net[80.81.19.29],
	TLS=1, IP=80.81.19.29
X-cloud-security: scantime:.1879
Subject: (No subject)
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
X-List-Received-Date: Mon, 27 Nov 2017 16:21:22 -0000
Content-Type: text/plain

I currently have an image with six different partitions. See the 
following partition configuration:

># bootloader
>part /boot/EFI --source bootimg-efi --sourceparams="loader=systemd-boot" --ondisk mmcblk --fstype=vfat --label boot --active --align 1024 --size 20 --overhead-factor=1.0 --uuid="1EFC2AC2-449B-6ABB-AA63-7EA004446DF1"
>
>#--use-uuid
># primary / recovery image
>part / --source rootfs --rootfs-dir=image --exclude-path opt/something/ opt/else/ opt/somemore/ --ondisk mmcblk --fstype=ext4 --label primary_rootfs --align 1024 --size 768 --overhead-factor=1.0 --uuid="2779D408-1362-AEF5-AEB1-00BF5674C065"
>part /recovery --source rootfs --rootfs-dir=image-recovery --ondisk mmcblk --fstype=ext4 --label recovery_rootfs --align 1024 --size 640 --overhead-factor=1.0 --uuid="528B6F25-5143-47B3-8D12-391820EAF1CF"
>
># additional partitions
>part /opt/something --source rootfs --rootfs-dir=image --rootfs-subdir=opt/something --ondisk mmcblk --fstype=ext4 --label persist --align 1024 --size 64 --overhead-factor=1.0 --use-uuid
>part /opt/else --source rootfs --rootfs-dir=image --rootfs-subdir=opt/else --ondisk mmcblk --fstype=ext4 --label de --align 1024 --size 256 --overhead-factor=1.0 --use-uuid
>part /opt/somemore --source rootfs --rootfs-dir=image --rootfs-subdir=opt/somemore --ondisk mmcblk --fstype=ext4 --label data --align 1024 --size 1700 --overhead-factor=1.0 --use-uuid
>
>bootloader --timeout=0 --ptable gpt --configfile="disk.cfg"

My problem is now that if I use the wic -e option to specify an image 
name as rootfs-dir I can not extract subdirectories from the rootfs 
to different partitions. Or at least I didn't found out a way.
That's why I added a rootfs-subdir option to wic that allows appending 
a rootfs dir to the one received by IMAGE_ROOTFS. I read something 
about spliting should be done on recipe level 
(https://lists.yoctoproject.org/pipermail/yocto/2016-March/029301.html), 
but I couldn't figure out how that should be done and that patch seems 
much easier for me.


