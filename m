Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SjZVL-0006py-Pr
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 19:24:43 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Jun 2012 10:13:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116224544"
Received: from unknown (HELO envy.home) ([10.255.12.246])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Jun 2012 10:13:49 -0700
Message-ID: <4FE9ED79.1090401@linux.intel.com>
Date: Tue, 26 Jun 2012 10:12:25 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4FE8F542.2070304@linux.intel.com>
	<CAMKF1spxr+RVQ85YoxdPdrPi+f4V6A_6Gt8QOWTeLCcF_DXEaA@mail.gmail.com>
	<4FE9DC0F.7010907@linux.intel.com>
	<B1BD7005-9688-4792-B3BD-74540DA26E1B@dominion.thruhere.net>
In-Reply-To: <B1BD7005-9688-4792-B3BD-74540DA26E1B@dominion.thruhere.net>
X-Enigmail-Version: 1.4.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: kernel: building target-arch scripts/* to include in kernel-headers package
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
X-List-Received-Date: Tue, 26 Jun 2012 17:24:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/26/2012 09:27 AM, Koen Kooi wrote:
> 
> Op 26 jun. 2012, om 17:58 heeft Darren Hart het volgende geschreven:
> 
>>
>>
>> On 06/25/2012 10:19 PM, Khem Raj wrote:
>>> On Mon, Jun 25, 2012 at 4:33 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>>>> I'm working on a patch series to provide a kernel-headers package which
>>>> allows for the compilation of Linux kernel modules on the target. I
>>>> currently have something working, but it requires that I first build the
>>>> scripts/* binaries on the target, prior to trying to build a module.
>>>>
>>>>       # cd /usr/src/kernel-headers
>>>>       # make scripts
>>>>
>>>> Then I can build modules:
>>>>
>>>>       # cd /home/root/hello-mod/files
>>>>       # export KERNEL_SRC=/usr/src/kernel-headers
>>>>       # make
>>>>
>>>> And test:
>>>>
>>>>       # insmod hello.ko
>>>>       # rmmod hello.ko
>>>>       # dmesg | tail -n2
>>>>       Hello World!
>>>>       Goodbye Cruel World!
>>>>
>>>> I would like to package the target-arch scripts binaries with the
>>>> kernel-headers package, but I'm not sure how to go about building both
>>>> the native and the target binaries as part of the kernel building
>>>> process. Does it make sense to build these as part of the do_install()
>>>> task after I've moved the files from the linux recipe's workdir and
>>>> removed the host-arch binaries from scripts?
>>>>
>>>
>>> the hostprogs there are a bit hairy. you could set HOSTCC to point to
>>> cross compiler and build scripts dir in some O=foo after copying
>>> .config into it but the problem would be that build system expects the
>>> hosttools in build tree at exact same location
>>> e.g. fixdep would be needed even to build other hosttools e.g.
>>> recordmcount etc. and thats where you have to patch kbuild such that
>>> it could reference another fixdep tool which then will be built for
>>> the host you are compiling kernel on.
>>>
>>
>> Ewe, what a mess.
>>
>> Another option would be to add:
>>
>>        # cd /usr/src/kernel-headers
>>        # make scripts
>>
>> To the kernel-headers post-inst script. =
> 
> or you could document it and have people do it manually.
> 

While I would like it to work "out of the box", that would require me to
either RDEPEND on make and gcc, or gracefully handle the postinst
failure if make and gcc are not available. Perhaps just documenting it
is the best plan for now.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




