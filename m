Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T9tEY-0003mg-JP
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 09:44:10 +0200
Received: by eekb57 with SMTP id b57so948576eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2012 00:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MPJgM3gPNBLGe7oNct/tC4dcC0nbzlPenHr9Ts2CZFQ=;
	b=t0Bp/SZsvVBRHdQxiKb0cHK9Ac613hX+4ZHsRC2Fv/jAVcDEPISCGfoqUWkZOWHkGI
	7fnPf+kPHRVvW9Gz/I2fxIePXiBuERoPN5H6kCBB2vpUmC3MIEFsgZS16lN7rkO7LExg
	x1TWSC06tVfNNweF+NcINLB7jnSeBEaPyEE76HDKktZiZyHYS0xQDMRxoun7Y6XqlHUT
	z8b6Q4ES2SdFk7IqVVTTZH+JVQokKC9JBXPRuHeEfj2HCWEo+oNIZPh8B6UwIUjCJ8KU
	IJUanPoX1Eu+groKho9Pyor52sPPDT/RrathSXpeyAdeCV4VUUfdu4lfkSF9xRFgwqDW
	H+eg==
Received: by 10.14.204.72 with SMTP id g48mr6414057eeo.45.1347003104992; Fri,
	07 Sep 2012 00:31:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 7 Sep 2012 00:31:14 -0700 (PDT)
In-Reply-To: <CADkTA4OZbVVXexU=dUF5wv+AS2gBQNPpfKzfgda2k2V0Of6t0g@mail.gmail.com>
References: <1345658390-19692-1-git-send-email-raj.khem@gmail.com>
	<1345658390-19692-3-git-send-email-raj.khem@gmail.com>
	<CADkTA4OZbVVXexU=dUF5wv+AS2gBQNPpfKzfgda2k2V0Of6t0g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Sep 2012 00:31:14 -0700
Message-ID: <CAMKF1sq01YfGMmtz-rnnjFnaMu-705U_S=Q=3jt86HDcNWTEhQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
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
X-List-Received-Date: Fri, 07 Sep 2012 07:44:10 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 22, 2012 at 11:19 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Wed, Aug 22, 2012 at 1:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> kernel compiler is not special and we currently have it so
>> we want to pass -march and -mtune options as CFLAGS to kernel
>> build so that compiler picks the right subarch flags when
>> compiling assembly files in particular. Otherwise defaults
>> are chosen which may not be right in many case e.g. when
>> compiling kernel for collie machine we should use arch=armv4
>> but it uses toolchain/as defaults which is armv5te
>>
>> in some case e.g. thumb1 we know that kernel can not be compiled
>> in thumb1 mode so we can provide that information e.g. -marm
>> option through KERNEL_HOST_CC_ARCH variable as we do now
>
> Having just fought with this a few months ago myself, I know that I ended up
> needing to override KERNEL_CC completely, vs using any of the existing
> variables and options. So I don't see a problem with streamlining the variables.
>
> Some random questions below:
>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/classes/kernel.bbclass      |    9 +++------
>>  meta/classes/module-base.bbclass |    9 +++------
>>  2 files changed, 6 insertions(+), 12 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index f34e632..766f345 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -1,7 +1,7 @@
>>  inherit linux-kernel-base module_strip
>>
>>  PROVIDES += "virtual/kernel"
>> -DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
>> +DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native update-modules"
>>
>>  # we include gcc above, we dont need virtual/libc
>>  INHIBIT_DEFAULT_DEPS = "1"
>> @@ -37,9 +37,6 @@ KERNEL_PRIORITY ?= "${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.
>>
>>  KERNEL_RELEASE ?= "${KERNEL_VERSION}"
>>
>> -KERNEL_CCSUFFIX ?= ""
>> -KERNEL_LDSUFFIX ?= ""
>> -
>>  # Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
>>  # specific options necessary for building the kernel and modules.
>>  #FIXME: should be this: TARGET_CC_KERNEL_ARCH ?= "${TARGET_CC_ARCH}"
>> @@ -48,8 +45,8 @@ HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
>>  TARGET_LD_KERNEL_ARCH ?= ""
>>  HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
>>
>> -KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
>> -KERNEL_LD = "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
>> +KERNEL_CC = "${CC} ${HOST_CC_KERNEL_ARCH}"
>> +KERNEL_LD = "${LD} ${HOST_LD_KERNEL_ARCH}"
>
> I haven't looked at CC recently, I assume it can contain ccache within
> it's variable
> definition if a person is inclined to use ccache ?

yes
meta/conf/bitbake.conf:export CC = "${CCACHE}${HOST_PREFIX}gcc
${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"

>
>>
>>  # Where built kernel lies in the kernel tree
>>  KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
>> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
>> index 9379bf8..72a0bff 100644
>> --- a/meta/classes/module-base.bbclass
>> +++ b/meta/classes/module-base.bbclass
>> @@ -7,9 +7,6 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
>>
>>  export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
>>  KERNEL_OBJECT_SUFFIX = ".ko"
>> -KERNEL_CCSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ccsuffix')}"
>> -KERNEL_LDSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ldsuffix')}"
>> -KERNEL_ARSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-arsuffix')}"
>>
>>  # Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
>>  # specific options necessary for building the kernel and modules.
>> @@ -20,9 +17,9 @@ HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
>>  TARGET_AR_KERNEL_ARCH ?= ""
>>  HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
>>
>> -KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_KERNEL_ARCH}"
>> -KERNEL_LD = "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}"
>> -KERNEL_AR = "${HOST_PREFIX}ar${KERNEL_ARSUFFIX} ${HOST_AR_KERNEL_ARCH}"
>> +KERNEL_CC = "${CC} ${HOST_CC_KERNEL_ARCH}"
>> +KERNEL_LD = "${LD} ${HOST_LD_KERNEL_ARCH}"
>> +KERNEL_AR = "${AR} ${HOST_AR_KERNEL_ARCH}"
>
> When I was working through my build issues, I wondered if the
> module-base and kernel.bbclass
> compile definitions could be unified to a single location (say
> kernel-arch.bbclass). I know
> that I found an issue with it, and didn't complete my work, but can
> you see a way that
> we could have a single definition vs the two ? These look to be
> exactly the same now :)
>

yes but I feel kernel-arch.bbclass has a different abstraction
and its used by few recipes like linux-libc-headers directly
adding these variables there will not affect these recipes but
kernel-arch will become loaded with unrelated stuff I think.

but then I dont have strong like/dislike may be rename kernel-arch.bbclass
to something like kernel-common.bbclass or some such

> Cheers,
>
> Bruce
>
>>
>>  # kernel modules are generally machine specific
>>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"


