Return-Path: <Arsalan_Awan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0010D60043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 10:46:56 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1gMWDh-0006jG-6Z from Arsalan_Awan@mentor.com ;
	Tue, 13 Nov 2018 02:46:57 -0800
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Tue, 13 Nov 2018 10:46:52 +0000
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1320.000; Tue, 13 Nov 2018 10:46:51 +0000
From: "Awan, Arsalan" <Arsalan_Awan@mentor.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [sumo][PATCH 1/1] wic/isoimage-isohybrid.py: fix
	booting from removable media
Thread-Index: AQHUdNlZ0/EsWKHdbkKTyXY3hxfOM6VNkmD4
Date: Tue, 13 Nov 2018 10:46:51 +0000
Message-ID: <1542106011533.81309@mentor.com>
References: <cover.1541168618.git.Arsalan_Awan@mentor.com>
	<6bf54a814e2aaa03e262aa2edd529405d391ee22.1541168618.git.Arsalan_Awan@mentor.com>,
	<c1316e3a-ec0c-3320-0972-9c7ee532aee8@gmail.com>,
	<1541403256938.5944@mentor.com>
In-Reply-To: <1541403256938.5944@mentor.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
MIME-Version: 1.0
Subject: Re: [sumo][PATCH 1/1] wic/isoimage-isohybrid.py: fix booting from removable media
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
X-List-Received-Date: Tue, 13 Nov 2018 10:46:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

ping=0A=
=0A=
> > Arsalan,=0A=
> >=0A=
> >=0A=
> > On 11/2/18 8:01 AM, Arsalan Awan wrote:=0A=
> > > From: "Arsalan H. Awan" <Arsalan_Awan@mentor.com>=0A=
> > >=0A=
> > > The EFI bootloader name and path for being able to boot from a=0A=
> > > removable storage media - such as USB - must be like:=0A=
> > >=0A=
> > >   /EFI/BOOT/boot<arch>.efi=0A=
> > >   /EFI/BOOT/bootx64.efi=0A=
> > >   /EFI/BOOT/bootia32.efi=0A=
> > >   /EFI/BOOT/bootaa64.efi=0A=
> > >=0A=
> > > otherwise system will not be able to boot from it.=0A=
> >=0A=
> > Is this fixed in Master & Thud ?=0A=
> >=0A=
> > - armin=0A=
> =0A=
> Yes Armin! It is fixed in Thud and Master.=0A=
> =0A=
> -=0A=
> Arsalan=0A=
> =0A=
> >=0A=
> > >=0A=
> > > This commit fixes the grub-efi bootloader destination image name=0A=
> > > accordingly just like efi_populate() function does it in=0A=
> > > meta/classes/grub-efi.bbclass.=0A=
> > >=0A=
> > > Signed-off-by: Arsalan H. Awan <Arsalan_Awan@mentor.com>=0A=
> > > ---=0A=
> > >  scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 4 +++-=0A=
> > >  1 file changed, 3 insertions(+), 1 deletion(-)=0A=
> > >=0A=
> > > diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/s=
cripts/lib/wic/plugins/source/isoimage-isohybrid.py=0A=
> > > index d6bd3bf..9a30713 100644=0A=
> > > --- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py=0A=
> > > +++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py=0A=
> > > @@ -329,13 +329,15 @@ class IsoImagePlugin(SourcePlugin):=0A=
> > >=0A=
> > >                  if re.match("x86_64", target_arch):=0A=
> > >                      grub_image =3D "grub-efi-bootx64.efi"=0A=
> > > +                    grub_image_dst =3D "bootx64.efi"=0A=
> > >                  elif re.match('i.86', target_arch):=0A=
> > >                      grub_image =3D "grub-efi-bootia32.efi"=0A=
> > > +                    grub_image_dst =3D "bootia32.efi"=0A=
> > >                  else:=0A=
> > >                      raise WicError("grub-efi is incompatible with ta=
rget %s" %=0A=
> > >                                     target_arch)=0A=
> > >=0A=
> > > -                grub_target =3D os.path.join(target_dir, grub_image)=
=0A=
> > > +                grub_target =3D os.path.join(target_dir, grub_image_=
dst)=0A=
> > >                  if not os.path.isfile(grub_target):=0A=
> > >                      grub_src =3D os.path.join(deploy_dir, grub_image=
)=0A=
> > >                      if not os.path.exists(grub_src):=0A=

