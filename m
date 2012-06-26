Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SjYcD-0005m9-3O
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 18:27:45 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jun 2012 09:16:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="185206075"
Received: from unknown (HELO envy.home) ([10.255.12.246])
	by fmsmga002.fm.intel.com with ESMTP; 26 Jun 2012 09:16:50 -0700
Message-ID: <4FE9E01E.3060802@linux.intel.com>
Date: Tue, 26 Jun 2012 09:15:26 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4FE8F542.2070304@linux.intel.com>
	<CAMKF1spxr+RVQ85YoxdPdrPi+f4V6A_6Gt8QOWTeLCcF_DXEaA@mail.gmail.com>
	<CAMKF1spnZCKBQTkF6cqi0LxRa=rN_Fuyi9S5o4DVSfg+ka80rw@mail.gmail.com>
In-Reply-To: <CAMKF1spnZCKBQTkF6cqi0LxRa=rN_Fuyi9S5o4DVSfg+ka80rw@mail.gmail.com>
X-Enigmail-Version: 1.4.2
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
X-List-Received-Date: Tue, 26 Jun 2012 16:27:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/25/2012 10:53 PM, Khem Raj wrote:
> On Mon, Jun 25, 2012 at 10:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Jun 25, 2012 at 4:33 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>>> I'm working on a patch series to provide a kernel-headers package which
>>> allows for the compilation of Linux kernel modules on the target. I
>>> currently have something working, but it requires that I first build the
>>> scripts/* binaries on the target, prior to trying to build a module.
>>>
>>>        # cd /usr/src/kernel-headers
>>>        # make scripts
>>>
>>> Then I can build modules:
>>>
>>>        # cd /home/root/hello-mod/files
>>>        # export KERNEL_SRC=/usr/src/kernel-headers
>>>        # make
>>>
>>> And test:
>>>
>>>        # insmod hello.ko
>>>        # rmmod hello.ko
>>>        # dmesg | tail -n2
>>>        Hello World!
>>>        Goodbye Cruel World!
>>>
>>> I would like to package the target-arch scripts binaries with the
>>> kernel-headers package, but I'm not sure how to go about building both
>>> the native and the target binaries as part of the kernel building
>>> process. Does it make sense to build these as part of the do_install()
>>> task after I've moved the files from the linux recipe's workdir and
>>> removed the host-arch binaries from scripts?
>>>
>>
>> the hostprogs there are a bit hairy. you could set HOSTCC to point to
>> cross compiler and build scripts dir in some O=foo after copying
>> .config into it but the problem would be that build system expects the
>> hosttools in build tree at exact same location
>> e.g. fixdep would be needed even to build other hosttools e.g.
>> recordmcount etc. and thats where you have to patch kbuild such that
>> it could reference another fixdep tool which then will be built for
>> the host you are compiling kernel on.
> 
> 
> another option is to add a completely new makefile to build
> the necessary tools the way we want them and not use make scripts target at all

While tempting, it sounds like a fragile mechanism with the potential
for maintenance issues.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




