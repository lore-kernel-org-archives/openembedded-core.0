Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkbZo-0006wq-9R
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 15:49:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Jun 2012 06:38:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="159711443"
Received: from unknown (HELO envy.home) ([10.255.13.25])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2012 06:38:39 -0700
Message-ID: <4FEDAF83.30600@linux.intel.com>
Date: Fri, 29 Jun 2012 06:37:07 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1340942930.git.dvhart@linux.intel.com>
	<4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340942930.git.dvhart@linux.intel.com>
	<CADkTA4MUhn4nUEkUdxG_TkV6qg8VHorhoPjYpeFOqAPrxEr4=A@mail.gmail.com>
In-Reply-To: <CADkTA4MUhn4nUEkUdxG_TkV6qg8VHorhoPjYpeFOqAPrxEr4=A@mail.gmail.com>
X-Enigmail-Version: 1.4.2
Cc: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 1/4] linux-libc-headers-yocto: Do not include linux-yocto
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
X-List-Received-Date: Fri, 29 Jun 2012 13:49:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/29/2012 06:02 AM, Bruce Ashfield wrote:
> On Fri, Jun 29, 2012 at 12:17 AM, Darren Hart <dvhart@linux.intel.com> wrote:
>> The only bit we seem to need from the linux-yocto include is the
>> SRCREV_FORMAT. If we define this explicitly, we can avoid including the
>> linux-yocto include.
>>
>> This is desirable so that linux-yocto can require kernel and simplify
>> the PR update process of all the linux-yocto* recipes. Pulling in
>> kernel to the linux-libc-headers-yocto recipes causes build failures by
>> pulling in "update-modules-nativesdk".
> 
> I'm familiar with this particular issue .. and I've tried to fix it
> myself (I have
> something that does largely work with both kernel and kernel yocto
> included), but I didn't know you were looking into this, so I'll toss
> that out :)

I wasn't looking at it explicitly, but it got in the way of the
kernel-headers effort, so it grew out of that.

> 
> There's something missing with this change, that I had restored the ability
> to patch and modify the tree, but I'll bolt that on later when I fix up those
> nativesdk parts.

Cool, thanks!

> 
> Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> 
>>
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> CC: Bruce Ashfield <bruce.ashfield@windriver.com>
>> CC: Tom Zanussi <tom.zanussi@intel.com>
>> ---
>>  .../linux-libc-headers/linux-libc-headers-yocto_git.bb              |    3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-yocto/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb b/meta-yocto/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
>> index b4222f1..8ab4fb1 100644
>> --- a/meta-yocto/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
>> +++ b/meta-yocto/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
>> @@ -1,5 +1,4 @@
>>  require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>> -include recipes-kernel/linux/linux-yocto.inc
>>
>>  B = "${S}"
>>
>> @@ -13,6 +12,8 @@ SRCREV = "a1cdb60720c452c3965eaec3ec2cd10f06261cc5"
>>  PV = "3.4+git-${SRCPV}"
>>  PR = "r6"
>>
>> +SRCREV_FORMAT ?= "meta_machine"
>> +
>>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
>>
>>  # force this to empty to prevent installation failures, we aren't
>> --
>> 1.7.10.2
>>
>> _______________________________________________
>> poky mailing list
>> poky@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/poky
> 
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




