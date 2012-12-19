Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TlHhj-0001Ch-NG
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 12:20:55 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so863577dak.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2012 03:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Yki5O4IM3MEjSBE9WwMS68xRZ3MR+iDzxP5rHHtyn10=;
	b=RNB3Bt0v7n5J+kR2qilOmTW34eFicpy3wzpNP2Tn7d+WvgF0Ch+E/khQP8VeJMdSyD
	SRxyr9bR65Qx1fwqIis8RuDt09bJkNJZg8yVOvox4dcMNtDoajugxXOEkl20MR/TJGCa
	ovt5u9QFU6YpV8We7cEy537YlgpdsthvFc+NXclXplwbLT7WSaJ/1GyocjrpyxqqBv6c
	boYk4ri0U3wjaPxwasBkirKYKD9EjOrE7/LzVfUYP6MzIvQ4hy3ZY5U2k4RhbUafO5Tq
	gRCWbH30nwhVCtHMhqRN1zELJlDNp6JmqqiLKnIPIOcQEktxALwieEdyZXl4F9O7mB78
	dsmw==
X-Received: by 10.68.83.68 with SMTP id o4mr17730371pby.25.1355915167925;
	Wed, 19 Dec 2012 03:06:07 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bt2sm3261444pab.15.2012.12.19.03.06.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Dec 2012 03:06:06 -0800 (PST)
Date: Wed, 19 Dec 2012 12:06:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Message-ID: <20121219110604.GB3525@jama.palm1.palmone.com>
References: <cover.1355902677.git.kai.kang@windriver.com>
	<1d85ab32f49b6d3eaab89eb78afe131415b00794.1355902677.git.kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1d85ab32f49b6d3eaab89eb78afe131415b00794.1355902677.git.kai.kang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] oprofile: use dynamic root home directory
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
X-List-Received-Date: Wed, 19 Dec 2012 11:20:58 -0000
X-Groupsio-MsgNum: 32880
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Content-Disposition: inline

--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 19, 2012 at 05:39:39PM +0800, Kang Kai wrote:
> Use stub "ROOTHOME" to replace "/home/root" in oprofile-root.patch, then
> we can substitute it with configured root home directory.
>=20
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  meta/recipes-kernel/oprofile/oprofile.inc          |    1 +
>  .../oprofile/oprofile/oprofile-root.patch          |   23 ++++++++++++--=
-----
>  2 files changed, 15 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-ker=
nel/oprofile/oprofile.inc
> index b3ce852..0977065 100644
> --- a/meta/recipes-kernel/oprofile/oprofile.inc
> +++ b/meta/recipes-kernel/oprofile/oprofile.inc
> @@ -31,6 +31,7 @@ inherit autotools
> =20
>  EXTRA_OECONF =3D "--with-kernel-support --without-x"
>  do_configure () {
> +        find . -type f | xargs sed -i 's#ROOTHOME#${ROOT_HOME}#'
>  	cp ${WORKDIR}/acinclude.m4 ${S}/
>  	autotools_do_configure

You should use tab here.

Cheers,

>  }
> diff --git a/meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch b/=
meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch
> index db63a8e..f3fe4c9 100644
> --- a/meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch
> +++ b/meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch
> @@ -4,6 +4,11 @@ Upstream-Status: inappropriate [OE specific]
> =20
>  Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> =20
> +Replace "/home/root" with stub "ROOTHOME", then substitute it with
> +real root home directory which is configured dymanically.
> +
> +Signed-off-by: Kang Kai <kai.kang@windriver.com>
> +
>  diff -ur oprofile-0.9.7.orig/doc/opcontrol.1.in oprofile-0.9.7/doc/opcon=
trol.1.in
>  --- oprofile-0.9.7.orig/doc/opcontrol.1.in	2011-07-04 21:25:04.000000000=
 -0500
>  +++ oprofile-0.9.7/doc/opcontrol.1.in	2012-07-02 14:02:16.358865420 -0500
> @@ -12,7 +17,7 @@ diff -ur oprofile-0.9.7.orig/doc/opcontrol.1.in oprofil=
e-0.9.7/doc/opcontrol.1.i
>   .SH FILES
>   .TP
>  -.I /root/.oprofile/daemonrc
> -+.I /home/root/.oprofile/daemonrc
> ++.I ROOTHOME/.oprofile/daemonrc
>   Configuration file for opcontrol
>   .TP
>   .I /var/lib/oprofile/samples/
> @@ -24,7 +29,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.1 oprofile-0.=
9.7/doc/oprofile.1
>   Configuration files
>   .TP
>  -.I /root/.oprofile/daemonrc
> -+.I /home/root/.oprofile/daemonrc
> ++.I ROOTHOME/.oprofile/daemonrc
>   Configuration file for opcontrol
>   .TP
>   .I /opt/oprofile-0.9.7-rc3/share/oprofile/
> @@ -36,7 +41,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.1.in oprofile=
-0.9.7/doc/oprofile.1.in
>   Configuration files
>   .TP
>  -.I /root/.oprofile/daemonrc
> -+.I /home/root/.oprofile/daemonrc
> ++.I ROOTHOME/.oprofile/daemonrc
>   Configuration file for opcontrol
>   .TP
>   .I @prefix@/share/oprofile/
> @@ -48,7 +53,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.html oprofile=
-0.9.7/doc/oprofile.html
>                   <p>
>   		    Followed by list arguments for profiling set up. List of arguments
>  -		    saved in <code class=3D"filename">/root/.oprofile/daemonrc</code>.
> -+		    saved in <code class=3D"filename">/home/root/.oprofile/daemonrc</=
code>.
> ++		    saved in <code class=3D"filename">ROOTHOME/.oprofile/daemonrc</co=
de>.
>   		    Giving this option is not necessary; you can just directly pass o=
ne
>   		    of the setup options, e.g. <span class=3D"command"><strong>opcont=
rol --no-vmlinux</strong></span>.
>   		  </p>
> @@ -57,7 +62,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.html oprofile=
-0.9.7/doc/oprofile.html
>                   <p>
>   		    Start data collection with either arguments provided by <code cla=
ss=3D"option">--setup</code>
>  -		or information saved in <code class=3D"filename">/root/.oprofile/daem=
onrc</code>. Specifying
> -+		or information saved in <code class=3D"filename">/home/root/.oprofile=
/daemonrc</code>. Specifying
> ++		or information saved in <code class=3D"filename">ROOTHOME/.oprofile/d=
aemonrc</code>. Specifying
>   		the addition <code class=3D"option">--verbose</code> makes the daemon=
 generate lots of debug data
>   		whilst it is running.
>   		</p>
> @@ -69,7 +74,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.xml oprofile-=
0.9.7/doc/oprofile.xml
>   		<listitem><para>
>   		    Followed by list arguments for profiling set up. List of arguments
>  -		    saved in <filename>/root/.oprofile/daemonrc</filename>.
> -+		    saved in <filename>/home/root/.oprofile/daemonrc</filename>.
> ++		    saved in <filename>ROOTHOME/.oprofile/daemonrc</filename>.
>   		    Giving this option is not necessary; you can just directly pass o=
ne
>   		    of the setup options, e.g. <command>opcontrol --no-vmlinux</comma=
nd>.
>   		  </para></listitem>
> @@ -78,7 +83,7 @@ diff -ur oprofile-0.9.7.orig/doc/oprofile.xml oprofile-=
0.9.7/doc/oprofile.xml
>   		<listitem><para>
>   		    Start data collection with either arguments provided by <option>-=
-setup</option>
>  -		or information saved in <filename>/root/.oprofile/daemonrc</filename>=
=2E Specifying
> -+		or information saved in <filename>/home/root/.oprofile/daemonrc</file=
name>. Specifying
> ++		or information saved in <filename>ROOTHOME/.oprofile/daemonrc</filena=
me>. Specifying
>   		the addition <option>--verbose</option> makes the daemon generate lot=
s of debug data
>   		whilst it is running.
>   		</para></listitem>
> @@ -90,7 +95,7 @@ diff -ur oprofile-0.9.7.orig/gui/oprof_start_util.cpp o=
profile-0.9.7/gui/oprof_s
>   string const get_config_dir()
>   {
>  -	return "/root";
> -+	return "/home/root";
> ++	return "ROOTHOME";
>   }
>  =20
>   string daemon_pid;
> @@ -102,7 +107,7 @@ diff -ur oprofile-0.9.7.orig/utils/opcontrol oprofile=
-0.9.7/utils/opcontrol
>  =20
>   	# location for daemon setup information
>  -	SETUP_DIR=3D"/root/.oprofile"
> -+	SETUP_DIR=3D"/home/root/.oprofile"
> ++	SETUP_DIR=3D"ROOTHOME/.oprofile"
>   	SETUP_FILE=3D"$SETUP_DIR/daemonrc"
>   	SEC_SETUP_FILE=3D"$SETUP_DIR/daemonrc_new"
>  =20
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDRn5wACgkQN1Ujt2V2gBxYyQCfRumUBUKr1vyxHMdtUhgsyBzi
+oMAoLuVmGgsz7gkUSFsxTwbfNQ3JX3U
=5p3t
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--
