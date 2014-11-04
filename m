Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 92C8A65C87
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 15:05:33 +0000 (UTC)
Received: from amavisd-new (mailscanner07.wrt-nm.internl.net [217.149.192.117])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 2AC5840123;
	Tue,  4 Nov 2014 16:05:32 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner07.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Tue,  4 Nov 2014 16:05:31 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS;
	Tue,  4 Nov 2014 16:05:30 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Tue, 4 Nov 2014 16:05:45 +0100
Message-ID: <5458EB39.5090407@topic.nl>
Date: Tue, 4 Nov 2014 16:05:29 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <5444F848.3040307@topic.nl>	<1413806657.17752.154.camel@ted>	<544502B6.5040808@topic.nl>
	<CAP9ODKoALXOnHWeAPH3FYU6=dyFDvjYrsbOD9cXJyzKD+ayKAQ@mail.gmail.com>
In-Reply-To: <CAP9ODKoALXOnHWeAPH3FYU6=dyFDvjYrsbOD9cXJyzKD+ayKAQ@mail.gmail.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Going beyond MACHINE?
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
X-List-Received-Date: Tue, 04 Nov 2014 15:05:42 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 10/20/2014 03:36 PM, Otavio Salvador wrote:
> On Mon, Oct 20, 2014 at 10:40 AM, Mike Looijmans
> <mike.looijmans@topic.nl> wrote:
>> On 10/20/2014 02:04 PM, Richard Purdie wrote:
>>>
>>> On Mon, 2014-10-20 at 13:55 +0200, Mike Looijmans wrote:
>>>>
>>>> =EF=BB=BFThe short version of my question: Can I define a "level" that=
 goes
>>>> beyond MACHINE?
>>>>
>>>> My problem in detail (and I suspect there are more systems with simila=
r
>>>> problems):
>>>>
>>>> I have an SOC called "topic-miami". There are currently two variants: =
The
>>>> 7015
>>>> and 7030. They are identical but for one component: They have a differ=
ent
>>>> FPGA
>>>> part (the 7030 is bigger and faster).
>>>> Both run exactly the same kernel and bootloader, and all other softwar=
e
>>>> and
>>>> libraries are exactly the same.
>>>>
>>>> Currently I have MACHINE=3D"topic-miami-7015" and then
>>>> SOC_FAMILY=3D"topic-miami"
>>>> so I can use "topic-miami" as override word for all packages.
>>>>
>>>> However, this means I get two kernels, two bootloaders, etc. even thou=
gh
>>>> they
>>>> are exactly the same.
>>>>
>>>> The only package that currently differs is the one that delivers the
>>>> bitstream(s) for the FPGA. These are big, too big to fit bitstreams fo=
r
>>>> both
>>>> models into flash and leave room for applications, so just installing
>>>> both
>>>> into the rootfs and pick the correct one at boot time is not really an
>>>> option.
>>>>
>>>> Maybe I could define some extra PACKAGE_ARCH for the bitstreams (which
>>>> make
>>>> sense, as this is sort of firmware for a different platform). But how
>>>> would a
>>>> user then pick the right value for this variable, since MACHINE seems =
to
>>>> be
>>>> the only thing he can really choose?
>>>>
>>>> Any thoughts and ideas are welcome...
>>>
>>>
>>> One possible solution would be to inject another PACKAGE_ARCH (as the
>>> intel gmgd graphics does for example), then mark the MACHINE specific
>>> packages as being that package architecture. They'd then only get built
>>> once per package architecture yet your bitstreams would still be machin=
e
>>> specific. You could probably do the "remarking" using anonymous python
>>> injected at the machine level.
>>
>>
>> Sounds doable, but I can't find anything about "intel gmgd" in any layer=
.
>> Which machine are you referring to here?
>
> We did something similar in meta-fsl-arm, check:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/classes/fsl-d=
ynamic-packagearch.bbclass
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/conf/machine/=
include/imx-base.inc#n41
>
> This should be easy to adapt for your specific case.

I experimented with both suggestions. The fsl method works well to prevent=
=20
multiple kernels being built for the same machine, but I have to "whitelist=
"=20
packages that I want to change. Since there's only one type of package that=
=20
depends on the last four digits of the machine name, I'm thinking about goi=
ng=20
in a different direction.

I set MACHINE to a pattern like "<SOM>-<CARRIER>-<FPGA>"

Then I split this into MACHINE_ARCH=3D"<SOM>_<CARRIER>", SOM_FAMILY=3D"<SOM=
>" and=20
introduce FPGA_FAMILY=3D"<FPGA>" in the machine.conf file.

Thus, for a topic-miami SOM featuring a 7015 on a florida carrier board, th=
is=20
would result in:

MACHINE =3D "topic-miami-florida-7015"

MACHINE_BOARD =3D "${@'-'.join(d.getVar('MACHINE', True).split('-')[:-1])}"
MACHINE_ARCH =3D "${@'_'.join(d.getVar('MACHINE', True).split('-')[:-1])}"
SOM_FAMILY =3D "${@'-'.join(d.getVar('MACHINE', True).split('-')[:-2])}"
FPGA_FAMILY =3D "${@d.getVar('MACHINE', True).split('-')[-1:]}"

Then add these to the MACHINEOVERRIDES and EXTRA_ARCHS:

MACHINEOVERRIDES .=3D "${SOM_FAMILY}:${MACHINE_BOARD}:{FPGA_FAMILY}:"

PACKAGE_EXTRA_ARCHS_append =3D " ${FPGA_FAMILY}"

That should build machine specific packages by default at the "board" level=
,=20
while the FPGA recipes would specify PACKAGE_ARCH=3D"${FPGA_FAMILY}" and he=
nce=20
get selected based on FPGA type only.

What do you think, should this work (in particular, setting MACHINE_ARCH mi=
ght=20
have unforeseen consequences), or will this leave no survivors?


Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/


