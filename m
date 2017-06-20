Return-Path: <prvs=337f61393=Mikko.Rapeli@bmw.de>
Received: from esa3.bmw.c3s2.iphmx.com (esa3.bmw.c3s2.iphmx.com
	[68.232.133.150])
	by mail.openembedded.org (Postfix) with ESMTP id 485516FF73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 12:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1497962933; x=1529498933;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=EIGYHcM5wHv9QJqro4cxN2rc2MLOASkTHWBtCiMo1ZI=;
	b=WqYaAv02hrMsCnxBkjPLaPj4S4B+RQdvJ4C10EfMTN6GQW59wyYvpfEN
	kLLNMIQpzEFXzqmJdGyjDXYTq+XKOmlRLW4RbY8wrWT3tq6fqRPRF1JWJ
	sCeamCfGwAMP3S598xU4jvHEaqHOmmKDkrxGP4nVDZTfvfVwbrWgAl3tA c=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa3.bmw.c3s2.iphmx.com with ESMTP/TLS; 20 Jun 2017 14:48:28 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw5.muc with ESMTP/TLS;
	20 Jun 2017 14:48:26 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb1.muc with ESMTP/TLS; 20 Jun 2017 14:48:25 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Tue, 20 Jun 2017 14:48:24 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1263.000;
	Tue, 20 Jun 2017 14:48:24 +0200
From: <Mikko.Rapeli@bmw.de>
To: <poky@yoctoproject.org>
Thread-Topic: [PATCH 3/3 v2] meta: Fix return value checks from
	subprocess.call()'s
Thread-Index: AQHS2u8+zfBp/dq+j0+MybW5e6K6EKItr5wA
Date: Tue, 20 Jun 2017 12:48:24 +0000
Message-ID: <20170620124824.ndyxisbbwhqt6fn5@hiutale>
References: <20170601125029.wli6reydiovo7xjk@hiutale>
	<1496332394-6615-1-git-send-email-mikko.rapeli@bmw.de>
In-Reply-To: <1496332394-6615-1-git-send-email-mikko.rapeli@bmw.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3 v2] meta: Fix return value checks from subprocess.call()'s
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
X-List-Received-Date: Tue, 20 Jun 2017 12:48:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8C791FE16E961D47B4DB865CF466A92B@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 01, 2017 at 06:53:14PM +0300, Mikko Rapeli wrote:
> Python function subprocess.call() returns the return value of the
> executed process. If return values are not checked, errors may
> go unnoticed and bad things can happen.
>=20
> Change all callers of subprocess.call() which do not check for
> the return value to use subprocess.check_call() which raises
> CalledProcessError if the subprocess returns with non-zero value.
>=20
> https://docs.python.org/2/library/subprocess.html#using-the-subprocess-mo=
dule
>=20
> All users of the function were found with:
>=20
> $ git grep "subprocess\.call" | \
>   egrep -v 'if.*subprocess\.call|=3D\ +subprocess\.call|return.*subproces=
s\.call'
>=20
> Tested similar patch on top of yocto jethro. Only compile tested
> core-image-minimal on poky master branch.

The bitbake and scripts parts from this patch series were merged already, b=
ut
this not.

Are there problems with this patch?

-Mikko

> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/classes/archiver.bbclass            | 2 +-
>  meta/classes/cml1.bbclass                | 2 +-
>  meta/classes/kernel-module-split.bbclass | 2 +-
>  meta/classes/sstate.bbclass              | 4 ++--
>  meta/lib/oeqa/utils/buildproject.py      | 2 +-
>  meta/lib/oeqa/utils/targetbuild.py       | 4 ++--
>  meta/recipes-extended/cups/cups.inc      | 2 +-
>  7 files changed, 9 insertions(+), 9 deletions(-)
>=20
> v2:
> split patches to bitbake, meta and scripts
>=20
> v1:
> http://lists.openembedded.org/pipermail/openembedded-core/2017-May/136901=
.html
>=20
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclas=
s
> index 2c04557..703eacb 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -288,7 +288,7 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
>      os.chdir(dirname)
>      out_file =3D os.path.join(ar_outdir, '%s-diff.gz' % d.getVar('PF'))
>      diff_cmd =3D 'diff -Naur %s.orig %s.patched | gzip -c > %s' % (basen=
ame, basename, out_file)
> -    subprocess.call(diff_cmd, shell=3DTrue)
> +    subprocess.check_call(diff_cmd, shell=3DTrue)
>      bb.utils.remove(src_patched, recurse=3DTrue)
> =20
>  # Run do_unpack and do_patch
> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> index 38e6613..eb8e790 100644
> --- a/meta/classes/cml1.bbclass
> +++ b/meta/classes/cml1.bbclass
> @@ -63,7 +63,7 @@ python do_diffconfig() {
> =20
>      if isdiff:
>          statement =3D 'diff --unchanged-line-format=3D --old-line-format=
=3D --new-line-format=3D"%L" ' + configorig + ' ' + config + '>' + fragment
> -        subprocess.call(statement, shell=3DTrue)
> +        subprocess.check_call(statement, shell=3DTrue)
> =20
>          shutil.copy(configorig, config)
> =20
> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kern=
el-module-split.bbclass
> index 5e10dcf..1035525 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -47,7 +47,7 @@ python split_kernel_module_packages () {
>          tf =3D tempfile.mkstemp()
>          tmpfile =3D tf[1]
>          cmd =3D "%sobjcopy -j .modinfo -O binary %s %s" % (d.getVar("HOS=
T_PREFIX") or "", file, tmpfile)
> -        subprocess.call(cmd, shell=3DTrue)
> +        subprocess.check_call(cmd, shell=3DTrue)
>          f =3D open(tmpfile)
>          l =3D f.read().split("\000")
>          f.close()
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 0a12935..f446c3d 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -404,7 +404,7 @@ python sstate_hardcode_path_unpack () {
>              return
> =20
>          bb.note("Replacing fixme paths in sstate package: %s" % (sstate_=
hardcode_cmd))
> -        subprocess.call(sstate_hardcode_cmd, shell=3DTrue)
> +        subprocess.check_call(sstate_hardcode_cmd, shell=3DTrue)
> =20
>          # Need to remove this or we'd copy it into the target directory =
and may=20
>          # conflict with another writer
> @@ -453,7 +453,7 @@ def sstate_clean_manifest(manifest, d, prefix=3DNone)=
:
>      if os.path.exists(manifest + ".postrm"):
>          import subprocess
>          os.chmod(postrm, 0o755)
> -        subprocess.call(postrm, shell=3DTrue)
> +        subprocess.check_call(postrm, shell=3DTrue)
>          oe.path.remove(postrm)
> =20
>      oe.path.remove(manifest)
> diff --git a/meta/lib/oeqa/utils/buildproject.py b/meta/lib/oeqa/utils/bu=
ildproject.py
> index 487f08b..721f35d 100644
> --- a/meta/lib/oeqa/utils/buildproject.py
> +++ b/meta/lib/oeqa/utils/buildproject.py
> @@ -52,4 +52,4 @@ class BuildProject(metaclass=3DABCMeta):
> =20
>      def clean(self):
>          self._run('rm -rf %s' % self.targetdir)
> -        subprocess.call('rm -f %s' % self.localarchive, shell=3DTrue)
> +        subprocess.check_call('rm -f %s' % self.localarchive, shell=3DTr=
ue)
> diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/tar=
getbuild.py
> index 9249fa2..1202d57 100644
> --- a/meta/lib/oeqa/utils/targetbuild.py
> +++ b/meta/lib/oeqa/utils/targetbuild.py
> @@ -69,7 +69,7 @@ class BuildProject(metaclass=3DABCMeta):
> =20
>      def clean(self):
>          self._run('rm -rf %s' % self.targetdir)
> -        subprocess.call('rm -f %s' % self.localarchive, shell=3DTrue)
> +        subprocess.check_call('rm -f %s' % self.localarchive, shell=3DTr=
ue)
>          pass
> =20
>  class TargetBuildProject(BuildProject):
> @@ -136,4 +136,4 @@ class SDKBuildProject(BuildProject):
> =20
>      def _run(self, cmd):
>          self.log("Running . %s; " % self.sdkenv + cmd)
> -        return subprocess.call(". %s; " % self.sdkenv + cmd, shell=3DTru=
e)
> +        return subprocess.check_call(". %s; " % self.sdkenv + cmd, shell=
=3DTrue)
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
> index c3fa459..699a34a 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -83,7 +83,7 @@ python do_package_append() {
>      import subprocess
>      # Change permissions back the way they were, they probably had a rea=
son...
>      workdir =3D d.getVar('WORKDIR')
> -    subprocess.call('chmod 0511 %s/install/cups/var/run/cups/certs' % wo=
rkdir, shell=3DTrue)
> +    subprocess.check_call('chmod 0511 %s/install/cups/var/run/cups/certs=
' % workdir, shell=3DTrue)
>  }
> =20
>  PACKAGES =3D+ "${PN}-lib ${PN}-libimage"
> --=20
> 1.9.1=

