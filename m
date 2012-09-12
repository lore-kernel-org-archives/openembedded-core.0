Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TBrEd-0004L7-VX
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 20:00:24 +0200
Received: from mail32-co1-R.bigfish.com (10.243.78.253) by
	CO1EHSOBE006.bigfish.com (10.243.66.69) with Microsoft SMTP Server id
	14.1.225.23; Wed, 12 Sep 2012 17:47:50 +0000
Received: from mail32-co1 (localhost [127.0.0.1])	by mail32-co1-R.bigfish.com
	(Postfix) with ESMTP id 817239C00F0;
	Wed, 12 Sep 2012 17:47:50 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eI1432Izz1202h1d1ah1d2ahzz17326ah8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail32-co1 (localhost.localdomain [127.0.0.1]) by mail32-co1
	(MessageSwitch) id 1347472068955215_6543;
	Wed, 12 Sep 2012 17:47:48 +0000 (UTC)
Received: from CO1EHSMHS026.bigfish.com (unknown [10.243.78.229])	by
	mail32-co1.bigfish.com (Postfix) with ESMTP id DA5DD78003F;
	Wed, 12 Sep 2012 17:47:48 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS026.bigfish.com
	(10.243.66.36) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 12 Sep 2012 17:47:47 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0309.003; Wed, 12 Sep 2012 12:47:46 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] autotools.bbclass: Add functionality to
	force a clean of ${B} when reconfiguring (and ${S} != ${B})
Thread-Index: AQHNkE/XZFtQAqUHwE+D5hE+WSne8JeHFZUAgAA684A=
Date: Wed, 12 Sep 2012 17:47:46 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A674D1E@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1347373349.2122.35.camel@ted>
	<70CC66F5C30A414DADDA6973E4CA391A66FF3F@039-SN1MPN1-001.039d.mgd.msft.net>
	<1347459386.11710.23.camel@ted>
In-Reply-To: <1347459386.11710.23.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"Garman, Scott A" <scott.a.garman@intel.com>
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a clean of ${B} when reconfiguring (and ${S} != ${B})
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 18:00:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E3AB5C291DDE7243844F0912406C7706@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 12, 2012 at 9:16 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-09-11 at 19:01 +0000, McClintock Matthew-B29882 wrote:
>> On Tue, Sep 11, 2012 at 9:22 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > Unfortunately whilst rerunning configure and make against a project wi=
ll mostly
>> > work there are situations where it does not correctly do the right thi=
ng.
>> >
>> > In particular, eglibc and gcc will fail out with errors where settings
>> > do not match a previously built configuration. It could be argued they=
 are
>> > broken but the situation is what it is. There is the possibility of mo=
re subtle
>> > errors too.
>> >
>> > This patch adds removal of the build directory (${B}) when configure i=
s
>> > rerunning, the sstate checksum for do_configure has changed and ${S} !=
=3D ${B}.
>> > We could simply use a stamp but saving out the previous configuration =
checksum
>> > adds some data at no real overhead.
>> >
>> > If we find there are things where we want to disable this behaviour wi=
th
>> > CONFIGURESTAMPFILE =3D "" in the recipe, or users could disable it glo=
bally.
>> >
>> > [YOCTO #2774]
>> > [YOCTO #2848]
>> >
>> > This is particularly helpful for eglibc and gcc which use split builds=
 by default and
>> > are a particular source of reconfigure type problems.
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> Is it feasible to back port this to denzil? I've encountered what I
>> think are similar issues reconfiguring gcc for example.
>
> One of the bugs above is open against denzil and the issue certainly
> exists there. The patch should apply equally well there.
>
> I'd suggest we let this settle in master for a week or two and then add
> it to the backport queue if no problems arise.
>
> Cc'ing Scott so he's aware of this.

I've added this to my denzil branch and will start doing build testing.

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dmattsm/denz=
il

-M

>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



