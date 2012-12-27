Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1To9HW-0005Qu-W4
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 09:57:39 +0100
Received: by mail-ee0-f41.google.com with SMTP id d41so4485226eek.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2012 00:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Vpo+vsUe41ZuDLUPK0KT08Chp70sp3x87nJReMJvpRk=;
	b=UnELVfl2rpbgoY68SF2lFh9NOQsjJNjfg4pZdhVOkE6JdqkmSdwrWQ7uSDkvUNS8Q5
	qYms7YPOQaxZPEWH19NMvypO6skFxKvRFsE4JNdi0jkwXNPNhiPtRLWCgvKPa8K7Z8fd
	zDRben5HazcbNol8mmcz4ggnBsT3hht8l7n9TkHK1rZ/exigan+ctt9I/aK/JbSvFOiO
	92vrGV7iaAnPrUHmasOn5C0X3D4XjJK86k4e6a4vncXhVVFNRMT5t9YzefNYYh0y1CBp
	u1KNZwzvHvAY8YR/a8YXhUa0nrgi2JI32Fxoqpufut3IFp4G8r6XDsbHOxqQcPbIp5/y
	DzmQ==
X-Received: by 10.14.174.198 with SMTP id x46mr76314482eel.23.1356597765236;
	Thu, 27 Dec 2012 00:42:45 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id k4sm58233135eep.15.2012.12.27.00.42.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Dec 2012 00:42:44 -0800 (PST)
Date: Thu, 27 Dec 2012 09:42:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Qi.Chen@windriver.com
Message-ID: <20121227084244.GB3777@jama>
References: <cover.1356576405.git.Qi.Chen@windriver.com>
	<819997e2cad5d6a4bf2621fb7cc443105ca0fc87.1356576405.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <819997e2cad5d6a4bf2621fb7cc443105ca0fc87.1356576405.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] image.bbclass: add two hook funtions to support read-only rootfs
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
X-List-Received-Date: Thu, 27 Dec 2012 08:57:39 -0000
X-Groupsio-MsgNum: 33113
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline

--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 27, 2012 at 10:57:39AM +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> read_only_rootfs_hook: this funtion is invoked only if 'read-only-rootfs'
> is in IMAGE_FEATURES. It tweaks some basic files and makes populate-
> volatile.sh script run at rootfs time.
>=20
> choose_volatile_conf_file: this function properly chooses the right
> conf file for volatile storage handling according to the IMAGE_FEATURES.

choose_volatile_conf_file is always called from core-image with or
without read-only-rootfs in IMAGE_FEATURES.

So it will use /etc/default/volatiles_stage/volatiles-readonly-minimal
without read-only-rootfs.

Cheers,

>=20
> [YOCTO #3406]
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/image.bbclass |   29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 8bf718a..15d42d0 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -394,6 +394,35 @@ zap_root_password () {
>  	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
>  }=20
> =20
> +# A hook function to support read-only-rootfs IMAGE_FEATURES
> +read_only_rootfs_hook () {
> +	# Tweak the mount option in fstab
> +	sed '/rootfs/ s/defaults/ro/' < ${IMAGE_ROOTFS}/etc/fstab > ${IMAGE_ROO=
TFS}/etc/fstab.new
> +	mv ${IMAGE_ROOTFS}/etc/fstab.new ${IMAGE_ROOTFS}/etc/fstab
> +	# Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
> +	sed 's/ROOTFS_READ_ONLY=3Dno/ROOTFS_READ_ONLY=3Dyes/' < ${IMAGE_ROOTFS}=
/etc/default/rcS > ${IMAGE_ROOTFS}/etc/default/rcS.new
> +	mv ${IMAGE_ROOTFS}/etc/default/rcS.new ${IMAGE_ROOTFS}/etc/default/rcS
> +	# Run populate-volatile.sh at rootfs time to set up basic files
> +	# and directories to support read-only rootfs.
> +	if [ ! -e ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
> +		echo "${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh doesn't exist."
> +		exit 1
> +	else
> +		${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
> +	fi
> +}
> +
> +# Choose the correct config file for volatile storage handling according=
 to the image type
> +choose_volatile_conf_file () {
> +	if ${@base_contains("IMAGE_FEATURES", "x11-sato", "true", "false" ,d)};=
 then
> +		cp ${IMAGE_ROOTFS}/etc/default/volatiles_stage/volatiles-readonly-sato=
 \
> +			${IMAGE_ROOTFS}/etc/default/volatiles/00_core_readonly
> +	else
> +		cp ${IMAGE_ROOTFS}/etc/default/volatiles_stage/volatiles-readonly-mini=
mal \
> +			${IMAGE_ROOTFS}/etc/default/volatiles/00_core_readonly
> +	fi
> +}
> +
>  # allow openssh accept login with empty password string
>  openssh_allow_empty_password () {
>  	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
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

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDcCgQACgkQN1Ujt2V2gBxU4ACfbM392Gx1/bl1atQ5Uh3c4tQS
Sp0AmwTPAqSYo6HWd8tKJgJN5Rc2YBCH
=aSZP
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
