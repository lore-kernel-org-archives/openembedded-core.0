Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.5400.1610811159660510138
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Jan 2021 07:32:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=gKu9p7S1;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from [192.168.178.23] (i59F77213.versanet.de [89.247.114.19])
	by linux.microsoft.com (Postfix) with ESMTPSA id C879A20B7192;
	Sat, 16 Jan 2021 07:32:37 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C879A20B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1610811158;
	bh=2lrq//nZr2K/qneDaxVI9YZagRN7KKD5DHZY/d97cjw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=gKu9p7S1GbX3Sm3gv6x/pFLMBM4i2+KI9RzjNb1B44pBpE74iMBiPwSiqhB4OTDY2
	 i8+TXy5kdavecLvuS2LE5yd7n1lKE/dpd6fkWZq7KZVdVRkDtj1ekPWcaQgDuHC7U1
	 OOLg2H8P2JPuoVX7c4gpYfWnvfCxO7GIVu3mS5ag=
Subject: Re: [OE-core] [PATCH] appliance: Add vhd & vhdx support
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
 Sinan Kaya <okaya@kernel.org>
References: <20210114130123.20507-1-anbelski@linux.microsoft.com>
 <CAM9ZRVsrJDWKdG0MhGybaWqOYztH_6D9zcvCaoTQ5HO5Gt7hbA@mail.gmail.com>
From: "Anatol Belski" <anbelski@linux.microsoft.com>
Message-ID: <f56dc38d-441f-f35e-72bb-a3c07f5af670@linux.microsoft.com>
Date: Sat, 16 Jan 2021 16:32:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVsrJDWKdG0MhGybaWqOYztH_6D9zcvCaoTQ5HO5Gt7hbA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------0A108375A3A5BA228328AA6E"
Content-Language: en-US

--------------0A108375A3A5BA228328AA6E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/16/2021 10:22 AM, Paul Barker wrote:
> On Thu, 14 Jan 2021 at 13:01, Anatol Belski
> <anbelski@linux.microsoft.com> wrote:
>> From: Sinan Kaya <okaya@kernel.org>
>>
>> This patch brings support for generating VHD/VHDX from WIC. It touches
>> different areas but it needs to be applied at once for all the parts to
>> concert. The patch could be split, if needed, otherwise considering
>> OE-Core as target.
>>
>> Signed-off-by: Sinan Kaya <okaya@kernel.org>
>> Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
>> ---
>>   bitbake/lib/toaster/orm/models.py                  |  4 ++--
>>   meta/classes/image-live.bbclass                    |  2 +-
>>   meta/classes/image_types.bbclass                   | 14 ++++++++++++--
>>   .../images/build-appliance-image_15.0.0.bb         |  4 +++-
>>   scripts/runqemu                                    |  8 +++++---
>>   5 files changed, 23 insertions(+), 9 deletions(-)
>>
>> diff --git a/bitbake/lib/toaster/orm/models.py b/bitbake/lib/toaster/orm/models.py
>> index 7f7e922ade..49dc7dae36 100644
>> --- a/bitbake/lib/toaster/orm/models.py
>> +++ b/bitbake/lib/toaster/orm/models.py
>> @@ -583,7 +583,7 @@ class Build(models.Model):
>>           note that this is the actual list of extensions stored on Target objects
>>           for this build, and not the value of IMAGE_FSTYPES.
>>
>> -        Returns comma-separated string, e.g. "vmdk, ext4"
>> +        Returns comma-separated string, e.g. "vmdk, vhd, vhdx, ext4"
>>           """
>>           extensions = []
>>
>> @@ -970,7 +970,7 @@ class Target_Image_File(models.Model):
>>           'ext3', 'ext3.gz', 'ext4', 'ext4.gz', 'f2fs', 'hddimg', 'iso', 'jffs2',
>>           'jffs2.sum', 'multiubi', 'squashfs', 'squashfs-lz4', 'squashfs-lzo',
>>           'squashfs-xz', 'tar', 'tar.bz2', 'tar.gz', 'tar.lz4', 'tar.xz', 'ubi',
>> -        'ubifs', 'wic', 'wic.bz2', 'wic.gz', 'wic.lzma'
>> +        'ubifs', "vhd", 'vhdx', 'wic', 'wic.bz2', 'wic.gz', 'wic.lzma'
>>       }
>>
>>       target = models.ForeignKey(Target, on_delete=models.CASCADE)
> The above changes to bitbake need to be submitted to the bitbake-devel
> list (https://lists.openembedded.org/g/bitbake-devel) and should be
> based on the bitbake repository
> (https://git.openembedded.org/bitbake/), i.e. the leading "bitbake/"
> in the path should be dropped.
>
>> diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
>> index 9ea5ddc312..1b2183eadd 100644
>> --- a/meta/classes/image-live.bbclass
>> +++ b/meta/classes/image-live.bbclass
>> @@ -234,7 +234,7 @@ build_hddimg() {
>>                                  bberror "${HDDDIR}/rootfs.img rootfs size is greather than or equal to 4GB,"
>>                                  bberror "and this doesn't work on a FAT filesystem. You can either:"
>>                                  bberror "1) Reduce the size of rootfs.img, or,"
>> -                               bbfatal "2) Use wic, vmdk or vdi instead of hddimg\n"
>> +                               bbfatal "2) Use wic, vmdk,vhd, vhdx or vdi instead of hddimg\n"
>>                          fi
>>                  fi
>>
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>> index 286009057e..0586c040bc 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -269,7 +269,7 @@ IMAGE_TYPES = " \
>>   # CONVERSION_CMD/DEPENDS.
>>   COMPRESSIONTYPES ?= ""
>>
>> -CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64 ${COMPRESSIONTYPES}"
>> +CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 base64 ${COMPRESSIONTYPES}"
>>   CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>>   CONVERSION_CMD_gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>>   CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>> @@ -288,6 +288,8 @@ CONVERSION_CMD_sha512sum = "sha512sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
>>   CONVERSION_CMD_bmap = "bmaptool create ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap"
>>   CONVERSION_CMD_u-boot = "mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.u-boot"
>>   CONVERSION_CMD_vmdk = "qemu-img convert -O vmdk ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vmdk"
>> +CONVERSION_CMD_vhdx = "qemu-img convert -O vhdx -o subformat=dynamic ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vhdx"
>> +CONVERSION_CMD_vhd = "qemu-img convert -O vpc -o subformat=fixed ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vhd"
>>   CONVERSION_CMD_vdi = "qemu-img convert -O vdi ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi"
>>   CONVERSION_CMD_qcow2 = "qemu-img convert -O qcow2 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qcow2"
>>   CONVERSION_CMD_base64 = "base64 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.base64"
>> @@ -303,9 +305,17 @@ CONVERSION_DEPENDS_sum = "mtd-utils-native"
>>   CONVERSION_DEPENDS_bmap = "bmap-tools-native"
>>   CONVERSION_DEPENDS_u-boot = "u-boot-tools-native"
>>   CONVERSION_DEPENDS_vmdk = "qemu-system-native"
>> +CONVERSION_DEPENDS_vhdx = "qemu-native"
>> +CONVERSION_DEPENDS_vhd = "qemu-native"
> Is this intended to be different from the dependencies from vmdk
> above? You've got "qemu-native", vmdk has "qemu-system-native".

Oh, this might be the exact point why for the autobuilder fail. And the 
other things should not be overridden, how it looks like.

>
>>   CONVERSION_DEPENDS_vdi = "qemu-system-native"
>>   CONVERSION_DEPENDS_qcow2 = "qemu-system-native"
>>   CONVERSION_DEPENDS_base64 = "coreutils-native"
>> +CONVERSION_DEPENDS_u-boot = "u-boot-mkimage-native"
>> +CONVERSION_DEPENDS_vmdk = "qemu-native"
>> +CONVERSION_DEPENDS_vhdx = "qemu-native"
>> +CONVERSION_DEPENDS_vhd = "qemu-native"
>> +CONVERSION_DEPENDS_vdi = "qemu-native"
>> +CONVERSION_DEPENDS_qcow2 = "qemu-native"
> This looks like it overwrites the above assignments. It also modifies
> the dependencies for other image types like u-boot and qcow2. What's
> the reason for these lines?
>
>>   RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
>>   RUNNABLE_MACHINE_PATTERNS ?= "qemu"
>> @@ -313,7 +323,7 @@ RUNNABLE_MACHINE_PATTERNS ?= "qemu"
>>   DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
>>
>>   # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
>> -# images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hddimg, iso, etc.
>> +# images that will not be built at do_rootfs time: vmdk, vhd, vhdx, vdi, qcow2, hddimg, iso, etc.
>>   IMAGE_TYPES_MASKED ?= ""
>>
>>   # bmap requires python3 to be in the PATH
>> diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
>> index 8b95026218..c5c9d385ef 100644
>> --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
>> +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
>> @@ -20,7 +20,7 @@ IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
>>   APPEND += "rootfstype=ext4 quiet"
>>
>>   DEPENDS = "zip-native python3-pip-native"
>> -IMAGE_FSTYPES = "wic.vmdk"
>> +IMAGE_FSTYPES = "wic.vmdk wic.vhd wic.vhdx"
> Do we need to generate vhd and vhdx images for the build appliance?
> Are you actually using these or just trying to build all relevant
> images?

Yep, we use the the VHD/VHDX. As the recipe is a generic appliance, it 
seemed the right place to contribute this change.

>>   inherit core-image module-base setuptools3
>>
>> @@ -129,6 +129,8 @@ create_bundle_files () {
>>          mkdir -p Yocto_Build_Appliance
>>          cp *.vmx* Yocto_Build_Appliance
>>          ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
>> +       ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vhdx Yocto_Build_Appliance/Yocto_Build_Appliance.vhdx
>> +       ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vhd Yocto_Build_Appliance/Yocto_Build_Appliance.vhd
>>          zip -r ${IMGDEPLOYDIR}/Yocto_Build_Appliance-${DATETIME}.zip Yocto_Build_Appliance
>>          ln -sf Yocto_Build_Appliance-${DATETIME}.zip ${IMGDEPLOYDIR}/Yocto_Build_Appliance.zip
>>   }
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index e5e66f3453..dd92a64553 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -94,11 +94,13 @@ Examples:
>>     runqemu qemux86-64 core-image-sato ext4
>>     runqemu qemux86-64 wic-image-minimal wic
>>     runqemu path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial
>> -  runqemu qemux86 iso/hddimg/wic.vmdk/wic.qcow2/wic.vdi/ramfs/cpio.gz...
>> +  runqemu qemux86 iso/hddimg/wic.vmdk/wic.vhd/wic.vhdx/wic.qcow2/wic.vdi/ramfs/cpio.gz...
>>     runqemu qemux86 qemuparams="-m 256"
>>     runqemu qemux86 bootparams="psplash=false"
>>     runqemu path/to/<image>-<machine>.wic
>>     runqemu path/to/<image>-<machine>.wic.vmdk
>> +  runqemu path/to/<image>-<machine>.wic.vhdx
>> +  runqemu path/to/<image>-<machine>.wic.vhd
>>   """)
>>
>>   def check_tun():
>> @@ -179,7 +181,7 @@ class BaseConfig(object):
>>           self.portlocks = {}
>>           self.bitbake_e = ''
>>           self.snapshot = False
>> -        self.wictypes = ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi')
>> +        self.wictypes = ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi', "wic.vhd", "wic.vhdx")
>>           self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs',
>>                           'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz')
>>           self.vmtypes = ('hddimg', 'iso')
>> @@ -1203,7 +1205,7 @@ class BaseConfig(object):
>>               return
>>           if 'wic.' in self.fstype:
>>               self.fstype = self.fstype[4:]
>> -        rootfs_format = self.fstype if self.fstype in ('vmdk', 'qcow2', 'vdi') else 'raw'
>> +        rootfs_format = self.fstype if self.fstype in ('vmdk', 'vhd', 'vhdx', 'qcow2', 'vdi') else 'raw'
>>
>>           qb_rootfs_opt = self.get('QB_ROOTFS_OPT')
>>           if qb_rootfs_opt:
> I actually recommend splitting the runqemu changes off into another
> patch. So you'd have one patch for image_types, one patch for bitbake
> and one patch for runqemu.

ACK, i'll do that and send the bitbake to the dedicated list. Initially 
i was just concerned as i'm not sure how to link those parts together. 
Probably could just link to the related patch on the web interface, anyway.

Thanks!

Anatol

> Thanks,
>
>
> 
>

--------------0A108375A3A5BA228328AA6E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/16/2021 10:22 AM, Paul Barker
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAM9ZRVsrJDWKdG0MhGybaWqOYztH_6D9zcvCaoTQ5HO5Gt7hbA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Thu, 14 Jan 2021 at 13:01, Anatol Belski
<a class="moz-txt-link-rfc2396E" href="mailto:anbelski@linux.microsoft.com">&lt;anbelski@linux.microsoft.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
From: Sinan Kaya <a class="moz-txt-link-rfc2396E" href="mailto:okaya@kernel.org">&lt;okaya@kernel.org&gt;</a>

This patch brings support for generating VHD/VHDX from WIC. It touches
different areas but it needs to be applied at once for all the parts to
concert. The patch could be split, if needed, otherwise considering
OE-Core as target.

Signed-off-by: Sinan Kaya <a class="moz-txt-link-rfc2396E" href="mailto:okaya@kernel.org">&lt;okaya@kernel.org&gt;</a>
Signed-off-by: Anatol Belski <a class="moz-txt-link-rfc2396E" href="mailto:anbelski@linux.microsoft.com">&lt;anbelski@linux.microsoft.com&gt;</a>
---
 bitbake/lib/toaster/orm/models.py                  |  4 ++--
 meta/classes/image-live.bbclass                    |  2 +-
 meta/classes/image_types.bbclass                   | 14 ++++++++++++--
 .../images/build-appliance-image_15.0.0.bb         |  4 +++-
 scripts/runqemu                                    |  8 +++++---
 5 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/bitbake/lib/toaster/orm/models.py b/bitbake/lib/toaster/orm/models.py
index 7f7e922ade..49dc7dae36 100644
--- a/bitbake/lib/toaster/orm/models.py
+++ b/bitbake/lib/toaster/orm/models.py
@@ -583,7 +583,7 @@ class Build(models.Model):
         note that this is the actual list of extensions stored on Target objects
         for this build, and not the value of IMAGE_FSTYPES.

-        Returns comma-separated string, e.g. "vmdk, ext4"
+        Returns comma-separated string, e.g. "vmdk, vhd, vhdx, ext4"
         """
         extensions = []

@@ -970,7 +970,7 @@ class Target_Image_File(models.Model):
         'ext3', 'ext3.gz', 'ext4', 'ext4.gz', 'f2fs', 'hddimg', 'iso', 'jffs2',
         'jffs2.sum', 'multiubi', 'squashfs', 'squashfs-lz4', 'squashfs-lzo',
         'squashfs-xz', 'tar', 'tar.bz2', 'tar.gz', 'tar.lz4', 'tar.xz', 'ubi',
-        'ubifs', 'wic', 'wic.bz2', 'wic.gz', 'wic.lzma'
+        'ubifs', "vhd", 'vhdx', 'wic', 'wic.bz2', 'wic.gz', 'wic.lzma'
     }

     target = models.ForeignKey(Target, on_delete=models.CASCADE)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The above changes to bitbake need to be submitted to the bitbake-devel
list (<a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/bitbake-devel">https://lists.openembedded.org/g/bitbake-devel</a>) and should be
based on the bitbake repository
(<a class="moz-txt-link-freetext" href="https://git.openembedded.org/bitbake/">https://git.openembedded.org/bitbake/</a>), i.e. the leading "bitbake/"
in the path should be dropped.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 9ea5ddc312..1b2183eadd 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -234,7 +234,7 @@ build_hddimg() {
                                bberror "${HDDDIR}/rootfs.img rootfs size is greather than or equal to 4GB,"
                                bberror "and this doesn't work on a FAT filesystem. You can either:"
                                bberror "1) Reduce the size of rootfs.img, or,"
-                               bbfatal "2) Use wic, vmdk or vdi instead of hddimg\n"
+                               bbfatal "2) Use wic, vmdk,vhd, vhdx or vdi instead of hddimg\n"
                        fi
                fi

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 286009057e..0586c040bc 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -269,7 +269,7 @@ IMAGE_TYPES = " \
 # CONVERSION_CMD/DEPENDS.
 COMPRESSIONTYPES ?= ""

-CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64 ${COMPRESSIONTYPES}"
+CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 base64 ${COMPRESSIONTYPES}"
 CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD_gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
@@ -288,6 +288,8 @@ CONVERSION_CMD_sha512sum = "sha512sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
 CONVERSION_CMD_bmap = "bmaptool create ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap"
 CONVERSION_CMD_u-boot = "mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.u-boot"
 CONVERSION_CMD_vmdk = "qemu-img convert -O vmdk ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vmdk"
+CONVERSION_CMD_vhdx = "qemu-img convert -O vhdx -o subformat=dynamic ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vhdx"
+CONVERSION_CMD_vhd = "qemu-img convert -O vpc -o subformat=fixed ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vhd"
 CONVERSION_CMD_vdi = "qemu-img convert -O vdi ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi"
 CONVERSION_CMD_qcow2 = "qemu-img convert -O qcow2 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qcow2"
 CONVERSION_CMD_base64 = "base64 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.base64"
@@ -303,9 +305,17 @@ CONVERSION_DEPENDS_sum = "mtd-utils-native"
 CONVERSION_DEPENDS_bmap = "bmap-tools-native"
 CONVERSION_DEPENDS_u-boot = "u-boot-tools-native"
 CONVERSION_DEPENDS_vmdk = "qemu-system-native"
+CONVERSION_DEPENDS_vhdx = "qemu-native"
+CONVERSION_DEPENDS_vhd = "qemu-native"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is this intended to be different from the dependencies from vmdk
above? You've got "qemu-native", vmdk has "qemu-system-native".</pre>
    </blockquote>
    <p>Oh, this might be the exact point why for the autobuilder fail.
      And the other things should not be overridden, how it looks like.<br>
    </p>
    <blockquote type="cite"
cite="mid:CAM9ZRVsrJDWKdG0MhGybaWqOYztH_6D9zcvCaoTQ5HO5Gt7hbA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> CONVERSION_DEPENDS_vdi = "qemu-system-native"
 CONVERSION_DEPENDS_qcow2 = "qemu-system-native"
 CONVERSION_DEPENDS_base64 = "coreutils-native"
+CONVERSION_DEPENDS_u-boot = "u-boot-mkimage-native"
+CONVERSION_DEPENDS_vmdk = "qemu-native"
+CONVERSION_DEPENDS_vhdx = "qemu-native"
+CONVERSION_DEPENDS_vhd = "qemu-native"
+CONVERSION_DEPENDS_vdi = "qemu-native"
+CONVERSION_DEPENDS_qcow2 = "qemu-native"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This looks like it overwrites the above assignments. It also modifies
the dependencies for other image types like u-boot and qcow2. What's
the reason for these lines?

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"
@@ -313,7 +323,7 @@ RUNNABLE_MACHINE_PATTERNS ?= "qemu"
 DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"

 # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
-# images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hddimg, iso, etc.
+# images that will not be built at do_rootfs time: vmdk, vhd, vhdx, vdi, qcow2, hddimg, iso, etc.
 IMAGE_TYPES_MASKED ?= ""

 # bmap requires python3 to be in the PATH
diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 8b95026218..c5c9d385ef 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -20,7 +20,7 @@ IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
 APPEND += "rootfstype=ext4 quiet"

 DEPENDS = "zip-native python3-pip-native"
-IMAGE_FSTYPES = "wic.vmdk"
+IMAGE_FSTYPES = "wic.vmdk wic.vhd wic.vhdx"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Do we need to generate vhd and vhdx images for the build appliance?
Are you actually using these or just trying to build all relevant
images?
</pre>
    </blockquote>
    <p>Yep, we use the the VHD/VHDX. As the recipe is a generic
      appliance, it seemed the right place to contribute this change. <br>
    </p>
    <blockquote type="cite"
cite="mid:CAM9ZRVsrJDWKdG0MhGybaWqOYztH_6D9zcvCaoTQ5HO5Gt7hbA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
 inherit core-image module-base setuptools3

@@ -129,6 +129,8 @@ create_bundle_files () {
        mkdir -p Yocto_Build_Appliance
        cp *.vmx* Yocto_Build_Appliance
        ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
+       ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vhdx Yocto_Build_Appliance/Yocto_Build_Appliance.vhdx
+       ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.wic.vhd Yocto_Build_Appliance/Yocto_Build_Appliance.vhd
        zip -r ${IMGDEPLOYDIR}/Yocto_Build_Appliance-${DATETIME}.zip Yocto_Build_Appliance
        ln -sf Yocto_Build_Appliance-${DATETIME}.zip ${IMGDEPLOYDIR}/Yocto_Build_Appliance.zip
 }
diff --git a/scripts/runqemu b/scripts/runqemu
index e5e66f3453..dd92a64553 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -94,11 +94,13 @@ Examples:
   runqemu qemux86-64 core-image-sato ext4
   runqemu qemux86-64 wic-image-minimal wic
   runqemu path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial
-  runqemu qemux86 iso/hddimg/wic.vmdk/wic.qcow2/wic.vdi/ramfs/cpio.gz...
+  runqemu qemux86 iso/hddimg/wic.vmdk/wic.vhd/wic.vhdx/wic.qcow2/wic.vdi/ramfs/cpio.gz...
   runqemu qemux86 qemuparams="-m 256"
   runqemu qemux86 bootparams="psplash=false"
   runqemu path/to/&lt;image&gt;-&lt;machine&gt;.wic
   runqemu path/to/&lt;image&gt;-&lt;machine&gt;.wic.vmdk
+  runqemu path/to/&lt;image&gt;-&lt;machine&gt;.wic.vhdx
+  runqemu path/to/&lt;image&gt;-&lt;machine&gt;.wic.vhd
 """)

 def check_tun():
@@ -179,7 +181,7 @@ class BaseConfig(object):
         self.portlocks = {}
         self.bitbake_e = ''
         self.snapshot = False
-        self.wictypes = ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi')
+        self.wictypes = ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi', "wic.vhd", "wic.vhdx")
         self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs',
                         'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz')
         self.vmtypes = ('hddimg', 'iso')
@@ -1203,7 +1205,7 @@ class BaseConfig(object):
             return
         if 'wic.' in self.fstype:
             self.fstype = self.fstype[4:]
-        rootfs_format = self.fstype if self.fstype in ('vmdk', 'qcow2', 'vdi') else 'raw'
+        rootfs_format = self.fstype if self.fstype in ('vmdk', 'vhd', 'vhdx', 'qcow2', 'vdi') else 'raw'

         qb_rootfs_opt = self.get('QB_ROOTFS_OPT')
         if qb_rootfs_opt:
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I actually recommend splitting the runqemu changes off into another
patch. So you'd have one patch for image_types, one patch for bitbake
and one patch for runqemu.
</pre>
    </blockquote>
    <p>ACK, i'll do that and send the bitbake to the dedicated list.
      Initially i was just concerned as i'm not sure how to link those
      parts together. Probably could just link to the related patch on
      the web interface, anyway.</p>
    <p>Thanks!</p>
    <p>Anatol<br>
    </p>
    <blockquote type="cite"
cite="mid:CAM9ZRVsrJDWKdG0MhGybaWqOYztH_6D9zcvCaoTQ5HO5Gt7hbA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
Thanks,

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------0A108375A3A5BA228328AA6E--
