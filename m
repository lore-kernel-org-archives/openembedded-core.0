Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Soy2S-00009B-O2
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 16:37:23 +0200
Received: by eekc50 with SMTP id c50so374794eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 07:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=dMeNGiTzN6xWbgt9FLxaHeuA/GVbpzMOjtn1WuTxOT4=;
	b=iBn3GENm5X1iHnYptQ6LOpQGDtloHc8R1wT84YGguDtaLjHS1sfuOSRzrNCPy4eo/5
	5XpbOL/GlV4bV3v9GofxUXdZ0gXZOIwv78J5hpPXxubQkh0Md/YlA/okkkAeuX1aJqBU
	ODkJGS2THl5LCbpAwRQeyM+45mraxRbPe9lbTGOPr4Ufsim2hq44AeNuQIE7LnsHJegL
	yTH/8505crc5fqxamRmZ8dCfCyx2cwSKTTqIbaSH3eo0DKInxR3ynYg9HEhf55nY0X/p
	LhKep+W8MdN8kpIm/jo6olV+7PRORURX9fmDlTczV3MsylsGaUkz1Dx2t5j2p0iSbVqe
	C2MA==
Received: by 10.14.185.137 with SMTP id u9mr12418676eem.220.1342016760780;
	Wed, 11 Jul 2012 07:26:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Wed, 11 Jul 2012 07:25:30 -0700 (PDT)
In-Reply-To: <1342002640.7934.5.camel@ted>
References: <1341940070-27715-1-git-send-email-raj.khem@gmail.com>
	<1341940070-27715-2-git-send-email-raj.khem@gmail.com>
	<1342002640.7934.5.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Jul 2012 07:25:30 -0700
Message-ID: <CAMKF1sqkxxrxKU-XO4HezbfsapTDXhz-TZNx_tNGq=rsNgB=wQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel.bbclass: Make tree available for cross building external modules
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jul 2012 14:37:24 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 11, 2012 at 3:30 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-07-10 at 10:07 -0700, Khem Raj wrote:
>> We shave too much from kernel sources for making it work
>> for on device external kernel module development that cross
>> development of external modules wont work from same tree
>> anymore. This patch makes a copy of tree which will eventually
>> be staged for building external modules
>
> It sounds from the further discussion that there is more to the patch
> than just this. Firstly, a change like this needs a more precise
> description.
>
> Secondly, we're copying around *way* to much data in this approach. I'd
> like to suggest an improvement but can't since the description above is
> lacking, I can't even understand what the problem is you're trying to
> fix.

alright. There are tools (especially in scripts/) which are made for
buildhost when compiling the kernel irrespective of cross
or native. The tools like fixdep, recordmcount etc. which are needed
to run when you build kernel itself as well as external
modules. Now we do 'make _mproper_scripts' which cleans all those
binaries. We do this because we want to ship kernel-dev
and packaging binaries for different host wont be allowed in a target
package. So we chose to delete them and then on device
regenerate them ( ideally I would have preferred to generate them
cross candian when making for target)

Deleting these tools also renders the cross building of modules
useless. Since I want to ship the sources as reference only
meaning people may not have write access to the kernel sources they
can not run make inside the kernel sources to regenerate
those binaries before they start building their external modules.

>
> So more discussion is needed.
>
> I have a suspicion that this fix only "happens" to work when SDKMACHINE
> == NATIVEMACHINE.
>

yes, for a full solution we have to generate two versions of
kernel-tools 1 for target and 1 for SDKMACHINE
however this at least brings back what we had.

> Cheers,
>
> Richard
>
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/classes/kernel.bbclass |   15 +++++++++++++--
>>  1 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 81c334b..b2b6fcd 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -80,6 +80,7 @@ KERNEL_ALT_IMAGETYPE ??= ""
>>  # Define where the kernel headers are installed on the target as well as where
>>  # they are staged.
>>  KERNEL_SRC_PATH = "/usr/src/kernel"
>> +UNPRUNED_KERNEL_SRC_PATH = "/usr/src/kernel-unpruned"
>>
>>  KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
>>
>> @@ -135,7 +136,9 @@ kernel_do_install() {
>>       # kernel source tree.
>>       #
>>       kerneldir=${D}${KERNEL_SRC_PATH}
>> +     unrprunedkerneldir=${D}${UNPRUNED_KERNEL_SRC_PATH}
>>       install -d $kerneldir
>> +     install -d $unrprunedkerneldir
>>
>>       #
>>       # Store the kernel version in sysroots for module-base.bbclass
>> @@ -176,7 +179,6 @@ kernel_do_install() {
>>       # and include files.
>>       #
>>       oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
>> -     make -C $kerneldir _mrproper_scripts
>>       find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
>>       find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
>>
>> @@ -186,6 +188,9 @@ kernel_do_install() {
>>       if [ ${ARCH} = "powerpc" ]; then
>>               cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
>>       fi
>> +     # make a copy of unpruned kernel tree
>> +     cp -fR $kerneldir/* $unrprunedkerneldir
>> +     make -C $kerneldir _mrproper_scripts
>>
>>       # Remove the following binaries which cause strip or arch QA errors
>>       # during do_package for cross-compiled platforms
>> @@ -197,8 +202,14 @@ kernel_do_install() {
>>       done
>>  }
>>
>> +PACKAGE_PREPROCESS_FUNCS += "kernel_package_preprocess"
>> +
>> +kernel_package_preprocess () {
>> +     rm -rf ${PKGD}/${UNPRUNED_KERNEL_SRC_PATH}
>> +}
>> +
>>  sysroot_stage_all_append() {
>> -     sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
>> +     sysroot_stage_dir ${D}${UNPRUNED_KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
>>  }
>>
>>  kernel_do_configure() {
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


