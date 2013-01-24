Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TyNP1-000256-Mg
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 15:03:40 +0100
Received: by mail-da0-f54.google.com with SMTP id n2so4274800dad.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 05:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=loo11HgH5rRd9x6uvYRVmhstj2GOT7mjzpyPjExRchQ=;
	b=ar72KRkF2ChDk42kob3m8WkJoMSPaLi4tLezAGxnd/P0TlVwu7NwANRNfWLv1peJqQ
	AmIbT2cYu3BaBs6hD0HkBLVYyyDgpH1UaIs6DAZGg+GI92hSc8AmVivIJJ4pnKZWFDyJ
	9scsObh5Uabf6i/hv9R3APfJYahSxT7cCmxnbC9QT5EmXvKZeQqd9ekg/GbztcOguCF3
	6mlDncY7C2NlKLPqFVPGPSlND/uU3wKruBdOwvgaU/aRY/2P+ViYKr5GEZbtyfR2Gfqx
	WxOVdR9mqSNZm6RtQ2PFswv2v9KVstHGd1KdgwiyE4UlTU0AI0XypgyVTRn5slL3h3+K
	gnWw==
X-Received: by 10.69.1.9 with SMTP id bc9mr5020678pbd.61.1359035286105;
	Thu, 24 Jan 2013 05:48:06 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id nf9sm14917132pbc.17.2013.01.24.05.48.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 05:48:05 -0800 (PST)
Date: Thu, 24 Jan 2013 14:48:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
Message-ID: <20130124134801.GD3012@jama>
References: <1359034562-31592-1-git-send-email-radu.moisan@intel.com>
MIME-Version: 1.0
In-Reply-To: <1359034562-31592-1-git-send-email-radu.moisan@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Thu, 24 Jan 2013 14:03:41 -0000
X-Groupsio-MsgNum: 34360
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VV4b6MQE+OnNyhkM"
Content-Disposition: inline

--VV4b6MQE+OnNyhkM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 24, 2013 at 03:36:02PM +0200, Radu Moisan wrote:
> this fixes a service dependency issue;
> while graphical.target is the default mode, systemd
> will try to start display-manager.service which is not
> available.

what about images with display-manager available?

meta-efl/recipes-efl/efl/entrance/entrance.service:Alias=3Ddisplay-manager.=
service
meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in:Alias=3Ddisplay-manager.ser=
vice
meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.s=
ervice:Alias=3Ddisplay-manager.service

?

Making this change in global PKG_ARCH recipe doesn't look correct (and
also missing Upstream-Status and SOB line).

Cheers,

> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  .../systemd/set_default_target_to_multi-user.patch |   13 +++++++++++++
>  meta/recipes-core/systemd/systemd_196.bb           |    1 +
>  2 files changed, 14 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/set_default_target_=
to_multi-user.patch
>=20
> diff --git a/meta/recipes-core/systemd/systemd/set_default_target_to_mult=
i-user.patch b/meta/recipes-core/systemd/systemd/set_default_target_to_mult=
i-user.patch
> new file mode 100644
> index 0000000..d29471c
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/set_default_target_to_multi-user.=
patch
> @@ -0,0 +1,13 @@
> +Index: git/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/Makefile.am
> ++++ git/Makefile.am
> +@@ -3873,7 +3873,7 @@ systemd-install-data-hook:
> + 		$(LN_S) reboot.target runlevel6.target )
> + 	( cd $(DESTDIR)$(systemunitdir) && \
> + 		rm -f default.target ctrl-alt-del.target autovt@.service && \
> +-		$(LN_S) graphical.target default.target && \
> ++		$(LN_S) multi-user.target default.target && \
> + 		$(LN_S) reboot.target ctrl-alt-del.target && \
> + 		$(LN_S) getty@.service autovt@.service )
> + 	( cd $(DESTDIR)$(systemunitdir)/multi-user.target.wants && \
> diff --git a/meta/recipes-core/systemd/systemd_196.bb b/meta/recipes-core=
/systemd/systemd_196.bb
> index a78a8a6..c6798fc 100644
> --- a/meta/recipes-core/systemd/systemd_196.bb
> +++ b/meta/recipes-core/systemd/systemd_196.bb
> @@ -23,6 +23,7 @@ SRC_URI =3D "http://www.freedesktop.org/software/system=
d/systemd-${PV}.tar.xz \
>             file://var-run.conf \
>             ${UCLIBCPATCHES} \
>             file://00-create-volatile.conf \
> +           file://set_default_target_to_multi-user.patch \
>            "
>  SRC_URI[md5sum] =3D "05ebd7f108e420e2b4e4810ea4b3c810"
>  SRC_URI[sha256sum] =3D "6bd4a658a5dd8198235b17ad1b1f0cc56d9e6f00d646ddcf=
fdfc6f058b55e4bf"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VV4b6MQE+OnNyhkM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEBO5EACgkQN1Ujt2V2gByUEQCdGP4VieFBhqIOEIKJWxSN/BH3
aV4Anjx6kTR+Wozr7lhhGqOAu0vqxet6
=Cblx
-----END PGP SIGNATURE-----

--VV4b6MQE+OnNyhkM--
