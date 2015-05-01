Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCC373DF0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 14:31:31 +0000 (UTC)
Received: by yhda23 with SMTP id a23so18199915yhd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 May 2015 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uLLjASMa3pUDTWgqdFmhHmoYclbExNftVaPwlQN1vxI=;
	b=eIlLIRfQZrSkyOzmiRd3IF3tdsA7Vd2pl8ny/QRT9uM0yQIdAhPT8zvdDpktTJFkkJ
	vdWOPhRtYBjmHTqlMM6vdu+hQ1ZVWD0KtBD7tLvI63VWwtYZn+3vkNJiQEeBlC2faSKG
	vX+jZZQSHtxLMTVE4rjIidx2E61Hbm+OMuszNMOa79AW8PyUWUOqvtiOREj5F5QZ1IBs
	uU2j0irNhPxSJL/lyr3+FKsMnFumgLKEgegg1FMnZ6TK//2kJHI1s37yH4xqEpUf8Gos
	3/OVnG9zJzCpHClps3db4AbS/trQ1z2fW6e41HoPop//dkkpdJboiRdtvcypAf3IaJpe
	HQdQ==
MIME-Version: 1.0
X-Received: by 10.170.55.142 with SMTP id 136mr3644518ykx.50.1430490692430;
	Fri, 01 May 2015 07:31:32 -0700 (PDT)
Received: by 10.129.109.20 with HTTP; Fri, 1 May 2015 07:31:32 -0700 (PDT)
In-Reply-To: <1430490525.18360.14.camel@linuxfoundation.org>
References: <1429030567-20338-1-git-send-email-ed.bartosh@linux.intel.com>
	<1430490525.18360.14.camel@linuxfoundation.org>
Date: Fri, 1 May 2015 10:31:32 -0400
Message-ID: <CADkTA4PHUx2hHnRTaP4o=WVTh0B71CndL7m06r13VfgVAE+oXA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Fix race condition
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
X-List-Received-Date: Fri, 01 May 2015 14:31:36 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 1, 2015 at 10:28 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2015-04-14 at 19:56 +0300, Ed Bartosh wrote:
>> Race condition between do_compile_kernelmodules and do_shared_workdir
>> tasks occurs when do_compilemodules changes files in include/generated/*
>> while do_shared_workdir tries to copy them to shared working directory.
>>
>> Functionality of do_shared_workdir has been moved to separate function
>> mk_shared_workdir and called from do_kernel_compile. do_shared_workdir
>> left in the code as it may be used in many recipes.
>
> Its called from do_kernel_install according to the patch?
>
> This leaves a race since some code depends on the do_shared_work task
> and shared_work is added after compile before install.

And the autobuilder picked up the failure as well. I have a variant
staged here, and
will shake it out now that my other kernel series is out.

Bruce

>
> Cheers,
>
> Richard
>
>> [YOCTO #7321]
>>
>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>  meta/classes/kernel.bbclass | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 125ed88..aad430a 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -231,6 +231,8 @@ kernel_do_install() {
>>       [ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
>>       install -d ${D}${sysconfdir}/modules-load.d
>>       install -d ${D}${sysconfdir}/modprobe.d
>> +
>> +     mk_shared_workdir
>>  }
>>  do_install[prefuncs] += "package_get_auto_pr"
>>
>> @@ -245,7 +247,7 @@ emit_depmod_pkgdata() {
>>
>>  PACKAGEFUNCS += "emit_depmod_pkgdata"
>>
>> -do_shared_workdir () {
>> +mk_shared_workdir () {
>>       cd ${B}
>>
>>       kerneldir=${STAGING_KERNEL_BUILDDIR}
>> @@ -289,6 +291,14 @@ do_shared_workdir () {
>>       fi
>>  }
>>
>> +# NOTE!!! Functionality of do_shared_workdir has been moved to mk_shared_workdir
>> +# and called from kernel_do_compile.
>> +# It caused race condition with do_compile_kernelmodules when it runs
>> +# in parallel with do_compile_kernelmodules
>> +do_shared_workdir () {
>> +     :
>> +}
>> +
>>  # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
>>  sysroot_stage_all () {
>>       :
>> --
>> 2.1.4
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

