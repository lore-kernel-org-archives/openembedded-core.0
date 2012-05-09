Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=469f43418=rich.pixley@palm.com>)
	id 1SSG5M-0003It-Ms for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 01:14:20 +0200
X-IronPort-AV: E=Sophos;i="4.75,560,1330934400"; d="scan'208";a="13414832"
Received: from unknown (HELO ushqusdns4.palm.com) ([148.92.223.164])
	by smtp-relay2.palm.com with ESMTP; 09 May 2012 16:04:26 -0700
Received: from fuji-land.noir.com ([10.100.2.2])
	by ushqusdns4.palm.com (8.14.4/8.14.4) with ESMTP id q49N4Pxs027314;
	Wed, 9 May 2012 16:04:25 -0700
Message-ID: <4FAAF7F9.4030000@palm.com>
Date: Wed, 09 May 2012 16:04:25 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4FA17B2A.5060903@palm.com> <4FA17FA7.9030805@windriver.com>
	<4FA187F4.9040003@palm.com> <4FA18DA7.6010205@windriver.com>
	<4FA18EC8.5040504@palm.com> <4FA18F9D.5090805@windriver.com>
	<1335999994.30113.39.camel@ted> <4FA6B6AC.60301@palm.com>
	<1336480442.25084.74.camel@ted> <4FAAAEB6.2060703@palm.com>
	<1336593138.2494.72.camel@ted>
In-Reply-To: <1336593138.2494.72.camel@ted>
Subject: Re: SetScene tasks hang forever?
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
X-List-Received-Date: Wed, 09 May 2012 23:14:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/12 12:52 , Richard Purdie wrote:
> On Wed, 2012-05-09 at 10:51 -0700, Rich Pixley wrote:
>> On 5/8/12 05:34 , Richard Purdie wrote:
>>> On Sun, 2012-05-06 at 10:36 -0700, Rich Pixley wrote:
>>>> Any other ideas?
>>> Well, this clearly doesn't happen with master or in any combination of
>>> the layers most users are using. The logical conclusion would be that
>>> there is something in your layer that is somehow triggering this.
>> No private layer involved.
>>
>> I do have a makefile which encapsulates the environment stuff, but
>> that's it.
>>> Of course since that layer is secret and you can't show us it, we have a
>>> bit of a problem. Can you reproduce the bug against public code?
>> Done.  (Our layer is becoming open, we're committed to it, but it's a
>> long process internally).
>>> Are you by any chance setting BB_STAMP_POLICY somewhere?
>> Yes.  BB_STAMP_POLICY = "full".
>>
>> I'll attach a copy of my local.conf and bblayers.conf.
> I'm 95% sure its BB_STAMP_POLICY = "full" causing the problems. The idea
> is really that sstate and other recent developments obsolete the "full"
> stamp code. I'm not sure it actually gets on with the setscene stamps
> the sstate code generates, as I suspect you're discovering.
>
> We could try and fix the "full" policy, or we could just remove it.
> Looking at the code for the function that deals with this in
> runqueue.py, I can see where problems could occur.
>
> So I guess I'm asking if we should fix that or can we remove it?
Um... I'm not sure.

In the past, that was required to get everything built in an incremental 
fashion.  That is, if A depended on B depended on C and C changed, 
BB_STAMP_POLICY = "full" was the only way to get A to be rebuilt 
automatically.

Are you saying that this happens automatically now even without the 
BB_STAMP_POLICY = "full" setting?  Or that some other setting is more 
appropriate and perhaps has semantics I don't know?  Or that the current 
default is no incremental rebuilds?  Or... ?

--rich


