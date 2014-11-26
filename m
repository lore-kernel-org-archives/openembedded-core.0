Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 2FBA560673
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 13:20:48 +0000 (UTC)
Received: from amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.127])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 0AF843F8B2;
	Wed, 26 Nov 2014 14:20:48 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: sco en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner04.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Wed, 26 Nov 2014 14:20:47 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Wed, 26 Nov 2014 14:20:47 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Wed, 26 Nov 2014 14:21:01 +0100
Message-ID: <5475D3AE.1040803@topic.nl>
Date: Wed, 26 Nov 2014 14:20:46 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <54758D01.3070601@topic.nl>
	<12654718.RPpo1aQ4TE@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <12654718.RPpo1aQ4TE@peggleto-mobl5.ger.corp.intel.com>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Why does building an image for machine X delete the bootloader for machine Y?
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
X-List-Received-Date: Wed, 26 Nov 2014 13:20:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 11/26/2014 12:31 PM, Paul Eggleton wrote:
> Hi Mike,
>
> On Wednesday 26 November 2014 09:19:13 Mike Looijmans wrote:
>> I do a:
>>
>> MACHINE=3DX bitbake my-image
>>
>> This DEPENDS on a virtual bootloader, which will produce a BOOT.BIN file=
 in
>> the deploy directory, which is tmp-glibc/deploy.images/X/
>>
>> If I then do a:
>>
>> MACHINE=3DY bitbake my-image
>>
>> the BOOT.BIN in tmp-glibc/deploy.images/X/ is suddenly gone!
>>
>> If i do a
>>
>> MACHINE=3DX bitbake my-image
>>
>> then the the BOOT.BIN in tmp-glibc/deploy.images/Y/ is suddenly gone, an=
d
>> the one for the X machine appears again. The bootloader recipe is not be=
ing
>> rebuilt at all.
>>
>> The machines have the same MACHINE_ARCH, they differ on only minor point=
s
>> (the FPGA).
>>
>> What is going on here?
>
> I can't be sure, but my guess is the recipe is not marked as being machin=
e-
> specific (i.e. PACKAGE_ARCH is not set to "${MACHINE_ARCH}" - is that the
> case?) but there is still some variable dependency on a variable that has=
 a
> machine-specific value. If it's not obvious from the recipe, check if the=
re are
> two sets of tasks for the bootloader recipe in the sstate cache, and then=
 use
> bitbake-diffsigs to compare the sigdata/siginfo files.

MACHINE is actually "topic-miami-florida-med-xc7z015" or=20
"topic-miami-florida-med-xc7z030"

Both machines have MACHINE_ARCH =3D "topic_miami_florida_med" since they on=
ly=20
differ in the FPGA subsystem, but share all the rest (kernel, bootloader, e=
tc).

Is it forbidden to share $MACHINE_ARCH between $MACHINEs? (And if so, why d=
oes=20
MACHINE_ARCH even exist?)

The BSP layer for the topic-miami machines is here (yes, you can build OE o=
r=20
Yocto images with it, but I have yet some more work to do to make it a prop=
er=20
BSP...):
https://github.com/topic-embedded-products/meta-topic




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


