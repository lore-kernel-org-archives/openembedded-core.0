Return-Path: <prvs=904257fbf=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 708 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 08 Jan 2019 11:14:27 UTC
Received: from esa8.bmw.c3s2.iphmx.com (esa8.bmw.c3s2.iphmx.com
	[68.232.139.97])
	by mail.openembedded.org (Postfix) with ESMTP id 2ACB76D9B6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 11:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1546946071; x=1578482071;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=OeeoruF2kemK5iPNc0jH9OTU23yW1f/69l68BiIur9M=;
	b=RU/N4iMx3+SBUA8dwwQ8Y3x5olAobLwGOv0eGHxzuKKJRN6s94JO4yXj
	8wJkjcWDIkLnU3i1ksseqOez1cD7Wl93bpFoHdGu/dIEcikr7OrUHEJ+a
	cChtj5epWHEE48Co0H9IxH05R3s0Fmcpx397dWbP67eE5x8PLcxbugd/n M=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa8.bmw.c3s2.iphmx.com with ESMTP/TLS; 08 Jan 2019 12:02:25 +0100
Received: from esabb6.muc ([160.50.100.50])  by esagw4.muc with ESMTP/TLS;
	08 Jan 2019 12:02:23 +0100
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb6.muc with ESMTP/TLS; 08 Jan 2019 12:02:22 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Tue, 8 Jan 2019 12:02:21 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1395.000;
	Tue, 8 Jan 2019 12:02:21 +0100
From: <Mikko.Rapeli@bmw.de>
To: <jacob.kroon@gmail.com>
Thread-Topic: [OE-core] [RFC][PATCH 2/2] buildhistory: support generating
	md5sum of files
Thread-Index: AQHUpz12xOAdBNAhIECOjxwauER7oaWlHMIAgAAHQIA=
Date: Tue, 8 Jan 2019 11:02:21 +0000
Message-ID: <20190108110221.GY7349@hiutale>
References: <20190106181350.25386-1-jacob.kroon@gmail.com>
	<20190106181350.25386-2-jacob.kroon@gmail.com>
	<CAPbeDCm=0X_8cN6_WCexaLBNcYrVv3zT_27g8uXW_eh-iGc=TA@mail.gmail.com>
	<20190108103232.GS7349@hiutale>
	<CAPbeDC=Nk0MD1Z+q0ss5TKGibPcrK335FiTr_V9qr_E_6e7OCA@mail.gmail.com>
In-Reply-To: <CAPbeDC=Nk0MD1Z+q0ss5TKGibPcrK335FiTr_V9qr_E_6e7OCA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.33]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 2/2] buildhistory: support generating md5sum of files
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
X-List-Received-Date: Tue, 08 Jan 2019 11:14:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ED4BE2251551904F951890FC38F6E2E8@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 08, 2019 at 11:36:24AM +0100, Jacob Kroon wrote:
> On Tue, Jan 8, 2019 at 11:32 AM <Mikko.Rapeli@bmw.de> wrote:
> >
> > On Mon, Jan 07, 2019 at 03:17:00PM +0100, Jacob Kroon wrote:
> > > On Sun, Jan 6, 2019 at 7:14 PM Jacob Kroon <jacob.kroon@gmail.com> wr=
ote:
> > > >
> > > > Introduce 'md5' in BUILDHISTORY_FEATURES and enable it by default
> > > > when doing reproducible builds.
> > > >
> > > > When enabled this will additionally create:
> > > >
> > > >   files-in-package-md5.txt
> > > >   files-in-image-md5.txt
> > > >   files-in-sdk-md5.txt
> > > >
> > > > containing the md5 checksums of regular files.
> > > >
> > > > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> > > > ---
> > > >  meta/classes/buildhistory.bbclass | 10 ++++++++--
> > > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/build=
history.bbclass
> > > > index 33eb1b00f6..00f0701dec 100644
> > > > --- a/meta/classes/buildhistory.bbclass
> > > > +++ b/meta/classes/buildhistory.bbclass
> > > > @@ -7,7 +7,8 @@
> > > >  # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
> > > >  #
> > > >
> > > > -BUILDHISTORY_FEATURES ?=3D "image package sdk"
> > > > +BUILDHISTORY_FEATURES ?=3D "image package sdk \
> > > > +  ${@ "md5" if bb.utils.to_boolean(d.getVar('BUILD_REPRODUCIBLE_BI=
NARIES')) else ""}"
> > > >  BUILDHISTORY_DIR ?=3D "${TOPDIR}/buildhistory"
> > > >  BUILDHISTORY_DIR_IMAGE =3D "${BUILDHISTORY_DIR}/images/${MACHINE_A=
RCH}/${TCLIBC}/${IMAGE_BASENAME}"
> > > >  BUILDHISTORY_DIR_PACKAGE =3D "${BUILDHISTORY_DIR}/packages/${MULTI=
MACH_TARGET_SYS}/${PN}"
> > > > @@ -526,7 +527,12 @@ buildhistory_list_files() {
> > > >                 eval ${FAKEROOTENV} ${FAKEROOTCMD} $find_cmd
> > > >         else
> > > >                 eval $find_cmd
> > > > -       fi | sort -k5 | sed 's/ * -> $//' > $2 )
> > > > +       fi | sort -k5 | sed 's/ * -> $//' > $2
> > > > +       if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'md5', =
'1', '0', d)}" =3D "1" ] ; then
> > > > +               md5filename=3D$(echo $2 | sed 's/\.txt$/-md5.txt/')
> > > > +               find -type f | xargs -I{} -n1 md5sum {} | sort -k2 =
> $md5filename
> > > > +               [ -s $md5filename ] || rm $md5filename # remove res=
ult if empty
> > >
> > > I added this remove because I thought it didn't make sense to keep
> > > empty files around, but I now realize that the "files-in-package.txt"
> > > file is kept around, even if empty. Is there a preference on what to
> > > do here ?
> >
> > FWIW, I'm wiping the all buildhistory data with external scripts before=
 doing a
> > clean build. Basically a "git rm -rf *" in buildhistory directory. Othe=
rwise
> > stale data about images, packages etc which are no longer built remain =
in
> > buildhistory.
>=20
> I think one can also do:
>=20
> BB_ENV_EXTRAWHITE=3DBUILDHISTORY_RESET BUILDHISTORY_RESET=3D1 bitbake <bu=
ild>
>=20
> (see buildhistory.bbclass)

Thanks for the hint!

-Mikko=

