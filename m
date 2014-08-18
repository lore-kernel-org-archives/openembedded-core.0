Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id D1301617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 08:12:49 +0000 (UTC)
Received: from amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.58])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 9AD1A3F742
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 10:12:49 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -0.5
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 tagged_above=-999 required=4.5
	tests=[BAYES_05=-0.5] autolearn=no
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 10:12:49 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 10:12:47 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 18 Aug 2014 10:12:57 +0200
Message-ID: <53F1B57E.3040902@topic.nl>
Date: Mon, 18 Aug 2014 10:12:46 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "OE Core (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
References: <53843793.3030309@topic.nl>
In-Reply-To: <53843793.3030309@topic.nl>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: How to find out why shared sstate is not being used for a recipe
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
X-List-Received-Date: Mon, 18 Aug 2014 08:12:50 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 05/27/2014 08:58 AM, Mike Looijmans wrote:
> I have a deja-vu feeling about this question.
>
> I have this recipe:
>
> https://github.com/topic-embedded-products/meta-topic/blob/master/recipes=
-bsp/fpga/fpga-image-miami.bb
>
>
> Which includes this one:
> https://github.com/topic-embedded-products/meta-topic/blob/master/recipes=
-bsp/fpga/fpga-image.inc
>
>
> I have a build server that exports its sstate-cache directory through HTT=
P,
> and a local host that attempts to use that sstate-cache. This works fine,
> except for the recipe above. Building this recipe takes about 1 hour, so =
i
> really really really want to share that state at any cost. As you can see=
,
> I've done a big shotgun blast of "vardepdsexclude" to get the recipe to b=
e as
> common as possible. Still any host wants to build its own version.
>

I recently figured out the cause of this:

LIC_FILES_CHKSUM =3D=20
"file://${META_ZYNQ_BASE}/COPYING;md5=3D751419260aa954499f7abaabaa882bbe"

The META_ZYNQ_BASE variable is set to the overlay path in the layer.conf fi=
le.=20
This path varies on different machines.

I added the following line to layer.conf to prevent this from happening:
META_ZYNQ_BASE[vardepvalue] =3D "meta-zynq"

This triggered a rebuild of all pacakges that I've seen to have this sstate=
=20
problem, thereby confirming that this really was the cause.

It DID surprise me that the LIC_FILES_CHKSUM full path filename somehow end=
ed=20
up in the hash for the package's contents. It would have been better to onl=
y=20
include the license contents itself (or its checksum).

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

Bezoek ons op 9 en 10 september tijdens Technology for Health Den Bosch (st=
and 53)
http://www.technologyforhealth.nl


