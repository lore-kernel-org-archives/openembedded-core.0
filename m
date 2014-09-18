Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7032C71480
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 09:27:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8I9RjsJ009145
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Sep 2014 02:27:45 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 18 Sep 2014 02:27:44 -0700
Message-ID: <541AA58F.8070002@windriver.com>
Date: Thu, 18 Sep 2014 17:27:43 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1410879378.git.kai.kang@windriver.com>	<64a67dbfe6aba5a52b7740fa15b6baa6f117defa.1410879378.git.kai.kang@windriver.com>
	<541A822D.2030702@gmail.com>
In-Reply-To: <541A822D.2030702@gmail.com>
X-Originating-IP: [128.224.162.231]
Subject: Re: [PATCH 1/9] linux-yocto: depend on libgcc for aarch64
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
X-List-Received-Date: Thu, 18 Sep 2014 09:27:50 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年09月18日 14:56, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
>
>
> On 9/16/14 8:06 AM, Kai Kang wrote:
>> Make aarch aarch64 kernel depend on libgcc. In arch/arm64/Makefile, it
>> adds LIBGCC to libs-y:
>>
>> LIBGCC          := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
>> libs-y          += $(LIBGCC)
>>
>> If build without libgcc, the value of LIBGCC is just libgcc.a without
>> parent directory. linux-yocto fails to build:
>>
>> |   LD      vmlinux.o
>> | aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or directory
>>
>> Add libgcc to aarch64 kernel dependency.
> really ? usually kernel has its own routines to substitute libgcc needs.
> why is it different here.

It calls script link-vmlinux.sh to link vmlinux.o. It runs function 
vmlinux_link() in the script:

if [ "${SRCARCH}" != "um" ]; then
${LD} ${LDFLAGS} ${LDFLAGS_vmlinux} -o ${2} \
-T ${lds} ${KBUILD_VMLINUX_INIT} \
--start-group ${KBUILD_VMLINUX_MAIN} --end-group ${1}

var KBUILD_VMLINUX_MAIN is defined in top Makefile:

export KBUILD_VMLINUX_MAIN := $(core-y) $(libs-y) $(drivers-y) $(net-y)


And arch aarch64 adds LIBGCC to var libs-y:

LIBGCC          := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
libs-y          += $(LIBGCC)


If doesn't do libgcc:popualte_sysroot, LIBGCC just get value 'libgcc.a' 
rather than 'absolute path' to libgcc.a.

In script link-vmlinux.sh, it expands to:

+ modpost_link vmlinux.o
+ aarch64-poky-linux-ld.bfd -r -o vmlinux.o arch/arm64/kernel/head.o 
init/built-in.o --start-group usr/built-in.o 
arch/arm64/kernel/built-in.o arch/arm64/mm/built-in.o kernel/built-in.o 
mm/built-in.o fs/built-in.o ipc/built-in.o security/built-in.o 
crypto/built-in.o block/built-in.o arch/arm64/lib/lib.a lib/lib.a 
*libgcc.a* arch/arm64/lib/built-in.o lib/built-in.o *libgcc.a* 
drivers/built-in.o sound/built-in.o firmware/built-in.o net/built-in.o 
--end-group

Because no libgcc.a in current directory, error shows twice:

aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or directory
aarch64-poky-linux-ld.bfd: cannot find libgcc.a: No such file or directory

So I add libgcc as dependency of aarch64 kernel.


And one thing more, in kernel source directory arch, only few arches 
depends on LIBGCC:

$ grep -rw LIBGCC arch/
./openrisc/Makefile:LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) 
-print-libgcc-file-name)
./openrisc/Makefile:libs-y += $(LIBGCC)
./parisc/Makefile:LIBGCC = $(shell $(CC) $(KBUILD_CFLAGS) 
-print-libgcc-file-name)
./parisc/Makefile:libs-y += arch/parisc/lib/ $(LIBGCC)
./hexagon/Makefile:LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) 
-print-libgcc-file-name)
./hexagon/Makefile:libs-y += $(LIBGCC)
./arc/Makefile:LIBGCC := $(shell $(CC) $(ARC_LIBGCC) $(cflags-y) 
--print-libgcc-file-name)
./arc/Makefile:libs-y += arch/arc/lib/ $(LIBGCC)
./m32r/Makefile:LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) 
-print-libgcc-file-name)
./m32r/Makefile:libs-y += arch/m32r/lib/ $(LIBGCC)
./xtensa/Makefile:LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) 
-print-libgcc-file-name)
./xtensa/Makefile:libs-y += arch/xtensa/lib/ $(LIBGCC)
./xtensa/boot/boot-redboot/Makefile:LIBGCC := $(shell $(CC) 
$(KBUILD_CFLAGS) -print-libgcc-file-name)
./xtensa/boot/boot-redboot/Makefile: $(Q)$(LD) $(LD_ARGS) -o $@ $^ 
-L/xtensa-elf/lib $(LIBGCC)
./cris/Makefile:LIBGCC = $(shell $(CC) $(KBUILD_CFLAGS) 
-print-file-name=libgcc.a)
./cris/Makefile:libs-y += arch/cris/$(SARCH)/lib/ $(LIBGCC)
./arm64/Makefile:LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) 
-print-libgcc-file-name)
./arm64/Makefile:libs-y += $(LIBGCC)


By coincidence, there is no arch Yocto support before.

Regards,
Kai


>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
>> index 4ed3188..db693e6 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>>   INC_PR = "r4"
>>   
>>   DEPENDS += "xz-native bc-native"
>> +DEPENDS_aarch64 += "libgcc"
>>   
> this should be using append instead of +=

OK.

Thanks,
--Kai

>
>>   # A KMACHINE is the mapping of a yocto $MACHINE to what is built
>>   # by the kernel. This is typically the branch that should be built,
>>
> - -- 
> - -Khem
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG/MacGPG2 v2.0.22 (Darwin)
> Comment: GPGTools - https://gpgtools.org
>
> iEYEARECAAYFAlQagi0ACgkQuwUzVZGdMxQfGwCaAuY+dIXbAnQ9tTOIA4MFSwhe
> wEwAn1FxFeun292octWdy0sYJqtGRPOb
> =5Tcg
> -----END PGP SIGNATURE-----


-- 
Regards,
Neil | Kai Kang


