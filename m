Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UA6t9-0002fP-Lt
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 23:51:17 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 25 Feb 2013 14:34:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,736,1355126400"; d="scan'208";a="206189759"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by AZSMGA002.ch.intel.com with ESMTP; 25 Feb 2013 14:34:55 -0800
Message-ID: <512BE70F.4050707@linux.intel.com>
Date: Mon, 25 Feb 2013 14:34:55 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <cover.1361091390.git.cazfi74@gmail.com>
	<5123B265.9050003@linux.intel.com>
	<CAF6bG8ei3p_RjsZX2Nmf5fy+StgJThrcR6R_rZ6-wT_A+6kAkg@mail.gmail.com>
	<CAF6bG8c9BU06uGvuM0ENuyGL4yggQOct620yP18kbkrh_bxbLA@mail.gmail.com>
In-Reply-To: <CAF6bG8c9BU06uGvuM0ENuyGL4yggQOct620yP18kbkrh_bxbLA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] automake-1.13 and upstream version updates
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
X-List-Received-Date: Mon, 25 Feb 2013 22:51:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/25/2013 03:40 AM, Marko Lindqvist wrote:
> On 20 February 2013 16:32, Marko Lindqvist <cazfi74@gmail.com> wrote:
>> On 19 February 2013 19:12, Saul Wold <sgw@linux.intel.com> wrote:
>>> On 02/17/2013 01:00 AM, Marko Lindqvist wrote:
>>>>     libffi: update to upstream version 3.0.12
>>>
>>> Not sure what's going on but I saw a batch of failures with glib-2.0, take a
>>> look at the autobuilder failure:
>>>
>>> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/808/steps/shell_29/logs/stdio
>>>
>>>   or
>>>
>>> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/931/steps/shell_29/logs/stdio
>>>
>>> Not sure why, but glib-2.0 is not finding the libffi library, but it seems
>>> to exist in the sysroot.
>>
>>   I should be able to take a brief look next weekend, but tonight and
>> tomorrow I'm busy with other things.
>
>   I've found no way to reproduce this on my own computer no matter how
> I've tried to invalidate parts of the cache etc. but I wonder if it
> could be that for some reason libffi didn't exist in sysroot already
> at the time it was needed, only later when you checked for it. I see
> no problem with glib-2.0-native dependencies, though.
>
I found a way to reproduce it and fix it, I believe!

Just curious, what's your build host arch?  and what does gcc 
-print-multi-os-directory return on your host?

It returns lib64 on my host and it causes the libs to be installed in 
the <WORKDIR>/image/usr/lib64 dir and not get picked up by the 
populate_sysroot() code.

I commented out some code in configure.ac and that seems to have solved 
the problem, but I am not sure if we need to start adding lib64 to 
populate_sysroot or tweaking configure code!

Sau!


>   Note that in the log there's:
> NOTE: Running noexec task 5283 of 7886 (ID: 3244,
> virtual:native:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/meta/recipes-gnome/libffi/libffi_3.0.12.bb,
> do_build)
>   AFTER glib2.0-native build has failed.
>
>   One thing that may play a role here is that libffi does not depend on
> anything, not even libffi-native. Libffi seems to be built already
> before libffi-native.
>
>
>   - ML
>


