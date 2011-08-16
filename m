Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1QtN6G-0004c3-5s
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 19:06:48 +0200
Received: by vwe42 with SMTP id 42so112470vwe.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 10:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=QG9oh+d8A3aJVe1aQ6BAaVIW33etMPCczTlXRjIwqnM=;
	b=LSN47TrWmgy8BHpcXC49jwXDJuKuG9yQgPycMWj3EoSnlMCizpckYcIGdLUw+zWLvu
	AgC4DmPjMf70oLXvDvrFXYvmxywi7dxm/f/kJTY6gI0PfkJowbIRqMrwQjjtL9hN/akN
	UOMmexTif7SKPV7EFtGwlZ1fG+Qgi0xMIkjlo=
MIME-Version: 1.0
Received: by 10.52.177.101 with SMTP id cp5mr5096205vdc.343.1313514129942;
	Tue, 16 Aug 2011 10:02:09 -0700 (PDT)
Received: by 10.220.210.79 with HTTP; Tue, 16 Aug 2011 10:02:09 -0700 (PDT)
In-Reply-To: <4E4A7FE5.10602@gmail.com>
References: <1313463192-1911-1-git-send-email-aalonso00@gmail.com>
	<4E4A7FE5.10602@gmail.com>
Date: Tue, 16 Aug 2011 12:02:09 -0500
Message-ID: <CAAB-1ywbXiBh0wHqPdPaFVy=eeYMe14H3e4Xk1qzdkQvjn0wMw@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: configure with staging native path for magic file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Aug 2011 17:06:48 -0000
Content-Type: multipart/alternative; boundary=bcaec50164191f67df04aaa257a8

--bcaec50164191f67df04aaa257a8
Content-Type: text/plain; charset=ISO-8859-1

Um you are right target rpm with conflict with the search path for the magic
file

So in order to close bug [1358] either apply first proposed patch [1] or
update
file_5.04.bb to file_5.07.bb that also solves the problem on my F15 dev
machine.

[1] https://lists.yoctoproject.org/pipermail/yocto/2011-August/004486.html
[1358] http://bugzilla.pokylinux.org/show_bug.cgi?id=1358


On Tue, Aug 16, 2011 at 9:34 AM, Khem Raj <raj.khem@gmail.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 08/15/2011 07:53 PM, Adrian Alonso wrote:
> > * Remove hardcoded system path for path-magic file in order to avoid
> > potential mistmatch between host and yocto native tools as reported
> > in yocto mailing list: ---- error: magic_load(ms,
> > /usr/share/misc/magic) failed: File 5.4 supports only version 7 magic
> > files. `/usr/share/misc/magic.mgc' is version 8 ---- * Another
> > solution is to update meta/recipes-devtools/file/file_5.04.bb to a
> > newer version ie. file_5.07.bb
> >
> > Signed-off-by: Adrian Alonso <aalonso00@gmail.com> ---
> > meta/recipes-devtools/rpm/rpm_5.4.0.bb |    4 ++-- 1 files changed, 2
> > insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> > b/meta/recipes-devtools/rpm/rpm_5.4.0.bb index c0e3208..948ed84
> > 100644 --- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb +++
> > b/meta/recipes-devtools/rpm/rpm_5.4.0.bb @@ -45,7 +45,7 @@
> > LIC_FILES_CHKSUM =
> > "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1" DEPENDS =
> > "bzip2 zlib db openssl elfutils expat libpcre attr acl popt
> > ${extrarpmdeps}" extrarpmdeps = "python perl"
> > extrarpmdeps_virtclass-native = "" -PR = "r19" +PR = "r20"
> >
> > # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It
> > is needed # in order to extract the distribution SRPM into a format
> > we can extract... @@ -120,7 +120,7 @@ EXTRA_OECONF = "--verbose \
> > ${WITH_DB} \ ${WITH_Z} \ --with-file \ -
> > --with-path-magic=/usr/share/misc/magic \ +
> > --with-path-magic=${STAGING_DIR_NATIVE}/usr/share/misc/magic.mgc \
>
> this wont work for target rpm I guess
>
> > --without-lua \ --without-tcl \ --with-syck=internal \
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (GNU/Linux)
>
> iEYEARECAAYFAk5Kf+UACgkQuwUzVZGdMxTmPACgiKm1rdoDPbxVdYhHvCqKEyFJ
> 0A4Anjx/BxnCQm6ZiLKGXOrn2nbFHzyS
> =jGQc
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

--bcaec50164191f67df04aaa257a8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Um you are right target rpm with conflict with the search path for the magi=
c file<br><br>So in order to close bug [1358] either apply first proposed p=
atch [1] or update<br><a href=3D"http://file_5.04.bb">file_5.04.bb</a> to <=
a href=3D"http://file_5.07.bb">file_5.07.bb</a> that also solves the proble=
m on my F15 dev machine.<br>
<br>[1] <a href=3D"https://lists.yoctoproject.org/pipermail/yocto/2011-Augu=
st/004486.html">https://lists.yoctoproject.org/pipermail/yocto/2011-August/=
004486.html</a><br>[1358] <a href=3D"http://bugzilla.pokylinux.org/show_bug=
.cgi?id=3D1358">http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1358</a><br=
>
=A0<br><br><div class=3D"gmail_quote">On Tue, Aug 16, 2011 at 9:34 AM, Khem=
 Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
-----BEGIN PGP SIGNED MESSAGE-----<br>
Hash: SHA1<br>
<div><div></div><div class=3D"h5"><br>
On 08/15/2011 07:53 PM, Adrian Alonso wrote:<br>
&gt; * Remove hardcoded system path for path-magic file in order to avoid<b=
r>
&gt; potential mistmatch between host and yocto native tools as reported<br=
>
&gt; in yocto mailing list: ---- error: magic_load(ms,<br>
&gt; /usr/share/misc/magic) failed: File 5.4 supports only version 7 magic<=
br>
&gt; files. `/usr/share/misc/magic.mgc&#39; is version 8 ---- * Another<br>
&gt; solution is to update meta/recipes-devtools/file/<a href=3D"http://fil=
e_5.04.bb" target=3D"_blank">file_5.04.bb</a> to a<br>
&gt; newer version ie. <a href=3D"http://file_5.07.bb" target=3D"_blank">fi=
le_5.07.bb</a><br>
&gt;<br>
&gt; Signed-off-by: Adrian Alonso &lt;<a href=3D"mailto:aalonso00@gmail.com=
">aalonso00@gmail.com</a>&gt; ---<br>
&gt; meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.0.bb" target=3D"_b=
lank">rpm_5.4.0.bb</a> | =A0 =A04 ++-- 1 files changed, 2<br>
&gt; insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.0.bb"=
 target=3D"_blank">rpm_5.4.0.bb</a><br>
&gt; b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.0.bb" target=3D"=
_blank">rpm_5.4.0.bb</a> index c0e3208..948ed84<br>
&gt; 100644 --- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.0.bb"=
 target=3D"_blank">rpm_5.4.0.bb</a> +++<br>
&gt; b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.0.bb" target=3D"=
_blank">rpm_5.4.0.bb</a> @@ -45,7 +45,7 @@<br>
&gt; LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1&quot; =
DEPENDS =3D<br>
&gt; &quot;bzip2 zlib db openssl elfutils expat libpcre attr acl popt<br>
&gt; ${extrarpmdeps}&quot; extrarpmdeps =3D &quot;python perl&quot;<br>
&gt; extrarpmdeps_virtclass-native =3D &quot;&quot; -PR =3D &quot;r19&quot;=
 +PR =3D &quot;r20&quot;<br>
&gt;<br>
&gt; # rpm2cpio is a shell script, which is part of the rpm src.rpm. =A0It<=
br>
&gt; is needed # in order to extract the distribution SRPM into a format<br=
>
&gt; we can extract... @@ -120,7 +120,7 @@ EXTRA_OECONF =3D &quot;--verbose=
 \<br>
&gt; ${WITH_DB} \ ${WITH_Z} \ --with-file \ -<br>
&gt; --with-path-magic=3D/usr/share/misc/magic \ +<br>
&gt; --with-path-magic=3D${STAGING_DIR_NATIVE}/usr/share/misc/magic.mgc \<b=
r>
<br>
</div></div>this wont work for target rpm I guess<br>
<div class=3D"im"><br>
&gt; --without-lua \ --without-tcl \ --with-syck=3Dinternal \<br>
<br>
</div>-----BEGIN PGP SIGNATURE-----<br>
Version: GnuPG v1.4.11 (GNU/Linux)<br>
<br>
iEYEARECAAYFAk5Kf+UACgkQuwUzVZGdMxTmPACgiKm1rdoDPbxVdYhHvCqKEyFJ<br>
0A4Anjx/BxnCQm6ZiLKGXOrn2nbFHzyS<br>
=3DjGQc<br>
-----END PGP SIGNATURE-----<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote></div><br><br clear=3D"all"><br>-- <br>Saludos<br>Adrian Alons=
o<br><a href=3D"http://aalonso.wordpress.com">http://aalonso.wordpress.com<=
/a><br><br>

--bcaec50164191f67df04aaa257a8--
