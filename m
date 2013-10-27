Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9456D224
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2013 15:08:00 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so3872447eek.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2013 08:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=q+F9wZZOIylJiNP/BzktgJSd1eIOZkuSUWv1aKY4Qic=;
	b=WVa3klgmgfgWl9edOVzYJbyjF+ZzQX2mDGsJo2p2SIs/SOd2GVaosPimbDfDucYzCE
	z89/6fyyQo0nJTw9RnP/qKJ4e6EaGP5B3ciPx8dVsCfYHKfKLQHy+UG22BiSHEyJn0ht
	JrbxcWxBI7d7QGmsr3z6TvwKOplDDqePMpC/To4gjMPsadrI7S2eWNfrxO5Uld6N4jc9
	0GIVyuZ+WZNsB2JAnXU2vi208+BZMRpnXJJhOCsXXde0BRmw1reuOtZ9wgiOnN7y60Nf
	b05TRP+bkpyyquUU0hwJ1L/5ObKIuHiA2iXqNMKHY8VX7vP4WHkxwJ3ipurtIJWxdTpO
	DA0A==
X-Received: by 10.14.210.8 with SMTP id t8mr16974162eeo.39.1382886482344;
	Sun, 27 Oct 2013 08:08:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id j7sm45114175eeo.15.2013.10.27.08.08.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Oct 2013 08:08:01 -0700 (PDT)
Date: Sun, 27 Oct 2013 16:08:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <20131027150812.GG3709@jama>
References: <1382827017-724-1-git-send-email-jacob.kroon@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1382827017-724-1-git-send-email-jacob.kroon@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] update-rc.d.bbclass: Fix host/target test in postinst
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
X-List-Received-Date: Sun, 27 Oct 2013 15:08:03 -0000
X-Groupsio-MsgNum: 46249
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nOM8ykUjac0mNN89"
Content-Disposition: inline

--nOM8ykUjac0mNN89
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 27, 2013 at 12:36:57AM +0200, Jacob Kroon wrote:
> When running the postinst script I get a shell warning:
>=20
> sh: argument expected
>=20
> and the service is never stopped. This patch fixes the warning
> message and stops the service.
>=20
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  meta/classes/update-rc.d.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.=
bbclass
> index e14659d..835b717 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -16,7 +16,7 @@ updatercd_postinst() {
>  # test if there is a previous init script there, ie, we are updating the=
 package
>  # if so, we stop the service and remove it before we install from the ne=
w package
>  if type update-rc.d >/dev/null 2>/dev/null; then
> -	if [ -z "$D" -a `test -f "${INIT_D_DIR}/${INITSCRIPT_NAME}"` ]; then
> +	if [ -z "$D" -a "test -f ${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then

I guess you want

+	if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then

here

>  		${INIT_D_DIR}/${INITSCRIPT_NAME} stop
>  	fi
>  	if [ -n "$D" ]; then
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nOM8ykUjac0mNN89
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJtLFwACgkQN1Ujt2V2gBzATwCgoW4fNq1QlavCY0mCBRsRvHgW
M0UAoLu+vYKnnn/esacx6mrNUv+wqWKm
=ZbyB
-----END PGP SIGNATURE-----

--nOM8ykUjac0mNN89--
