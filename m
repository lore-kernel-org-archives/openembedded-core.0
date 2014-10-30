Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id BB42A65D3C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 14:17:18 +0000 (UTC)
Received: from amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.58])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id C15D34013B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 15:17:16 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: 0
X-Spam-Level: 
X-Spam-Status: No, score=0 tagged_above=-999 required=4.5
	tests=[BAYES_20=-0.001, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner06.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 15:17:16 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 15:17:15 +0100 (CET)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Thu, 30 Oct 2014 15:17:30 +0100
Message-ID: <5452486B.6070303@topic.nl>
Date: Thu, 30 Oct 2014 15:17:15 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Weird ALTERNATIVES and staging conflict.
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
X-List-Received-Date: Thu, 30 Oct 2014 14:17:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFI have this base script that builds FPGA bitstreams:

https://github.com/topic-embedded-products/meta-topic/blob/master/recipes-b=
sp/fpga/fpga-image.inc

Now you can have multiple recipes using it, and as such, it seemed a good i=
dea=20
to add these lines to that recipe:

+ALTERNATIVE_${PN} =3D "fpga.bin bitstreams"
+ALTERNATIVE_LINK_NAME[fpga.bin] =3D "${datadir}/fpga.bin"
+ALTERNATIVE_TARGET[fpga.bin] =3D "${datadir}/fpga.bin"
+ALTERNATIVE_LINK_NAME[bitstreams] =3D "${datadir}/bitstreams"
+ALTERNATIVE_TARGET[bitstreams] =3D "${datadir}/bitstreams"


This still resulted in staging conflicts. So I made two simple recipes to=20
demonstrate the problem:

SUMMARY =3D "FPGA bitstream"
XILINX_VIVADO_VERSION =3D "2014.1"
require recipes-bsp/fpga/fpga-image.inc
LICENSE =3D "internal"
LIC_FILES_CHKSUM =3D=20
"file://${METATOPIC_BASE}/LICENSE;md5=3Dcf85de037de7ae12cc2d0059741fdbae"
SRC_URI =3D ""
S =3D "${WORKDIR}"

do_compile() {
	echo "${PN}" > fpga.bit
}
do_convert_bitstreams() {
	ln -f fpga.bit fpga.bin
}


I save this as "fpga-image-fake-one.bb" and "fpga-image-fake-two.bb"

I then create an image that installs them both, and bitbake that image. Thi=
s=20
(still) results in the following error:


ERROR: The recipe fpga-image-fake-two is trying to install files into a sha=
red=20
area when those files already exist. Those files and their manifest locatio=
n are:
=20
/home/mike/zynq_platform/build/tmp-glibc/sysroots/topic-miami-7015/usr/shar=
e/fpga.bin
  Matched in manifest-topic-miami-7015-fpga-image-fake-one.populate_sysroot
Please verify which recipe should provide the above files.



But looking at the contents of the fake packages, the fpga.bin has been=20
renamed by alternatives (as expected), and the symlink will be created afte=
r=20
installing, so how come I still get this?



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


