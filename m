Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0bIt-00060B-TJ
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:13:59 +0100
Received: by eekd41 with SMTP id d41so632394eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 08:05:38 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.32.67 as permitted sender) client-ip=10.213.32.67; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.32.67 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.32.67])
	by 10.213.32.67 with SMTP id b3mr620881ebd.75.1330013138686 (num_hops =
	1); Thu, 23 Feb 2012 08:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pRuhEe8RW85fhc0HE6n6nysi9UgVF6gp5KeprHD0xPk=;
	b=hJe0sQ5o3uZx5f2gAdfB5OYFU16et8C8KB510IWKhUhA63ljUdL1Fd5HgA/wEZeYXu
	uGdTnRZ0zKVLsDjkfzpPjKF9iYXcPn+Kmm/l9eFkQ2pkPs7ySmjKvcbL43g00/F2u27T
	UJsxrMk+oSbzK0TbaKHSk5SZw4X5a4iZdZ4VA=
Received: by 10.213.32.67 with SMTP id b3mr488643ebd.75.1330013138469;
	Thu, 23 Feb 2012 08:05:38 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm6772689eeb.8.2012.02.23.08.05.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 08:05:37 -0800 (PST)
Date: Thu, 23 Feb 2012 17:05:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120223160536.GY3769@jama.jama.net>
References: <cover.1330012029.git.Martin.Jansa@gmail.com>
	<c79b78bd5e3d4869682f7d3a0d09af61e3dc4da4.1330012029.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c79b78bd5e3d4869682f7d3a0d09af61e3dc4da4.1330012029.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 11/11] sstate.bbclass: improve performance of sstate package creation
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
X-List-Received-Date: Thu, 23 Feb 2012 16:14:00 -0000
X-Groupsio-MsgNum: 17834
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vavxEBoGuREFpPEl"
Content-Disposition: inline

--vavxEBoGuREFpPEl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 04:50:27PM +0100, Martin Jansa wrote:
> * also fixes replacing paths for perl where cmd line was probably
>   too long for os.system(cmd) (it had 560410 characters because a lot of
>   files from sstate_scan_cmd).
> * also print those 2 commands so we can find them in log.do_package
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/sstate.bbclass |   39 ++++++++++++++++---------------------=
--
>  1 files changed, 16 insertions(+), 23 deletions(-)
>=20
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index ee9bf05..6883843 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -304,38 +304,31 @@ python sstate_cleanall() {
>  def sstate_hardcode_path(d):
>  	# Need to remove hardcoded paths and fix these when we install the
>  	# staging packages.
> -	sstate_scan_cmd =3D d.getVar('SSTATE_SCAN_CMD', True)
> -	p =3D os.popen("%s" % sstate_scan_cmd)
> -	file_list =3D p.read()
> -
> -	if file_list =3D=3D "":
> -		p.close()
> -		return
> =20
>  	staging =3D d.getVar('STAGING_DIR', True)
>  	staging_target =3D d.getVar('STAGING_DIR_TARGET', True)
>  	staging_host =3D d.getVar('STAGING_DIR_HOST', True)
>  	sstate_builddir =3D d.getVar('SSTATE_BUILDDIR', True)
> =20
> -	files =3D " ".join(file_list.split('\n'))
> -
>  	if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativ=
esdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_clas=
s('cross-canadian', d):
> -		cmd =3D "sed -i -e s:%s:FIXMESTAGINGDIR:g %s" % (staging, files)
> +		sstate_sed_cmd =3D "sed -i -e 's:%s:FIXMESTAGINGDIR:g'" % (staging)
>  	elif bb.data.inherits_class('cross', d):
> -		cmd =3D "sed -i -e s:%s:FIXMESTAGINGDIRTARGET:g %s \
> -			sed -i -e s:%s:FIXMESTAGINGDIR:g %s" % (staging_target, files, stagin=
g, files)
> +		sstate_sed_cmd =3D "sed -i -e 's:%s:FIXMESTAGINGDIRTARGET:g; s:%s:FIXM=
ESTAGINGDIR:g'" % (staging_target, staging)
>  	else:
> -		cmd =3D "sed -i -e s:%s:FIXMESTAGINGDIRHOST:g %s" % (staging_host, fil=
es)
> -
> -	if files:
> -		os.system(cmd)
> -		fix =3D open("%sfixmepath" % (sstate_builddir), "w")
> -		fixme =3D []
> -		for f in file_list.split('\n'):
> -			fixme.append(f.replace(sstate_builddir, ""))
> -		fix.write("\n".join(fixme))
> -		fix.close()
> -	p.close()
> +		sstate_sed_cmd =3D "sed -i -e 's:%s:FIXMESTAGINGDIRHOST:g'" % (staging=
_host)
> +=09
> +	sstate_scan_cmd =3D d.getVar('SSTATE_SCAN_CMD', True)
> +	sstate_filelist_cmd =3D "tee %sfixmepath" % (sstate_builddir)
> +
> +	# fixmepath file needs relative paths, drop sstate_builddir prefix

Ah.. forgot to squash small fix before sending, but it's correct in
jansa/pull branch:

-	sstate_filelist_relative_cmd =3D "sed -i -e 's:^%s::g %sfixmepath'" % (ss=
tate_builddir, sstate_builddir)
+	sstate_filelist_relative_cmd =3D "sed -i -e 's:^%s::g' %sfixmepath'" % (s=
state_builddir, sstate_builddir)

Cheers,

> +
> +	sstate_hardcode_cmd =3D "%s | %s | xargs %s" % (sstate_scan_cmd, sstate=
_filelist_cmd, sstate_sed_cmd)
> +
> +	print "Removing hardcoded paths from sstate package: '%s'" % (sstate_ha=
rdcode_cmd)
> +	os.system(sstate_hardcode_cmd)
> +	print "Replacing absolute paths in fixmepath file: '%s'" % (sstate_file=
list_relative_cmd)
> +	os.system(sstate_filelist_relative_cmd)
> =20
>  def sstate_package(ss, d):
>      import oe.path
> --=20
> 1.7.8.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vavxEBoGuREFpPEl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9GY9AACgkQN1Ujt2V2gBwdJQCbBxxDYAEcoFEyZtcrdzC8m/TV
3vUAnjoCuNadRqzdaArZhR0YD8FwUkme
=xRIS
-----END PGP SIGNATURE-----

--vavxEBoGuREFpPEl--
