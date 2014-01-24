Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E67C66E811
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 12:08:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jan 2014 04:08:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,712,1384329600"; d="scan'208";a="470194594"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2014 04:08:09 -0800
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Fri, 24 Jan 2014 12:08:08 +0000
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.215]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.169]) with mapi id
	14.03.0123.003; Fri, 24 Jan 2014 12:08:08 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Yang, Liezhi (Wind River)" <liezhi.yang@windriver.com>, Paul Barker
	<paul@paulbarker.me.uk>, Philip Balister <philip@balister.org>
Thread-Topic: [OE-core] Berkeley DB fails to build
Thread-Index: AQHPGDE37H6zTKJoekes/I2ebM5Te5qSl/0AgAASngCAAQBMgIAAELMw
Date: Fri, 24 Jan 2014 12:08:07 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16CE757B@IRSMSX105.ger.corp.intel.com>
References: <52E10247.8050700@pseudoterminal.org>
	<52E15760.8050606@balister.org>
	<CANyK_8f__Lh=1VqfEb7YwNHZ=Cvy561J1aDMYgmoDtQT2w7QBA@mail.gmail.com>
	<52E23DFD.50204@windriver.com>
In-Reply-To: <52E23DFD.50204@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 24 Jan 2014 12:08:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Robert,
What is your OS?
I am unable to reproduce it on my machine following your testcase: Ubuntu 1=
3.10 x86 64bits.
I tried with qemux86 and qemux86-64 machines.
But then again, on my machine there is no /usr/lib/libstdc++.so file.
I assume that you have tried with that touch, see how system behaves and if=
 it not the case of a host contamination.
/Cristian Iorga
YP
Intel


-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Robert Yang
Sent: Friday, January 24, 2014 12:19 PM
To: Paul Barker; Philip Balister
Cc: openembedded-core
Subject: Re: [OE-core] Berkeley DB fails to build


Seems that it is caused by the libtool, but I'm not very sure, we can repro=
duce it by:

$ sudo touch /usr/lib/libstdc++.so
$ bitbake db

// Robert

On 01/24/2014 03:01 AM, Paul Barker wrote:
> On 23 January 2014 17:54, Philip Balister <philip@balister.org> wrote:
>> On 01/23/2014 06:51 AM, Carlos Rafael Giani wrote:
>>> Hello,
>>>
>>> I noticed that since the C++ bindings for the berkeley DB were=20
>>> included in commit 23f29027db73d5759889b48fabdea7f6173217a7 , I=20
>>> cannot build db anymore.
>>> The error is:
>>>
>>>      /usr/lib/libstdc++.so: file not recognized: File format not=20
>>> recognized
>>>
>>> this is the offending part in the log.do_compile file:
>>
>> What distro is your build machine running? I've this from people=20
>> using Arch Linux.
>>
>
> I've tracked this down to libtool replacing '-lstdc++' with an=20
> explicit reference to '/usr/lib/libstdc++.so' before it runs ld. So=20
> it's libtool not ld at fault here. I did look at the recipe for=20
> Berkeley db and spotted that it overrides do_configure, allowing the=20
> shipped copies of libtool and related files to be used rather than=20
> running the autoreconf stuff that replaces them. That's my=20
> understanding at least.
>
> At that point I ran away and reverted the commit in question locally=20
> as libtool terrifies me and I don't need the c++ bindings myself!
>
> Sorry I can't be more help but I hope that points someone in the right=20
> direction.
>
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

