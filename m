Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id B387765CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 14:07:06 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u7TE76G5025797; Mon, 29 Aug 2016 09:07:06 -0500
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016082909070626-268016 ;
	Mon, 29 Aug 2016 09:07:06 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4PF0Qws1rcdfZ=UU12quLjPZnfXPjqf8vq23Ytemd6enQ@mail.gmail.com>
References: <20160829091958.1125-1-adrian.ratiu@ni.com>
	<CADkTA4PF0Qws1rcdfZ=UU12quLjPZnfXPjqf8vq23Ytemd6enQ@mail.gmail.com>
User-Agent: Notmuch/0.22.1 (https://notmuchmail.org) Emacs/25.1.50.1
	(x86_64-unknown-linux-gnu)
Date: Mon, 29 Aug 2016 17:05:44 +0300
Message-ID: <87fupnvfev.fsf@ni.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/29/2016 09:07:06 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/29/2016 09:07:06 AM,
	Serialize complete at 08/29/2016 09:07:06 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-08-29_07:, , signatures=0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: do_kernel_configme: Fix silent sysroot poisoning error
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
X-List-Received-Date: Mon, 29 Aug 2016 14:07:09 -0000
Content-Type: text/plain

On Mon, 29 Aug 2016, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> On Mon, Aug 29, 2016 at 5:19 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> wrote:
>
>> do_kernel_configme calls merge_config.sh (installed in the sysroot by
>> the kern-tools-native recipe) which calls make to fill in any missing
>> symbols from the resulting merged config.
>
>
> That's not what it does ... but that isn't important.
>
>
>>
>> This errors out on my system because of sysroot poisoning [1]. Here is
>> a partial output from my .kernel-meta/cfg/merge_config_build.log (this
>> file is created in do_kernel_configme() while callig merge_config.sh):
>>
>> make[1]: Entering directory '/media/adi/ssd/nilrt-master/
>> build/tmp-glibc/work/x64-nilrt-linux/linux-nilrt/4.1+
>> gitAUTOINC+a7e53ecc27-r0/linux-x64-standard-build'
>>   HOSTCC  scripts/basic/fixdep
>> /media/adi/ssd/nilrt-master/build/tmp-glibc/work-shared/
>> x64/kernel-source/scripts/basic/fixdep.c:106:23: fatal error:
>> sys/types.h: No such file or directory
>> compilation terminated.
>> make[2]: *** [/media/adi/ssd/nilrt-master/build/tmp-glibc/work-shared/
>> x64/kernel-source/scripts/basic/Makefile:22: scripts/basic/x86_64-nilrt-linux-fixdep]
>> Error 1
>>
>
> This just means that we are missing a dependency. Everything that
> merge_config
> needs should be already in place before it runs, i.e. do_kernel_metadata
> should
> have already run and built any host tools that it needs.
>
> How are you managing to trigger this error ? I've done plenty of builds,
> and haven't
> seen this one before.

Maybe some context is in order for how I build the kernel. I'm using a
custom kernel recipe which inherits from linux-yocto.inc. My kernel
tree contains a defconfig which is passed to OE in my kernel recipe
using KBUILD_DEFCONFIG and KCONFIG_MODE="--alldefconfig".

I have no configuration fragments.

As expected I need the merge_configs script to automatically fill in any
missing CONFIG symbols before building the kernel and this is where it
fails because the sysroot is poisoned since 2014.

>
> Bruce
>
>
>>
>> This issue is hard to debug because merge_config.sh does NOT check the
>> error output of its make call (this is added in the second patch) and
>> even though make errors out, the build continues as if nothing happened
>> and compiles a kernel with garbage configs (the .config generated by
>> do_kernel_configme is empty and gets filled later) which doesn't boot.
>>
>> Adding $TOOLCHAIN_OPTIONS to $CFLAGS before calling merge_configs.sh
>> fixes the error because $TOOLCHAIN_OPTIONS defines the sysroot and make
>> uses it to correctly compile & fill all missing kernel config options.
>>
>> [1] http://lists.openembedded.org/pipermail/openembedded-core/
>> 2014-October/098253.html
>>
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> ---
>>  meta/classes/kernel-yocto.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel-yocto.bbclass
>> b/meta/classes/kernel-yocto.bbclass
>> index 8650e55..4397a9d 100644
>> --- a/meta/classes/kernel-yocto.bbclass
>> +++ b/meta/classes/kernel-yocto.bbclass
>> @@ -249,7 +249,7 @@ do_kernel_configme() {
>>                 bbfatal_log "Could not find configuration queue
>> (${meta_dir}/config.queue)"
>>         fi
>>
>> -       ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} >
>> ${meta_dir}/cfg/merge_config_build.log 2>&1
>> +       CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" ARCH=${ARCH}
>> merge_config.sh -O ${B} ${config_flags} ${configs} >
>> ${meta_dir}/cfg/merge_config_build.log 2>&1
>>         if [ $? -ne 0 ]; then
>>                 bbfatal_log "Could not configure
>> ${KMACHINE}-${LINUX_KERNEL_TYPE}"
>>         fi
>> --
>> 2.9.3
>>
>>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"

