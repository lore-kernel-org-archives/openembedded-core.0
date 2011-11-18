Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RRV5N-00034L-V8
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 21:30:58 +0100
Received: from mail-yx0-f180.google.com ([209.85.213.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 18 Nov 2011 12:24:26 -0800
Received: by yenl9 with SMTP id l9so1140555yen.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 12:24:25 -0800 (PST)
Received: by 10.50.140.1 with SMTP id rc1mr4908629igb.25.1321647865498;
	Fri, 18 Nov 2011 12:24:25 -0800 (PST)
Received: from [192.168.1.12] (c-98-246-160-155.hsd1.or.comcast.net.
	[98.246.160.155])
	by mx.google.com with ESMTPS id jm11sm6942534ibb.1.2011.11.18.12.24.23
	(version=SSLv3 cipher=OTHER); Fri, 18 Nov 2011 12:24:24 -0800 (PST)
Message-ID: <4EC6BEF9.9060205@intel.com>
Date: Fri, 18 Nov 2011 12:24:25 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4EC6B45A.9060107@intel.com>
	<CAMKF1spQ5roygTCMRtZ5nhfhV+S9520tJYdV5Lyt-MB-Je1XZA@mail.gmail.com>
	<4EC6B917.90007@linux.intel.com>
In-Reply-To: <4EC6B917.90007@linux.intel.com>
Subject: Re: qemu needs > 2 GB of RAM to build?
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
X-List-Received-Date: Fri, 18 Nov 2011 20:30:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/2011 11:59 AM, Joshua Lock wrote:
>
>
> On 18/11/11 11:49, Khem Raj wrote:
>> On Fri, Nov 18, 2011 at 11:39 AM, Scott Garman<scott.a.garman@intel.com>  wrote:
>>> Hi all,
>>>
>>> I'm testing building core-image-minimal in a resource-constrained
>>> environment (a VirtualBox VM with 2300 MB of RAM allocated to it). With
>>> PARALLEL_MAKE set to -j4 (the VM does have two CPUs allocated), I'm finding
>>> that the build of qemu-native fails because the OOM killer steps in and
>>> kills gcc. This is happening during the linking phase of building qemu.
>
> What's BB_NUMBER_THREADS set to? I had to reduce to 1 to build
> qemu-native on a laptop with 2GB RAM. iirc it had a habit of linking
> something equally large such as eglibc, qt or the kernel at the same time.

I had it set to 2, but I'm able to reproduce the problem when rebuilding 
*only* qemu-native.

>> what distro are you running on guest ? it could be something wrong
>> with the distro gcc or system
>
> I've seen this on F14 (Gnome 2.x) and F15 (Gnome 3) with a laptop with
> only 2GB RAM.

This is a Fedora 14 host running GNOME 2.x

> I think BB_NUMBER_THREADS is the key here. And whether you're running
> much in the way of a desktop environment.

I would have thought PARALLEL_MAKE would have been more of the issue - I 
think I saw two instances of ld running via top when the crash occurred.

In any case, the purpose behind this exercise for me is to test the 
feasibility of using a VM environment for performing builds. The idea is 
to get Windows users started with some tutorial screencasts they can 
follow along with using the VM until they feel compelled enough to set 
up a native Linux development system.

It sounds like a system requirement of using this VM will have to be 
that the host system have 6 GB or more of RAM (since the VM guest won't 
be able to use all of that - generally around 50-60%). This pretty much 
rules out its use on all but the most recent laptops.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


