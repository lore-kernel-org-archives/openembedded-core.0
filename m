Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A62676020
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 20:07:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5JK6Cen026237
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Jun 2018 13:06:27 -0700
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 19 Jun 2018 13:06:01 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-12-alexander.kanavin@linux.intel.com>
	<32602a82-f07d-3c69-2305-3f0f17f4c9dc@windriver.com>
	<CAJTo0La2eicsFUCAPOktYs110iFdOrFWNzLXC+EeeRrDzBHtNQ@mail.gmail.com>
	<282aab6b-9e7c-1d85-8e1e-443d1156c1fa@gmail.com>
	<CAJTo0LY-xmzar7jRYeboJJ5krAULqPMdwpS7hxgbC8m52uTEew@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <4cfebd9d-73bb-613d-65e5-ca2abfe86eb7@windriver.com>
Date: Tue, 19 Jun 2018 16:06:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY-xmzar7jRYeboJJ5krAULqPMdwpS7hxgbC8m52uTEew@mail.gmail.com>
X-Originating-IP: [172.25.44.2]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/14] meson: update to 0.46.0 -- broke systemd on qemuppc
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
X-List-Received-Date: Tue, 19 Jun 2018 20:07:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 06/19/2018 03:49 PM, Burton, Ross wrote:
> On 19 June 2018 at 17:00, Khem Raj <raj.khem@gmail.com> wrote:
>>>> I recently started testing qemuppc by booting
>>>> core-image-minimal with systemd as init. It fails with:
>>>>
>>>>      /sbin/init: error while loading shared libraries:
>>>>         /lib/systemd/libsystemd-shared-237.so: R_PPC_REL24 relocation at
>>>> 0x0054574c for symbol `strlen' out of range
>>
>>
>> This would also indicate that libsystemd is probably missing -fPIC during
>> compile, can you check the compiler cmdline passed when building on of .o
>> files that gets includes in libsystemd.
> 
> [1/1423] powerpc-poky-linux-gcc -m32 -mhard-float -mcpu=7400 -mno-spe
> -fstack-protector-strong -D_FORTIFY_SOURCE=2 -no-pie -fno-PIE
> --sysroot=/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot
> -Isrc/libsystemd/src@libsystemd@@systemd@sta -Isrc/libsystemd
> -I../git/src/libsystemd -Isrc/basic -I../git/src/basic -Isrc/shared
> -I../git/src/shared -Isrc/systemd -I../git/src/systemd -Isrc/journal
> -I../git/src/journal -Isrc/resolve -I../git/src/resolve -Isrc/timesync
> -I../git/src/timesync -Isrc/login -I../git/src/login -Isrc/udev
> -I../git/src/udev -Isrc/libudev -I../git/src/libudev -Isrc/core
> -I../git/src/core -I../git/src/libsystemd/sd-bus
> -I../git/src/libsystemd/sd-device -I../git/src/libsystemd/sd-hwdb
> -I../git/src/libsystemd/sd-id128 -I../git/src/libsystemd/sd-netlink
> -I../git/src/libsystemd/sd-network -Isrc/libsystemd-network
> -I../git/src/libsystemd-network -I. -I../git/
> -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -std=gnu99
> -Wextra -Werror=undef -Wlogical-op -Wmissing-include-dirs
> -Wold-style-definition -Wpointer-arith -Winit-self
> -Wdeclaration-after-statement -Wfloat-equal
> -Wsuggest-attribute=noreturn -Werror=missing-prototypes
> -Werror=implicit-function-declaration -Werror=missing-declarations
> -Werror=return-type -Werror=incompatible-pointer-types
> -Werror=format=2 -Wstrict-prototypes -Wredundant-decls
> -Wmissing-noreturn -Wimplicit-fallthrough=5 -Wshadow -Wendif-labels
> -Wstrict-aliasing=2 -Wwrite-strings -Werror=overflow -Wdate-time
> -Wnested-externs -ffast-math -fno-common -fdiagnostics-show-option
> -fno-strict-aliasing -fvisibility=hidden -fstack-protector
> -fstack-protector-strong --param=ssp-buffer-size=4 -fPIE
> -Wno-unused-parameter -Wno-missing-field-initializers
> -Wno-unused-result -Wno-format-signedness -Wno-error=nonnull
> -Werror=shadow -ffunction-sections -fdata-sections -include config.h

> -fPIC
Hey Ross ^^^

> -pthread -fvisibility=default -m32 -mhard-float -mcpu=7400
> -mno-spe -fstack-protector-strong -D_FORTIFY_SOURCE=2 -no-pie -fno-PIE
> --sysroot=/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot
> -O2 -pipe -g -feliminate-unused-debug-types
> -fdebug-prefix-map=/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0=/usr/src/debug/systemd/1_237-r0
> -fdebug-prefix-map=/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot=
> -fdebug-prefix-map=/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot-native=
> -MD -MQ 'src/libsystemd/src@libsystemd@@systemd@sta/sd-utf8_sd-utf8.c.o'
> -MF 'src/libsystemd/src@libsystemd@@systemd@sta/sd-utf8_sd-utf8.c.o.d'
> -o 'src/libsystemd/src@libsystemd@@systemd@sta/sd-utf8_sd-utf8.c.o' -c
> ../git/src/libsystemd/sd-utf8/sd-utf8.c
> 
> You're right, no -fPIC.  

fPIC is there, look again!
I just send my reply as your email arrived.

> The no-PIE flags are coming from
> SECURITY_NOPIE_CFLAGS.  I'm guessing security_flags is interacting
> badly with ppc again?

Right and I could just add:
    SECURITY_CFLAGS_pn-systemd_powerpc = "${SECURITY_NO_PIE_CFLAGS}"
in meta/conf/distro/include/security_flags.inc but
I wanted to be sure that I understood why such a change is needed.
The meson update shouldn't break things...

../Randy

> 
> Ross
> 


-- 
# Randy MacLeod
# Wind River Linux

