Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8ED8660670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 01:12:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2V1CqMX013351
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Mar 2016 18:12:52 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 30 Mar 2016 18:12:51 -0700
To: Saul Wold <saul.wold@intel.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1458640034.git.liezhi.yang@windriver.com>
	<9050734f9f9baec08caa67948dd70f9389a93a6e.1458640034.git.liezhi.yang@windriver.com>
	<1459386101.18406.168.camel@intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56FC7992.8000508@windriver.com>
Date: Thu, 31 Mar 2016 09:12:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1459386101.18406.168.camel@intel.com>
Subject: Re: [PATCH 3/3] bootimg.bbclass: only inherit syslinux when pcbios
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
X-List-Received-Date: Thu, 31 Mar 2016 01:12:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/31/2016 09:01 AM, Saul Wold wrote:
> On Tue, 2016-03-22 at 02:48 -0700, Robert Yang wrote:
>> syslinux.bbclass should not be seen when use efi.
>>
> That's not completely true, there is a case which still requires the
> ioslinux.bin binary when EFI is used.  In the build_iso() function
> there is a workaround that is still required and uses isolinux.bin
>
> This change breaks building EFI only machines (intel-quark for example)
>
> Please check into this.

I had built EFI only boards before send this, it worked well. I will check
meta-intel's intel-quark .

// Robert

> Thanks
>
> Sau!
>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/boot-directdisk.bbclass |    1 -
>>   meta/classes/bootimg.bbclass         |    9 +++++++--
>>   meta/classes/image-live.bbclass      |    1 -
>>   meta/classes/syslinux.bbclass        |    7 +++----
>>   4 files changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta/classes/boot-directdisk.bbclass
>> b/meta/classes/boot-directdisk.bbclass
>> index c6ada47..46f88ac 100644
>> --- a/meta/classes/boot-directdisk.bbclass
>> +++ b/meta/classes/boot-directdisk.bbclass
>> @@ -59,7 +59,6 @@ inherit ${EFI_CLASS}
>>
>>   DISK_SIGNATURE ?= "${DISK_SIGNATURE_GENERATED}"
>>   ROOT_VM ?= "root=/dev/sda2"
>> -SYSLINUX_CFG_VM  ?= "${S}/syslinux_vm.cfg"
>>
>>   boot_direct_populate() {
>>   	dest=$1
>> diff --git a/meta/classes/bootimg.bbclass
>> b/meta/classes/bootimg.bbclass
>> index 70ce070..d9ed7db 100644
>> --- a/meta/classes/bootimg.bbclass
>> +++ b/meta/classes/bootimg.bbclass
>> @@ -40,6 +40,11 @@ EFIIMGDIR = "${S}/efi_img"
>>   COMPACT_ISODIR = "${S}/iso.z"
>>   COMPRESSISO ?= "0"
>>
>> +ISOLINUXDIR ?= "/isolinux"
>> +ISO_BOOTIMG = "isolinux/isolinux.bin"
>> +ISO_BOOTCAT = "isolinux/boot.cat"
>> +MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
>> +
>>   BOOTIMG_VOLUME_ID   ?= "boot"
>>   BOOTIMG_EXTRA_SPACE ?= "512"
>>
>> @@ -59,10 +64,10 @@ def pcbios(d):
>>       return pcbios
>>
>>   PCBIOS = "${@pcbios(d)}"
>> +PCBIOS_CLASS = "${@['','syslinux'][d.getVar('PCBIOS', True) ==
>> '1']}"
>>
>> -# The syslinux is required for the isohybrid command and boot
>> catalog
>> -inherit syslinux
>>   inherit ${EFI_CLASS}
>> +inherit ${PCBIOS_CLASS}
>>
>>   populate() {
>>   	DEST=$1
>> diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-
>> live.bbclass
>> index 504725d..05e416a 100644
>> --- a/meta/classes/image-live.bbclass
>> +++ b/meta/classes/image-live.bbclass
>> @@ -3,7 +3,6 @@ INITRD_IMAGE_LIVE ?= "core-image-minimal-initramfs"
>>   INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-
>> ${MACHINE}.cpio.gz"
>>   ROOT_LIVE ?= "root=/dev/ram0"
>>   LABELS_LIVE ?= "boot install"
>> -SYSLINUX_CFG_LIVE ?= "${S}/syslinux_live.cfg"
>>
>>   ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
>>
>> diff --git a/meta/classes/syslinux.bbclass
>> b/meta/classes/syslinux.bbclass
>> index 6de656b..7d324c3 100644
>> --- a/meta/classes/syslinux.bbclass
>> +++ b/meta/classes/syslinux.bbclass
>> @@ -20,7 +20,7 @@
>>   do_bootimg[depends] += "${MLPREFIX}syslinux:do_populate_sysroot \
>>                           syslinux-native:do_populate_sysroot"
>>
>> -ISOLINUXDIR = "/isolinux"
>> +ISOLINUXDIR ?= "/isolinux"
>>   SYSLINUXDIR = "/"
>>   # The kernel has an internal default console, which you can override
>> with
>>   # a console=...some_tty...
>> @@ -30,10 +30,9 @@ SYSLINUX_SERIAL_TTY ?= "console=ttyS0,115200"
>>   SYSLINUX_PROMPT ?= "0"
>>   SYSLINUX_TIMEOUT ?= "50"
>>   AUTO_SYSLINUXMENU ?= "1"
>> -ISO_BOOTIMG = "isolinux/isolinux.bin"
>> -ISO_BOOTCAT = "isolinux/boot.cat"
>> -MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
>>   SYSLINUX_ROOT ?= "${ROOT}"
>> +SYSLINUX_CFG_VM  ?= "${S}/syslinux_vm.cfg"
>> +SYSLINUX_CFG_LIVE ?= "${S}/syslinux_live.cfg"
>>   APPEND_prepend = " ${SYSLINUX_ROOT} "
>>
>>   # Need UUID utility code.
>> --
>> 1.7.9.5
>>
>

