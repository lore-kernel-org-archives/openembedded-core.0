Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vc0-f178.google.com (mail-vc0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id D074365E1A
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 21:14:45 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id la4so3591710vcb.23
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 14:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ypjXdiSfH07T2yNHelqcOKLFGj5jzRId+nBRb9aVHsg=;
	b=e4959JDfKCT6Oq4tOzc1bIRZEcDmZmPyv/xP1c6+UZQ0vfIx/0hSQrpDk+zDf+3Mb+
	bIIrqNtT/o58eu87Mr/iSwtB27LQMVTay69JqZIzwQ+rbBVwbtYUJTnMUUnUUI6WGkDw
	uZsT4DncmQFRI+Msv/ynJ/KYfeq4NoOFNJwtu+cU3eDSHctmcNVHpEggCI/iUx7Z9t+y
	cLVhetm+B/A0em6/jGNkJpulJqXYTPEMjqWfzzYii0lRmdSYm/rnA4ukTuDqDimnMGFm
	xm/SfkisVQBoL4C7csbKDaqp+0mbak8HnKQ/zxhGHYZtJ3Mad6orNzRqWjEg04eTIBPq
	RW2g==
MIME-Version: 1.0
X-Received: by 10.52.190.130 with SMTP id gq2mr31819392vdc.16.1412111686891;
	Tue, 30 Sep 2014 14:14:46 -0700 (PDT)
Received: by 10.52.75.135 with HTTP; Tue, 30 Sep 2014 14:14:46 -0700 (PDT)
In-Reply-To: <542B19F8.4030805@windriver.com>
References: <cover.1412108536.git.nitin.a.kamble@intel.com>
	<09a0bf7dab7a1152fe19faa74436eb4856ce631a.1412108536.git.nitin.a.kamble@intel.com>
	<542B19F8.4030805@windriver.com>
Date: Tue, 30 Sep 2014 17:14:46 -0400
Message-ID: <CADkTA4MVZ-kyujkKFj3ug1s7GRtKmDNgUqdjON0dDhD74ACCgw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Saul Wold <saul.wold@intel.com>, Ross Burton <ross.burton@intel.com>,
	Darren Hart <dvhart@linux.intel.com>, 
	Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel.bbclass: enable a link for external module building
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
X-List-Received-Date: Tue, 30 Sep 2014 21:14:53 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 30, 2014 at 5:00 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 2014-09-30, 4:57 PM, nitin.a.kamble@intel.com wrote:
>>
>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>>
>> To build external modules, the link /lib/modules/<kernel-version>/build
>> must exist, and point to the proper kernel source area.
>>
>> The kernel-dev package already provides the needed source files. Now
>> putting a link in place to unblock the external module building.
>
>
> This description is not entirely accurate, at least from my point of
> view.
>
> You can build external modules on the target without this link .. it is
> that many scripts and utilities look in this location for the kernel
> source.
>
> We are fixing that case, not the general case of building an external
> module.

I forgot to say, that outside of my nit picking on the commit message, I don't
see any significant issues with the patch.

Cheers,

Bruce

>
> Cheers,
>
> Bruce
>
>
>>
>> Fixes Bug:
>> [YOCTO #2968]
>>
>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>> ---
>>   meta/classes/kernel.bbclass | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 78b33ce..5ac4ff4 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -213,6 +213,7 @@ kernel_do_install() {
>>         #
>>         kerneldir=${D}${KERNEL_SRC_PATH}
>>         install -d $kerneldir
>> +       ln -sf ${KERNEL_SRC_PATH}
>> "${D}/lib/modules/${KERNEL_VERSION}/build"
>>
>>         #
>>         # Store the kernel version in sysroots for module-base.bbclass
>> @@ -346,7 +347,7 @@ PACKAGES = "kernel kernel-base kernel-vmlinux
>> kernel-image kernel-dev kernel-mod
>>   FILES_${PN} = ""
>>   FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order
>> /lib/modules/${KERNEL_VERSION}/modules.builtin"
>>   FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
>> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*
>> ${KERNEL_SRC_PATH}"
>> +FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*
>> ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
>>   FILES_kernel-vmlinux = "/boot/vmlinux*"
>>   FILES_kernel-modules = ""
>>   RDEPENDS_kernel = "kernel-base"
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

