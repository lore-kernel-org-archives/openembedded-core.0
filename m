Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNdp6-0004l5-Jq
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 08:39:01 +0200
Received: by mail-da0-f41.google.com with SMTP id w4so997512dam.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 23:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=56DBY9T6BXZDFvy511nDMf8VZdxXYNpgWYttSA3M35o=;
	b=VurS3o6uIAxwBbjspZhwTpH+aJskpU1Kx3ZH/phuK54h/uQjlnWZgP2010Y/3Q9tMJ
	9TMsv7Z9bE166gZYVWqJCa254GPA5cVy4gnbfnohepCgLPe4tO3t1eCF9j1P8+nz6kJS
	EHbxxtJa1a4fepYCZuRAXeEVIvRfoAZfHtRUVLrpxflAaFF4K3+khvWRomNua0I+vHmX
	ox1U/7bp3FfSK95dMSjfEemoPlr4VRCbczv8IcvFOZWcnV0e3RvA7CLxrSDR6gMGaLls
	PYJdSxSYdW8Z3gat/2RJDt+CvhRu6dahWsSjICZyM157P9izN8gerT4mVQ/P7RWOKzbW
	ld9w==
X-Received: by 10.66.8.34 with SMTP id o2mr7501216paa.182.1365056507568;
	Wed, 03 Apr 2013 23:21:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qa6sm8886604pbc.46.2013.04.03.23.21.44
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 23:21:46 -0700 (PDT)
Date: Thu, 4 Apr 2013 08:21:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130404062147.GF10679@jama.dyndns-home.com>
References: <1363601408-5528-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1363601408-5528-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC] icecc: Allow to use this bbclass together with external toolchains
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
X-List-Received-Date: Thu, 04 Apr 2013 06:39:01 -0000
X-Groupsio-MsgNum: 37395
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f61P+fpdnY2FZS1u"
Content-Disposition: inline

--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2013 at 11:10:08AM +0100, Martin Jansa wrote:
> * original implementation by Antti Harju

Nobody using external TC, interested in icecc?

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/icecc.bbclass | 37 +++++++++++++++++++++++++++++++++----
>  1 file changed, 33 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index f3e89a9..cf3f23d 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -47,6 +47,9 @@ def get_cross_kernel_cc(bb,d):
>      kernel_cc =3D kernel_cc.strip()
>      return kernel_cc
> =20
> +def get_icecc(d):
> +    return d.getVar('ICECC_PATH') or os.popen("which icecc").read()[:-1]
> +
>  def create_path(compilers, bb, d):
>      """
>      Create Symlinks for the icecc in the staging directory
> @@ -56,7 +59,7 @@ def create_path(compilers, bb, d):
>          staging +=3D "-kernel"
> =20
>      #check if the icecc path is set by the user
> -    icecc   =3D d.getVar('ICECC_PATH') or os.popen("which icecc").read()=
[:-1]
> +    icecc =3D get_icecc(d)
> =20
>      # Create the dir if necessary
>      try:
> @@ -151,6 +154,11 @@ def icc_path(bb,d):
>          prefix =3D d.expand('${HOST_PREFIX}')
>          return create_path( [prefix+"gcc", prefix+"g++"], bb, d)     =20
> =20
> +def icc_get_external_tool(bb, d, tool):
> +    external_toolchain_bindir =3D d.expand('${EXTERNAL_TOOLCHAIN}${bindi=
r_cross}')
> +    target_prefix =3D d.expand('${TARGET_PREFIX}')
> +    return os.path.join(external_toolchain_bindir, '%s%s' % (target_pref=
ix, tool))
> +
>  def icc_get_tool(bb, d, tool):
>      if icc_is_native(bb, d):
>          return os.popen("which %s" % tool).read()[:-1]
> @@ -159,7 +167,26 @@ def icc_get_tool(bb, d, tool):
>      else:
>          ice_dir =3D d.expand('${STAGING_BINDIR_TOOLCHAIN}')
>          target_sys =3D d.expand('${TARGET_SYS}')
> -        return os.path.join(ice_dir, "%s-%s" % (target_sys, tool))
> +        tool_bin =3D os.path.join(ice_dir, "%s-%s" % (target_sys, tool))
> +        if os.path.isfile(tool_bin):
> +            return tool_bin
> +        else:
> +            external_tool_bin =3D icc_get_external_tool(bb, d, tool)
> +            if os.path.isfile(external_tool_bin):
> +                return external_tool_bin
> +            else:
> +                return ""
> +
> +def icc_get_and_check_tool(bb, d, tool):
> +    # Check that g++ or gcc is not a symbolic link to icecc binary in
> +    # PATH or icecc-create-env script will silently create an invalid
> +    # compiler environment package.
> +    t =3D icc_get_tool(bb, d, tool)
> +    if t and os.popen("readlink -f %s" % t).read()[:-1] =3D=3D get_icecc=
(d):
> +        bb.error("%s is a symlink to %s in PATH and this prevents icecc =
=66rom working" % (t, get_icecc(d)))
> +        return ""
> +    else:
> +        return t
> =20
>  set_icecc_env() {
>      if [ "x${ICECC_DISABLED}" !=3D "x" ]
> @@ -178,8 +205,8 @@ set_icecc_env() {
>          return
>      fi
> =20
> -    ICECC_CC=3D"${@icc_get_tool(bb,d, "gcc")}"
> -    ICECC_CXX=3D"${@icc_get_tool(bb,d, "g++")}"
> +    ICECC_CC=3D"${@icc_get_and_check_tool(bb, d, "gcc")}"
> +    ICECC_CXX=3D"${@icc_get_and_check_tool(bb, d, "g++")}"
>      if [ ! -x "${ICECC_CC}" -o ! -x "${ICECC_CXX}" ]
>      then
>          return
> @@ -207,6 +234,8 @@ set_icecc_env() {
>      export ICECC_VERSION ICECC_CC ICECC_CXX
>      export PATH=3D"$ICE_PATH:$PATH"
>      export CCACHE_PATH=3D"$PATH"
> +
> +    bbnote "Using icecc"
>  }
> =20
>  do_configure_prepend() {
> --=20
> 1.8.1.5
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f61P+fpdnY2FZS1u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFdG/sACgkQN1Ujt2V2gBwTAACeOypZOzj0gjTEsCJE7waXThZO
HEgAn3FQ+iRuNw2P9VXq7DaNWHCPVsEw
=V4DU
-----END PGP SIGNATURE-----

--f61P+fpdnY2FZS1u--
