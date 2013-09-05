Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id EC9E161617
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 08:13:55 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so271874eek.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 01:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wMCSyXpiRXS7HLFjDOqe/zquGTqKrWJIiZ+dLnAjZwQ=;
	b=IUR5+irraVQ8myh1d48ERxq0hoq4LZ4dSsYTogGWiLKFvNQY8V2+6lYN6Ew/AvxHL+
	ZVUsQr4kEP0XCR0Y719Ko6anR8HHImZaAC8RMGlb8O1WKrVQgBOuwWnv6S8y4P848SQL
	xigB5jLf9G9txfQqsrCsHYoKdPHKUV50AjL8E8K64iYZjtRNsZtongI7j0DqQHn5hUp0
	es2PLivDb7VAsBQRAfPL7HaDJiLROQgkb3Kqyb5JIek7sZrl0eY7EFW7ao/GOG8VKx2W
	xTbjBsNWxFmaWyE1Jcs7xapinlkJGf//A7fvKx6rdwln7ZpdcyOdDcJJ1qMsWdGc8tvY
	JQmw==
X-Received: by 10.15.45.8 with SMTP id a8mr11699826eew.1.1378368836913;
	Thu, 05 Sep 2013 01:13:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm46508790eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 01:13:56 -0700 (PDT)
Date: Thu, 5 Sep 2013 10:15:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20130905081516.GI11500@jama>
References: <cover.1378366233.git.laurentiu.palcu@intel.com>
	<728bbce2f20eefd81accfbbe48c6f5f4e85aabb2.1378366233.git.laurentiu.palcu@intel.com>
MIME-Version: 1.0
In-Reply-To: <728bbce2f20eefd81accfbbe48c6f5f4e85aabb2.1378366233.git.laurentiu.palcu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: leave metadata in place if a PM is installed in the image
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
X-List-Received-Date: Thu, 05 Sep 2013 08:13:57 -0000
X-Groupsio-MsgNum: 44527
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BWWlCdgt6QLN7tv3"
Content-Disposition: inline

--BWWlCdgt6QLN7tv3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2013 at 10:31:10AM +0300, Laurentiu Palcu wrote:
> If IMAGE_FEATURES does not contain 'package-management' but the user
> manually installs a package manager (opkg/dpkg/rpm) using
> CORE_IMAGE_EXTRA_INSTALL (for example), then do not remove update-rc.d,
> base-passwd and package metadata because these will be needed by the
> package manager to function correcly.
>=20
> [YOCTO #4484]
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/classes/image.bbclass |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 84f638c..e1a7367 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -498,7 +498,12 @@ rootfs_install_complementary() {
>  }
> =20
>  rootfs_uninstall_unneeded () {
> -	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "t=
rue", d)}; then
> +	rpm_installed=3D${@base_contains("PACKAGE_INSTALL", "rpm",  "true", "fa=
lse", d)}
> +	opkg_installed=3D${@base_contains("PACKAGE_INSTALL", "opkg", "true", "f=
alse", d)}
> +	dpkg_installed=3D${@base_contains("PACKAGE_INSTALL", "dpkg", "true", "f=
alse", d)}
> +
> +	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "t=
rue", d)} &&\

is this first condition still needed? Do we have some case where
package-management is enabled without rpm/opkg/dpkg installed?

> +	   ! $rpm_installed && ! $opkg_installed && ! $dpkg_installed; then
>  		if [ -z "$(delayed_postinsts)" ]; then
>  			# All packages were successfully configured.
>  			# update-rc.d, base-passwd, run-postinsts are no further use, remove =
them now
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BWWlCdgt6QLN7tv3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIoPZQACgkQN1Ujt2V2gBzP4ACgiY3lGY68hkVqUF70WMW6Eomh
DyUAn29JPAu1nMvniZEvfFxoyLY1JVKP
=hOXB
-----END PGP SIGNATURE-----

--BWWlCdgt6QLN7tv3--
