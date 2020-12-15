Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.12299.1608042295158288214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 06:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=du4D2Ug2;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1608042295;
  x=1639578295;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=XcBOpO8iebMHDF4VP8BW+Ht4Z8guyWo4NZA4r2NyY9A=;
  b=du4D2Ug2qWWyPsJzHzr8EzJgGu08hA1jMLJUzdp9BqeZ4BFMCrU1oGqb
   F1PlAoPoHWE+yvNGwyTHOMb7llEz5oArezbWyb4uUS5LRQsKQz8WHEDdR
   rDo95+ppjWSgFvjmzvBbmM8n6Fh7NF/jy/g9FG5h217OHiW9f/Ai5cpxn
   SqcpcY7TzByejzvcm/KGO5bJZhWKUXy78kIxo4+1ly8tY9hAKIdEOmufl
   pZuId5DW/FjIpR1KnexVdvF/BALHbtVN0/2/0T1McVJoCFYYLoXsJqaek
   tcIpoyK4MrKKl3HBuFs4VAose4/eXv3zRSlkaOsKhPiwKMbjTFALb0x2E
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] How to create a directory in multiple packages?
Thread-Topic: [OE-core] How to create a directory in multiple packages?
Thread-Index: AdbSQJc4B4k2YOYSQY+O793Rgwk5dAANN0wAABY9reA=
Date: Tue, 15 Dec 2020 14:24:38 +0000
Message-ID: <503f4c44699844c588fe68cd6e45296b@XBOX03.axis.com>
References: <9f740ac720f742ab869a15de54cf865e@XBOX03.axis.com>
 <6df31263-e880-19a8-10ed-7ec6a8a2b5ba@kernel.crashing.org>
In-Reply-To: <6df31263-e880-19a8-10ed-7ec6a8a2b5ba@kernel.crashing.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Mark Hatle
> Sent: den 15 december 2020 02:02
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] How to create a directory in multiple packages?
>=20
> On 12/14/20 11:43 AM, Peter Kjellerstedt wrote:
> > Say we have a recipe that creates an empty /etc/foo directory. Now we
> > want to add a new file in that directory /etc/foo/bar and package it as
> > ${PN}-bar. This means the creation of the /etc/foo directory is moved
> > from the ${PN} package to the ${PN}-bar package. Is there any way to
> > make ${PN} continue to create an empty /etc/foo, or is the only
> > alternative to introduce an /etc/foo/.dummy and package it in ${PN}?
>=20
> try adjust the order of the PACKAGES variant.  Something like:
>=20
> PACKAGES =3D "${PN}-bar ... ${PN}"
>=20
> FILES_${PN}-bar =3D "/etc/foo/bar"
> FILES_${PN} =3D "/etc/foo"
>=20
> That SHOULD package the file 'bar' in -bar, and the directory in ${PN}.

Unfortunately that does not work (seems bitbake is too smart). What I have=
=20
is basically:

PACKAGE_BEFORE_PN =3D "${PN}-bar"
FILES_${PN} +=3D "${sysconfdir}/foo"
FILES_${PN}-bar =3D "${sysconfdir}/foo/bar"

which results in the following in the spec file:

%files -n foo-bar
%defattr(-,-,-,-)
%dir "/etc"
%dir "/etc/foo"
"/etc/foo/bar"

There is nothing else about /etc or /etc/foo in the spec file.

After delving into the code for at bit, I believe this is due to how=20
populate_packages() works. When it handles the ${PN}-bar package and=20
finds the /etc/foo/bar file, it will also mark /etc and /etc/foo as =20
seen, which means they will not be added to any other package, unless=20
that package has an entry for some other /etc/foo/something file, even=20
if /etc/foo is explicitly listed in, e.g., FILES_${PN}.

So for now, it seems we will have to resort to using a pkg_postinst_${PN}.

> (Some of the people commenting this isn't less then optimal, actually
> it's not that unusual.. Typical case I see is creating a directory in=20
> /var or /usr/share for datafiles and the main package owns the directory,=
=20
> with sub-packages [or other packages] contributing data into that=20
> directory.)

Yes, there are reason why the empty directory needs to be installed as=20
part of the image. Otherwise I would just have used a file in=20
"/usr/lib/tmpfiles.d".

> --Mark
>=20
> > //Peter

//Peter

