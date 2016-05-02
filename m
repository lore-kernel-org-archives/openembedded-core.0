Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5CE2D6FFF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 17:51:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 02 May 2016 10:51:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,568,1455004800"; d="scan'208";a="797076869"
Received: from bitbang.jf.intel.com (HELO [10.7.199.65]) ([10.7.199.65])
	by orsmga003.jf.intel.com with ESMTP; 02 May 2016 10:51:31 -0700
To: Robert Yang <liezhi.yang@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	oe-core <openembedded-core@lists.openembedded.org>
References: <571EE388.7040107@windriver.com>
	<1461923108.5465.87.camel@linuxfoundation.org>
	<572332C5.4000706@windriver.com>
From: Randy Witt <randy.e.witt@linux.intel.com>
Message-ID: <572793A3.3060102@linux.intel.com>
Date: Mon, 2 May 2016 10:51:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <572332C5.4000706@windriver.com>
Subject: Re: Make runqemu knows nothing about machine
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
X-List-Received-Date: Mon, 02 May 2016 17:51:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/29/2016 03:09 AM, Robert Yang wrote:
>
>
> On 04/29/2016 05:45 PM, Richard Purdie wrote:
>> On Tue, 2016-04-26 at 11:42 +0800, Robert Yang wrote:
>>> Hello,
>>>
>>> The qemu-native can boot a lot of machines, but oe-core's runqemu can
>>> only
>>> boot a few of them which are hardcoded into runqemu. I'd like to
>>> change
>>> it little to make it drop the hardcode and can boot more machines.
>>> Here
>>> are some basic thoughts, please feel free to give your comments.
>>>
>>> runqemu is a helpful script which can help us boot images easily, but
>>> it
>>> has a lot of hard code for machine + args. I'd like to remove these
>>> from
>>> runqemu, and make it as a frame. The logical is that, who knows
>>> clearly
>>> about whether qemu can boot the machine and how to boot it (args),
>>> the
>>> answer is the machine/bsp developer, so we can:
>>>
>>> * Add a var like QEMU_SUPPORTED = "yes/no" in the bsp conf file
>>> (default to no)
>>> * Add a var like QEMU_BOOT_ARGS = "foo" if there are special args.
>>> * Let do_rootfs or do_image_foo write data such as QEMU_BOOT_ARGS to
>>>     DEPLOY_DIR_IMAGE/runqemu/ or tmp/deploy/images/runqemu/, we can
>>> treat
>>>     the "runqemu/" dir as a database, and anything we need there, for
>>> example,
>>>     efi/pcbios, root args, and so on. We won't miss anything since all
>>> the
>>>     images which can be boot by runqemu are built by oe-core.
>>> * Then we can easily add supported machine to runqemu from the bsp
>>> itself
>>>     without change runqemu.
>>>
>>> I will start working on it if there is no objections, and make sure
>>> it won't
>>> break any current supported machines.
>>
>> I guess we have some decisions to make. Firstly, is that script better
>> in shell or python at this point? Originally, shell made sense but I'm
>> starting to wonder if it would be clearer in python.
>>
>> If we left it as shell, I'd envisaged it going through something like
>> BBPATH and sourcing files from each of the layers to build up its own
>> list of supported machines. The trouble is we can't easily get BBPATH
>> in the shell environment since we can't assume bitbake and we ideally
>> want it to work outside of our build environment.
>
> Thanks for the reply, my thought is that move part of the implementation
> into a class called runqemu.bbclass (or other names), and leave the runqemu
> as a shell script, when QEMU_BOOT_SUPPORTED = "1", runqemu.bbclass will
> create a:
> tmp/deploy/images/<machine>/runqemu
>
> And the content in runqemu can be: (for example, arm)
> QEMU="/path/to/sysroots/x86_64-linux/usr/bin/qemu-system-arm -m 128 -machine
> versatilepb  "
> TUNE_ARCH="arm"
> QEMU_DEFAULT_KERNEL="zImage-qemuarm.bin"
> QEMU_DEFAULT_FSTYPE="ext4"
> QEMU_MEM="-m 128"
> [maybe more]

Would it be better to just have a meta-qemu-config-[whateverarch]-native that 
publishes the config file? Then it could also publish the config in different 
forms such as  json/yaml/ini for users who don't want to use runqemu, but still 
need to know the *required* args. They might want to ignore the rest.

> All of these variables can be defined in bsp layer or conf files. I will
> add some default values there according to TUNE_ARCH, so that the bsp may
> not need do anything to boot from qemu when QEMU_BOOT_SUPPORTED = "1".
>
> // Robert
>
>>
>> With the development of devtool, I'm wondering if runqemu should become
>> another such "command", written in python and working in any of the
>> environments we'd expect devtool to work (eSDK, main build). If we did
>> that, we'd have the layers and could easily access BBPATH and search
>> for additional modules to add support for additional machines.
>>
>> Thoughts?
>>
>> Cheers,
>>
>> Richard
>>
>>
>>


