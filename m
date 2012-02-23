Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0ZzN-0002DD-2n
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 15:49:45 +0100
Received: by eekd41 with SMTP id d41so576022eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 06:41:23 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.10.4 as permitted sender) client-ip=10.213.10.4; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.10.4 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.10.4])
	by 10.213.10.4 with SMTP id n4mr549085ebn.34.1330008083836 (num_hops =
	1); Thu, 23 Feb 2012 06:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dFkrAPTjHjVejSX29ppv6kaPFnhbXSw5nyiJ2+noPnY=;
	b=UVHpqISanEUpMiuUuRddXI7GayzDkgEHCFwohl52pLLbZ6LL2eG8pw4pa3/BKRHcdv
	jqgvZMSmH12Y6MH4nJnvkXJ/BpwP3pUIa5zTQ8i1l+mC/niMXUD5VOkywISaFsWns5F8
	z041BGjhOzWJPjR589sp6+P/1hNGAiTKd5vn4=
Received: by 10.213.10.4 with SMTP id n4mr430346ebn.34.1330008083677;
	Thu, 23 Feb 2012 06:41:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm6025420eeb.8.2012.02.23.06.41.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 06:41:21 -0800 (PST)
Date: Thu, 23 Feb 2012 15:41:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120223144120.GV3769@jama.jama.net>
References: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
	<a7a11da5e692eba27bb228c6e34c4fbe56e7ad6c.1330004039.git.richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <a7a11da5e692eba27bb228c6e34c4fbe56e7ad6c.1330004039.git.richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 16/16] sstatesig.py: Add handling for machine specific module depenedencies
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
X-List-Received-Date: Thu, 23 Feb 2012 14:49:45 -0000
X-Groupsio-MsgNum: 17789
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YnIutncTLXsDZs5t"
Content-Disposition: inline

--YnIutncTLXsDZs5t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 01:38:25PM +0000, Richard Purdie wrote:
> Adding dependencies on machine specific recipes from generic packages
> causes a rebuild of the generic package per machine if using signatures
> for the stamp files which is unacceptable.
>=20
> We need to declare that RRECOMMENDS on kernel-module-* are safe
> and that we shouldn't care about these machine specific dependencies
> from a stamp perspective. This change adds code which does this.
>=20
> It depends on a change in bitbake to expose the dataCache object
> which can be used to make the calculations we need to allow this to
> work correctly.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Improves qemux86-64copy build times significantly :)

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>


> ---
>  meta/lib/oe/sstatesig.py |   26 ++++++++++++++++++++------
>  1 files changed, 20 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index ee7cbad..5a64882 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -1,6 +1,6 @@
>  import bb.siggen
> =20
> -def sstate_rundepfilter(fn, recipename, task, dep, depname):
> +def sstate_rundepfilter(fn, recipename, task, dep, depname, dataCache):
>      # Return True if we should keep the dependency, False to drop it
>      def isNative(x):
>          return x.endswith("-native")
> @@ -8,13 +8,16 @@ def sstate_rundepfilter(fn, recipename, task, dep, depn=
ame):
>          return x.endswith("-cross") or x.endswith("-cross-initial") or x=
=2Eendswith("-cross-intermediate")
>      def isNativeSDK(x):
>          return x.endswith("-nativesdk")
> +    def isKernel(fn):
> +        inherits =3D " ".join(dataCache.inherits[fn])
> +        return inherits.find("module-base.bbclass") !=3D -1 or inherits.=
find("linux-kernel-base.bbclass") !=3D -1
> =20
>      # Always include our own inter-task dependencies
>      if recipename =3D=3D depname:
>          return True
> =20
>      # Quilt (patch application) changing isn't likely to affect anything
> -    if depname =3D=3D "quilt-native":
> +    if depname =3D=3D "quilt-native" and recipename !=3D "quilt-native":
>          return False
>      # Don't change native/cross/nativesdk recipe dependencies any further
>      if isNative(recipename) or isCross(recipename) or isNativeSDK(recipe=
name):
> @@ -30,6 +33,17 @@ def sstate_rundepfilter(fn, recipename, task, dep, dep=
name):
>      if depname in ['sysvinit-inittab', 'shadow-securetty', 'opkg-config-=
base', 'netbase', 'formfactor', 'xserver-xf86-config', 'pointercal', 'base-=
files']:
>          return False
> =20
> +    # Kernel modules are well namespaced. We don't want to depend on the=
 kernel's checksum
> +    # if we're just doing an RRECOMMENDS_xxx =3D "kernel-module-*", not =
least because the checksum
> +    # is machine specific.
> +    # Therefore if we're not a kernel or a module recipe (inheriting the=
 kernel classes)
> +    # and we reccomend a kernel-module, we exclude the dependency.
> +    depfn =3D dep.rsplit(".", 1)[0]
> +    if dataCache and isKernel(depfn) and not isKernel(fn):
> +        for pkg in dataCache.runrecs[fn]:
> +            if " ".join(dataCache.runrecs[fn][pkg]).find("kernel-module-=
") !=3D -1:
> +                return False
> +
>      # Default to keep dependencies
>      return True
> =20
> @@ -37,15 +51,15 @@ class SignatureGeneratorOEBasic(bb.siggen.SignatureGe=
neratorBasic):
>      name =3D "OEBasic"
>      def init_rundepcheck(self, data):
>          pass
> -    def rundep_check(self, fn, recipename, task, dep, depname):
> -        return sstate_rundepfilter(fn, recipename, task, dep, depname)
> +    def rundep_check(self, fn, recipename, task, dep, depname, dataCache=
 =3D None):
> +        return sstate_rundepfilter(fn, recipename, task, dep, depname, d=
ataCache)
> =20
>  class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHas=
h):
>      name =3D "OEBasicHash"
>      def init_rundepcheck(self, data):
>          pass
> -    def rundep_check(self, fn, recipename, task, dep, depname):
> -        return sstate_rundepfilter(fn, recipename, task, dep, depname)
> +    def rundep_check(self, fn, recipename, task, dep, depname, dataCache=
 =3D None):
> +        return sstate_rundepfilter(fn, recipename, task, dep, depname, d=
ataCache)
> =20
>  # Insert these classes into siggen's namespace so it can see and select =
them
>  bb.siggen.SignatureGeneratorOEBasic =3D SignatureGeneratorOEBasic
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

--YnIutncTLXsDZs5t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9GUA8ACgkQN1Ujt2V2gBz2AwCfYRGbjKZnHMjmN32a33a2ka3C
3swAn1e96yYlFsTxuhEGMKbt626fs4U4
=WrtQ
-----END PGP SIGNATURE-----

--YnIutncTLXsDZs5t--
