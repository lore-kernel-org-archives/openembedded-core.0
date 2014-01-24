Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32CC56E764
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 10:18:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0OAIdBu021248
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Jan 2014 02:18:39 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 24 Jan 2014 02:18:39 -0800
Message-ID: <52E23DFD.50204@windriver.com>
Date: Fri, 24 Jan 2014 18:18:37 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>, Philip Balister <philip@balister.org>
References: <52E10247.8050700@pseudoterminal.org>	<52E15760.8050606@balister.org>
	<CANyK_8f__Lh=1VqfEb7YwNHZ=Cvy561J1aDMYgmoDtQT2w7QBA@mail.gmail.com>
In-Reply-To: <CANyK_8f__Lh=1VqfEb7YwNHZ=Cvy561J1aDMYgmoDtQT2w7QBA@mail.gmail.com>
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
X-List-Received-Date: Fri, 24 Jan 2014 10:18:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Seems that it is caused by the libtool, but I'm not very sure, we can
reproduce it by:

$ sudo touch /usr/lib/libstdc++.so
$ bitbake db

// Robert

On 01/24/2014 03:01 AM, Paul Barker wrote:
> On 23 January 2014 17:54, Philip Balister <philip@balister.org> wrote:
>> On 01/23/2014 06:51 AM, Carlos Rafael Giani wrote:
>>> Hello,
>>>
>>> I noticed that since the C++ bindings for the berkeley DB were included
>>> in commit 23f29027db73d5759889b48fabdea7f6173217a7 , I cannot build db
>>> anymore.
>>> The error is:
>>>
>>>      /usr/lib/libstdc++.so: file not recognized: File format not recognized
>>>
>>> this is the offending part in the log.do_compile file:
>>
>> What distro is your build machine running? I've this from people using
>> Arch Linux.
>>
>
> I've tracked this down to libtool replacing '-lstdc++' with an
> explicit reference to '/usr/lib/libstdc++.so' before it runs ld. So
> it's libtool not ld at fault here. I did look at the recipe for
> Berkeley db and spotted that it overrides do_configure, allowing the
> shipped copies of libtool and related files to be used rather than
> running the autoreconf stuff that replaces them. That's my
> understanding at least.
>
> At that point I ran away and reverted the commit in question locally
> as libtool terrifies me and I don't need the c++ bindings myself!
>
> Sorry I can't be more help but I hope that points someone in the right
> direction.
>

