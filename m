Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03541C433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 14:24:52 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.13343.1633011890910621300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 07:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 12863240002;
	Thu, 30 Sep 2021 14:24:47 +0000 (UTC)
Message-ID: <3be903c7aa7c2008120121d68662e43ad6b380df.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] ruby: fix the reproducibility issue
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Thu, 30 Sep 2021 16:24:47 +0200
In-Reply-To: 
 <CANNYZj8ho6hhP4W2oFoQpP5rsqroG9Cww27JABKYcfJKiZck5g@mail.gmail.com>
References: <20210930140424.438761-1-thomas.perrot@bootlin.com>
	 <CANNYZj8ho6hhP4W2oFoQpP5rsqroG9Cww27JABKYcfJKiZck5g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-NnvkcLjqEx55V7BO1DvV"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 14:24:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156501


--=-NnvkcLjqEx55V7BO1DvV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, 2021-09-30 at 16:12 +0200, Alexander Kanavin wrote:
> Does this mean ruby can be dropped from reproducibility exception
> list?
>=20

I think so, but it would be nice to run some additional build tests on
autobuilder before, because it's not often obvious to reproduce this
kind of issue locally.

Best regards,
Thomas

> Alex
>=20
> On Thu, 30 Sept 2021 at 16:04, Thomas Perrot <
> thomas.perrot@bootlin.com> wrote:
> > Apply some changes on the Ruby makefiles in order to fix the
> > reproducibility:
> > - use a fixed timestamp,
> > - sort linked objects,
> > - doesn't use the current date,
> > - and use UTC date.
> >=20
> > [YOCTO #14268]
> >=20
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> > =C2=A0...doc-build-reproducible-documentation.patch | 35 ++++++++++
> > =C2=A0...-list-of-object-files-in-generated-M.patch | 28 ++++++++
> > =C2=A0...eproducible-change-fixing-784225-too.patch | 28 ++++++++
> > =C2=A0.../0006-Make-gemspecs-reproducible.patch=C2=A0 =C2=A0 =C2=A0| 67
> > +++++++++++++++++++
> > =C2=A0meta/recipes-devtools/ruby/ruby_3.0.2.bb=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 4 ++
> > =C2=A05 files changed, 162 insertions(+)
> > =C2=A0create mode 100644 meta/recipes-devtools/ruby/ruby/0003-rdoc-
> > build-
> > reproducible-documentation.patch
> > =C2=A0create mode 100644 meta/recipes-devtools/ruby/ruby/0004-lib-
> > mkmf.rb-
> > sort-list-of-object-files-in-generated-M.patch
> > =C2=A0create mode 100644 meta/recipes-devtools/ruby/ruby/0005-Mark-
> > Gemspec-reproducible-change-fixing-784225-too.patch
> > =C2=A0create mode 100644 meta/recipes-devtools/ruby/ruby/0006-Make-
> > gemspecs-reproducible.patch
> >=20
> > diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-
> > reproducible-documentation.patch b/meta/recipes-
> > devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
> > new file mode 100644
> > index 000000000000..f92f0e1ba683
> > --- /dev/null
> > +++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-
> > documentation.patch
> > @@ -0,0 +1,35 @@
> > +From: Christian Hofstaedtler <zeha@debian.org>
> > +Date: Tue, 10 Oct 2017 15:04:34 -0300
> > +Subject: rdoc: build reproducible documentation
> > +
> > +- provide a fixed timestamp to the gzip compression
> > +
> > +Upstream-Status: Backport [debian]
> > +
> > +Signed-off-by: Antonio Terceiro <terceiro@debian.org>
> > +Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
> > +---
> > + lib/rdoc/generator/json_index.rb | 4 ++--
> > + lib/rdoc/rdoc.rb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-
> > + 2 files changed, 3 insertions(+), 3 deletions(-)
> > +
> > +--- a/lib/rdoc/generator/json_index.rb
> > ++++ b/lib/rdoc/generator/json_index.rb
> > +@@ -178,7 +178,7 @@
> > +=C2=A0 =C2=A0 =C2=A0debug_msg "Writing gzipped search index to %s" % o=
utfile
> > +
> > +=C2=A0 =C2=A0 =C2=A0Zlib::GzipWriter.open(outfile) do |gz|
> > +-=C2=A0 =C2=A0 =C2=A0 gz.mtime =3D File.mtime(search_index_file)
> > ++=C2=A0 =C2=A0 =C2=A0 gz.mtime =3D -1
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0gz.orig_name =3D search_index_file.basename=
.to_s
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0gz.write search_index
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0gz.close
> > +@@ -196,7 +196,7 @@
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debug_msg "Writing gzipped file to %=
s" % outfile
> > +
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Zlib::GzipWriter.open(outfile) do |g=
z|
> > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gz.mtime =3D File.mtime(dest)
> > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gz.mtime =3D -1
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gz.orig_name =3D dest.basenam=
e.to_s
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gz.write data
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gz.close
> > diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-
> > list-of-object-files-in-generated-M.patch b/meta/recipes-
> > devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-
> > generated-M.patch
> > new file mode 100644
> > index 000000000000..e0aca0dcfc10
> > --- /dev/null
> > +++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-
> > of-
> > object-files-in-generated-M.patch
> > @@ -0,0 +1,28 @@
> > +From: Reiner Herrmann <reiner@reiner-h.de>
> > +Date: Tue, 10 Oct 2017 15:06:13 -0300
> > +Subject: lib/mkmf.rb: sort list of object files in generated
> > Makefile
> > +
> > +Without sorting the list explicitly, its order is indeterministic,
> > +because readdir() is also not deterministic.
> > +When the list of object files varies between builds, they are
> > linked
> > +in a different order, which results in an unreproducible build.
> > +
> > +Upstream-Status: Backport [debian]
> > +
> > +Signed-off-by: Antonio Terceiro <terceiro@debian.org>
> > +Signed-off-by: Reiner Herrmann <reiner@reiner-h.de>
> > +---
> > + lib/mkmf.rb | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +--- a/lib/mkmf.rb
> > ++++ b/lib/mkmf.rb
> > +@@ -2315,7 +2315,7 @@
> > + LIBS =3D #{$LIBRUBYARG} #{$libs} #{$LIBS}
> > + ORIG_SRCS =3D #{orig_srcs.collect(&File.method(:basename)).join('
> > ')}
> > + SRCS =3D $(ORIG_SRCS) #{(srcs -
> > orig_srcs).collect(&File.method(:basename)).join(' ')}
> > +-OBJS =3D #{$objs.join(" ")}
> > ++OBJS =3D #{$objs.sort.join(" ")}
> > + HDRS =3D #{hdrs.map{|h| '$(srcdir)/' + File.basename(h)}.join(' ')}
> > + LOCAL_HDRS =3D #{$headers.join(' ')}
> > + TARGET =3D #{target}
> > diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-
> > reproducible-change-fixing-784225-too.patch b/meta/recipes-
> > devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-
> > 784225-too.patch
> > new file mode 100644
> > index 000000000000..b7faa58655b2
> > --- /dev/null
> > +++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-
> > reproducible-
> > change-fixing-784225-too.patch
> > @@ -0,0 +1,28 @@
> > +From: Christian Hofstaedtler <zeha@debian.org>
> > +Date: Tue, 10 Oct 2017 15:07:11 -0300
> > +Subject: Mark Gemspec-reproducible change fixing #784225, too
> > +
> > +I think the UTC date change will fix the Multi-Arch not-same file
> > issue,
> > +too.
> > +
> > +Upstream-Status: Backport [debian]
> > +
> > +Signed-off-by: Antonio Terceiro <terceiro@debian.org>
> > +Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
> > +---
> > + lib/rubygems/specification.rb | 4 +++-
> > + 1 file changed, 3 insertions(+), 1 deletion(-)
> > +
> > +--- a/lib/rubygems/specification.rb
> > ++++ b/lib/rubygems/specification.rb
> > +@@ -1695,7 +1695,9 @@
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise(Ge=
m::InvalidSpecificationException,
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0"invalid date format in specification:
> > #{date.inspect}")
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end
> > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 when Time, DateLike then
> > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 when Time then
> > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Time.utc(date.utc.ye=
ar, date.utc.month,
> > date.utc.day)
> > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 when DateLike then
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Time.utc(date.y=
ear, date.month, date.day)
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TODAY
> > diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-
> > reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-
> > gemspecs-reproducible.patch
> > new file mode 100644
> > index 000000000000..504893b4b4ff
> > --- /dev/null
> > +++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-
> > reproducible.patch
> > @@ -0,0 +1,67 @@
> > +From: Lucas Kanashiro <kanashiro@debian.org>
> > +Date: Fri, 1 Nov 2019 15:25:17 -0300
> > +Subject: Make gemspecs reproducible
> > +
> > +Without an explicit date, they will get the current date and make
> > the
> > +build unreproducible
> > +
> > +Upstream-Status: Backport [debian]
> > +
> > +---
> > + ext/bigdecimal/bigdecimal.gemspec | 1 +
> > + ext/fiddle/fiddle.gemspec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +
> > + ext/io/console/io-console.gemspec | 2 +-
> > + lib/ipaddr.gemspec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 +
> > + lib/rdoc/rdoc.gemspec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 1 +
> > + 5 files changed, 5 insertions(+), 1 deletion(-)
> > +
> > +--- a/ext/bigdecimal/bigdecimal.gemspec
> > ++++ b/ext/bigdecimal/bigdecimal.gemspec
> > +@@ -6,6 +6,7 @@
> > +=C2=A0 =C2=A0s.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "bigdecimal"
> > +=C2=A0 =C2=A0s.version=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D bigdecimal_versio=
n
> > +=C2=A0 =C2=A0s.authors=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ["Kenta Murata", =
"Zachary Scott", "Shigeo
> > Kobayashi"]
> > ++=C2=A0 s.date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D RUBY_RELEASE_DATE
> > +=C2=A0 =C2=A0s.email=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ["mrkn@mrkn.=
jp"]
> > +
> > +=C2=A0 =C2=A0s.summary=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "Arbitrary-precis=
ion decimal floating-point
> > number library."
> > +--- a/ext/fiddle/fiddle.gemspec
> > ++++ b/ext/fiddle/fiddle.gemspec
> > +@@ -8,6 +8,7 @@
> > + Gem::Specification.new do |spec|
> > +=C2=A0 =C2=A0spec.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "fiddle"
> > +=C2=A0 =C2=A0spec.version=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D version_module=
::Fiddle::VERSION
> > ++=C2=A0 spec.date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D RUBY_RELEASE_D=
ATE
> > +=C2=A0 =C2=A0spec.authors=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ["Aaron Patter=
son", "SHIBATA Hiroshi"]
> > +=C2=A0 =C2=A0spec.email=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ["aaron@t=
enderlovemaking.com",
> > "hsbt@ruby-lang.org"]
> > +
> > +--- a/ext/io/console/io-console.gemspec
> > ++++ b/ext/io/console/io-console.gemspec
> > +@@ -4,6 +4,7 @@
> > + Gem::Specification.new do |s|
> > +=C2=A0 =C2=A0s.name =3D "io-console"
> > +=C2=A0 =C2=A0s.version =3D _VERSION
> > ++=C2=A0 s.date =3D RUBY_RELEASE_DATE
> > +=C2=A0 =C2=A0s.summary =3D "Console interface"
> > +=C2=A0 =C2=A0s.email =3D "nobu@ruby-lang.org"
> > +=C2=A0 =C2=A0s.description =3D "add console capabilities to IO instanc=
es."
> > +--- a/lib/ipaddr.gemspec
> > ++++ b/lib/ipaddr.gemspec
> > +@@ -6,6 +6,7 @@
> > + Gem::Specification.new do |spec|
> > +=C2=A0 =C2=A0spec.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "ipaddr"
> > +=C2=A0 =C2=A0spec.version=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.2.2"
> > ++=C2=A0 spec.date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D RUBY_RELEASE_D=
ATE
> > +=C2=A0 =C2=A0spec.authors=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ["Akinori MUSH=
A", "Hajimu UMEMOTO"]
> > +=C2=A0 =C2=A0spec.email=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ["knu@ida=
emons.org", "ume@mahoroba.org"]
> > +
> > +--- a/lib/rdoc/rdoc.gemspec
> > ++++ b/lib/rdoc/rdoc.gemspec
> > +@@ -7,6 +7,7 @@
> > +
> > + Gem::Specification.new do |s|
> > +=C2=A0 =C2=A0s.name =3D "rdoc"
> > ++=C2=A0 s.date =3D RUBY_RELEASE_DATE
> > +=C2=A0 =C2=A0s.version =3D RDoc::VERSION
> > +
> > +=C2=A0 =C2=A0s.authors =3D [
> > diff --git a/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> > b/meta/recipes-
> > devtools/ruby/ruby_3.0.2.bb
> > index 38e594a59ef3..2abf504d91bc 100644
> > --- a/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> > +++ b/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> > @@ -7,6 +7,10 @@ SRC_URI +=3D " \
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=20
> > file://0001-template-Makefile.in-do-not-write-host-cross-
> > cc-item.patch \
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-template-Makefile=
.in-filter-out-f-prefix-
> > map.patch \
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-rdoc-build-reprod=
ucible-documentation.patch
> > \
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-lib-mkmf.rb-sort-=
list-of-object-files-in-
> > generated-M.patch \
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-Mark-Gemspec-repr=
oducible-change-fixing-
> > 784225-too.patch \
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-Make-gemspecs-rep=
roducible.patch \
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> >=20
> > =C2=A0SRC_URI[sha256sum] =3D
> > "5085dee0ad9f06996a8acec7ebea4a8735e6fac22f22e2d98c3f2bc3bef7e6f1"
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#156496):=20
> > https://lists.openembedded.org/g/openembedded-core/message/156496
> > Mute This Topic: https://lists.openembedded.org/mt/85974381/5443093
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:=20
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > thomas.perrot@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-NnvkcLjqEx55V7BO1DvV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmFVyK8ACgkQn8ALBXH+
Cu1AAwv/dzN+Ft4aX/ysKAWJND7mvKyxM4oOxWrvPCSl6AsU869UWjWrPLFrJzjI
dzPv5SSyvkam0NxEMvNXtAfdHpdniIl52uBgNsRJiZYzHBw4kNNypg69rSo/C5rj
Cehrlv23zJTnteXXmP9/DnvqbLKzlZpkLIFYQPNjHo/L7nI1+YVCB/xST9CQPVjT
MtyOYkqrk1m3N2NVOPIWabgq2cVEeA1wbBIiyD/fif1fUV+BMEMKVdBO/ZhQmIf+
8Te4/CQMNg47PN0pAgCbMnoeH/eTwskBk+jJSIRasjujWKQ+2/cZ118kiyGSsbkl
XW08qG/JhMZtxUAnRgmp6dcnXFG5FrQqhxeuIaKC7is5HZj3eD/BFE6m2Vbomkj4
pMiDceU98rrnU6DrSzNT1QXX0njzWbF7cJV4JbzsH8kiwLlGoNNeOzMMBWS52KZ5
IU0dN6J+pi8gado0L1Sx6xn269T58MlIEriFsh9A3vqrhXrtzp1xDuGukCd1p9RH
vbmQ4Z9i
=GQP2
-----END PGP SIGNATURE-----

--=-NnvkcLjqEx55V7BO1DvV--


