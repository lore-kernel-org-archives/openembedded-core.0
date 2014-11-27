Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id F198860097
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 08:20:27 +0000 (UTC)
Received: from amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.54])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 100304027D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 09:20:27 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 09:20:26 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 09:20:26 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Thu, 27 Nov 2014 09:20:40 +0100
Message-ID: <5476DEC9.2050908@topic.nl>
Date: Thu, 27 Nov 2014 09:20:25 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <54758D01.3070601@topic.nl>	<12654718.RPpo1aQ4TE@peggleto-mobl5.ger.corp.intel.com>	<5475D3AE.1040803@topic.nl>	<1920393.GFIm8gtWQZ@peggleto-mobl5.ger.corp.intel.com>	<54761F8F.9000400@topic.nl>
	<5476D6F1.3010405@topic.nl>
In-Reply-To: <5476D6F1.3010405@topic.nl>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: Why does building an image for machine X delete the bootloader (and kernel) for machine Y?
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
X-List-Received-Date: Thu, 27 Nov 2014 08:20:30 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 11/27/2014 08:46 AM, Mike Looijmans wrote:
> On 11/26/2014 07:44 PM, Mike Looijmans wrote:
>> On 11/26/2014 03:57 PM, Paul Eggleton wrote:
>>> On Wednesday 26 November 2014 14:20:46 Mike Looijmans wrote:
>>>> On 11/26/2014 12:31 PM, Paul Eggleton wrote:
>>>>> Hi Mike,
>>>>>
>>>>> On Wednesday 26 November 2014 09:19:13 Mike Looijmans wrote:
>>>>>> I do a:
>>>>>>
>>>>>> MACHINE=3DX bitbake my-image
>>>>>>
>>>>>> This DEPENDS on a virtual bootloader, which will produce a BOOT.BIN =
file
>>>>>> in
>>>>>> the deploy directory, which is tmp-glibc/deploy.images/X/
>>>>>>
>>>>>> If I then do a:
>>>>>>
>>>>>> MACHINE=3DY bitbake my-image
>>>>>>
>>>>>> the BOOT.BIN in tmp-glibc/deploy.images/X/ is suddenly gone!
>>>>>>
>>>>>> If i do a
>>>>>>
>>>>>> MACHINE=3DX bitbake my-image
>>>>>>
>>>>>> then the the BOOT.BIN in tmp-glibc/deploy.images/Y/ is suddenly gone=
, and
>>>>>> the one for the X machine appears again. The bootloader recipe is no=
t
>>>>>> being
>>>>>> rebuilt at all.
>>>>>>
>>>>>> The machines have the same MACHINE_ARCH, they differ on only minor p=
oints
>>>>>> (the FPGA).
>>>>>>
>>>>>> What is going on here?
>>>>>
>>>>> I can't be sure, but my guess is the recipe is not marked as being
>>>>> machine-
>>>>> specific (i.e. PACKAGE_ARCH is not set to "${MACHINE_ARCH}" - is that=
 the
>>>>> case?) but there is still some variable dependency on a variable that=
 has
>>>>> a machine-specific value. If it's not obvious from the recipe, check =
if
>>>>> there are two sets of tasks for the bootloader recipe in the sstate
>>>>> cache, and then use bitbake-diffsigs to compare the sigdata/siginfo
>>>>> files.
>>>>
>>>> MACHINE is actually "topic-miami-florida-med-xc7z015" or
>>>> "topic-miami-florida-med-xc7z030"
>>>>
>>>> Both machines have MACHINE_ARCH =3D "topic_miami_florida_med" since th=
ey only
>>>> differ in the FPGA subsystem, but share all the rest (kernel, bootload=
er,
>>>> etc).
>>>>
>>>> Is it forbidden to share $MACHINE_ARCH between $MACHINEs? (And if so, =
why
>>>> does MACHINE_ARCH even exist?)
>>>
>>> I don't know for sure, but I don't think that is forbidden. I'm not sur=
e
>>> that's the issue here though.
>>>
>>>> The BSP layer for the topic-miami machines is here (yes, you can build=
 OE or
>>>> Yocto images with it, but I have yet some more work to do to make it a
>>>> proper BSP...):
>>>> https://github.com/topic-embedded-products/meta-topic
>>>
>>> Is it u-boot that's the actual bootloader we are talking about here?
>>
>> Yep.
>>
>> u-boot-spl to be exact. The BOOT.bin is just one of the files that disap=
pears,
>> it's the firststage loader built by u-boot.
>
> It happens anytime I switch between machines. Building for one will delet=
e the
> files for the other. It will delete all bootloader and kernel files.
>
> Running
> MACHINE=3Dtopic-miami-florida-med-xc7z030 bitbake virtual/kernel -c deplo=
y
> deletes the kernel for the xc7z015, and places it in the xz7z030 deploy d=
ir, and
> MACHINE=3Dtopic-miami-florida-med-xc7z015 bitbake virtual/kernel -c deplo=
y
> does the opposite.
>
> Probably some unforeseen effect of deploy when machines share the same ar=
ch?
>

It's not limited to kernel and bootloader either, it happens for ANY task t=
hat=20
has a "deploy". The deploy task will remove files for another MACHINE, and=
=20
then replace them with its own. It does not take the MACHINE into=20
consideration, even though the deployment directory is specific to a machin=
e=20
(and not just MACHINE_ARCH).

Something similar happens if you create a package that is generic for all=20
machines (PACKAGE_ARCH=3D"all" or so), but needs to be deployed. Building f=
or=20
another machine will remove that package from the previous machine's=20
deployment directory.

Seems to be a bug in OE. I'll create an example recipe to demonstrate it fo=
r=20
any target.




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


