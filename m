Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TJDWd-0007EF-Kg
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 03:13:23 +0200
Received: from mail122-tx2-R.bigfish.com (10.9.14.236) by
	TX2EHSOBE006.bigfish.com (10.9.40.26) with Microsoft SMTP Server id
	14.1.225.23; Wed, 3 Oct 2012 01:00:23 +0000
Received: from mail122-tx2 (localhost [127.0.0.1])	by
	mail122-tx2-R.bigfish.com (Postfix) with ESMTP id 54A7940171;
	Wed,  3 Oct 2012 01:00:23 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eI1432Izz1202h1d1ah1d2ahzz17326ah8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441hbe9i1155h)
Received: from mail122-tx2 (localhost.localdomain [127.0.0.1]) by mail122-tx2
	(MessageSwitch) id 1349226021452704_23319;
	Wed,  3 Oct 2012 01:00:21 +0000 (UTC)
Received: from TX2EHSMHS028.bigfish.com (unknown [10.9.14.252])	by
	mail122-tx2.bigfish.com (Postfix) with ESMTP id 6C7404A0045;
	Wed,  3 Oct 2012 01:00:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS028.bigfish.com
	(10.9.99.128) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 3 Oct 2012 01:00:19 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Tue, 2 Oct 2012 20:00:18 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] sstate: Add detail to shared area warning
Thread-Index: AQHNoQJ0s6Ikv2mhPkWwTfWdOF13gg==
Date: Wed, 3 Oct 2012 01:00:18 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6CBAF1@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1349215201-30117-1-git-send-email-sgw@linux.intel.com>
	<1349215253.4422.79.camel@x121e.pbcl.net>
	<20121002221141.GG15881@jama.jama.net> <1349216559.18301.18.camel@ted>
In-Reply-To: <1349216559.18301.18.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Phil Blundell <philb@gnu.org>, Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Add detail to shared area warning
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
X-List-Received-Date: Wed, 03 Oct 2012 01:13:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4330AF8F6B867341A77838058140D71F@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 2, 2012 at 5:22 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-10-03 at 00:11 +0200, Martin Jansa wrote:
>> On Tue, Oct 02, 2012 at 11:00:53PM +0100, Phil Blundell wrote:
>> > On Tue, 2012-10-02 at 15:00 -0700, Saul Wold wrote:
>> > > -        bb.warn("The recipe is trying to install files into a share=
d area when those files already exist. Those files are:\n   %s" % "\n   ".j=
oin(match))
>> > > +        bb.warn("The %s recipe is trying to install files into a sh=
ared area when those files already exist (please fix %s). Those files are:\=
n   %s" % (d.getVar('PN', True), d.getVar('FILE', True), "\n   ".join(match=
)))
>> >
>> > That seems potentially misleading: the file that needs fixing isn't
>> > necessarily the one that triggers this warning.  What would be ideal
>> > would be to have it output the names of all recipes that have tried to
>> > stage the files in question so that the user can make an informed
>> > decision about which one ought to be putting them there.
>>
>> Maybe something like master.list was before
>> http://git.openembedded.org/openembedded-core/commit/?id=3D603daf343ad3f=
18c8adb799e3625ae2a18d94f56
>> with added recipe name, but that doesn't detect files already
>
> We can list any sstate manifest files (tmp/sstate-control) also adding
> that file which may or may not have a listing of it. We might as well
> just grep those files and print matches.
>
> We are not going back to a master.list file, its a performance headache.

I had to do this manually recently, so this error would be very useful ;)

-M=



