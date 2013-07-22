Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 7917661FE1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 09:48:15 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V1Cj1-0005Cw-IF; Mon, 22 Jul 2013 11:48:15 +0200
Message-ID: <1374486494.6324.44.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Date: Mon, 22 Jul 2013 10:48:14 +0100
In-Reply-To: <1374481350.6719.83.camel@bril0118.bri.st.com>
References: <cover.1374479372.git.kai.kang@windriver.com>
	<3185bfa72aaa8acd02d32f67ee51de79a24c7c19.1374479372.git.kai.kang@windriver.com>
	<1374481350.6719.83.camel@bril0118.bri.st.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] webkit-gtk: fix 'Memory exhausted' error
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
X-List-Received-Date: Mon, 22 Jul 2013 09:48:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Agreed, I think this sort of thing belongs in site.conf or some such
place, not in the recipe.

p.

On Mon, 2013-07-22 at 09:22 +0100, Andr=C3=A9 Draszik wrote:
> Hi,
>=20
> Instead of penalising everybody, would it be possible to make this
> change dependent on the build machine (ram + swap)? Or to only add
> -Wl,--no-keep-memory if the build failed without it?
>=20
> Not sure if it would make any difference, but do you see this only with
> full debug enabled (-ggdb)? If yes, can the debug flags be changed, or
> that linker flag only be added, if full debug is enabled?
>=20
>=20
> Cheers,
> Andre'
>=20
> On Mon, 2013-07-22 at 15:51 +0800, Kai Kang wrote:
> > Build webkit-gtk occupies lot of memory and fails on some host:
> > | ...tmp/sysroots/i686-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wr=
s-linux/4.8.1/ld:
> > failed to set dynamic section sizes: Memory exhausted
> > | collect2: error: ld returned 1 exit status
> > | make[1]: *** [libwebkitgtk-1.0.la] Error 1
> >=20
> > Add ld option to fix it.
> >=20
> > Refer to:
> > http://comments.gmane.org/gmane.os.opendarwin.webkit.devel/20078
> >=20
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >  meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipe=
s-sato/webkit/webkit-gtk_1.8.3.bb
> > index 5691d3f..90625a3 100644
> > --- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
> > +++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
> > @@ -60,6 +60,8 @@ CPPFLAGS_append_powerpc =3D " -I${STAGING_INCDIR}/pan=
go-1.0 \
> > =20
> >  EXTRA_AUTORECONF =3D " -I Source/autotools "
> > =20
> > +# Fix compile error: "ld: failed to set dynamic section sizes: Memory =
exhausted"
> > +LDFLAGS +=3D " -Wl,--no-keep-memory"
> > =20
> >  #| ./Source/JavaScriptCore/heap/HandleTypes.h: In static member functi=
on 'static T* JSC::HandleTypes<T>::getFromSlot(JSC::HandleSlot) [with T =3D=
 JSC::Structure, JSC::HandleTypes<T>::ExternalType =3D JSC::Structure*, JSC=
::HandleSlot =3D JSC::JSValue*]':
> >  #| ./Source/JavaScriptCore/heap/Handle.h:141:79:   instantiated from '=
JSC::Handle<T>::ExternalType JSC::Handle<T>::get() const [with T =3D JSC::S=
tructure, JSC::Handle<T>::ExternalType =3D JSC::Structure*]'
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



