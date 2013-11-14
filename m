Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C200C6D8A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 01:58:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAE1wJUH000771
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Nov 2013 17:58:19 -0800 (PST)
Received: from [128.224.162.230] (128.224.162.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 13 Nov 2013 17:58:19 -0800
Message-ID: <52842E39.8020404@windriver.com>
Date: Thu, 14 Nov 2013 09:58:17 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1383982908.git.jackie.huang@windriver.com>
	<6595bf3519f7ac59300b8a173027b2f771a824bb.1383982908.git.jackie.huang@windriver.com>
	<5283F7E5.6000006@linux.intel.com>
In-Reply-To: <5283F7E5.6000006@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [v2 PATCH 1/2] grub-efi-native: fix build failure on 32bit host
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
X-List-Received-Date: Thu, 14 Nov 2013 01:58:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/14/2013 6:06 AM, Saul Wold wrote:
> On 11/08/2013 11:56 PM, jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> grub-efi-native builds grub with efi platform, then run
>> "grub-mkimage" command with built in cfg and modules to
>> generate an EFI binary for the target, and deploys it.
>>
>> It works fine when build on 64bit host, but when we build
>> x86-64 target on 32bit host, it fails to build 64bit grub,
>> even if it builds, the 64bit binary "grub-mkimage" would
>> fail to run to generate EFI.
>>
>> So the solution is:
>> Add a target package grub-efi and grub-efi-native depends
>> on it, grub-efi-native will be back to real native, then
>> run "grub-mkimage" command with modules in sysroot populated
>> by grub-efi to generate the EFI binary for target.
>>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>>   meta/recipes-bsp/grub/grub-efi-native_2.00.bb | 54
>> ++++++---------------------
>>   meta/recipes-bsp/grub/grub-efi.inc            | 42
>> +++++++++++++++++++++
>>   meta/recipes-bsp/grub/grub-efi_2.00.bb        | 11 ++++++
>>   3 files changed, 64 insertions(+), 43 deletions(-)
>>   create mode 100644 meta/recipes-bsp/grub/grub-efi.inc
>>   create mode 100644 meta/recipes-bsp/grub/grub-efi_2.00.bb
>>
>> diff --git a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
>> b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
>> index 04973b5..b64fc3c 100644
>> --- a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
>> +++ b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
>> @@ -1,47 +1,20 @@
>> -SUMMARY = "GRUB2 is the next-generation GRand Unified Bootloader"
>> +require grub-efi.inc
>>
>> -DESCRIPTION = "GRUB2 is the next generaion of a GPLed bootloader \
>> -intended to unify bootloading across x86 operating systems. In \
>> -addition to loading the Linux kernel, it implements the Multiboot \
>> -standard, which allows for flexible loading of multiple boot images. \
>> -This recipe builds an EFI binary for the target. It does not install \
>> -or package anything, it only deploys a target-arch GRUB EFI image."
>> +# do_mkimage needs grub modules for the target to generate the correct
>> +# EFI binary, so depends on the target package 'grub-efi' to compile
>> +# the necessary modules.
>> +DEPENDS += "grub-efi"
>>
>> -HOMEPAGE = "http://www.gnu.org/software/grub/"
>> -SECTION = "bootloaders"
>> -
>> -LICENSE = "GPLv3"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>> -
>> -# FIXME: We should be able to optionally drop freetype as a dependency
>> -DEPENDS = "autogen-native"
>> -RDEPENDS_${PN} = "diffutils freetype"
>> -PR = "r2"
>> +PR = "${INC_PR}.0"
>>
> Don't need the INC_PR
>
>>   # Native packages do not normally rebuild when the target changes.
>>   # Ensure this is built once per HOST-TARGET pair.
>>   PN := "grub-efi-${TRANSLATED_TARGET_ARCH}-native"
>>
>> -SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>> -           file://cfg \
>> -           file://grub-2.00-fpmath-sse-387-fix.patch \
>> -           file://grub-2.00-fix-enable_execute_stack-check.patch \
>> -           file://grub-2.00-disable-help2man.patch \
>> -           file://check-if-liblzma-is-disabled.patch \
>> -           file://grub-no-unused-result.patch \
>> -           file://grub-2.00-ignore-gnulib-gets-stupidity.patch \
>> -           file://fix-issue-with-flex-2.5.37.patch \
>> -          "
>> -SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
>> -SRC_URI[sha256sum] =
>> "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
>> -
>> -COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
>> -
>> -S = "${WORKDIR}/grub-${PV}"
>> -
>>   # Determine the target arch for the grub modules before the native
>> class
>> -# clobbers TARGET_ARCH.
>> +# clobbers TARGET_ARCH and STAGING_LIBDIR.
>>   ORIG_TARGET_ARCH := "${TARGET_ARCH}"
>> +ORIG_STAGING_LIBDIR := "${STAGING_LIBDIR}"
>>   python __anonymous () {
>>       import re
>>       target = d.getVar('ORIG_TARGET_ARCH', True)
>> @@ -57,19 +30,14 @@ python __anonymous () {
>>       d.setVar("GRUB_IMAGE", grubimage)
>>   }
>>
>> -inherit autotools
>> -inherit gettext
>>   inherit native
>>   inherit deploy
>>
>> -EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
>> -                --target=${GRUB_TARGET} --enable-efiemu=no
>> --program-prefix='' \
>> -                --enable-liblzma=no --enable-device-mapper=no
>> --enable-libzfs=no"
>> -
>>   do_mkimage() {
>>       # Search for the grub.cfg on the local boot media by using the
>> -    # built in cfg file provided via this recipe
>> -    ./grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
>> +    # built in cfg file provided via this recipe and modules dir
>> +    # populated by grub-efi
>> +    ./grub-mkimage -c ../cfg -p /EFI/BOOT -d
>> ${ORIG_STAGING_LIBDIR}/grub-efi/${GRUB_TARGET}-efi \
>>                      -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
>>                      boot linux ext2 fat serial part_msdos part_gpt
>> normal efi_gop iso9660 search
>>   }
>> diff --git a/meta/recipes-bsp/grub/grub-efi.inc
>> b/meta/recipes-bsp/grub/grub-efi.inc
>> new file mode 100644
>> index 0000000..1c64646
>> --- /dev/null
>> +++ b/meta/recipes-bsp/grub/grub-efi.inc
>> @@ -0,0 +1,42 @@
>> +SUMMARY = "GRUB2 is the next-generation GRand Unified Bootloader"
>> +
>> +DESCRIPTION = "GRUB2 is the next generaion of a GPLed bootloader \
>> +intended to unify bootloading across x86 operating systems. In \
>> +addition to loading the Linux kernel, it implements the Multiboot \
>> +standard, which allows for flexible loading of multiple boot images. \
>> +This recipe builds an EFI binary for the target. It does not install \
>> +or package anything, it only deploys a target-arch GRUB EFI image."
>> +
>> +HOMEPAGE = "http://www.gnu.org/software/grub/"
>> +SECTION = "bootloaders"
>> +
>> +LICENSE = "GPLv3"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>> +
>> +# FIXME: We should be able to optionally drop freetype as a dependency
>> +DEPENDS = "autogen-native flex-native"
>> +INC_PR = "r2"
>> +
> Should just be PR = "r2" and shared by both.
>
>
>> +SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>> +           file://cfg \
>> +           file://grub-2.00-fpmath-sse-387-fix.patch \
>> +           file://grub-2.00-fix-enable_execute_stack-check.patch \
>> +           file://grub-2.00-disable-help2man.patch \
>> +           file://check-if-liblzma-is-disabled.patch \
>> +           file://grub-no-unused-result.patch \
>> +           file://grub-2.00-ignore-gnulib-gets-stupidity.patch \
>> +           file://fix-issue-with-flex-2.5.37.patch \
>> +          "
>> +SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
>> +SRC_URI[sha256sum] =
>> "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
>> +
>> +COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
>> +
>> +S = "${WORKDIR}/grub-${PV}"
>> +
>> +inherit autotools
>> +inherit gettext
>> +
>> +EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
>> +                --enable-efiemu=no --program-prefix='' \
>> +                --enable-liblzma=no --enable-device-mapper=no
>> --enable-libzfs=no"
>> diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> b/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> new file mode 100644
>> index 0000000..9be1fd2
>> --- /dev/null
>> +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> @@ -0,0 +1,11 @@
>> +require grub-efi.inc
>> +
>> +RDEPENDS_${PN} = "diffutils freetype"
>> +
>> +PR = "${INC_PR}.0"
>
> I am not sure you need to extend PR here since we are working to get rid
> of PR in general, just leave the PR="r2" in the new .inc file.
>
>> +FILES_${PN}-dbg += "${libdir}/${BPN}/${TARGET_ARCH}-efi/.debug"
>> +
>
> I am not sure if this is doing the right thing, as I am getting QA
> errors regarding where debug files are going, but this may need to be
> GRUB-TARGET.  This is just an example of one:

Yes, you are right, the TARGET_ARCH is not correct for this, I will fix 
this and the PR issue, thanks!

Thanks,
Jackie

>
> ERROR: QA Issue: non debug package contains .debug directory: grub-efi
> path
> /work/core2-poky-linux/grub-efi/2.00-r2.0/packages-split/grub-efi/usr/lib/grub-efi/i386-efi/.debug/part_bsd.module
>
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
>
>
>> +do_install_append () {
>> +    mv ${D}${libdir}/grub ${D}${libdir}/${BPN}
>> +    mv ${D}${datadir}/grub ${D}${datadir}/${BPN}
>> +}
>>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

