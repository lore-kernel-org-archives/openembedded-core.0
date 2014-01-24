Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 94E396E8B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 20:05:37 +0000 (UTC)
Received: (qmail 25946 invoked by uid 1003); 24 Jan 2014 20:05:38 -0000
Received: from unknown (HELO ?192.168.1.122?)
	(philip@opensdr.com@71.171.41.155)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	24 Jan 2014 20:05:37 -0000
Message-ID: <52E2C790.5040803@balister.org>
Date: Fri, 24 Jan 2014 15:05:36 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>
References: <52E10247.8050700@pseudoterminal.org>
	<52E15760.8050606@balister.org>
	<CANyK_8f__Lh=1VqfEb7YwNHZ=Cvy561J1aDMYgmoDtQT2w7QBA@mail.gmail.com>
	<52E23DFD.50204@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB16CE757B@IRSMSX105.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16CE757B@IRSMSX105.ger.corp.intel.com>
X-Enigmail-Version: 1.6
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Berkeley DB fails to build
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
X-List-Received-Date: Fri, 24 Jan 2014 20:05:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/24/2014 07:08 AM, Iorga, Cristian wrote:
> Hi Robert,
> What is your OS?
> I am unable to reproduce it on my machine following your testcase: Ubuntu 13.10 x86 64bits.
> I tried with qemux86 and qemux86-64 machines.
> But then again, on my machine there is no /usr/lib/libstdc++.so file.
> I assume that you have tried with that touch, see how system behaves and if it not the case of a host contamination.

My Fedora 19 box has /usr/lib/libstdc++.so.6 and .so.6.0.19 and the
recipe works for me.

I guess we need to look at sed'ing the libtool script harder. The
problem is the db package doesn't include enough stuff to do the usual
rebuild of configure etc.

Philip

> /Cristian Iorga
> YP
> Intel
> 
> 
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Robert Yang
> Sent: Friday, January 24, 2014 12:19 PM
> To: Paul Barker; Philip Balister
> Cc: openembedded-core
> Subject: Re: [OE-core] Berkeley DB fails to build
> 
> 
> Seems that it is caused by the libtool, but I'm not very sure, we can reproduce it by:
> 
> $ sudo touch /usr/lib/libstdc++.so
> $ bitbake db
> 
> // Robert
> 
> On 01/24/2014 03:01 AM, Paul Barker wrote:
>> On 23 January 2014 17:54, Philip Balister <philip@balister.org> wrote:
>>> On 01/23/2014 06:51 AM, Carlos Rafael Giani wrote:
>>>> Hello,
>>>>
>>>> I noticed that since the C++ bindings for the berkeley DB were 
>>>> included in commit 23f29027db73d5759889b48fabdea7f6173217a7 , I 
>>>> cannot build db anymore.
>>>> The error is:
>>>>
>>>>      /usr/lib/libstdc++.so: file not recognized: File format not 
>>>> recognized
>>>>
>>>> this is the offending part in the log.do_compile file:
>>>
>>> What distro is your build machine running? I've this from people 
>>> using Arch Linux.
>>>
>>
>> I've tracked this down to libtool replacing '-lstdc++' with an 
>> explicit reference to '/usr/lib/libstdc++.so' before it runs ld. So 
>> it's libtool not ld at fault here. I did look at the recipe for 
>> Berkeley db and spotted that it overrides do_configure, allowing the 
>> shipped copies of libtool and related files to be used rather than 
>> running the autoreconf stuff that replaces them. That's my 
>> understanding at least.
>>
>> At that point I ran away and reverted the commit in question locally 
>> as libtool terrifies me and I don't need the c++ bindings myself!
>>
>> Sorry I can't be more help but I hope that points someone in the right 
>> direction.
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 

