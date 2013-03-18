Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UHc1x-0007s5-CV
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 16:31:28 +0100
Received: by mail-pb0-f50.google.com with SMTP id up1so6421379pbc.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 08:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=jwdY4RMJU62Ztyekp4GdoftepyKrNP0/zSTV1AeoJdA=;
	b=h/htsJVAa7rnZnliyqz3jcoz3WzBm7LPyyZtXvk0shVBp2yPxm93eC+gKvtRnOnrdS
	OAEo7ZWqs3+cSkFxbPFpJA6SsXHalSDIPyj4I275QMSUThMo/Tr6CPj7ICAqsdX01YzC
	cf/y0aCpsZrObbZkDdhOQs0Q1P3/Gd4chTR8SQ2ddFqzgKf/moQH5RMOUVPZU4vtLup+
	pmfoNH5GoWzRhDNGQ9qW3Tufx+FeQ8YQcc0vMgKxqApOJD3Y3oN4RMTsvy4Ii+RqLsXM
	+ehT/t1+EfRQ16t7hcHZZApKnlwYIOjm71QBBIjrSflQFO2ughiqaLlYvwFLzzb45bfj
	z41g==
X-Received: by 10.68.189.65 with SMTP id gg1mr33419470pbc.122.1363619672584;
	Mon, 18 Mar 2013 08:14:32 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ip8sm20488782pbc.39.2013.03.18.08.14.29
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 08:14:30 -0700 (PDT)
Date: Mon, 18 Mar 2013 16:14:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
Message-ID: <20130318151422.GB13277@jama.dyndns-home.com>
References: <1363613958-20200-1-git-send-email-jukka.rissanen@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1363613958-20200-1-git-send-email-jukka.rissanen@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman-conf: Initial systemd support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2013 15:31:50 -0000
X-Groupsio-MsgNum: 36707
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline

--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2013 at 03:39:18PM +0200, Jukka Rissanen wrote:
> Create IPv4 address for ethernet in qemu image when systemd is
> in use.

This belongs to oe-devel ML with [meta-systemd] in subject.

>=20
> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
> ---
> Hi,
>=20
> this patch will provision the ethernet IP address automatically
> in qemu image when systemd is being used.
>=20
> Cheers,
> Jukka
>=20
>  .../connman/connman-conf.bbappend                     | 19 +++++++++++++=
++++++
>  .../connman/connman-conf/qemuall/connman-conf.service | 11 +++++++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta-systemd/oe-core/recipes-connectivity/connman/con=
nman-conf.bbappend
>  create mode 100644 meta-systemd/oe-core/recipes-connectivity/connman/con=
nman-conf/qemuall/connman-conf.service
>=20
> diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman-co=
nf.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman-con=
f.bbappend
> new file mode 100644
> index 0000000..6699355
> --- /dev/null
> +++ b/meta-systemd/oe-core/recipes-connectivity/connman/connman-conf.bbap=
pend
> @@ -0,0 +1,19 @@
> +PRINC :=3D "${@int(PRINC) + 1}"
> +
> +inherit systemd
> +
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> +SRC_URI_append_qemuall +=3D " file://connman-conf.service "
> +
> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN}-systemd =3D "connman-conf.service"
> +SYSTEMD_AUTO_ENABLE =3D "enable"
> +
> +FILES_${PN} +=3D " connman-conf.service "
> +
> +do_install_append() {
> +	install -d ${D}${nonarch_base_libdir}/systemd/system
> +	install -m 0755 ${WORKDIR}/connman-conf.service ${D}${nonarch_base_libd=
ir}/systemd/system
> +}
> +
> +PACKAGES +=3D " ${PN}-systemd"
> diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman-co=
nf/qemuall/connman-conf.service b/meta-systemd/oe-core/recipes-connectivity=
/connman/connman-conf/qemuall/connman-conf.service
> new file mode 100644
> index 0000000..5d3c2b4
> --- /dev/null
> +++ b/meta-systemd/oe-core/recipes-connectivity/connman/connman-conf/qemu=
all/connman-conf.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=3DSetup IP address for wired interface
> +After=3Dsyslog.target
> +
> +[Service]
> +Type=3Dsimple
> +ExecStart=3D-/usr/lib/connman/wired-setup
> +StandardOutput=3Dnull
> +
> +[Install]
> +WantedBy=3Dconnman.service
> --=20
> 1.7.11.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFHL04ACgkQN1Ujt2V2gBypFwCgjfaBMiMeLBw26WQO12c2W274
nLUAn1WoA92oASSN4Zm+eIRxkc9lyT7e
=GPyv
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
