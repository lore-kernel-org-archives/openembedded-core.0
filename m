Received: from mailout03.rmx.de (mailout03.rmx.de [94.199.88.101])
 by mx.groups.io with SMTP id smtpd.web11.33427.1607944464877040939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 03:14:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.101, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout03.rmx.de (Postfix) with ESMTPS id 4Cvf0r49CJzlZw1
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 12:14:20 +0100 (CET)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 4Cvf0r0Xnzz2xG4
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 12:14:20 +0100 (CET)
Received: from n95hx1g2.localnet (192.168.54.135) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 14 Dec
 2020 12:14:19 +0100
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [SDK] How to use the gold linker
Date: Mon, 14 Dec 2020 12:14:18 +0100
Message-ID: <5776519.IOBmFsySL6@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
MIME-Version: 1.0
X-Originating-IP: [192.168.54.135]
X-RMX-ID: 20201214-121420-RvydvkQRnFvs-0@out01.hq
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Branch: dunfell
Arch: arm

When I set -fuse-ld=3Dgold with the Yocto SDK, the bfd linker is used anywa=
y:

> . /opt/poky-tiny/3.1.4/environment-setup-cortexa7t2hf-neon-vfpv4-poky-lin=
ux-musleabi
> ${CC} -fuse-ld=3Dgold -Wl,--threads -o test test.c
/opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-lin=
ux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/real-ld: unrecognized option '-=
-threads'
/opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-lin=
ux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/real-ld: use the --help option =
for usage information

When I call the "real-ld" with -h, I can see that it's the BFD linker.

> ${CC} -print-prog-name=3Dld
/opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-lin=
ux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/ld

> ${CC} -fuse-ld=3Dbfd -print-prog-name=3Dld
ld.bfd

> ${CC} -fuse-ld=3Dgold -print-prog-name=3Dld
ld.gold

Compared to other cross toolchains I use, the output of the previous two co=
mmands
miss the full path to the linker. The gold linker is part of my SDK:

> arm-poky-linux-musleabi-ld.gold --help
Usage: arm-poky-linux-musleabi-ld.gold [options] file...
Options:
  --help                      Report usage information
...

How can I use the gold linker from gcc (without making it default)?

regards
Christian



________________________________
 [http://assets.arri.com/media/sign/2020-04-03-E-mail-signature-Stellar2_V1=
.jpg] <https://microsites.arri.com/stellar/>

Get all the latest information from www.arri.com<https://www.arri.com/>, Fa=
cebook<https://www.facebook.com/TeamARRI>, Twitter<https://twitter.com/ARRI=
Channel>, Instagram<https://instagram.com/arri> and YouTube<https://www.you=
tube.com/user/ARRIChannel>.

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRA 57918
Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik Gmb=
H
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRB 54477
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Neuh=C3=A4user; Stephan Schenk; Walt=
er Trauninger; Markus Zeiler
