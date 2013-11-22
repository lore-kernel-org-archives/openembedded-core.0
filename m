Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43A076CEEA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 04:49:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAM4nSvX019839
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Nov 2013 20:49:30 -0800 (PST)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 21 Nov 2013 20:49:28 -0800
Message-ID: <528EE256.2030909@windriver.com>
Date: Fri, 22 Nov 2013 12:49:26 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1384854113.git.jackie.huang@windriver.com>
	<726632570b9d8a6bfcd88c5a411a6387f6869f91.1384854113.git.jackie.huang@windriver.com>
	<1385088300.3614.25.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1385088300.3614.25.camel@dvhart-mobl4.amr.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] grub-efi: change to generate EFI image in target package
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
X-List-Received-Date: Fri, 22 Nov 2013 04:49:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/22/2013 10:45 AM, Darren Hart wrote:
> On Wed, 2013-11-20 at 09:40 +0800, jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> It's not a good idea to generate the target EFI image in
>> a native packge,
>
> This was admittedly a hack when I wrote it...
>
>>   it would be a problem when build a 64bit
>> target on 32bit host.
>
> I build 32b on a 64b host regularly, why is it a problem the other way
> around?
>
> There is infrastructure in place to specify the target architecture for
> the grub efi binary and the modules. The 32b compiler should be able to
> do -m64 just as the 64b compiler can do -m32.

It should be, but for most 32bit linux distributions, gcc is not 
compiled for supporting 64bit cross compiling.

e.g. on rhel 6.2 32bit:

$ gcc -m64 test.c
test.c:1: sorry, unimplemented: 64-bit mode not compiled in
$ gcc -m64 -v
Using built-in specs.
Target: i686-redhat-linux
Configured with: ../configure --prefix=/usr --mandir=/usr/share/man 
--infodir=/usr/share/info 
--with-bugurl=http://bugzilla.redhat.com/bugzilla --enable-bootstrap 
--enable-shared --enable-threads=posix --enable-checking=release 
--with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions 
--enable-gnu-unique-object 
--enable-languages=c,c++,objc,obj-c++,java,fortran,ada 
--enable-java-awt=gtk --disable-dssi 
--with-java-home=/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0/jre 
--enable-libgcj-multifile --enable-java-maintainer-mode 
--with-ecj-jar=/usr/share/java/eclipse-ecj.jar 
--disable-libjava-multilib --with-ppl --with-cloog --with-tune=generic 
--with-arch=i686 --build=i686-redhat-linux
Thread model: posix
gcc version 4.4.6 20110731 (Red Hat 4.4.6-3) (GCC)

on openSUSE 12.2 32bit:

$ gcc -m64 test.c
test.c:1:0: sorry, unimplemented: 64-bit mode not compiled in
$ gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/i586-suse-linux/4.7/lto-wrapper
Target: i586-suse-linux
Configured with: ../configure --prefix=/usr --infodir=/usr/share/info 
--mandir=/usr/share/man --libdir=/usr/lib --libexecdir=/usr/lib 
--enable-languages=c,c++,objc,fortran,obj-c++,java,ada 
--enable-checking=release --with-gxx-include-dir=/usr/include/c++/4.7 
--enable-ssp --disable-libssp --disable-libitm --disable-plugin 
--with-bugurl=http://bugs.opensuse.org/ --with-pkgversion='SUSE Linux' 
--disable-libgcj --disable-libmudflap --with-slibdir=/lib 
--with-system-zlib --enable-__cxa_atexit 
--enable-libstdcxx-allocator=new --disable-libstdcxx-pch 
--enable-version-specific-runtime-libs --enable-linker-build-id 
--program-suffix=-4.7 --enable-linux-futex --without-system-libunwind 
--with-arch-32=i586 --with-tune=generic --build=i586-suse-linux
Thread model: posix
gcc version 4.7.1 20120723 [gcc-4_7-branch revision 189773] (SUSE Linux)

We may have to ask users to re-compile for the supporting if they are 
using 32bit hosts. But another problem is, even if we build 64b on 32b 
host, I don't think we can run the 64b binary "grub-mkimage" on the 32b 
host.

>
>>   In fact, all we need from grub-efi-native
>> is the grub-mkimage binary, so change the solution to:
>>   * grub-efi-native only install grub-mkimage
>
> Seems reasonable.
>
>>   * grub-efi compiles target modules, generates EFI image
>>     with grub-mkimage and deploy, but install nothing.
>
> Also makes sense.
>
> Have you tested the 4 possible combinations?
>
> host	target
> 32	32
> 64	32
> 32	64
> 64	64

Yes, I tested all these possiblities.

>
>
>
>>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>
> With verification of testing scope and the the minor comments below, I'm
> OK with this approach. It's better than the native hack, but I'm not
> sure it addresses an actual failure - but that's OK.
>
>> ---
>>   meta/classes/grub-efi.bbclass                      |  4 +-
>>   .../{grub-efi-native_2.00.bb => grub-efi_2.00.bb}  | 43 ++++++++++++----------
>>   2 files changed, 26 insertions(+), 21 deletions(-)
>>   rename meta/recipes-bsp/grub/{grub-efi-native_2.00.bb => grub-efi_2.00.bb} (77%)
>>
>> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
>> index 2f00901..71bd00f 100644
>> --- a/meta/classes/grub-efi.bbclass
>> +++ b/meta/classes/grub-efi.bbclass
>> @@ -15,8 +15,8 @@
>>   # ${GRUB_OPTS} - additional options to add to the config, ';' delimited # (optional)
>>   # ${GRUB_TIMEOUT} - timeout before executing the deault label (optional)
>>
>> -do_bootimg[depends] += "grub-efi-${TRANSLATED_TARGET_ARCH}-native:do_deploy"
>> -do_bootdirectdisk[depends] += "grub-efi-${TRANSLATED_TARGET_ARCH}-native:do_deploy"
>> +do_bootimg[depends] += "grub-efi:do_deploy"
>> +do_bootdirectdisk[depends] += "grub-efi:do_deploy"
>>
>>   GRUB_SERIAL ?= "console=ttyS0,115200"
>>   GRUBCFG = "${S}/grub.cfg"
>> diff --git a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> similarity index 77%
>> rename from meta/recipes-bsp/grub/grub-efi-native_2.00.bb
>> rename to meta/recipes-bsp/grub/grub-efi_2.00.bb
>> index 04973b5..2fe688c 100644
>> --- a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
>> +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> @@ -14,14 +14,10 @@ LICENSE = "GPLv3"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>
>>   # FIXME: We should be able to optionally drop freetype as a dependency
>> -DEPENDS = "autogen-native"
>> -RDEPENDS_${PN} = "diffutils freetype"
>> +DEPENDS = "autogen-native flex-native bison-native"
>> +DEPENDS_class-target = "grub-efi-native"
>
> So no target DEPENDS are created, correct?

You mean RDEPENDS, right? Yes, because the target package grub-efi 
installs nothing on the rootfs, it only deploy the efi image, I don't 
think it need any RDEPENDS.

>
>>   PR = "r2"
>>
>> -# Native packages do not normally rebuild when the target changes.
>> -# Ensure this is built once per HOST-TARGET pair.
>> -PN := "grub-efi-${TRANSLATED_TARGET_ARCH}-native"
>> -
>>   SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>>              file://cfg \
>>              file://grub-2.00-fpmath-sse-387-fix.patch \
>> @@ -39,12 +35,10 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
>>
>>   S = "${WORKDIR}/grub-${PV}"
>>
>> -# Determine the target arch for the grub modules before the native class
>> -# clobbers TARGET_ARCH.
>> -ORIG_TARGET_ARCH := "${TARGET_ARCH}"
>> +# Determine the target arch for the grub modules
>>   python __anonymous () {
>>       import re
>> -    target = d.getVar('ORIG_TARGET_ARCH', True)
>> +    target = d.getVar('TARGET_ARCH', True)
>>       if target == "x86_64":
>>           grubtarget = 'x86_64'
>>           grubimage = "bootx64.efi"
>> @@ -59,26 +53,37 @@ python __anonymous () {
>>
>>   inherit autotools
>>   inherit gettext
>> -inherit native
>>   inherit deploy
>>
>>   EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
>> -                --target=${GRUB_TARGET} --enable-efiemu=no --program-prefix='' \
>> +                --enable-efiemu=no --program-prefix='' \
>>                   --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
>>
>> -do_mkimage() {
>> +do_install_class-target() {
>> +	:
>> +}
>> +
>> +do_install_class-native() {
>> +	install -d ${D}${bindir}
>> +	install -m 755 grub-mkimage ${D}${bindir}
>> +}
>> +
>> +do_deploy() {
>>   	# Search for the grub.cfg on the local boot media by using the
>>   	# built in cfg file provided via this recipe
>> -	./grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
>> +	grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
>>   	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
>>   	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search
>> +	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
>>   }
>> -addtask mkimage after do_compile before do_install
>>
>> -do_deploy() {
>> -	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
>> +do_deploy_class-native() {
>> +	:
>>   }
>> +
>>   addtask deploy after do_install before do_build
>>
>> -do_install[noexec] = "1"
>> -do_populate_sysroot[noexec] = "1"
>> +FILES_${PN}-dbg += "${libdir}/${BPN}/${GRUB_TARGET}-efi/.debug"
>
> Technically this is an independent functional change...

You mean it should be in a separate commit?

Thanks,
Jackie

>
>> +
>> +BBCLASSEXTEND = "native"
>> +ALLOW_EMPTY_${PN} = "1"
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

