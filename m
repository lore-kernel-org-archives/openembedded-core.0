Return-Path: <prvs=904257fbf=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 591 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 08 Jan 2019 10:42:24 UTC
Received: from esa2.bmw.c3s2.iphmx.com (esa2.bmw.c3s2.iphmx.com
	[68.232.133.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9C9F06DA25
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 10:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1546944147; x=1578480147;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=fyTL/Zj1MglqXhfqNyNJyAQOjrSjMT466MOt9jTKjU0=;
	b=e8qat5Zsj5VSFJ2WuWrlTXOsHR14C/iKw638LD243TrptP4xcmnfNe0h
	SvbUrdyITje+wtzYV6CiqwsG/tR2LZDvm9eWKB9p54Zp5EwfAiH/WtaFq
	yz9v9NyVgeg5pQsSFmu36vmXwRbkMwXGJRELXTE1FGLaIWDib0iOdMTfK A=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa2.bmw.c3s2.iphmx.com with ESMTP/TLS; 08 Jan 2019 11:32:34 +0100
Received: from esabb5.muc ([160.50.100.47])  by esagw6.muc with ESMTP/TLS;
	08 Jan 2019 11:32:32 +0100
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb5.muc with ESMTP/TLS; 08 Jan 2019 11:32:32 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Tue, 8 Jan 2019 11:32:32 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1395.000;
	Tue, 8 Jan 2019 11:32:32 +0100
From: <Mikko.Rapeli@bmw.de>
To: <jacob.kroon@gmail.com>
Thread-Topic: [OE-core] [RFC][PATCH 2/2] buildhistory: support generating
	md5sum of files
Thread-Index: AQHUpz12xOAdBNAhIECOjxwauER7oQ==
Date: Tue, 8 Jan 2019 10:32:32 +0000
Message-ID: <20190108103232.GS7349@hiutale>
References: <20190106181350.25386-1-jacob.kroon@gmail.com>
	<20190106181350.25386-2-jacob.kroon@gmail.com>
	<CAPbeDCm=0X_8cN6_WCexaLBNcYrVv3zT_27g8uXW_eh-iGc=TA@mail.gmail.com>
In-Reply-To: <CAPbeDCm=0X_8cN6_WCexaLBNcYrVv3zT_27g8uXW_eh-iGc=TA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.44]
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
X-List-Received-Date: Tue, 08 Jan 2019 10:42:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EA8E9D100D1AD141BC82A6D8C1C54587@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 07, 2019 at 03:17:00PM +0100, Jacob Kroon wrote:
> On Sun, Jan 6, 2019 at 7:14 PM Jacob Kroon <jacob.kroon@gmail.com> wrote:
> >
> > Introduce 'md5' in BUILDHISTORY_FEATURES and enable it by default
> > when doing reproducible builds.
> >
> > When enabled this will additionally create:
> >
> >   files-in-package-md5.txt
> >   files-in-image-md5.txt
> >   files-in-sdk-md5.txt
> >
> > containing the md5 checksums of regular files.
> >
> > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> > ---
> >  meta/classes/buildhistory.bbclass | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhist=
ory.bbclass
> > index 33eb1b00f6..00f0701dec 100644
> > --- a/meta/classes/buildhistory.bbclass
> > +++ b/meta/classes/buildhistory.bbclass
> > @@ -7,7 +7,8 @@
> >  # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
> >  #
> >
> > -BUILDHISTORY_FEATURES ?=3D "image package sdk"
> > +BUILDHISTORY_FEATURES ?=3D "image package sdk \
> > +  ${@ "md5" if bb.utils.to_boolean(d.getVar('BUILD_REPRODUCIBLE_BINARI=
ES')) else ""}"
> >  BUILDHISTORY_DIR ?=3D "${TOPDIR}/buildhistory"
> >  BUILDHISTORY_DIR_IMAGE =3D "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}=
/${TCLIBC}/${IMAGE_BASENAME}"
> >  BUILDHISTORY_DIR_PACKAGE =3D "${BUILDHISTORY_DIR}/packages/${MULTIMACH=
_TARGET_SYS}/${PN}"
> > @@ -526,7 +527,12 @@ buildhistory_list_files() {
> >                 eval ${FAKEROOTENV} ${FAKEROOTCMD} $find_cmd
> >         else
> >                 eval $find_cmd
> > -       fi | sort -k5 | sed 's/ * -> $//' > $2 )
> > +       fi | sort -k5 | sed 's/ * -> $//' > $2
> > +       if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'md5', '1',=
 '0', d)}" =3D "1" ] ; then
> > +               md5filename=3D$(echo $2 | sed 's/\.txt$/-md5.txt/')
> > +               find -type f | xargs -I{} -n1 md5sum {} | sort -k2 > $m=
d5filename
> > +               [ -s $md5filename ] || rm $md5filename # remove result =
if empty
>=20
> I added this remove because I thought it didn't make sense to keep
> empty files around, but I now realize that the "files-in-package.txt"
> file is kept around, even if empty. Is there a preference on what to
> do here ?

FWIW, I'm wiping the all buildhistory data with external scripts before doi=
ng a
clean build. Basically a "git rm -rf *" in buildhistory directory. Otherwis=
e
stale data about images, packages etc which are no longer built remain in
buildhistory.

-Mikko=

