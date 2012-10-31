Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1TTSXR-0006N5-PI
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Oct 2012 08:16:33 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so420523bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2012 00:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=NF9VV/7MX73yhpKIgqkC7746CSoEc/oBzktM9u5RYY8=;
	b=SK77wz+MG3g0Tirjfunv72wl+/XLfrPmmr2jLF4JRLeoIxWEB3D1TBrqFAhC41CE2x
	97A1tx8JO7r1yzm7p++FI30XomN9CeS/P/tyCNtjkGEGflj5mAdfmq7y5nmYOxSK5o57
	dCc5Bw0opmgfZjW1D83ASTmPksWZam/RFOWx6B5+BCNlzQK45lL0ANRFYb9+LeKKo061
	ptUJ6JpZSAj16p6wbhli484NKjbmw7Ox0tjy/CNYxQZsGEOTuz7O9cGpmjdsnKPizh0H
	NCM4WRfvpJrTEjlAxWrRXrxR/kXlaN+YN5Mm4ZnbAjk8Z87ftSUOd4rFYpc/OY1po89y
	zS2g==
Received: by 10.204.149.10 with SMTP id r10mr10733286bkv.61.1351666976993;
	Wed, 31 Oct 2012 00:02:56 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPS id x13sm2327273bkv.16.2012.10.31.00.02.55
	(version=SSLv3 cipher=OTHER); Wed, 31 Oct 2012 00:02:56 -0700 (PDT)
Message-ID: <5090CD1E.9070203@dresearch-fe.de>
Date: Wed, 31 Oct 2012 08:02:54 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121025 Thunderbird/16.0.2
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>
References: <1343319703-15704-1-git-send-email-msm@freescale.com>
	<1343554172.16998.32.camel@ted> <508E4BAF.9080901@dresearch-fe.de>
	<CAEsOVNdBpH__03pF_M4eHbb+Etanx0AfAh3U-5vHAXoGcueKzQ@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A72C925@039-SN1MPN1-003.039d.mgd.msft.net>
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A72C925@039-SN1MPN1-003.039d.mgd.msft.net>
X-Enigmail-Version: 1.4.5
X-Gm-Message-State: ALoCoQnKIP31qahCdyIO6HxYh5xcqFdT+Jwro4ozmuNpbliGalvEROBcVAsXJ29UP94/Z6lnL6YV
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: update linker arguments to pass --sysroot arg (BUILD BREAKAGE)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Oct 2012 07:16:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 29.10.2012 19:08, McClintock Matthew-B29882 wrote:
> On Mon, Oct 29, 2012 at 9:36 AM, Matthew McClintock <msm@freescale.com> wrote:
>> On Mon, Oct 29, 2012 at 4:26 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>>> On 29.07.2012 11:29, Richard Purdie wrote:
>>>> On Thu, 2012-07-26 at 11:21 -0500, Matthew McClintock wrote:
>>>>> If we are building from sstate-cache it's possible to be building
>>>>> from another folder on another machine, therefore the linker requires
>>>>> that a proper --sysroot is passed too it so it can find things like
>>>>> libgcc.a and avoid errors such as:
>>>>>
>>>>> | arm-poky-linux-gnueabi-gcc  -g  -O2  -fno-common -ffixed-r8 -msoft-float   -D__KERNEL__ -DCONFIG_SYS_TEXT_BASE=0x80008000 -I/local/yocto/upstream/label/ubuntu1204-64b/machine/beagleboard/poky/edison/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git5+b1af6f532e0d348b153d5c148369229d24af361a-r0/git/include -fno-builtin -ffreestanding -nostdinc -isystem /local/yocto/upstream/label/ubuntu1204-64b/machine/beagleboard/poky/edison/tmp/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.3/include -pipe  -DCONFIG_ARM -D__ARM__ -marm  -mabi=aapcs-linux -mno-thumb-interwork -march=armv5 -Wall -Wstrict-prototypes -fno-stack-protector -fno-toplevel-reorder   -o hello_world.o hello_world.c -c
>>>>> | arm-poky-linux-gnueabi-gcc  -g  -O2  -fno-common -ffixed-r8 -msoft-float   -D__KERNEL__ -DCONFIG_SYS_TEXT_BASE=0x80008000 -I/local/yocto/upstream/label/ubuntu1204-64b/machine/beagleboard/poky/edison/tmp/work/beagleboard-poky-linux-gnueabi/u-boot-v2011.06+git5+b1af6f532e0d348b153d5c148369229d24af361a-r0/git/include -fno-builtin -ffreestanding -nostdinc -isystem /local/yocto/upstream/label/ubuntu1204-64b/machine/beagleboard/poky/edison/tmp/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.6.3/include -pipe  -DCONFIG_ARM -D__ARM__ -marm  -mabi=aapcs-linux -mno-thumb-interwork -march=armv5 -Wall -Wstrict-prototypes -fno-stack-protector -fno-toplevel-reorder   -o stubs.o stubs.c -c
>>>>> | arm-poky-linux-gnueabi-ld  -r -o libstubs.o  stubs.o
>>>>> | arm-poky-linux-gnueabi-ld -g -Ttext 0x80300000 \
>>>>> |                    -o hello_world -e hello_world hello_world.o libstubs.o \
>>>>> |                    -L. -lgcc
>>>>> | arm-poky-linux-gnueabi-ld: cannot find -lgcc
>>>>> | make[1]: *** [hello_world] Error 1
>>>>>
>>>>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>>>>> ---
>>>>>  meta/recipes-bsp/u-boot/u-boot.inc           |    2 +-
>>>>>  meta/recipes-bsp/u-boot/u-boot_2011.03.bb    |    2 +-
>>>>>  meta/recipes-bsp/u-boot/u-boot_2011.06.bb    |    2 +-
>>>>>  meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |    1 +
>>>>>  4 files changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>>
>>>> Merged to master, thanks.
>>>
>>> While trying to migrate the u-boot support for our machine from oe-classic i hit a problem with this patch. :(
>>>
>>> The
>>>
>>>   EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
>>>
>>> in u-boot.inc leads to compiling problems with some build support tools. The tools (e.g. bmp_logo) are now compiled with the target compiler (arm-oe-linux-gnueabi-gcc in our case) instead of the host compiler. This results in build errors like
>>>
>>> | ./bmp_logo logos/denx.bmp >/pm/sledz/oe-core/build/tmp-eglibc/work/hipox-oe-linux-gnueabi/u-boot-v2009.03+git91+e60beb13cf0135dc71c541021487b5ccc4d269cb-r8/git/include/bmp_logo.h
>>> | /bin/sh: ./bmp_logo: cannot execute binary file
>>>
>>> Reverting to
>>>
>>>   EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX}'
>>>
>>> seems to fix this problem.
>>
>> That however will break building from sstate... we might need to patch
>> u-boot's Makefiles here...
> 
> Looking closer you are using a really old u-boot. Can you update? The
> Makefile for bmp_logo uses HOSTCC so this should not be an issue with
> a recent u-boot.

You're right. We use a rather old version. Unfortunatly we are bound to it for the moment. :(

Until we can switch to a newer version i'll use a machine specific override for EXTRA_OEMAKE. I think this will be reasonable solution for this case.

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


