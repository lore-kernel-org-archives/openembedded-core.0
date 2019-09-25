Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68AED7E66A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 19:39:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8PJboqx003989
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Sep 2019 12:38:07 -0700
Received: from [192.168.10.15] (172.25.59.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 25 Sep 2019 12:37:40 -0700
To: Alessio Igor Bogani <alessio.bogani@elettra.eu>,
	<openembedded-core@lists.openembedded.org>, Anuj Mittal
	<anuj.mittal@intel.com>
References: <20190925150602.7959A440DCB_D8B825AB@spamalot.elettra.eu>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <f313da8e-6f87-a0d3-413b-d69d0fec9f12@windriver.com>
Date: Wed, 25 Sep 2019 14:37:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190925150602.7959A440DCB_D8B825AB@spamalot.elettra.eu>
Subject: Re: [PATCH] wic: Using the right rootfs size during prepare_rootfs
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
X-List-Received-Date: Wed, 25 Sep 2019 19:39:00 -0000
X-Groupsio-MsgNum: 129494
Content-Type: multipart/mixed; boundary="------------406AD2453FE285B2B7682448"
Content-Language: en-US

--------------406AD2453FE285B2B7682448
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


This definitely doesn't work as is, for the case where you use additional rootfs-dir variables in the .wks.in file.

I made a sample .wks.in file with the following and build core-image-minimal.

bootloader --ptable gpt
part / --source rootfs --ondisk sda --fstype=ext4 --label otaboot1 --align 4
part / --source rootfs --rootfs-dir=${WORKDIR}/rootfs_ota --ondisk sda --fstype=ext4 --label otaboot --align 4
part / --source rootfs --rootfs-dir=${WORKDIR}/rootfs_boot --ondisk sda --fstype=ext4 --label otaroot --align 4
part / --source rootfs --rootfs-dir=${WORKDIR}/rootfs_ota --ondisk sda --fstype=ext4 --label otaboot_b --align 4
part / --source rootfs --rootfs-dir=${WORKDIR}/rootfs_boot --ondisk sda --fstype=ext4 --label otaroot_b --align 4

The first time through it will die because we don't have a bbclass which is creating and populating the directories, so I just filled the directories with some random contents since I wasn't going to boot this image.

mkdir -p tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs_boot
mkdir -p tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs_ota

To see how it worked for your case, I left the first partition as a default with the standard "rootfs" and updated the IMAGE_ROOT_SIZE = "1024000".  That caused wic to create five 1.3 gig partitions.

I created a patch on top of what you provided which seems to address the problem the new patch creates.


diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 81df15f71b..d809408e1a 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -216,7 +216,8 @@ class Partition():
              # The rootfs size is not set in .ks file so try to get it
              # from bitbake variable
              rsize_bb = get_bitbake_var('ROOTFS_SIZE')
-            if rsize_bb:
+            rdir = get_bitbake_var('IMAGE_ROOTFS')
+            if rsize_bb and rdir == rootfs_dir:
                  # Bitbake variable ROOTFS_SIZE is calculated in
                  # Image._get_rootfs_size method from meta/lib/oe/image.py
                  # using IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT,



----

Using the patch above, plus your patch, I can see the resulting image computes the size automatically for the other partitions.


% fdisk -l tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
Disklabel type: gpt
Disk identifier: C024DE9A-1213-4D0B-8FEB-1C97CFB36FC1

Device                                                            Start     End Sectors   Size Type
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic1      40 2673089 2673050   1.3G Linux filesystem
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic2 2673096 3291271  618176 301.9M Linux filesystem
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic3 3291272 3317907   26636    13M Linux filesystem
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic4 3317912 3936087  618176 301.9M Linux filesystem
tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic5 3936088 3962723   26636    13M Linux filesystem

---

If you wish to submit your patch, please either merge in my patch, which is attached, or submit both patches together, else it will regress the automatic partition sizing fixes.

Thanks,
Jason.


On 9/25/19 10:05 AM, Alessio Igor Bogani wrote:
> The commit 8e48b4d6c4 makes wic ignores IMAGE_ROOTFS_SIZE for rootfs
> size and makes it uses the computed one only. Re-add support for
> IMAGE_ROOTFS_SIZE variable and compute roots size only if the former
> is not defined.
> 
> Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
> ---
>   scripts/lib/wic/partition.py | 22 ++++++++++++++++------
>   1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 2a71d7b1d6..81df15f71b 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -212,13 +212,23 @@ class Partition():
>           if os.path.isfile(rootfs):
>               os.remove(rootfs)
>   
> -        # If size is not specified compute it from the rootfs_dir size
>           if not self.size and real_rootfs:
> -            # Use the same logic found in get_rootfs_size()
> -            # from meta/classes/image.bbclass
> -            du_cmd = "du -ks %s" % rootfs_dir
> -            out = exec_cmd(du_cmd)
> -            self.size = int(out.split()[0])
> +            # The rootfs size is not set in .ks file so try to get it
> +            # from bitbake variable
> +            rsize_bb = get_bitbake_var('ROOTFS_SIZE')
> +            if rsize_bb:
> +                # Bitbake variable ROOTFS_SIZE is calculated in
> +                # Image._get_rootfs_size method from meta/lib/oe/image.py
> +                # using IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT,
> +                # IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
> +                self.size = int(round(float(rsize_bb)))
> +            else:
> +                # Bitbake variable ROOTFS_SIZE is not defined so compute it
> +                # from the rootfs_dir size using the same logic found in
> +                # get_rootfs_size() from meta/classes/image.bbclass
> +                du_cmd = "du -ks %s" % rootfs_dir
> +                out = exec_cmd(du_cmd)
> +                self.size = int(out.split()[0])
>   
>           prefix = "ext" if self.fstype.startswith("ext") else self.fstype
>           method = getattr(self, "prepare_rootfs_" + prefix)
> 


--------------406AD2453FE285B2B7682448
Content-Type: text/x-patch;
	name="0001-wic-Only-use-ROOTFS_SIZE-for-the-IMAGE_ROOTFS.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-wic-Only-use-ROOTFS_SIZE-for-the-IMAGE_ROOTFS.patch"

From 04ba59686d6e70d7ae347a8e92667edbb882cb9d Mon Sep 17 00:00:00 2001
From: Jason Wessel <jason.wessel@windriver.com>
Date: Wed, 25 Sep 2019 12:31:57 -0700
Subject: [PATCH] wic: Only use ROOTFS_SIZE for the IMAGE_ROOTFS

The size of a provided directory with --rootfs-dir="" in the .wks file
should always be computed on the fly, else every partition will be constrained to be the same size as what ever value was in ROOTFS_SIZE.

Bitbake will provide the ROOTFS_SIZE along with the IMAGE_ROOTFS from
the image.bbclass.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 scripts/lib/wic/partition.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 81df15f71b..d809408e1a 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -216,7 +216,8 @@ class Partition():
             # The rootfs size is not set in .ks file so try to get it
             # from bitbake variable
             rsize_bb = get_bitbake_var('ROOTFS_SIZE')
-            if rsize_bb:
+            rdir = get_bitbake_var('IMAGE_ROOTFS')
+            if rsize_bb and rdir == rootfs_dir:
                 # Bitbake variable ROOTFS_SIZE is calculated in
                 # Image._get_rootfs_size method from meta/lib/oe/image.py
                 # using IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT,
-- 
2.23.0


--------------406AD2453FE285B2B7682448--
