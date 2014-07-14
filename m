Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 1371170436
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 13:06:32 +0000 (UTC)
Received: from amavisd-new (mailscanner05.wrt-nm.internl.net [217.149.192.128])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 4C437401C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 15:06:33 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: 0.8
X-Spam-Level: 
X-Spam-Status: No, score=0.8 tagged_above=-999 required=4.5
	tests=[BAYES_50=0.8] autolearn=no
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner05.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 15:06:32 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 15:06:32 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 14 Jul 2014 15:06:40 +0200
Message-ID: <53C3D5D7.5090309@topic.nl>
Date: Mon, 14 Jul 2014 15:06:31 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <53C3C7E8.2000806@topic.nl>
In-Reply-To: <53C3C7E8.2000806@topic.nl>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: UBI filesystem creation fails silently with 4k erase size
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
X-List-Received-Date: Mon, 14 Jul 2014 13:06:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 07/14/2014 02:07 PM, Mike Looijmans wrote:
> I have a NOR chip that reports a 4k erase size, so in my machine.conf I e=
ntered:
>
> MKUBIFS_ARGS =3D "-m 1 -e 3968 -c 7040"
> UBINIZE_ARGS =3D "-m 1 -p 4096"
> UBI_VOLNAME =3D "qspi-rootfs"
>
>
> When I create an image with "ubi" in the IMAGE_FSTYPES, the build runs an=
d
> does not report any error, however it did NOT create the ubi filesystem i=
mage.
>
> If I change the parameters for a 64k flash using:
>
> MKUBIFS_ARGS =3D "-m 1 -e 65408 -c 440"
>
> the ubi filesystem is created (both ubifs and ubi files).
>
>
> Where can I find what went wrong? I'd expect big read error messages tell=
ing
> me that it failed to create an image for my device, but I cannot find suc=
h
> message anywhere.
>
> So my questions are:
>
> 1) Why is there no error message when image creation fails?
> 2) Where is the log/output from the mkfs.ubi commands?
> 2) What could be wrong with my mkubifs parameters?
>

The answer to that last question is that UBI itself refuses to work with a=
=20
sector size below 15kB. Which results in UBI now failing to work on most NO=
R=20
chips on the market because the kernel recently uses 4k erasing for all ser=
ial=20
flash chips that support it.

So just the question remains why OE doesn't tell me about mkfs.ubifs failur=
e?

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


