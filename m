Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RV8uL-0000d6-3t
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2011 22:38:38 +0100
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id F2204EB888
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 22:31:44 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmofAIf9005T4zgTPGdsb2JhbAAMN4UDon2DDAEBAQE3giQBAQEBAwEBASAPAQU2CgEQCxgCAgUWCwICCQMCAQIBFQEbFAYNAQUCAQGICaUmkgSBMIIvhW2BFgSSKoIgkgw
X-IronPort-AV: E=Sophos;i="4.69,586,1315173600"; 
   d="scan'208";a="4454357"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.235]) ([83.227.56.19])
	by ipb3.telenor.se with ESMTP; 28 Nov 2011 22:31:44 +0100
Message-ID: <4ED3FDC1.6030703@emagii.com>
Date: Mon, 28 Nov 2011 22:31:45 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED0CC76.4040606@emagii.com> <4ED0DDBF.9000104@eukrea.com>
	<1322394029.4798.16.camel@ted> <4ED22364.3000801@eukrea.com>
In-Reply-To: <4ED22364.3000801@eukrea.com>
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 28 Nov 2011 21:38:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

2011-11-27 12:47, Eric B=C3=A9nard skrev:
> Le 27/11/2011 12:40, Richard Purdie a =C3=A9crit :
>> On Sat, 2011-11-26 at 13:38 +0100, Eric B=C3=A9nard wrote:
>>> Le 26/11/2011 12:24, Ulf Samuelsson a =C3=A9crit :
>>>> I noted that "iostream" is built and available=20
>>>> in<sysroot>/usr/include/c++
>>>> On the host, it is located in /usr/incolude/c++/<version>
>>>> "tiff" build seems to be OK with Ubuntu 11.04 i686.
>>>>
>>> what is your BB_NUMBER_THREADS setting ?
>>> Here (on 2 different hosts/distro/arch but with an i7 CPU in both=20
>>> cases) if I
>>> set it over 4, I often (always with a value of 8) meet problems with=20
>>> c++
>>> includes during build from scratch. 4 seems the magic value which nev=
er
>>> trigger the problem.
>>
>> To help me get further data points on this issue, are you using rm_wor=
k?
>> Do the recent changes in master help (the bitbake sstate/task_skip()
>> ones in particular)? I've not been able to reproduce this :(
>>
> yes that was with rm_work, I still need to test with current head.
>
> Eric

I have tried Ubuntu 11.10 x64 once more.
This time with
BB_NUMBER_THREADS =3D "4"
PARALLEL_MAKE =3D "j4".

Not exactly the same symptoms , but similar.
This time, the "string" header is not found.


| #    source=3D'libcg_ba.cpp' object=3D'libcg_ba.o' libtool=3Dno
| arm-angstrom-linux-gnueabi-g++  -march=3Darmv5te  -mno-thumb=20
-mthumb-interwork  -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb=20
--sysroot=3D/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eg=
libc/sysroots/qemuarm=20
-DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g=20
-feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden=20
-fvisibility-inlines-hidden -c -o libcg_ba.o libcg_ba.cpp
| libcg_ba.cpp:18:18: fatal error: string: No such file or directory
| compilation terminated.
| make[2]: *** [libcg_ba.o] Error 1

Tried compiling manually.
It appears to me that the "--sysroot" directive gets ignored.

--sysroot=3D/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eg=
libc/sysroots/qemuarm

I manually added "-I/usr/include/c++", but that did not help
I then copied "string" to the compile directory, and then the
compile continued /until missing the next include file)


compiler built:
arm-angstrom-linux-gnueabi-g++ --version
arm-angstrom-linux-gnueabi-g++ (GCC) 4.5.4 20110917 (prerelease)
Copyright (C) 2010 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is N=
O
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOS=
E.


The same build works on Ubuntu 11.04 i686.

Best Regards
Ulf Samuelsson
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--=20
Best Regards
Ulf Samuelsson
eMagii



