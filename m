Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 781706AFB5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 08:35:57 +0000 (UTC)
Received: from amavisd-new (mailscanner07.wrt-nm.internl.net [217.149.192.117])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id 3F2453F4E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 09:35:57 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner07.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 09:35:56 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 09:35:56 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Thu, 27 Nov 2014 09:36:10 +0100
Message-ID: <5476E26B.80003@topic.nl>
Date: Thu, 27 Nov 2014 09:35:55 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Deployment for machine X will remove its results from machine Y's deploy dir
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
X-List-Received-Date: Thu, 27 Nov 2014 08:36:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFHere's an example recipe to demonstrate the issue. Save it as "dep=
loyme.bb"=20
into a recipe dir. Then build it for two machines. Building it for one mach=
ine=20
will remove it from the deployment directory of the other. This problem has=
=20
been bugging me for months, I had files just "disappear" mysteriously from =
the=20
deploy directory and seemingly random times, and now I finally figured out=
=20
what causes it.

(cut here)

SUMMARY =3D "Demonstrate a bug in OE deployment"
DESCRIPTION =3D "Build this package for a machine X, then look at the image=
's \
  deploy directory. You'll see a deployme.txt there. Now build it for anoth=
er \
  machine, e.g. "Y". The deployme.txt for machine X will have disappeared \
  from the image dir. This appears to be a bug in OE's deployment."
LICENSE =3D "GPLv2"
LIC_FILES_CHKSUM =3D=20
"file://${COREBASE}/LICENSE;md5=3D4d92cd373abda3937c2bc47fbc49d690"

inherit allarch deploy

do_compile () {
	echo "Hello world!" > deployme.txt
}

do_deploy () {
     install -d ${DEPLOYDIR}
     install -m 644 ${B}/deployme.txt ${DEPLOYDIR}/
}

addtask deploy before do_build after do_compile

(cut here)


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


