Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96E2A6C4DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 10:59:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBBAxMrF012666
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Dec 2018 02:59:22 -0800 (PST)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.138]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0415.000;
	Tue, 11 Dec 2018 02:59:22 -0800
From: "Yang, Liezhi" <Liezhi.Yang@windriver.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/4] base.bbclass: Remove invalid ccache
	related code
Thread-Index: AQHUkHNSmRNzQfPWdUOBePrS+zcKbaV5y74AgAAFq4CAAAfKAIAACIeA//9+g4w=
Date: Tue, 11 Dec 2018 10:59:21 +0000
Message-ID: <60AE6DB2-266B-4F70-891F-8282F61F9E7A@windriver.com>
References: <cover.1544408339.git.liezhi.yang@windriver.com>
	<bb3ede855b1af3d681a1007ccfff34be43cf6c27.1544408339.git.liezhi.yang@windriver.com>
	<37ad7314e33e17f8d20004e609c32fb03b90dfdc.camel@linuxfoundation.org>
	<117c2412-f698-45a5-d82a-e1ee3210ec44@windriver.com>
	<0b4127efa7077e49230199b08757d7aa13fb518a.camel@linuxfoundation.org>
	<bb74d937-c676-77d2-2258-0db6037fce51@windriver.com>,
	<ad5b21cd26692c6a74384be336ed27e6592571e4.camel@linuxfoundation.org>
In-Reply-To: <ad5b21cd26692c6a74384be336ed27e6592571e4.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] base.bbclass: Remove invalid ccache related code
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
X-List-Received-Date: Tue, 11 Dec 2018 10:59:22 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable



Sent from mobile phone

> =1B$B:_=1B(B 2018=1B$BG/=1B(B12=1B$B7n=1B(B11=1B$BF|!$=1B(B18:43=1B$B!$=
=1B(B"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.o=
rg> =1B$B<LF;!'=1B(B
>=20
>> On Tue, 2018-12-11 at 18:12 +0800, Robert Yang wrote:
>>> On 12/11/18 5:44 PM, richard.purdie@linuxfoundation.org wrote:
>>>> On Tue, 2018-12-11 at 17:24 +0800, Robert Yang wrote:
>>>> On 12/10/18 6:29 PM, Richard Purdie wrote:
>>> No, that isn't correct :(
>>>=20
>>> The problem is that "gcc" can be linked directly to ccache by the
>>> host
>>> distro. This means you end up using the host ccache just by calling
>>> "gcc". This code is still needed if we want to control ccache and
>>> be
>>> able to disable it and use ccache-native for determinism.
>>=20
>> I did a test:
>>=20
>> $ ln -s /usr/bin/ccache /folk/lyang1/bin/gcc
>> I got errors with/without the code:
>>=20
>> $ bitbake -p
>> bb.BBHandledException
>> ERROR: Error running gcc  --version:
>>=20
>> $ ls -l tmp/hosttools/gcc
>> tmp/hosttools/gcc -> /folk/lyang1/bin/gcc
>>=20
>> $ ls -l /folk/lyang1/bin/gcc
>> /folk/lyang1/bin/gcc -> /usr/bin/ccache
>>=20
>> It worked well if I run gcc --version manually:
>> $ gcc --version
>> gcc (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609
>> Copyright (C) 2015 Free Software Foundation, Inc.
>> $ echo $?
>> 0
>>=20
>> There must be something wrong in such a case. I will fix this later.
>>=20
>> Let's get back to he code:
>>=20
>>             srctool =3D bb.utils.which(path, tool, executable=3DTrue)
>>             if "ccache" in srctool:
>>                 srctool =3D bb.utils.which(path, tool,
>> executable=3DTrue, direction=3D1)
>>             if srctool:
>>                 os.symlink(srctool, desttool)
>>=20
>>=20
>> * If tool =3D=3D "gcc", then srctool would be gcc, too.
>> * If tool =3D=3D "ccache", then srctool would be ccache, too.
>>=20
>> So I think that the code doesn't help when gcc links to ccache ?
>=20
> https://www.unix.com/man-page/suse/1/ccache/
>=20
> When the distros we tested on did this they placed it in something like
> bin/ccache/ so the code detects the "ccache" element of the path
> returned by which() (something like /usr/bin/ccache/gcc but I don't
> remember exactly).
>=20
> Try using /folk/lyang1/ccache/ or /folk/lyang1/bin/ccache/ in your
> example.

Thanks, I will try it tomorrow.

// Robert

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20

