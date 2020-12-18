Received: from mailout01.rmx.de (mailout01.rmx.de [94.199.90.91])
 by mx.groups.io with SMTP id smtpd.web12.8468.1608291024667642870
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 03:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.90.91, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout01.rmx.de (Postfix) with ESMTPS id 4Cy69S0DV2z2SXwt;
	Fri, 18 Dec 2020 12:30:20 +0100 (CET)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 4Cy69R0qhfz2TTFb;
	Fri, 18 Dec 2020 12:30:19 +0100 (CET)
Received: from n95hx1g2.localnet (192.168.54.185) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 18 Dec
 2020 12:30:18 +0100
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>, Christopher Larson <kergoth@gmail.com>
Subject: Re: [OE-core] [SDK] How to use the gold linker
Date: Fri, 18 Dec 2020 12:30:17 +0100
Message-ID: <1664221.2vONSAOZnb@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <074c7da4-c8d0-680d-d33d-476dcc51c5b7@gmail.com>
References: <5776519.IOBmFsySL6@n95hx1g2> <CABcZAN=QdWzV=LObrdHMWfcDx_1VV3Ce-i_nYL3H7WYUcCtSSA@mail.gmail.com> <074c7da4-c8d0-680d-d33d-476dcc51c5b7@gmail.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.185]
X-RMX-ID: 20201218-123019-DqjmHDKkCVpQ-0@out02.hq
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi Khem, hi Christopher,

On Tuesday, 15 December 2020, 18:15:52 CET, Khem Raj wrote:
>
> On 12/15/20 8:50 AM, Christopher Larson wrote:
> > This can be fixed via two changes, first removing real-ld, then adding
> > the missing links to fix -fuse-ld=3D. I have this in one of my
> > not-yet-submitted bbappends:
> >
> >      # Remove real-ld, as it prevents checking for ld or gold in the
> > search path
> >      rm -f ${dest}real-ld$suffix
> >      # Then add links to fix builds with -fuse-ld=3D
> >      ln -sf ${BINRELPATH}/${TARGET_PREFIX}ld.gold$suffix
> > ${dest}ld.gold$suffix
> >      ln -sf ${BINRELPATH}/${TARGET_PREFIX}ld.bfd$suffix ${dest}ld.bfd$s=
uffix
> >
>
> right this looks ok. Can you submit this for upstreaming please

while this change works "fine for me" (I can now use ld.gold which is about
3 times faster for my project), there are side effects:

> ${CC} -fuse-ld=3Dbfd -print-prog-name=3Dld
/opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-lin=
ux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/ld.bfd

> ${CC} -fuse-ld=3Dbfd -o test test.c
works fine

> ${CC} -fuse-ld=3Dgold -print-prog-name=3Dld
/opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-lin=
ux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/ld.gold

> ${CC} -fuse-ld=3Dgold -o test test.c
also works fine

> ${CC} print-prog-name=3Dld
/opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-lin=
ux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/ld

> ${CC} -o test test.c
collect2: fatal error: cannot find =E2=80=98ld=E2=80=99
compilation terminated.

> ls -l /opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-=
poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/ld
/opt/poky-tiny/3.1.4/sysroots/x86_64-pokysdk-linux/usr/libexec/arm-poky-lin=
ux-gnueabi/gcc/arm-poky-linux-gnueabi/9.3.0/ld -> ../../../../../bin/arm-po=
ky-linux-gnueabi/arm-poky-linux-gnueabi-ld



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
