Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TvWHP-0007fI-2C
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 17:56:05 +0100
Received: by mail-pb0-f52.google.com with SMTP id ro2so811580pbb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 08:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=swPlZYUa0tQffAvrU85Un8cll4rC2z7fFfng1OaVA9Q=;
	b=jiS6sV1SLEUkelo9YxDJWXAuSo6zGYezJVD24Z0hacytnMlVa0E0xzD2O6ckLtdEDN
	eBaYh7DEPYzhAxie9oW3HAm6vz0X2cpOBb4Na2mBg9Mp7TRMXwi4uEL/LBD3yqeNw5ps
	5oa2WRoUXuydZTOtUhU8HsPUKLmQhOODPmk653PDt8/VE1rgK75dAaih8GhBz+oN0euR
	vd0e7KS4RaESieQdB4mN1wz76m/MQfaS42z60Ok2dbqPi42QR3gIUjSGUzI5SxJHBpPm
	2HgWpUoWAMyprYBgLeigMrmqB0jGNG5C0OrwcQByHoCepq/36z+LqnTI1hb7atHE5rFs
	7ryg==
X-Received: by 10.68.219.227 with SMTP id pr3mr1019666pbc.38.1358354436388;
	Wed, 16 Jan 2013 08:40:36 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ql9sm12558384pbc.61.2013.01.16.08.40.33
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 08:40:35 -0800 (PST)
Date: Wed, 16 Jan 2013 17:40:38 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130116164038.GF3002@jama>
References: <cover.1358350661.git.paul.eggleton@linux.intel.com>
	<d0ac33caf983e8a3eeb8c596587e9ae29c4edc88.1358350661.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <d0ac33caf983e8a3eeb8c596587e9ae29c4edc88.1358350661.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] classes/image: improve debug-tweaks ssh server configuration
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
X-List-Received-Date: Wed, 16 Jan 2013 16:56:06 -0000
X-Groupsio-MsgNum: 33904
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8bBEDOJVaa9YlTAt"
Content-Disposition: inline

--8bBEDOJVaa9YlTAt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2013 at 03:38:13PM +0000, Paul Eggleton wrote:
> Create a single postprocessing function that enables no-password logins
> for both openssh and dropbear when debug-tweaks is in IMAGE_FEATURES,
> changing its behaviour slightly:
> * Run it regardless of whether ssh-server-* are in IMAGE_FEATURES so
>   that it still takes effect if these are installed by adding
>   dropbear/openssh to IMAGE_INSTALL.
> * Enable it to be run from image.bbclass rather than core-image.bbclass
>   so that it works for images that are using the former.
>=20
> Second half of the fix for [YOCTO #2578].
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/core-image.bbclass |    3 ---
>  meta/classes/image.bbclass      |   10 ++++++++--
>  2 files changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bb=
class
> index 2e67018..e0f6dbb 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -76,6 +76,3 @@ ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_update_timestam=
p ; "
> =20
>  # Zap the root password if debug-tweaks feature is not enabled
>  ROOTFS_POSTPROCESS_COMMAND +=3D '${@base_contains("IMAGE_FEATURES", "deb=
ug-tweaks", "", "zap_root_password ; ",d)}'
> -# Allow openssh accept empty password login if both debug-tweaks and ssh=
-server-openssh are enabled
> -ROOTFS_POSTPROCESS_COMMAND +=3D '${@base_contains("IMAGE_FEATURES", "deb=
ug-tweaks ssh-server-openssh", "openssh_allow_empty_password; ", "",d)}'
> -
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index e494689..131958d 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -167,6 +167,8 @@ inherit ${IMAGE_CLASSES}
>  IMAGE_POSTPROCESS_COMMAND ?=3D ""
>  MACHINE_POSTPROCESS_COMMAND ?=3D ""
>  ROOTFS_POSTPROCESS_COMMAND_prepend =3D "run_intercept_scriptlets; "
> +# Allow dropbear/openssh to accept logins from accounts with an empty pa=
ssword string if debug-tweaks is enabled
> +ROOTFS_POSTPROCESS_COMMAND +=3D '${@base_contains("IMAGE_FEATURES", "deb=
ug-tweaks", "ssh_allow_empty_password; ", "",d)}'
> =20
>  # some default locales
>  IMAGE_LINGUAS ?=3D "de-de fr-fr en-gb"
> @@ -396,12 +398,16 @@ zap_root_password () {
>  	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
>  }=20
> =20
> -# allow openssh accept login with empty password string
> -openssh_allow_empty_password () {
> +# allow dropbear/openssh to accept root logins and logins from accounts =
with an empty password string
> +ssh_allow_empty_password () {
>  	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
>  		sed -i 's#.*PermitRootLogin.*#PermitRootLogin yes#' ${IMAGE_ROOTFS}${s=
ysconfdir}/ssh/sshd_config
>  		sed -i 's#.*PermitEmptyPasswords.*#PermitEmptyPasswords yes#' ${IMAGE_=
ROOTFS}${sysconfdir}/ssh/sshd_config
>  	fi
> +
> +	if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then
> +		echo 'DROPBEAR_EXTRA_ARGS=3D"-B"' > ${IMAGE_ROOTFS}${sysconfdir}/defau=
lt/dropbear
> +	fi

Can we use >> here? In case some distro layer provides own
default/dropbear already?

Or grep + >> if you fear of duplication of that line, probably=20
should be using sed to add -B if DROPBEAR_EXTRA_ARGS line is already
there without -B.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8bBEDOJVaa9YlTAt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD22AYACgkQN1Ujt2V2gByr9ACgnU9lXvZqmc+0ZywrGxu/L5Or
tYkAoJP0ST4lAvqGvMpTQJZvQZPxWHr9
=acNY
-----END PGP SIGNATURE-----

--8bBEDOJVaa9YlTAt--
