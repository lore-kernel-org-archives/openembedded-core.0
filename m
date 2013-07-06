Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id EBC9C6ABED
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2013 10:27:22 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id l10so1806869eei.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2013 03:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DlnKUkLiZj3yyFVIq3TYlwtb/Rzhx7I1Lf5l5B++D/g=;
	b=H7ySvg4tXYVbt79nEwtr+sIMMUPp8Mi3bNlYxxCchsyK5DA8JVX9qvj4gHY5Y0GMgm
	Vf7p7sN9taMdODyddCoZcnLSVV5B4YYPLiKfvAZyxANQWy44tUL+ftJ8XUtaTJ32NbyX
	GdS69yKC3fAzBrU1FYax7gwW86lqqD9QDIzMgGn5g8nxZKVi39OjO/UMYtoOOWVzH76Y
	3N/W6/PuwLPCeBVOIA+B03xM/zXkCzsieytvrdFCvdsUdyVMZvBlHDsxoPyvkQTxnPx8
	GwWUEnQdTTRTvgxq5/X5GN/jFGinEmx3ul0H6IGEIRS1XO2bf8qIYLd4vLW9VOvRA6E3
	NhrQ==
X-Received: by 10.14.98.6 with SMTP id u6mr15590803eef.62.1373106442628;
	Sat, 06 Jul 2013 03:27:22 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	y1sm22304910eew.3.2013.07.06.03.27.21 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 03:27:21 -0700 (PDT)
Date: Sat, 6 Jul 2013 12:27:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Qi.Chen@windriver.com
Message-ID: <20130706102728.GA30517@jama>
References: <cover.1372826827.git.Qi.Chen@windriver.com>
	<61d58e6bfc00142957a77a3a1747c9848710917a.1372826827.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <61d58e6bfc00142957a77a3a1747c9848710917a.1372826827.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] busybox: fix the on-target upgrade problem
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
X-List-Received-Date: Sat, 06 Jul 2013 10:27:23 -0000
X-Groupsio-MsgNum: 41547
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2013 at 12:48:12PM +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> We now can have a 'one-binary' version of busybox, or 'two-binary'
> version of busybox, controlled by the 'BUSYBOX_SPLIT_SUID' variable.
> This makes on-target upgrade a problem, as we have to support the
> following four upgrading paths.
>=20
> For convenience, in the following context, A is used to denote a
> 'two-binary' version of busybox while B is used to denote a 'one-binary'
> version of busybox.
>=20
> A --(upgrade)--> B
> B --(upgrade)--> A
> A --(upgrade)--> A
> B --(upgrade)--> B
>=20
> This patch makes effort to support the above four situations.

Thanks for looking into it (it's more complicated then I've first
expected) and it looks like there is more issues probably caused
by applet path moved in latest busybox upgrade (but ip looks weird) :/

update-alternatives: Error: cannot register alternative addgroup to
/usr/sbin/addgroup since it is already registered to /bin/addgroup
update-alternatives: Error: cannot register alternative adduser to
/usr/sbin/adduser since it is already registered to /bin/adduser

update-alternatives: Error: cannot register alternative delgroup to
/usr/sbin/delgroup since it is already registered to /bin/delgroup
update-alternatives: Error: cannot register alternative deluser to
/usr/sbin/deluser since it is already registered to /bin/deluser

update-alternatives: Error: cannot register alternative ip to /sbin/ip
since it is already registered to /bin/ip

SHR root@gjama ~ $ cat /var/lib/opkg/alternatives/ip
/bin/ip
busybox 50
/bin/busybox 50
/bin/busybox.nosuid 50
SHR root@gjama ~ $ cat /var/lib/opkg/alternatives/adduser
/bin/adduser
/bin/busybox.nosuid 50
SHR root@gjama ~ $ cat /var/lib/opkg/alternatives/addgroup
/bin/addgroup
/bin/busybox.nosuid 50
SHR root@gjama ~ $ cat /var/lib/opkg/alternatives/delgroup
/bin/delgroup
/bin/busybox.nosuid 50
SHR root@gjama ~ $ cat /var/lib/opkg/alternatives/deluser
/bin/deluser
/bin/busybox.nosuid 50

> [YOCTO #4802]
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/busybox/busybox.inc |   48 +++++++++++++++++++++++++++=
++++++
>  1 file changed, 48 insertions(+)
>=20
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
> index 8567d64..acd2bfb 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -190,6 +190,10 @@ do_install () {
>  			install -m 0644 ${S}/busybox.links.suid ${D}${sysconfdir}
>  			install -m 0644 ${S}/busybox.links.nosuid ${D}${sysconfdir}
>  			ln -sf busybox.nosuid ${D}${base_bindir}/sh
> +			# Keep a default busybox for people who want to invoke busybox direct=
ly.
> +			# This is also useful for the on device upgrade. Because we want
> +			# to use the busybox command in postinst.
> +			ln -sf busybox.nosuid ${D}${base_bindir}/busybox
>  		else
>  			if grep -q "CONFIG_FEATURE_SUID=3Dy" ${B}/.config; then
>  				install -m 4755 ${B}/busybox ${D}${base_bindir}
> @@ -198,6 +202,12 @@ do_install () {
>  			fi
>  			install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
>  			ln -sf busybox ${D}${base_bindir}/sh
> +			# We make this symlink here to eliminate the error when upgrading tog=
ether
> +			# with busybox-syslog. Without this symlink, the opkg may think of the
> +			# busybox.nosuid as obsolete and remove it, resulting in dead links l=
ike
> +			# /bin/sed -> /bin/busybox.nosuid. This will make upgrading busybox-s=
yslog fail.
> +			# This symlink will be safely deleted in postinst, thus no negative e=
ffect.
> +			ln -sf busybox ${D}${base_bindir}/busybox.nosuid
>  		fi
>  	else
>  		install -d ${D}${base_bindir} ${D}${base_sbindir}
> @@ -306,6 +316,44 @@ python do_package_prepend () {
>          set_alternative_vars("/etc/busybox.links.suid", "/bin/busybox.su=
id")
>  }
> =20
> +pkg_postinst_${PN} () {
> +	# This part of code is dedicated to the on target upgrade problem.
> +	# It's known that if we don't make appropriate symlinks before update-a=
lternatives calls,
> +	# there will be errors indicating missing commands such as 'sed'.
> +	# These symlinks will later be updated by update-alternatives calls.
> +	test -n 2 > /dev/null || alias test=3D'busybox test'
> +	if test "x$D" =3D "x"; then
> +		# Remove busybox.nosuid if it's a symlink, because this situation indi=
cates
> +		# that we're installing or upgrading to a one-binary busybox.
> +		if test -h /bin/busybox.nosuid; then
> +			rm -f /bin/busybox.nosuid
> +		fi
> +		for suffix in "" ".nosuid" ".suid"; do
> +			if test -e /etc/busybox.links$suffix; then
> +				while read link; do
> +					if test ! -e "$link"; then
> +						case "$link" in
> +							/*/*/*)
> +								to=3D"../../bin/busybox$suffix"
> +								;;
> +							/bin/*)
> +								to=3D"busybox$suffix"
> +								;;
> +							/*/*)
> +								to=3D"../bin/busybox$suffix"
> +								;;
> +						esac
> +						# we can use busybox here because even if we are using splitted bu=
sybox
> +						# we've made a symlink from /bin/busybox to /bin/busybox.nosuid.
> +						busybox rm -f $link
> +						busybox ln -s $to $link
> +					fi
> +				done < /etc/busybox.links$suffix
> +			fi
> +		done
> +	fi
> +}
> +
>  pkg_prerm_${PN} () {
>  	# This is so you can make busybox commit suicide - removing busybox wit=
h no other packages
>  	# providing its files, this will make update-alternatives work, but the=
 update-rc.d part
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHX8RAACgkQN1Ujt2V2gBy/eACgqin5qgrTPiL0Zfli0vIC3oK1
A+cAoJHvBAFv2yzAZI0tpO0rxbh6C4Do
=1Qo6
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
