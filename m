Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RbhPJ-0005hn-Nc
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Dec 2011 00:41:42 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Dec 2011 15:34:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87474011"
Received: from unknown (HELO envy.home) ([10.255.12.232])
	by orsmga001.jf.intel.com with ESMTP; 16 Dec 2011 15:34:40 -0800
Message-ID: <4EEBD57F.6030903@linux.intel.com>
Date: Fri, 16 Dec 2011 15:34:23 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EEB8E58.3030806@linux.intel.com>
	<59473640-1B02-42F9-A44D-6747552F80DE@dominion.thruhere.net>
	<4EEBD245.5060103@linux.intel.com>
In-Reply-To: <4EEBD245.5060103@linux.intel.com>
X-Enigmail-Version: 1.3.3
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Can we drop eglibc-utils from LIBC_DEPENDENCIES?
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
X-List-Received-Date: Fri, 16 Dec 2011 23:41:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 12/16/2011 03:20 PM, Darren Hart wrote:
> 
> 
> On 12/16/2011 01:07 PM, Koen Kooi wrote:
>>
>> Op 16 dec. 2011, om 19:30 heeft Darren Hart het volgende geschreven:
>>
>>> I'm working on a minimal distro definition, and found that eglibc-utils
>>> pulls in bash (needed for tzconfig and xtrace apparently)
>>
>> My first thought is: fix the bashisms in those scripts, I bet ubuntu/fedora/arch/gentoo have patches for that,
> 
> 
> Agreed, this would be a good thing to do. However, I still shouldn't
> need to include this in a "tiny" distribution.
> 
> 
>>> which pulls in
>>> gettext, which requires wchar support. I'd like to remove eglibc-utils
>>> from my distro definition. I could override the default I suspect, but I
>>> wonder if eglibc-utils should be made an optional package that distro
>>> definitions, images, or users should specifically add if needed?
>>>
>>> The relevant bit of code appears to be:
>>>
>>> meta/conf/distro/include/tclibc-eglibc.inc
>>>
>>> LIBC_DEPENDENCIES = "libsegfault \
>>> 		     eglibc \
>>>    		     eglibc-dbg \
>>>    		     eglibc-dev \
>>>    		     eglibc-utils \
>>>    		     eglibc-thread-db \
>>>    		     eglibc-localedata-i18n \
>>>    		     eglibc-gconv-ibm850 \
>>>    		     eglibc-gconv-cp1252 \
>>>    		     eglibc-gconv-iso8859-1 \
>>>    		     eglibc-gconv-iso8859-15 \
>>>    		     locale-base-en-us \
>>>    		     locale-base-en-gb "
>>>
>>> eglibc-dbg and eglibc-dev also seem like they could be made optional.
>>>
>>> Thoughts? Would anyone object to me removing at least eglibc-utils from
>>> LIBC_DEPENDENCIES?
>>
>> I did a little digging:
>>
>> koen@dominion:/OE/tentacle/sources/openembedded-core$ git grep LIBC_DEPENDENCIES
>> meta/conf/distro/include/tclibc-eglibc.inc:LIBC_DEPENDENCIES = "libsegfault \
>> meta/conf/distro/include/tclibc-uclibc.inc:LIBC_DEPENDENCIES = "\
>> meta/recipes-core/tasks/task-core-nfs.bb:GLIBC_DEPENDENCIES = "glibc-utils"
>> meta/recipes-core/tasks/task-core-nfs.bb:RRECOMMENDS_task-core-nfs-server_append_libc-glibc = " ${GLIBC_DEPENDENCIES}"
>> meta/recipes-core/tasks/task-core-standalone-sdk-target.bb:    ${LIBC_DEPENDENCIES} \
>>
>> So it's only used for debug and/or SDK uses. I am going to argue that if you're going to support debug and SDK you're not minimal anymore and can live with bash/gettext/etc.
> 
> Well, nfs isn't SDK only, there are valid deployment uses for that. But
> otherwise, agreed.
> 
>>
>> Since I was bored I dug up an OE-classic:
>>
>> koen@dominion:/OE/org.openembedded.dev$ git blame  recipes/tasks/task-sdk-bare.bb
>> 749310c7 packages/tasks/task-sdk-bare.bb (Koen Kooi 2008-07-07 21:24:38 +0000  1) DESCRIPTION = "Packages for a standalone  SDK or external toolchain"
>> [..]
>> 9bff47f7 packages/tasks/task-sdk-bare.bb (Tom Rini  2008-11-26 13:16:21 -0500  8) GLIBC_PKGS = "\
>> 749310c7 packages/tasks/task-sdk-bare.bb (Koen Kooi 2008-07-07 21:24:38 +0000  9)     glibc \
>> 749310c7 packages/tasks/task-sdk-bare.bb (Koen Kooi 2008-07-07 21:24:38 +0000 10)     glibc-dbg \
>> 86fa8521 packages/tasks/task-sdk-bare.bb (Tom Rini  2009-02-04 02:07:47 -0500 11)     virtual-libc-dev \
>> 749310c7 packages/tasks/task-sdk-bare.bb (Koen Kooi 2008-07-07 21:24:38 +0000 12)     glibc-utils \
>> 749310c7 packages/tasks/task-sdk-bare.bb (Koen Kooi 2008-07-07 21:24:38 +0000 13)     libsegfault \
>> 749310c7 packages/tasks/task-sdk-bare.bb (Koen Kooi 2008-07-07 21:24:38 +0000 14)     glibc-thread-db \
>> f18a05e2 recipes/tasks/task-sdk-bare.bb  (Tom Rini  2010-02-09 16:43:45 -0700 15) "
>> 9bff47f7 packages/tasks/task-sdk-bare.bb (Tom Rini  2008-11-26 13:16:21 -0500 16) 
>> edd3a1de recipes/tasks/task-sdk-bare.bb  (Tom Rini  2011-01-18 17:56:52 -0700 17) LIBC_PKGS_libc-glibc = "${GLIBC_PKGS}"
>> edd3a1de recipes/tasks/task-sdk-bare.bb  (Tom Rini  2011-01-18 17:56:52 -0700 18) LIBC_PKGS_libc-uclibc = "uclibc uclibc-dev uclibc-thread-db"
> 
> Was this list used in the same way as LIBC_DEPENDENCIES above?
> 
>>
>> So a few years ago that list of packages was only meant for SDK usage.
>>
>> If you meant GLIBC_DEPENDENCIES (note the extra 'G'), then you need
>> to
>> check if they are still needed for NFS operation. If so I am going to
>> argue that the dependencies should move to the recipes in question
>> instead of hiding in the task.
> 
> Right, that makes sense.
> 
>> If it's just a convenience package go
>> ahead and remove it, people wanting it can create a new task :)
> 
> Agreed as well.
> 
> I ran into an interesting issue. If I remove eglibc-utils from
> LIBC_DEPENDENCIES, it still seems to be getting pulled in, as do bash
> and gettext. Still digging to sort out why...

It would appear that removing it from LIBC_DEPENDENCIES prevents it from
being installed, but it is still built and, worse, so are all of it's
RDEPENDS, which pull in bash and gettext and then break on a small libc
with no widechar support.

So, is it correct behavior to build RDEPENDS for packages that will not
be installed?

If so, I gather my fix is to remove eglibc-utils from the packages
generated by the eglibc recipe when building with my tiny distro?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


