Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id C143865DEB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 09:53:53 +0000 (UTC)
Received: from amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.54])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 198423F8C6;
	Mon,  3 Nov 2014 10:53:52 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -0.499
X-Spam-Level: 
X-Spam-Status: No, score=-0.499 tagged_above=-999 required=4.5
	tests=[BAYES_05=-0.5, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Mon,  3 Nov 2014 10:53:51 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS;
	Mon,  3 Nov 2014 10:53:50 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 3 Nov 2014 10:54:05 +0100
Message-ID: <545750AE.6080300@topic.nl>
Date: Mon, 3 Nov 2014 10:53:50 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <5452486B.6070303@topic.nl> <1414691238.7649.70.camel@ted>
In-Reply-To: <1414691238.7649.70.camel@ted>
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
X-List-Received-Date: Mon, 03 Nov 2014 09:54:00 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 10/30/2014 06:47 PM, Richard Purdie wrote:
> On Thu, 2014-10-30 at 15:17 +0100, Mike Looijmans wrote:
>> =EF=BB=BFI have this base script that builds FPGA bitstreams:
>>
>> https://github.com/topic-embedded-products/meta-topic/blob/master/recipe=
s-bsp/fpga/fpga-image.inc
>>
>> Now you can have multiple recipes using it, and as such, it seemed a goo=
d idea
>> to add these lines to that recipe:
>>
>> +ALTERNATIVE_${PN} =3D "fpga.bin bitstreams"
>> +ALTERNATIVE_LINK_NAME[fpga.bin] =3D "${datadir}/fpga.bin"
>> +ALTERNATIVE_TARGET[fpga.bin] =3D "${datadir}/fpga.bin"
>> +ALTERNATIVE_LINK_NAME[bitstreams] =3D "${datadir}/bitstreams"
>> +ALTERNATIVE_TARGET[bitstreams] =3D "${datadir}/bitstreams"
>>
>>
>> This still resulted in staging conflicts.
>
> This isn't surprising since update-alternatives only works for target
> systems. It is not designed for operating on the sysroot.

I don't want these files in sysroot, I want them on target only.

>> But looking at the contents of the fake packages, the fpga.bin has been
>> renamed by alternatives (as expected), and the symlink will be created a=
fter
>> installing, so how come I still get this?
>
> The "staging" code uses the output of do_install directly and does
> different things to the packaging code path. We've never had someone
> with this problem before. Binaries in *bindir only get installed into
> the sysroot in the -native case.
>
> I appreciate that tells you why it doesn't work and not how to fix it
> but hopefully that helps a bit.

If I understand you correctly, the problem is that the recipe is trying to=
=20
install things in sysroot?



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


