Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QaBxb-0000k1-Ek
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 21:22:35 +0200
Received: by wyg30 with SMTP id 30so112977wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 12:18:58 -0700 (PDT)
Received: by 10.227.179.14 with SMTP id bo14mr3380642wbb.90.1308943138445;
	Fri, 24 Jun 2011 12:18:58 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm2219377wbb.48.2011.06.24.12.18.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Jun 2011 12:18:57 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <149d6209aca5fcc3eb708b81e9d0f28bf3706763.1308942534.git.mark.hatle@windriver.com>
Date: Fri, 24 Jun 2011 21:18:55 +0200
Message-Id: <BC8EDE88-C1B5-4991-BE9F-A5D735F81A3B@dominion.thruhere.net>
References: <cover.1308942534.git.mark.hatle@windriver.com>
	<149d6209aca5fcc3eb708b81e9d0f28bf3706763.1308942534.git.mark.hatle@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] prelink: Uprev prelink to latest version
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
X-List-Received-Date: Fri, 24 Jun 2011 19:22:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 24 jun 2011, om 21:10 heeft Mark Hatle het volgende geschreven:

> The latest cross-prelink version tracks the prelink r190 SVN.
>=20
> Fix two minor issues as well.  If we remove the package, we would
> unprelink the filesystem after the rm was finished.  This is
> incorrect.. we need to do this prerm.
>=20
> Also disable the cron configuration file.  This isn't appropriate
> for embedded systems, but someone might still find it useful.
>=20
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
> meta/recipes-devtools/prelink/prelink_git.bb |   18 +++++++++++++-----
> 1 files changed, 13 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb =
b/meta/recipes-devtools/prelink/prelink_git.bb
> index 1eea30a..044cb6b 100644
> --- a/meta/recipes-devtools/prelink/prelink_git.bb
> +++ b/meta/recipes-devtools/prelink/prelink_git.bb
> @@ -8,9 +8,9 @@ and executables, so that far fewer relocations need to =
be resolved at \
> runtime and thus programs come up faster."
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dc93c0550bd3173f4504b2cbd8991e50b"
> -SRCREV =3D "909470ee441237563d6236c505cb2d02ddc48704"
> +SRCREV =3D "ac461e73b17253a4da25c5aafeac7193b553156c"
> PV =3D "1.0+git${SRCPV}"
> -PR =3D "r2"
> +PR =3D "r3"
>=20
> SRC_URI =3D "git://git.yoctoproject.org/prelink-cross.git;protocol=3Dgit=
 \
>            file://prelink.conf \
> @@ -35,11 +35,15 @@ do_configure_prepend () {
>         echo "all:" > ${S}/doc/Makefile.am
> }
>=20
> +# Disabled the cron and cron configuration file, isn't appropriate =
for
> +# embedded systems.  (The script re-prelinks the system daily -- on
> +# systems where users are adding applications, this might be =
reasonable
> +# but for embedded, we should be re-running prelink -a after an =
update.)
> do_install_append () {
> 	install -d ${D}${sysconfdir}/cron.daily =
${D}${sysconfdir}/default ${D}${sysconfdir}/rpm
> 	install -m 0644 ${WORKDIR}/prelink.conf =
${D}${sysconfdir}/prelink.conf
> -	install -m 0644 ${WORKDIR}/prelink.cron.daily =
${D}${sysconfdir}/cron.daily/prelink
> -	install -m 0644 ${WORKDIR}/prelink.default =
${D}${sysconfdir}/default/prelink
> +#	install -m 0644 ${WORKDIR}/prelink.cron.daily =
${D}${sysconfdir}/cron.daily/prelink
> +#	install -m 0644 ${WORKDIR}/prelink.default =
${D}${sysconfdir}/default/prelink
> 	install -m 0644 ${WORKDIR}/macros.prelink =
${D}${sysconfdir}/rpm/macros.prelink

How about PACKAGES +=3D prelink-cron, FILES_prelink-cron =3D =
"{sysconfdir}/cron.dailly" ,etc ,etc ?=


