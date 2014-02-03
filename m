Return-Path: <openembedded-core@emagii.com>
Received: from smtprelay-b21.telenor.se (smtprelay-b21.telenor.se
	[195.54.99.212])
	by mail.openembedded.org (Postfix) with ESMTP id 3F55C6E8B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 21:24:34 +0000 (UTC)
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id 9962AEA6CC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 22:24:33 +0100 (CET)
X-SENDER-IP: [83.227.57.102]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AsIUAM0H8FJT4zlmPGdsb2JhbAANTINEumiDMk+BJQMBAQEBOIJaAQEBAQIBAQEBNzQLBQsLGCMLJwEbFAYTh30NCKsvoigXjjElMweCLw9mgRQElVeCU4EyiR2JQYE/gWc
X-IPAS-Result: AsIUAM0H8FJT4zlmPGdsb2JhbAANTINEumiDMk+BJQMBAQEBOIJaAQEBAQIBAQEBNzQLBQsLGCMLJwEbFAYTh30NCKsvoigXjjElMweCLw9mgRQElVeCU4EyiR2JQYE/gWc
X-IronPort-AV: E=Sophos;i="4.95,774,1384297200"; d="scan'208";a="795295993"
Received: from c-6639e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.117]) ([83.227.57.102])
	by ipb1.telenor.se with ESMTP; 03 Feb 2014 22:24:33 +0100
References: <1390833588.17424.254.camel@ted>
	<BEFD196E-8595-4DD1-BEAD-0183FBB61D55@dominion.thruhere.net>
	<52E8EF66.5040609@emagii.com> <1391000162.24655.67.camel@ted>
	<52ECBCAF.1060403@topic.nl>
In-Reply-To: <52ECBCAF.1060403@topic.nl>
Mime-Version: 1.0 (1.0)
Message-Id: <D4601ED0-3B88-46B4-A507-BACB35D3FBC9@emagii.com>
From: Ulf Samuelsson <openembedded-core@emagii.com>
Date: Mon, 3 Feb 2014 22:23:57 +0100
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Mailer: iPad Mail (9B176)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Mon, 03 Feb 2014 21:24:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable



1 feb 2014 kl. 10:21 skrev Mike Looijmans <mike.looijmans@topic.nl>:

> On 01/29/2014 01:56 PM, Richard Purdie wrote:
>> On Wed, 2014-01-29 at 13:09 +0100, Ulf Samuelsson wrote:
>>> We discussed this 2.3 months ago.
>>> Did some studies on my dual hex-core machine (24 H/W treads) while
>>> building a cloud9-gnome-image derivative.
>>> This did about 7500 tasks.
>>>=20
>>> Enabled the CPU supervisors in the panel.
>>>=20
>>> Everything seems to be ok with BB_NUMBER_THREADS =3D "24" for about 4-45=
00
>>> tasks.
>>>=20
>>> Then the CPUs are mostly inactive and only 1-2 running for ~500 tasks.
>>> Then parallellism  is resumed until about task 7000, and again
>>> only a few CPUs are active.
>>=20
>> This is likely whilst the lib and toolchain is getting built.
>>=20
>>> I believe that some tools use "make" within the Makefile,
>>> and they are written badly, and do not use "-j <n>" for
>>> that part of the build.
>>=20
>> Which recipes were building at this point? It would be interesting to
>> track them down.
>=20
> I would suspect "recursive" makes. If you use autotools with the evil "SUD=
IRS=3D..." construction, it will WAIT for that dir to finish before doing an=
ything else.
> It's much better to construct a giant makefile in the root, autotools will=
 happily do that once properly instructed. I've seen first time builds going=
 from half an hour to two minutes, and incremental builds taking only one or=
 two seconds instead of several minutes just because I removed the recursion=
.
>=20
>>> Got my build down to 83 minutes.
>>>=20
>>> Since I have 96 GB of RAM, I tried creating an 80 GB tmpfs for the build=
,
>>> and copied the download and the recipes to the ram.
>>>=20
>>> That shaved only 2 monutes from the build, and some stuff,
>>> still built using only a single CPU.
>=20
> That confirms what I have already suspected - it is pointless to buy an SS=
D, building OE is mostly CPU limited and hardly I/O related.

To be fair, the 83 minute build was on a RAID with two striped 600 GB, 15k R=
PM, 3 Gbps SAS disks (luckily on the machine I got on eBay :-)
hdparm -t -T give about 390 MB/s.

If I run a single late model SATA-III disk (on a SATA-II) I get 120-150 MB/s=

with the same test.

Using 15k RPM SAS disks will give 2 x the number of seeks per second
vs the SATA disks, (170 vs 85 IIRC)
Using RAID does not increase this value.

>=20
> I guess the only way to really speed up the build would be to have multipl=
e machines participate in it. Single machines aren't really getting any fast=
er.
>=20
>> There are certainly dependency bottlenecks in the build such as the
>> toolchain, compiler, gettext, gtk+ and so where large numbers of things
>> need those dependencies to get built before they can proceed. Not sure
>> what we can do to help this though.
>=20
> Move them to the front as far as possible I guess. And any package they de=
pend on as well... It should try to set up the shortest tree to be able to b=
uild the crosscompiler and build that first...
>=20

If I understand things correctly, bitbake will calculate a priority for a ce=
rtain package based on
how many packages are depending on this package.
If you could add a value to the priority, specified in the recipe
then you could make the build of the package occur earlier.

If bitbakes can track the loading of the CPU, then maybe some parts
in the later part of each recipe can be delayed until loading is low (maybe a=
lready doing this).

If the toolchain/native stuff could be pulled down from packages as part of a=
 build
it would be real cool.
Today you can install cross compilers for certain Linux distributions.
Maybe there should be a possibility to generate automatically the .rpm/.deb e=
tc.
and make that the default way to get stuff done for those distributions.

Best Regards
Ulf Samuelsson


> Mike.
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


