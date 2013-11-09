Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD0D6D12D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 20:43:07 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id el20so2887208lab.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Nov 2013 12:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SIQzWfrVQP30mTe2HTZm19xK0pkp2BvV+3svXkMtRFc=;
	b=N4o4+0Wjx/t0L1s3pX3IrKd1UZlf/R9RH8WA3+py2mfHYrofJ8BaHh7NcGQGQT2dsf
	YQF+DxQHbtRvLRO9OhQLnFxMm5Z39Sc0Mi6IrCbMpudCAncrWbuVJWVpfxtj45tVdnaM
	PcYqm42tB7Qa338jz54MJo+aSdBxb/BLf52J96Syr63dL8rvEqQhhEg1rGg+c5NGGD39
	6oQwNRnooZrmQ94sHHSyi2N1pCAKnp6uxtn9og09lGdBxzQ1riu3KdGIYZMOELAIiMbt
	T0aXZEAz8CI0Fvpr520HOqiWOn4mjz+E53BnK8tSSkVfbMIGZLGquzOayAOlTFFRuxKo
	X37g==
MIME-Version: 1.0
X-Received: by 10.112.136.65 with SMTP id py1mr15785463lbb.4.1384029788896;
	Sat, 09 Nov 2013 12:43:08 -0800 (PST)
Received: by 10.112.52.74 with HTTP; Sat, 9 Nov 2013 12:43:08 -0800 (PST)
In-Reply-To: <527D067C.6040709@windriver.com>
References: <1383923945.2345.5.camel@ted>
	<527D067C.6040709@windriver.com>
Date: Sat, 9 Nov 2013 21:43:08 +0100
Message-ID: <CAAQYJAsV5rBzNpPneh5TAh5t1RoV_EeDrKGFp2qP3q=o7XsqdA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/path: Fix performance issue got copyhardlinktree()
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
X-List-Received-Date: Sat, 09 Nov 2013 20:43:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 8, 2013 at 4:42 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 13-11-08 10:19 AM, Richard Purdie wrote:
>>
>> With the directory copy was added to avoid race issues, it wasn't noticed
>> that
>> tar was recursing the directories and copying files too. This is
>> completely
>> crazy when we hardlink those files in the next command.
>>
>> Resolve the issue by telling tar not to recurse. This gives a significant
>> performance boost to various parts of the system (do_package for
>> linux-yocto
>> 256s -> 178s for example).
>
>
> Every second makes a difference in this beast .. when adding up a
> zillion package runs a week. :)
>
> Cheers,
>
> Bruce
>
>
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
>> index 1310e38..d0588ba 100644
>> --- a/meta/lib/oe/path.py
>> +++ b/meta/lib/oe/path.py
>> @@ -93,7 +93,7 @@ def copyhardlinktree(src, dst):
>>       if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
>>           # Need to copy directories only with tar first since cp will
>> error if two
>>           # writers try and create a directory at the same time
>> -        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p
>> --files-from - | tar -xf - -C %s' % (src, src, dst)
>> +        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p
>> --files-from - --no-recursion | tar -xf - -C %s' % (src, src, dst)
>>           check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>>           if os.path.isdir(src):
>>               src = src + "/*"
>>
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

After this patch do_populate_sysroot fails:

ERROR: Function failed: kernelscripts_sstate_postinst (log file is
located at /oe/oe-core/build/tmp-eglibc/work/collie-oe-linux-gnueabi/linux-yocto/3.10.17+gitAUTOINC+f1c9080cd2_c03195ed6e-r0/temp/log.do_populate_sysroot.26363)
ERROR: Logfile of failure stored in:
/oe/oe-core/build/tmp-eglibc/work/collie-oe-linux-gnueabi/linux-yocto/3.10.17+gitAUTOINC+f1c9080cd2_c03195ed6e-r0/temp/log.do_populate_sysroot.26363
Log data follows:
| DEBUG: Executing python function sstate_task_prefunc
| DEBUG: Python function sstate_task_prefunc finished
| DEBUG: Executing python function do_populate_sysroot
| DEBUG: Executing python function sysroot_stage_all
| DEBUG: Python function sysroot_stage_all finished
| DEBUG: Python function do_populate_sysroot finished
| DEBUG: Executing python function do_qa_staging
| NOTE: QA checking staging
| DEBUG: Python function do_qa_staging finished
| DEBUG: Executing python function sstate_task_postfunc
| DEBUG: Staging files from
/oe/oe-core/build/tmp-eglibc/work/collie-oe-linux-gnueabi/linux-yocto/3.10.17+gitAUTOINC+f1c9080cd2_c03195ed6e-r0/sysroot-destdir
to /oe/oe-core/build/tmp-eglibc/sysroots/collie
| DEBUG: Executing shell function kernelscripts_sstate_postinst
| NOTE: make scripts
|   HOSTCC  scripts/basic/fixdep
|   HOSTCC  scripts/kconfig/conf.o
|   SHIPPED scripts/kconfig/zconf.tab.c
|   SHIPPED scripts/kconfig/zconf.lex.c
|   SHIPPED scripts/kconfig/zconf.hash.c
|   HOSTCC  scripts/kconfig/zconf.tab.o
|   HOSTLD  scripts/kconfig/conf
| scripts/kconfig/conf --silentoldconfig Kconfig
| ***
| *** Configuration file ".config" not found!
| ***
| *** Please run some configurator (e.g. "make oldconfig" or
| *** "make menuconfig" or "make xconfig").
| ***
| make[2]: *** [silentoldconfig] Error 1
| make[1]: *** [silentoldconfig] Error 2
| make: *** No rule to make target `include/config/auto.conf', needed
by `scripts'.  Stop.
| ERROR: oe_runmake failed
| WARNING: /oe/oe-core/build/tmp-eglibc/work/collie-oe-linux-gnueabi/linux-yocto/3.10.17+gitAUTOINC+f1c9080cd2_c03195ed6e-r0/temp/run.kernelscripts_sstate_postinst.26363:1
exit 1 from
|   [ "populate_sysroot" = "populate_sysroot" -o "populate_sysroot" =
"populate_sysroot_setscene" ]
| DEBUG: Python function sstate_task_postfunc finished
| ERROR: Function failed: kernelscripts_sstate_postinst (log file is
located at /oe/oe-core/build/tmp-eglibc/work/collie-oe-linux-gnueabi/linux-yocto/3.10.17+gitAUTOINC+f1c9080cd2_c03195ed6e-r0/temp/log.do_populate_sysroot.26363)
ERROR: Task 5 (/oe/oe-core/meta/recipes-kernel/linux/linux-yocto_3.10.bb,
do_populate_sysroot) failed with exit code '1'


Cheers

Andrea

