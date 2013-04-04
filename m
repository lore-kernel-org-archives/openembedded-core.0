Received: from mail-pd0-f177.google.com ([209.85.192.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNeUo-00080h-2r
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 09:22:07 +0200
Received: by mail-pd0-f177.google.com with SMTP id u11so1271650pdi.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 00:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=25qVTztHJhbaFw/79FceYmEqFBghJTlF3H95FKMlw6M=;
	b=xQs7uWTAeIgkdUHBu71K6nNBStrAWHxU/2lDG83C+xHtjMjsJd9hHlccM4/i9dlpW2
	xuapWrG04zuRHHgJbxcUsvzA4uqbzXCmlVSwd16dsrDWYrSy2Our/UmCu1n+XU1tXOSo
	zH/bbkaxM2aFPPGFYgYwBxiWPDjVsnVfxBKrwRIp7I6e60XhAhE/a04EuY4I9Tc3zOIc
	K6JmnIFnFy3PuW95xrnPjhERa7+D2//IQnLgNlaI15oYX5wStSMIhOfZihbMJp3WBV/E
	5lkAXSamLiq2VsCH7QxjRhmxnuxoob+XVasRnFzaNGtLl9NDI/7el+O8blhfFF5jn92Y
	lx3g==
X-Received: by 10.68.172.5 with SMTP id ay5mr7234730pbc.53.1365059093054;
	Thu, 04 Apr 2013 00:04:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id s6sm9050983pbi.37.2013.04.04.00.04.50
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 00:04:51 -0700 (PDT)
Date: Thu, 4 Apr 2013 09:04:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130404070453.GA1271@jama.dyndns-home.com>
References: <1363601408-5528-1-git-send-email-Martin.Jansa@gmail.com>
	<20130404062147.GF10679@jama.dyndns-home.com>
MIME-Version: 1.0
In-Reply-To: <20130404062147.GF10679@jama.dyndns-home.com>
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
X-List-Received-Date: Thu, 04 Apr 2013 07:22:09 -0000
X-Groupsio-MsgNum: 37400
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline

--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2013 at 08:21:47AM +0200, Martin Jansa wrote:
> On Mon, Mar 18, 2013 at 11:10:08AM +0100, Martin Jansa wrote:
> > * original implementation by Antti Harju
>=20
> Nobody using external TC, interested in icecc?

If someone does not know how to setup icecc, there is surprisingly
up2date wiki page about it:
http://www.openembedded.org/wiki/Using_IceCC

Looks like nothing changed in icecc world since 2008..

> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/icecc.bbclass | 37 +++++++++++++++++++++++++++++++++----
> >  1 file changed, 33 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> > index f3e89a9..cf3f23d 100644
> > --- a/meta/classes/icecc.bbclass
> > +++ b/meta/classes/icecc.bbclass
> > @@ -47,6 +47,9 @@ def get_cross_kernel_cc(bb,d):
> >      kernel_cc =3D kernel_cc.strip()
> >      return kernel_cc
> > =20
> > +def get_icecc(d):
> > +    return d.getVar('ICECC_PATH') or os.popen("which icecc").read()[:-=
1]
> > +
> >  def create_path(compilers, bb, d):
> >      """
> >      Create Symlinks for the icecc in the staging directory
> > @@ -56,7 +59,7 @@ def create_path(compilers, bb, d):
> >          staging +=3D "-kernel"
> > =20
> >      #check if the icecc path is set by the user
> > -    icecc   =3D d.getVar('ICECC_PATH') or os.popen("which icecc").read=
()[:-1]
> > +    icecc =3D get_icecc(d)
> > =20
> >      # Create the dir if necessary
> >      try:
> > @@ -151,6 +154,11 @@ def icc_path(bb,d):
> >          prefix =3D d.expand('${HOST_PREFIX}')
> >          return create_path( [prefix+"gcc", prefix+"g++"], bb, d)     =
=20
> > =20
> > +def icc_get_external_tool(bb, d, tool):
> > +    external_toolchain_bindir =3D d.expand('${EXTERNAL_TOOLCHAIN}${bin=
dir_cross}')
> > +    target_prefix =3D d.expand('${TARGET_PREFIX}')
> > +    return os.path.join(external_toolchain_bindir, '%s%s' % (target_pr=
efix, tool))
> > +
> >  def icc_get_tool(bb, d, tool):
> >      if icc_is_native(bb, d):
> >          return os.popen("which %s" % tool).read()[:-1]
> > @@ -159,7 +167,26 @@ def icc_get_tool(bb, d, tool):
> >      else:
> >          ice_dir =3D d.expand('${STAGING_BINDIR_TOOLCHAIN}')
> >          target_sys =3D d.expand('${TARGET_SYS}')
> > -        return os.path.join(ice_dir, "%s-%s" % (target_sys, tool))
> > +        tool_bin =3D os.path.join(ice_dir, "%s-%s" % (target_sys, tool=
))
> > +        if os.path.isfile(tool_bin):
> > +            return tool_bin
> > +        else:
> > +            external_tool_bin =3D icc_get_external_tool(bb, d, tool)
> > +            if os.path.isfile(external_tool_bin):
> > +                return external_tool_bin
> > +            else:
> > +                return ""
> > +
> > +def icc_get_and_check_tool(bb, d, tool):
> > +    # Check that g++ or gcc is not a symbolic link to icecc binary in
> > +    # PATH or icecc-create-env script will silently create an invalid
> > +    # compiler environment package.
> > +    t =3D icc_get_tool(bb, d, tool)
> > +    if t and os.popen("readlink -f %s" % t).read()[:-1] =3D=3D get_ice=
cc(d):
> > +        bb.error("%s is a symlink to %s in PATH and this prevents icec=
c from working" % (t, get_icecc(d)))
> > +        return ""
> > +    else:
> > +        return t
> > =20
> >  set_icecc_env() {
> >      if [ "x${ICECC_DISABLED}" !=3D "x" ]
> > @@ -178,8 +205,8 @@ set_icecc_env() {
> >          return
> >      fi
> > =20
> > -    ICECC_CC=3D"${@icc_get_tool(bb,d, "gcc")}"
> > -    ICECC_CXX=3D"${@icc_get_tool(bb,d, "g++")}"
> > +    ICECC_CC=3D"${@icc_get_and_check_tool(bb, d, "gcc")}"
> > +    ICECC_CXX=3D"${@icc_get_and_check_tool(bb, d, "g++")}"
> >      if [ ! -x "${ICECC_CC}" -o ! -x "${ICECC_CXX}" ]
> >      then
> >          return
> > @@ -207,6 +234,8 @@ set_icecc_env() {
> >      export ICECC_VERSION ICECC_CC ICECC_CXX
> >      export PATH=3D"$ICE_PATH:$PATH"
> >      export CCACHE_PATH=3D"$PATH"
> > +
> > +    bbnote "Using icecc"
> >  }
> > =20
> >  do_configure_prepend() {
> > --=20
> > 1.8.1.5
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFdJhUACgkQN1Ujt2V2gByI/gCePDCvIyYDCDiQiEv4hYYbNwd9
WTcAn2EQODSxwdDlcsJZksKdRW6RIHs3
=Ta0K
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
