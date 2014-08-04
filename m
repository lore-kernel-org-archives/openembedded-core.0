Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id C3687609AC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 05:12:33 +0000 (UTC)
Received: from amavisd-new (mailscanner02.wrt-nm.internl.net [217.149.192.114])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 9C3DD3F76E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 07:12:32 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -4.4
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, KHOP_THREADED=-1.5] autolearn=no
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner02.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 07:12:31 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 07:12:30 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 4 Aug 2014 07:12:40 +0200
Message-ID: <53DF163E.6020807@topic.nl>
Date: Mon, 4 Aug 2014 07:12:30 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <53DE3841.2000305@topic.nl>
	<1407082041.6981.42.camel@ted>	<53DE72CF.5080303@topic.nl>
	<53DE75F2.5070107@topic.nl>
In-Reply-To: <53DE75F2.5070107@topic.nl>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: What does "QA Issue: ... rdepends on .. but its not a build dependency?" mean
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
X-List-Received-Date: Mon, 04 Aug 2014 05:12:40 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 08/03/2014 07:48 PM, Mike Looijmans wrote:
> On 08/03/2014 07:35 PM, Mike Looijmans wrote:
>> On 08/03/2014 06:07 PM, Richard Purdie wrote:
>>> On Sun, 2014-08-03 at 15:25 +0200, Mike Looijmans wrote:
>>>> I'm getting lots of warnings like this:
>>>>
>>>> """
>>>> WARNING: QA Issue: enigma2-plugin-systemplugins-wirelesslan rdepends o=
n
>>>> wireless-tools but its not a build dependency? [build-deps]
>>>> """
>>>>
>>>> What does it actually mean? What does it want me to provide here?
>>>>
>>>> The message in itself is correct. The package only has a runtime
>>>> dependency. It does not require the wireless-tools package to be built
>>>> or otherwise present on the build system. But what is the QA issue her=
e
>>>> and how do I get rid of the message?
>>>
>>> The issue is that if you built an image that just depends on whichever
>>> recipe builds enigma2-plugin-systemplugins-wirelesslan and you try and
>>> install that into an image without something else depending on
>>> wireless-tools, the build will fail.
>>>
>>> Sometimes (like this case) these are genuine runtime dependencies and
>>> you therefore just need to make the dependency visible to bitbake.
>>> Sometimes these can be floating autodetected dependencies which should
>>> wither have been in DEPENDS or turned off with PACKAGECONFIG.
>>>
>>> In this case I'm going to guess that the plugin is part of a
>>> PACKAGES_DYNAMIC and hence bitbake can't see the dependency until its
>>> too late (once the package is built).
>>>
>>> Adding the package name to PACKAGES would probably allow bitbake to
>>> "see" it and avoid the problem.
>>>
>>> Yes, bitbake could in theory go though all the RDEPENDS/RRECOMMENDS_*
>>> variables and try and guess which ones to look at however it would kill
>>> parsing time :/.
>>
>> And in this particular case, even that would not help - the dependencies
>> are being calculated after the "install" task has completed. There's
>> code in the recipe that parses the output of the plugins and then sets a
>> bunch of RDEPENDS and similar values for the package.
>>
>> I think the easy workaround here would be to just add it to the DEPENDS
>> list - this particular recipe has been ported along from ancient OE, and
>> it already has to wait for tons of other things, because it builds about
>> a hundres useless plugins. The newer plugin recipes tend to have a
>> recipe each, so they don't cause this kind of problems.
>
> Hmm, that did NOT work. I added everything it warned about to the DEPENDS
> list, but it did not make a difference. I still got the warnings.

Interestingly, the result of fixing this warning - now that I grasp its=20
meaning - is quite good. It turned out that three of these plugins depended=
 on=20
packages that could not be built. The others that triggered this warning no=
w=20
have their RDEPENDS listed in the main recipe, and the build nicely include=
s=20
the depended upon packages, solving both the warning and the potential prob=
lem=20
it signals.

I think the warning message should be expanded with a little explanation=20
though. It clearly states what the situation is, it just doesn't say anythi=
ng=20
about what's wrong with that situation. Although googling on it will now=20
likely lead to this thread and explain it...

Mike.


Met vriendelijke groet / kind regards,

Mike Looijmans

TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Topic zoekt FPGA experts
http://topic.nl/vacatures/word-jij-onze-nieuwe-fpga-expert/


