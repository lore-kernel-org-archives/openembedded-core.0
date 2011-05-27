Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPylm-0000PE-Lw
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 17:16:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 May 2011 08:13:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,280,1304319600"; 
   d="scan'208";a="5885154"
Received: from unknown (HELO [10.255.12.184]) ([10.255.12.184])
	by orsmga001.jf.intel.com with ESMTP; 27 May 2011 08:13:04 -0700
Message-ID: <4DDFBF83.40805@linux.intel.com>
Date: Fri, 27 May 2011 08:13:07 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1306444161.git.dvhart@linux.intel.com>	
	<e5f5d48165bcb5dc3ccf160a29e16ca700f85395.1306444161.git.dvhart@linux.intel.com>	
	<1306452282.27470.214.camel@rex> <4DDF1DDD.30001@linux.intel.com>	
	<1306485644.27470.247.camel@rex>
	<4DDFAD9E.7080902@linux.intel.com>	
	<1306507609.27470.272.camel@rex> <1306507721.27470.273.camel@rex>
In-Reply-To: <1306507721.27470.273.camel@rex>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Chris Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
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
X-List-Received-Date: Fri, 27 May 2011 15:16:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/27/2011 07:48 AM, Richard Purdie wrote:
> On Fri, 2011-05-27 at 15:46 +0100, Richard Purdie wrote:
>> On Fri, 2011-05-27 at 06:56 -0700, Darren Hart wrote:
>>>
>>> On 05/27/2011 01:40 AM, Richard Purdie wrote:
>>>> On Thu, 2011-05-26 at 20:43 -0700, Darren Hart wrote:
>>>>> On 05/26/2011 04:24 PM, Richard Purdie wrote:
>>>>>> On Thu, 2011-05-26 at 14:12 -0700, Darren Hart wrote:
>>>>>>> Note: I used bb.note() instead of bb.debug() to ensure the message at least
>>>>>>>       makes it to the console. From what I could gather, bb.debug() doesn't
>>>>>>>       go anywhere during recipe parsing.
>>>>>>
>>>>>> Why?
>>>>>>
>>>>>
>>>>> My thinking was that the only time you would legitimately try and build
>>>>> this package when you can't is during a "world" build, which is likely
>>>>> an unattended sort of build anyway. The rest of the time you might hit
>>>>> this error would be when you intended to build u-boot but are missing
>>>>> the requisite configuration bits in your machine config.
>>>>
>>>> You've inserted the note at parsing time though so every time anyone
>>>> builds anything this will show up.
>>>
>>> Aha! Got it. I changed it and ran a test:
>>>
>>> bb.note("DEBUG TO FOLLOW")
>>> bb.debug(1, "To build %s, see %s for instructions on setting \
>>> 	     up your machine config" % (PN, FILE))
>>>
>>>
>>> $ rm -rf tmp/cache; bitbake -DDDD u-boot | tee log
>>> Pseudo is not present but is required, building this first before the
>>> main build
>>> Loading cache...done.
>>> Loaded 998 entries from dependency cache.
>>> Parsing recipes...NOTE: DEBUG TO FOLLOW
>>> done.
>>> Parsing of 783 .bb files complete (780 cached, 3 parsed). 1000 targets,
>>> 11 skipped, 0 masked, 0 errors.
>>>
>>> As you can see, even with -DDDD, the message never makes it to the
>>> console. So I agree that bb.note() is inappropriate, unfortunately,
>>> bb.debug doesn't appear to be working. I believe it was yesterday...
>>
>> The result was cached (780 cached). Try that command after "touch
>> conf/local.conf" and it will be in there.
> 
> Sorry, the note did appear though.
> 
> That needs looking into and is possibly a logging problem. Needs fixing
> as a separate issue though and use of bb.note there isn't the right
> approach.


OK, I haven't completely lost it then :-) In that case, are you looking
for any additional changes/dialog/acks here? If not, the version with
bb.debug() is now in the contrib branch:

  git://git.pokylinux.org/poky-contrib dvhart/oe/u-boot
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/oe/u-boot

I can resend as V3 if more discussion is desirable.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


