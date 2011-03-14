Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PzB0c-0006hK-81
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 17:52:42 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PzAyy-0004XD-Vw from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 09:51:01 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 14 Mar 2011 09:50:21 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 14 Mar 2011 09:50:21 -0700
Message-ID: <4D7E473E.6010800@mentor.com>
Date: Mon, 14 Mar 2011 09:50:06 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>	<1299135167-18330-4-git-send-email-raj.khem@gmail.com>	<AANLkTiks0VSWcW4_54mQUv17ZQvb8+CsbWcsDkA_9ZA+@mail.gmail.com>	<1299610396.602.104.camel@rex>	<AANLkTim62_Vb=EumqASMY_ARCJkS8M7rTAUtpxnMR6gx@mail.gmail.com>
	<1299934200.1445.3023.camel@rex>
In-Reply-To: <1299934200.1445.3023.camel@rex>
X-OriginalArrivalTime: 14 Mar 2011 16:50:21.0837 (UTC)
	FILETIME=[E860FBD0:01CBE267]
Subject: Re: [PATCHv3 3/6] gcc: Statically link in support libraries e.g. libmpfr libgmp etc.
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
X-List-Received-Date: Mon, 14 Mar 2011 16:52:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2011 05:50 AM, Richard Purdie wrote:
> On Tue, 2011-03-08 at 11:04 -0800, Khem Raj wrote:
>> On Tue, Mar 8, 2011 at 10:53 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org>  wrote:
>>> On Mon, 2011-03-07 at 22:38 -0800, Khem Raj wrote:
>>>> ping any opinion on this patch ?
>>>
>>> This change looks rather hacky and I'd really like to understand more
>>> about why this is needed and whether there is a better way we could
>>> ensure the right flags get passed around. Can you provide more details
>>> about whats going on with this. Obviously this change as it stands isn't
>>> acceptable to upstream gcc and I'd like to see if we could find one that
>>> was.
>>
>> this is because the supporting libraries like mpc mpfr that are needed
>> by gcc itself to run
>> we might have different versions of these libraries. So depending upon
>> shared objects
>> would mean we need to find same shared objects where say the SDK is installed
>> so either we ship the whole baggage or we link it in statically. This
>> patch makes those libs to
>> linked in statically and cross gcc wont have dependencies on these
>> libs anymore so
>> it can run on all hosts pretty much.
>
> If you look at the way the SDK toolchain works in Poky, it automatically
> ships the versions of these libraries that it needs so we don't actually
> have this problem.
>
> Also, looking at the patch again, was the first LDFLAGS change meant to
> be in there, is that related or different to the shared/static
> mpfr/mpc/gmp issue?

I think it's time for someone to build one at dig at it, but are you 
sure they're used and shipped and not just used?  That was a problem 
before and unless the exported bits are using a relative $ORIGIN in the 
link path (or we've broken relocatability, which would be another 
problem) there's problems today.

-- 
Tom Rini
Mentor Graphics Corporation


