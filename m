Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id A2666621CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:00:02 +0000 (UTC)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id D76C94B0127;
	Mon, 10 Jun 2013 14:59:54 +0200 (CEST)
Date: Mon, 10 Jun 2013 14:59:52 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-ID: <20130610145952.779c05a0@e6520eb>
In-Reply-To: <CAP71WjxSiWcGu98VTY2z_Dsf+WgSEMKnCoPkoWUfrR7ch321dQ@mail.gmail.com>
References: <CABuzA3PAguwK=KW7xnoe6PJqASWZXktBLB5LTs7LHcw5mopXJQ@mail.gmail.com>
	<2326207.iuBVrRrsbt@helios>
	<CABuzA3N_Bk0_AnC3sF4TDqk08F2h2LHcv3ChkWJi4iX=dCKT_g@mail.gmail.com>
	<CAP71WjxSiWcGu98VTY2z_Dsf+WgSEMKnCoPkoWUfrR7ch321dQ@mail.gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.18; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qt4-embedded - image size
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
X-List-Received-Date: Mon, 10 Jun 2013 13:00:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Le Mon, 10 Jun 2013 14:10:15 +0200,
Nicolas Dechesne <nicolas.dechesne@linaro.org> a =C3=A9crit :

> On Mon, Jun 10, 2013 at 1:19 PM, John Stirling
> <ap.john.stirling@gmail.com>wrote:
>=20
> > You suggest just cutting it down to
> >
> > IMAGE_INSTALL +=3D " \
> > qtui \
> > "
> > and it should work itself out ?
> >

this will work but if you need plugins they will be missing as only the
linked libraries will be automatically integrated.

>=20
> hi, i have observed the same issue, and I used the following 'workaround':
>=20
> BAD_RECOMMENDATIONS =3D " \
>     qt4-embedded-demos \
>     qt4-embedded-examples \
>     qt4-embedded-demos-doc \
>     qt4-embedded-tools \
>     qt4-embedded-assistant \
>     "
> which I added in my image recipe, that would ensure that the packages whi=
ch
> are RECOMMENDS don't get installed in the final image.
>=20
> I would be happy to use another (nicer?) method, too.


check packagegroup-core-qt4e.bb and remove :
        qt4-embedded-demos \
        qt4-embedded-examples \
        qt-demo-init \
        qt4-embedded-assistant \

(and also the plugins & libs you may not need)

FWIW I'm using this to build a quite full featured qt4e base image :
RDEPENDS_append +=3D " \
	qt4-embedded \
	"

QT_INSTALL =3D " \
	libqt-embedded3support4 \
	libqt-embeddedclucene4 \
	libqt-embeddedcore4 \
	libqt-embeddedgui4 \
	libqt-embeddednetwork4 \
	libqt-embeddedsvg4 \
	libqt-embeddedsql4 \
	libqt-embeddedxml4 \
	libqt-embeddedxmlpatterns4 \
	libqt-embeddedwebkit4 \
	libqt-embeddedscripttools4 \
	libqt-embeddedtest4 \
	libqt-embeddedmultimedia4 \
	libqt-embeddedhelp4 \
	libqt-embeddeddeclarative4 \
	libqt-embeddeddbus4 \
	libqt-embeddedphonon4 \
	\
	qt4-embedded-fonts-ttf-vera \
	qt4-embedded-fonts-ttf-dejavu \
	qt4-embedded-plugin-mousedriver-tslib \
	qt4-embedded-plugin-sqldriver-sqlite2 \
	qt4-embedded-plugin-sqldriver-sqlite \
	qt4-embedded-plugin-phonon-backend-gstreamer \
	qt4-embedded-plugin-iconengine-svgicon \
	qt4-embedded-plugin-imageformat-gif \
	qt4-embedded-plugin-imageformat-ico \
	qt4-embedded-plugin-imageformat-jpeg \
	qt4-embedded-plugin-imageformat-mng \
	qt4-embedded-plugin-imageformat-svg \
	qt4-embedded-plugin-imageformat-tiff \
	sqlite3 \
"

QWT_INSTALL =3D " \
	qwt-e \
"

IMAGE_INSTALL +=3D "\
	${QT_INSTALL} \
	${QWT_INSTALL} \
"

and I add this when I want the examples :
IMAGE_INSTALL +=3D "\
	qt4-embedded-demos qt4-embedded-examples qt-demo-init \
	qwt-e-examples \
"
(qt-demo-init is a homemade init script).

Eric

