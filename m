Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Qor2j-0002no-3x
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 08:04:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Aug 2011 23:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,315,1309762800"; d="scan'208";a="37720450"
Received: from unknown (HELO [10.255.14.93]) ([10.255.14.93])
	by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2011 23:00:03 -0700
Message-ID: <4E3A3562.1060907@linux.intel.com>
Date: Wed, 03 Aug 2011 23:00:02 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: "Cui, Dexuan" <dexuan.cui@intel.com>
References: <cover.1312265186.git.dexuan.cui@intel.com>	<6def4624e63c8c7cf439dff32cb155dd2bba0ebe.1312265186.git.dexuan.cui@intel.com>	<1312285430.2344.582.camel@rex>
	<4E38C941.30805@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B304414CE2@shsmsx502.ccr.corp.intel.com>
	<4E395235.9010709@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3044150C6@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6B3044150C6@shsmsx502.ccr.corp.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oe-init-build-env, scripts/oe-buildenv-internal: add error detecting for $BDIR
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
X-List-Received-Date: Thu, 04 Aug 2011 06:04:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 08/03/2011 07:25 PM, Cui, Dexuan wrote:
> Darren Hart wrote on 2011-08-03:
>> On 08/02/2011 11:46 PM, Cui, Dexuan wrote:
>>> Hi Darren, thanks for the suggestion! I considered the idea too,
>>> however, if we use the idea, it looks not that simple to gracefully
>>> and concisely handle the case if a user (by accident or by prank)
>>> passes / as $1 here, i.e., "readlink -f" would fail. So I didn't do
>>> that.
>>
>> Hi Dexuan, 
>> I had not considered that case, good catch. I can't think of a valid
>> use case for BDIR="/". Not only are write permissions unlikely, but
> Agree.
> 
>> the build would conflict with /tmp as well.
>>
>> if [ "$BDIR" == "/" ]; then
>> 	echo "ERROR: / is not supported as a build directory."
>> 	exit 1
>> fi
>> BDIR=${BDIR%/}
> Hi Darren,
> This seems good to me.
> Looks ${BDIR%/} can only remove one trailing slash. Do we need to consider more-than-one-slashes, e.g., $BDIR is /home/poky/build///? :-)   (We could use sed:  BDIR=`echo $BDIR | sed -re 's|/+$||'` , but I'm not sure if it deserves the complexity)
> Darren, could you please help to make a patch? 
> I really have few experience about how to validate a user's input. :-)

At some point I think it's fair for us to say "so don't do that" when
someone says "if I pass this random string of garbage to the script it
gives up and uses the current directory".

As for a patch, I'm on Jury duty all this week and only get to a very
small percentage of my tasks. I would appreciate if you would try to put
one together using the above source snippet, with the suggested changes
from Paul of course. Then just send it to the list with Paul and myself
on CC. We'll review and provided additional Acked-by's to confirm we're
all happy with the end result.

I would suggest you include a patch to first revert the previous patch
that was applied to address this issue.

--
Darren

> 
>> I would be happy with something like the above (untested). It seems a
>> lot more clear and direct to me.
>>
>> In any case, I don't see any reason to bail out and ask the user to
>> remove a trailing slash. We should just do this and move on. There is
>> no semantic difference from the user's perspective, and the blame is
>> to be placed on readlink, not the user.
> I agree.
> 
> Thanks,
> -- Dexuan
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


