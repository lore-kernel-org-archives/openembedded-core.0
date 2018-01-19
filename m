Return-Path: <v.vogelhuber@digitalendoscopy.de>
X-Greylist: delayed 425 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 19 Jan 2018 16:08:08 UTC
Received: from mx-relay39-hz2.antispameurope.com
	(mx-relay39-hz2.antispameurope.com [94.100.136.239])
	by mail.openembedded.org (Postfix) with ESMTP id DF76771AB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 16:08:08 +0000 (UTC)
Received: from ptr-128.65.149.218.static.lewtelnet-access.de
	([128.65.149.218]) by mx-relay39-hz2.antispameurope.com; 
	Fri, 19 Jan 2018 17:01:03 +0100
Received: from [192.168.20.187] (192.168.20.187) by srv-msx01.digitendos.de
	(192.168.20.14) with Microsoft SMTP Server (TLS) id 15.0.516.32;
	Fri, 19 Jan 2018 17:00:42 +0100
To: <openembedded-core@lists.openembedded.org>
From: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>
Message-ID: <9536e25b-bbf9-8c21-e44a-c96dd79a848c@digitalendoscopy.de>
Date: Fri, 19 Jan 2018 17:00:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
X-Originating-IP: [192.168.20.187]
X-ClientProxiedBy: srv-msx01.digitendos.de (192.168.20.14) To
	srv-msx01.digitendos.de (192.168.20.14)
X-TM-AS-Product-Ver: SMEX-11.1.0.1291-8.200.1013-23606.004
X-TM-AS-Result: No--9.119100-8.000000-31
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-cloud-security-sender: v.vogelhuber@digitalendoscopy.de
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
	mx-relay39-hz2.antispameurope.com with B183FA6AC2B
X-cloud-security-connect: ptr-128.65.149.218.static.lewtelnet-access.de[128.65.149.218],
	TLS=1, IP=128.65.149.218
X-cloud-security: scantime:.2780
Subject: Question about multi rootfs UIDs when using wic
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
X-List-Received-Date: Fri, 19 Jan 2018 16:08:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I'm currently trying to create a multi RootFS WIC image as mentioned in
directdisk-multi-rootfs.wks. For that I have two image recipes. One that 
is creating only an ext4 image (image-recovery), and the second that is 
also creating a WIC image (image-main). I used the IMAGE_FSTYPES 
variable for that. The WKS file for the second image is integrating the 
recovery image by specifying --rootfs-dir=image-recovery in it's part 
description.

# primary / recovery image
part / --source rootfs --rootfs-dir=image-main --exclude-path mnt/data/ 
mnt/data2/ --fstype=ext4 --label primary_rootfs --align 1024 --size 700 
--overhead-factor=1.0
part /recovery --source rootfs --rootfs-dir=image-recovery --fstype=ext4 
--label recovery_rootfs --align 1024 --size 640 --overhead-factor=1.0

The UIDs of the second rootfs (image-main) are correctly set to 0 within 
the file system when calling mkfs.ext4 during prepare_rootfs_ext. For 
the recovery rootfs the UID is always set to my own (host) one which is 
of course not valid for the image where that UID does not exist.
I tried calling the mkfs.ext4 command myself from a terminal and for 
whatever reason an image created out of the rootfs folder of the second 
image (image-main) recipe is deployed with the correct UID 0, while the 
rootfs folder of the first image (image-recovery) recipe always uses the 
UID of the source folder/files.

I search the code of e2fsprogs for the line that sets the UID and added 
a printf in set_inode_extra. There I can see clearly that the source UID 
for the file is 0 for the rootfs of the image-main rootfs folder while 
it is 10000 (my own UID) for the image-recovery. I wonder how the UID of 
the image-main rootfs folder can be zero when I don't call any command 
with root permissions. I searched for a preparation step where the UIDs 
are managed in the scripts folder of Yocto, but didn't found any hint 
for the whole behavior. So while it is good that the rootfs partition of 
the main rootfs has the UID set correctly to zero, I can't understand 
why it happens. On the other side I can understand why the UID of the 
recovery rootfs is set to my own one, but it stops me from booting that 
rootfs because the UIDs of the files and folders are set to a user that 
does not exist on the target system.

Can someone please explain to me, how that UID handling is meant to be done?

