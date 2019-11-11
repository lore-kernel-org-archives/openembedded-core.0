Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 59C797FA16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 14:18:16 +0000 (UTC)
Received: from Marks-MacBook-Pro.local ([76.164.61.198]) (authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id xABEHUb1026659
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO); Mon, 11 Nov 2019 08:18:14 -0600
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Seebs <seebs@seebs.net>
References: <20191109153559.15847-1-richard.purdie@linuxfoundation.org>
	<20191109100710.66530547@seebsdell>
	<5100e289ac8a5c4d0196e8ec77813859bb7a703d.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <d9dedf00-f8f4-8bf6-5b94-81868de5dc31@kernel.crashing.org>
Date: Mon, 11 Nov 2019 08:17:30 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <5100e289ac8a5c4d0196e8ec77813859bb7a703d.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: Drop static linking to sqlite3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Nov 2019 14:18:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/9/19 10:30 AM, Richard Purdie wrote:
> On Sat, 2019-11-09 at 10:07 -0600, Seebs wrote:
>> On Sat,  9 Nov 2019 15:35:59 +0000
>> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>>> Back in 2010[1] we made pseudo statically link against sqlite3.
>>> Since then the world has changed, pseudo now has separate processes
>>> for the database in the server and the client and they have
>>> separate linking commands.
>>
>> I'm not sure what that has to do with the reasons for it being
>> static? Not that I remember exactly anymore, but I think we were
>> hitting problems caused if pseudo was dynamically linked to sqlite,
>> but I don't remember what they were.
> 
> I did talk briefly to Mark (also cc'd) as he wrote the original patch
> and he thought it was possibly because the client was also linking
> against sqlite3 and due to the other things the client does, that was
> problematic.

First (early) version of pseudo would fork for the server, there wasn't a
seperate executed server and we had all sorts of problems with dynamic libraries
being loaded and loaded from the correct paths (due to the LD_PRELOAD).

Moving to two process spaces, LD_PRELOAD and the pseudo executable happened
pretty early in development, but I suspect some of this is left over from that.

>> I'm not entirely sure I know what you mean by "separate processes for
>> the database in the server and the client". I don't think
>> libpseudo.so should ever do any database things at all, and it
>> shouldn't need to link to sqlite.
> 
> I was under the impression the client may once have linked against it.
> I admit I didn't dive into history, just checked that it clearly
> doesn't now.

The client had both from above, but also for some early logging that happened
before the pseudo server was executed.  Both vestiges are long fone.

>>> which occurs if sqlite3-native was built on a machine with glibc
>>> 2.28 or later and pseudo-native is being built on glibc before
>>> that.
>>
>> I don't think pseudo's ever been *expected* to work when built linked
>> against things built against different libc. It is *way* too full of
>> unholy magics that depend on knowing which libc it's using. That
>> said, the pseudo server also shouldn't really need to be statically-
>> linked, the only times it ever runs under pseudo, it just immediately
>> tries to escape and not run that way.
> 
> The client lib doesn't and the server side should behave just like any
> other linux binary afaik so we should be ok with a dynamicly linked
> sqlite3?
> 
>>> There appears to be no easy way to avoid this other than adding a
>>> copy of sqlite3 into the pseudo recipe. Given the static linking
>>> doesn't seem to be required any longer due to the separate
>>> processes,
>>> drop that to fix those issues.
>>
>> I don't understand the "separate processes" thing. So far as I know,
>> pseudo has never talked to sqlite from the client. I think Jason
>> Wessel had experimental patches at one point to do client-local
>> sqlite work to avoid the IPC overhead, but I don't think it ever got
>> merged because it turns out the IPC overhead is insignificant
>> compared to everything else.
> 
> If I'm working off incorrect assumptions, is there another reason we
> need a static sqlite? I have tested this patch before I posted it and
> it seems fine in our test builds...
> 
> Cheers,
> 
> Richard
> 

