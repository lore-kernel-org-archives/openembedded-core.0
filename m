Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QwrKs-0001e7-T3
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 10:00:18 +0200
Received: by wwe32 with SMTP id 32so2544549wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 00:55:30 -0700 (PDT)
Received: by 10.227.155.83 with SMTP id r19mr628024wbw.71.1314345326114;
	Fri, 26 Aug 2011 00:55:26 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id et16sm1082547wbb.2.2011.08.26.00.55.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 00:55:25 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1314318504-9524-7-git-send-email-joelagnel@ti.com>
Date: Fri, 26 Aug 2011 09:55:22 +0200
Message-Id: <6302E210-41EB-42C8-9B4F-446C5D8A8F4E@dominion.thruhere.net>
References: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
	<1314318504-9524-7-git-send-email-joelagnel@ti.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH meta-oe 6/9] vlc: Imported from OE classic
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
X-List-Received-Date: Fri, 26 Aug 2011 08:00:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 aug. 2011, om 02:28 heeft Joel A Fernandes het volgende =
geschreven:

> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> vlc is not an mplayer depdency, but libdvdcss is an mplayer depedency =
and it is included in the recipes/vlc directory in oe-classic. I have =
imported vlc as well for completeness.
>=20
> meta-oe/recipes-multimedia/vlc/vlc.inc        |   61 =
+++++++++++++++++++++++++
> meta-oe/recipes-multimedia/vlc/vlc_1.1.4.1.bb |   51 =
+++++++++++++++++++++
> 2 files changed, 112 insertions(+), 0 deletions(-)
> create mode 100644 meta-oe/recipes-multimedia/vlc/vlc.inc
> create mode 100644 meta-oe/recipes-multimedia/vlc/vlc_1.1.4.1.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/vlc/vlc.inc =
b/meta-oe/recipes-multimedia/vlc/vlc.inc
> new file mode 100644
> index 0000000..0435e87
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/vlc/vlc.inc
> @@ -0,0 +1,61 @@
> +DESCRIPTION =3D "Video player and streamer - davinci edition"
> +HOMEPAGE =3D "http://www.videolan.org"
> +LICENSE =3D "GPL"

Which version?

> +PRIORITY =3D "optional"

That field isn't used anymore

> +SECTION =3D "multimedia"
> +
> +DEPENDS =3D "libfribidi libtool hal gettext libgcrypt schroedinger =
virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac =
\
> +           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad =
libid3tag liba52 mpeg2dec', d)}"
> +
> +INC_PR =3D "r4"

reset that

>=20
> +++ b/meta-oe/recipes-multimedia/vlc/vlc_1.1.4.1.bb
> @@ -0,0 +1,51 @@
> +# This recipe packages vlc as a library as well, so qt4 dependencies
> +# can be avoided when ony the library is installed.
> +# Would be cool if when newer vlc is added to OE and older ones are =
phased
> +# out that could be made the default.

Can be made the default now?

> +
> +require vlc.inc


> +
> +PR =3D "${INC_PR}.1"
> +
> +SRC_URI[md5sum] =3D "ce17c335b38b322949694313173fcd49"
> +SRC_URI[sha256sum] =3D =
"61c9ea30a17ea40c6ccbfd507026e5c83ad9e0691f221d3667c8e49696d7c2aa"

Why isn't anll of the below in the .inc?

> +# ffmpeg from git (library version =3D> 52) is required
> +# libtool-native must be >=3D 2.2.4
> +DEPENDS +=3D "libdvdcss libdvdread lua5.1-native lua5.1"
> +RDEPENDS_${PN} +=3D "lua5.1"
> +
> +EXTRA_OECONF +=3D "\
> +	--enable-dvdread \
> +"
> +
> +LEAD_SONAME =3D "libvlc.so.5"
> +
> +PACKAGES =3D+ "libvlc-dbg libvlc-dev libvlc"
> +
> +FILES_libvlc-dev =3D "${libdir}/lib*.so"
> +
> +FILES_libvlc-dbg =3D "\
> +	${libdir}/.debug \
> +	${libdir}/vlc/meta_engine/.debug \
> +	${libdir}/vlc/audio_filter/.debug =
${libdir}/vlc/audio_output/.debug \
> +	${libdir}/vlc/demux/.debug ${libdir}/vlc/control/.debug \
> +	${libdir}/vlc/gui/.debug ${libdir}/vlc/packetizer/.debug \
> +	${libdir}/vlc/audio_mixer/.debug ${libdir}/vlc/stream_out/.debug =
\
> +	${libdir}/vlc/mux/.debug ${libdir}/vlc/access/.debug \
> +	${libdir}/vlc/visualization/.debug =
${libdir}/vlc/access_filter/.debug \
> +	${libdir}/vlc/access_output/.debug =
${libdir}/vlc/video_output/.debug \
> +	${libdir}/vlc/services_discovery/.debug =
${libdir}/vlc/video_chroma/.debug \
> +	${libdir}/vlc/video_codec/.debug =
${libdir}/vlc/video_filter/.debug \
> +	${libdir}/vlc/misc/.debug ${libdir}/vlc/codec/.debug \
> +	"
> +
> +FILES_libvlc =3D "${libdir}/lib*.so.*"
> +
> +FILES_${PN} +=3D "${bindir}/vlc \
> +	${datadir}/applications \
> +	${datadir}/vlc/ \
> +	"
> +
> +FILES_${PN}-dbg	+=3D "${libdir}/vlc/*/.debug"
> +




