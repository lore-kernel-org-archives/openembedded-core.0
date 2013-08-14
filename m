Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 594B560017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 14:32:21 +0000 (UTC)
Received: from amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.96])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 6B3F93F49B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 16:32:20 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -3.418
X-Spam-Level: 
X-Spam-Status: No, score=-3.418 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, KHOP_DYNAMIC2=1, KHOP_THREADED=-1.5,
	RDNS_DYNAMIC=0.982, _DSLHELP01=-1] autolearn=no
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 16:32:19 +0200 (CEST)
Received: from TOP-EX02.topic.local (82-204-13-181.dsl.bbeyond.nl
	[82.204.13.181]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 16:32:19 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (192.168.10.102) by mail.topic.nl
	(192.168.1.103) with Microsoft SMTP Server (TLS) id 14.1.438.0;
	Wed, 14 Aug 2013 16:32:14 +0200
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.1.438.0;
	Wed, 14 Aug 2013 16:32:18 +0200
Message-ID: <520B94F2.8050007@topic.nl>
Date: Wed, 14 Aug 2013 16:32:18 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1376401955-5676-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1376401955-5676-1-git-send-email-otavio@ossystems.com.br>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: How about deploying devicetree (dtb) files?
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
X-List-Received-Date: Wed, 14 Aug 2013 14:32:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFNow that the subject came up, maybe it's good to exchange some ide=
as here.

Building the DTB is one thing. But we have to get it on the target as well.

Currently, a bitbake virtual/kernel will also build one or more dtb=20
files, and put them in the directory where the images will end up. It's=20
up to the user to make it so that the blobs actually get programmed onto=20
the target. Nothing wrong with that.

At some point, I thought it would be a good idea to be able to upgrade=20
boards "in the field". So I added a postinstall script to the kernel to=20
deploy in "/tmp/boot" instead of "/boot" and then make it write itself=20
into the flash device or onto the FAT partition on the SD card, or=20
whatever other method I came up with to load the kernel.

Now for the devicetree, I thought I could just include the=20
"kernel-devicetree" package onto my system, add a bit of script, and=20
that would allow me to have devices upgrade themselves.

The "kernel-devicetree" package contains multiple DTB files. I would=20
expect a target to actually use only one, and that the various dtb files=20
are intended for different targets. I think it would make sense to split=20
that single package into a package for each DTB file. Then you can pick=20
and choose which dtb you want on your target.

Another issue is that the kernel-devicetree package postinstall script=20
calls "awk" and "update-alternatives". Those must therefore be present=20
on the target, if you expect to be able to install or upgrade it. As far=20
as I can see, the only reason for using these tools is to create a=20
symbolic link. As far as I know, no other package provides a dtb file.=20
So why is it registering itself as an alternative?

And I was just wondering, how do you guys handle upgrading kernel,=20
bootloader and devicetree files?


Met vriendelijke groet / kind regards,

Mike Looijmans

TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) =E2=80=93 (0)499 - 33.69.79
Telefax: (+31) - (0)499 - 33.69.70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Dit e-mail bericht en de eventueel daarbij behorende bijlagen zijn uitsluit=
end bestemd voor de geadresseerde, zoals die blijkt uit het e-mail bericht =
en/of de bijlagen. Er kunnen gegevens met betrekking tot een derde instaan.=
 Indien u als niet-geadresseerde dit bericht en de bijlagen ontvangt, terwi=
jl u niet bevoegd of gemachtigd bent om dit bericht namens de geadresseerde=
 te ontvangen, wordt u verzocht de afzender hierover direct te informeren e=
n het e-mail bericht met de bijlagen te vernietigen. Ieder gebruik van de i=
nhoud van het e-mail bericht, waaronder de daarbij behorende bijlagen, door=
 een ander dan de geadresseerde is onrechtmatig jegens ons dan wel de event=
ueel in het e-mail bericht of de bijlagen voorkomende andere personen. TOPI=
C Embedded Systems is niet aansprakelijk voor enigerlei schade voortvloeien=
d uit het gebruik en/of acceptatie van dit e-mail bericht of de daarbij beh=
orende bijlagen.

The contents of this message, as well as any enclosures, are addressed pers=
onally to, and thus solely intended for the addressee. They may contain inf=
ormation regarding a third party. A recipient who is neither the addressee,=
 nor empowered to receive this message on behalf of the addressee, is kindl=
y requested to immediately inform the sender of receipt, and to destroy the=
 message and the enclosures. Any use of the contents of this message and/or=
 the enclosures by any other person than the addressee or person who is emp=
owered to receive this message, is illegal towards the sender and/or the af=
orementioned third party. TOPIC Embedded Systems is not  liable for any dam=
age as a result of the use and/or acceptance of this message and as well as=
 any enclosures.

