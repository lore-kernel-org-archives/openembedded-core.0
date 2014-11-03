Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 39AD560169
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 14:11:45 +0000 (UTC)
Received: from amavisd-new (mailscanner02.wrt-nm.internl.net [217.149.192.114])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 0A51A3F4BB;
	Mon,  3 Nov 2014 15:11:45 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -0.5
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 tagged_above=-999 required=4.5
	tests=[BAYES_05=-0.5] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner02.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Mon,  3 Nov 2014 15:11:44 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Mon,  3 Nov 2014 15:11:43 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 3 Nov 2014 15:11:58 +0100
Message-ID: <54578D1E.2060206@topic.nl>
Date: Mon, 3 Nov 2014 15:11:42 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <5452486B.6070303@topic.nl>
	<1414691238.7649.70.camel@ted>			<545750AE.6080300@topic.nl>
	<1415009059.5111.5.camel@ted>	 <54575DC6.8040403@topic.nl>
	<54576864.3060507@topic.nl> <1415016563.5111.8.camel@ted>
In-Reply-To: <1415016563.5111.8.camel@ted>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Weird ALTERNATIVES and staging conflict.
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
X-List-Received-Date: Mon, 03 Nov 2014 14:11:53 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 11/03/2014 01:09 PM, Richard Purdie wrote:
> On Mon, 2014-11-03 at 12:35 +0100, Mike Looijmans wrote:
>> =EF=BB=BFOn 11/03/2014 11:49 AM, Mike Looijmans wrote:
>>> On 11/03/2014 11:04 AM, Richard Purdie wrote:
>>>> On Mon, 2014-11-03 at 10:53 +0100, Mike Looijmans wrote:
>>>>> =EF=BB=BFOn 10/30/2014 06:47 PM, Richard Purdie wrote:
>>>>>> On Thu, 2014-10-30 at 15:17 +0100, Mike Looijmans wrote:
>>>>>>> =EF=BB=BFI have this base script that builds FPGA bitstreams:
>>>>>>>
>>>>>>> https://github.com/topic-embedded-products/meta-topic/blob/master/r=
ecipes-bsp/fpga/fpga-image.inc
>>>>>>>
>>>>>>>
>>>>>>> Now you can have multiple recipes using it, and as such, it seemed =
a good
>>>>>>> idea
>>>>>>> to add these lines to that recipe:
>>>>>>>
>>>>>>> +ALTERNATIVE_${PN} =3D "fpga.bin bitstreams"
>>>>>>> +ALTERNATIVE_LINK_NAME[fpga.bin] =3D "${datadir}/fpga.bin"
>>>>>>> +ALTERNATIVE_TARGET[fpga.bin] =3D "${datadir}/fpga.bin"
>>>>>>> +ALTERNATIVE_LINK_NAME[bitstreams] =3D "${datadir}/bitstreams"
>>>>>>> +ALTERNATIVE_TARGET[bitstreams] =3D "${datadir}/bitstreams"
>>>>>>>
>>>>>>>
>>>>>>> This still resulted in staging conflicts.
>>>>>>
>>>>>> This isn't surprising since update-alternatives only works for targe=
t
>>>>>> systems. It is not designed for operating on the sysroot.
>>>>>
>>>>> I don't want these files in sysroot, I want them on target only.
>>>>
>>>> Ok, that makes things much easier.
>>>>
>>>>>>> But looking at the contents of the fake packages, the fpga.bin has =
been
>>>>>>> renamed by alternatives (as expected), and the symlink will be crea=
ted after
>>>>>>> installing, so how come I still get this?
>>>>>>
>>>>>> The "staging" code uses the output of do_install directly and does
>>>>>> different things to the packaging code path. We've never had someone
>>>>>> with this problem before. Binaries in *bindir only get installed int=
o
>>>>>> the sysroot in the -native case.
>>>>>>
>>>>>> I appreciate that tells you why it doesn't work and not how to fix i=
t
>>>>>> but hopefully that helps a bit.
>>>>>
>>>>> If I understand you correctly, the problem is that the recipe is tryi=
ng to
>>>>> install things in sysroot?
>>>>
>>>> Correct, by default ${datadir} is staged. The easiest way to handle th=
is
>>>> may be to define your own sysroot_stage_all function (or
>>>> sysroot_stage_dirs) which just stages what you need, if anything.
>>>
>>> In other words, make  sysroot_stage_all into a no-op?
>>>
>>> I've been looking at the staging.bbclass, but that's basically the best=
 I can
>>> come up with.
>>
>> Ah, slightly better:
>>
>> # Prevent bitstreams ending up in sysroot.
>> sysroot_stage_dirs_append() {
>> 	rm -rf $to${datadir}/fpga.bin $to${datadir}/bitstreams
>> }
>>
>> This wastes a bit (installing multimegabyte bitstreams only to remove th=
em)
>> but it won't interfere with recipes that do wish to install things in sy=
sroot.
>>
>> I've tested with this now, and this appears to do exactly as I wanted.
>
> That is fine and perfectly acceptable. Just to be clear, you can also
> do:
>
> sysroot_stage_all() {
> 	:
> }
>
> in your recipe and it will only affect that recipe, not all recipes.

It's slowly growing into a more of a class. This particular file gets inclu=
ded=20
by all FPGA image recipes (which is why I needed the alternatives mechanism=
),=20
so in my particular case, any change here affects a dozen actual packages.




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


