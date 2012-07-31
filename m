Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SwFle-0005zk-3O
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 18:57:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 31 Jul 2012 09:46:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175348116"
Received: from unknown (HELO envy.home) ([10.255.13.49])
	by azsmga001.ch.intel.com with ESMTP; 31 Jul 2012 09:46:19 -0700
Message-ID: <50180B6F.8050906@linux.intel.com>
Date: Tue, 31 Jul 2012 09:44:31 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343747440-31885-1-git-send-email-raj.khem@gmail.com>
	<CADkTA4MGir+Ag=PnP2hLE941vQMNnKQRs2NRvj1NUW4c9CaB4Q@mail.gmail.com>
	<50180584.4030305@linux.intel.com>
	<CADkTA4O4c=F8FR67adWZyiZ5kOAqbB7bmjRMCsGEctgiwYK_FA@mail.gmail.com>
In-Reply-To: <CADkTA4O4c=F8FR67adWZyiZ5kOAqbB7bmjRMCsGEctgiwYK_FA@mail.gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [PATCH] kernel.bbclass: Preserve generated headers
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
X-List-Received-Date: Tue, 31 Jul 2012 16:57:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 07/31/2012 09:31 AM, Bruce Ashfield wrote:
> On Tue, Jul 31, 2012 at 12:19 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>>
>>
>> On 07/31/2012 08:16 AM, Bruce Ashfield wrote:
>>> On Tue, Jul 31, 2012 at 11:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> asm/unistd.h includes asm/unistd_64.h on x86_64
>>>> and asm/unistd_32.h on i386 but these files are
>>>> generated files in 3.4 and when we do 'make clean' they get
>>>> deleted and it shows up as an error when building
>>>> external modules. May be its a 3.4 kernel bug may be not
>>>> but make clean should have left the tree in
>>>> a shape to build modules but it does not.
>>>>
>>>> Probably we should run make modules_prepare after having
>>>> run make clean.
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>  meta/classes/kernel.bbclass |    2 ++
>>>>  1 files changed, 2 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>>> index b19ed4c..4ac3d48 100644
>>>> --- a/meta/classes/kernel.bbclass
>>>> +++ b/meta/classes/kernel.bbclass
>>>> @@ -197,6 +197,8 @@ kernel_do_install() {
>>>>         if [ -f include/generated/bounds.h ]; then
>>>>                 cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
>>>>         fi
>>>> +       mkdir -p $kerneldir/arch/${ARCH}/include/generated/
>>>> +       cp -fR arch/${ARCH}/include/generated/* $kerneldir/arch/${ARCH}/include/generated/
>>>
>>> If we take the blanket protection, we should be able to drop the
>>> bounds.h specific
>>> case a the same time .. right ?
>>
>> No, different dirs (one is ARCH)
> 
> Aha. I missed that, but can we back up a directory and take everything from
> generated/* ? .. assuming your question about binaries being in those
> directory is "no".

It isn't a "no" for the include/generated dir, just not sure about ARCH.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


