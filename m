Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SBVlG-0005wR-Pz
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 19:32:22 +0100
Received: from mail23-db3-R.bigfish.com (10.3.81.233) by
	DB3EHSOBE005.bigfish.com (10.3.84.25) with Microsoft SMTP Server id
	14.1.225.23; Sat, 24 Mar 2012 18:23:15 +0000
Received: from mail23-db3 (localhost [127.0.0.1])	by mail23-db3-R.bigfish.com
	(Postfix) with ESMTP id A6D2760690;
	Sat, 24 Mar 2012 18:23:14 +0000 (UTC)
X-SpamScore: -10
X-BigFish: VS-10(zz9371I936eK1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail23-db3 (localhost.localdomain [127.0.0.1]) by mail23-db3
	(MessageSwitch) id 1332613385420177_5947;
	Sat, 24 Mar 2012 18:23:05 +0000 (UTC)
Received: from DB3EHSMHS010.bigfish.com (unknown [10.3.81.247])	by
	mail23-db3.bigfish.com (Postfix) with ESMTP id DA197C00C7;
	Sat, 24 Mar 2012 18:23:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS010.bigfish.com
	(10.3.87.110) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Sat, 24 Mar 2012 18:23:05 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Sat, 24 Mar 2012 13:23:12 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "tom.rini@gmail.com"
	<tom.rini@gmail.com>, Christopher Larson <chris_larson@mentor.com>
Thread-Topic: [OE-core] sstate reuse for -native, -cross across different
	host glibc version, how to make it work?
Thread-Index: AQHNCRLrlIBR481Ab0uvyvKcXmFJVJZ4ckmAgAGlnQA=
Date: Sat, 24 Mar 2012 18:23:11 +0000
Message-ID: <CAEsOVNc1KY0UW=dfDpsFRy_uiR83h=ar-jqd3y5+ktg8OZTmqQ@mail.gmail.com>
References: <4DCCC4C4-51F4-43CF-ACF2-BF3D2BAD7BDC@dominion.thruhere.net>
	<1332506475.9740.409.camel@ted>
	<CAEsOVNfaP_NzdnigOOfgOcdhkHgQfEYVoS-K0pPn1dH4PdZpEQ@mail.gmail.com>
	<20120323171347.GF9551@bill-the-cat>
In-Reply-To: <20120323171347.GF9551@bill-the-cat>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: sstate reuse for -native, -cross across different host glibc version, how to make it work?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Sat, 24 Mar 2012 18:32:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3F45E9A652D8354E80717F4E589E8556@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 12:13 PM, Tom Rini <tom.rini@gmail.com> wrote:
> On Fri, Mar 23, 2012 at 04:35:12PM +0000, McClintock Matthew-B29882 wrote=
:
>> On Fri, Mar 23, 2012 at 7:41 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Fri, 2012-03-23 at 13:22 +0100, Koen Kooi wrote:
>> >> I turned on sstate mirroring for angstrom recently and I'm getting
>> >> reports of build failures due to missing GLIBC_2.14 symbols:
>> >>
>> >> arm-angstrom-linux-gnueabi-gcc: /lib/x86_64-linux-gnu/libc.so.6:
>> >> version `GLIBC_2.14' not found (required by
>> >> arm-angstrom-linux-gnueabi-gcc)
>> >>
>> >> The sstate tarballs are built on a Fedora16 VM and the breakage occur=
s
>> >> when it being used on systems with an older c library (e.g. debian).
>> >> To get rid of this problem there are multiple options, but I think th=
e
>> >> 2 most obvious are:
>> >>
>> >> 1) inject host distroname and distroversion into the checksums
>> >> 2) build everything against a native libc
>> >>
>> > 3) Use an older version on the VM which is the oldest distro you plan =
to
>> > build against.
>> >
>> >> Would it be appropriate to get 1) into oe-core before the branchpoint=
?
>> >
>> > We've talked about this and its been on the "to fix" list but nobody h=
as
>> > got around to it. Its hard as we need to come up with something that
>> > isn't going to kill performance of the checksum calculations. A cat
>> > operation on a few files for each checksum for example isn't
>> > appropriate. We may need to do something at the bitbake level as there
>> > is also the issue of checksuming local files such as those in file://
>> > urls and including that in the sstate checksums.
>> >
>> > So whilst I'd love to see fixes for these and they are bugfixes, they'=
re
>> > going to have to be well written patches and its late in cycle for
>> > invasive changes :(.
>>
>> Can't you just inject a variable into native.bbclass:
>>
>> LIBC_DEP =3D `ldd /bin/sh | grep libc`
>
> That just catches one of the many variables. =A0If you want sstate reuse
> of the "runs on host" side of things, you need to capture either all of
> the libraries we may use, build the published feed linking vs these
> libraries (VM or chroot or sysroot games) and the include some way to
> say "yes, X is usbale here". =A0lsb_release and a little bit of mapping
> (which can/should be done at the distro level) gets you this easier.

Fair enough, but is the only solution to have native cache work per
distro? Maybe we can have compatible distros? These sstate-cache
starts to take up a lot of space if we want to share this via ISOs
etc. I've been testing quite successfully with native cache that is
used on several distros. (We are just building it on an old distro).
Maybe I'm getting completely lucky as well which would not surprise me
either.

Another though is improving the initial user experience by pointing
the SSTATE_MIRROR to the autobuilder so the first builds go so much
faster (experienced users could turn it off). We would need some
policy of keeping around sstate-cache for releases and maybe keeping
the last month of sstate cache from the current builds.

-M=



