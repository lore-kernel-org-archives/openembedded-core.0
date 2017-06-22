Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9E72577E7C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 13:32:00 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id 16so11951027qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 06:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Dyu9ts6nuFnchIm141CxRu2bQ5FjRG5XwvMfnnWA5lY=;
	b=M3TUA3M9nimWLd8UGCYfJu+aZO2Zb2l0QDYj1m8mL2JZ65KAPm9sYQy9HRRXe8a70O
	8gppa9wCPuOmre0khS9gWLyL7G7Fa1eMyoicshFHY9Nl6qQRbRfWVp3I81UKHK/DN7sW
	CdIBYQRgKg3UEDK75RNM8pFpvRrUMENyhoOPeGDmYlKtokBLRlwRyI6woOagxf0EoVI9
	LTX0mTRebXA4+zdX575/W+YuEapuBRKuLwYzg9/B9X1r9iEm2b5EGoyjTmk7OsmkQfiY
	YoSq4txZUA1dJy/lp0KJ9kzBipgAVPrJakWNsMzAOpcYkmT+DeAiGvtuzfVw8QCnJLm7
	q7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Dyu9ts6nuFnchIm141CxRu2bQ5FjRG5XwvMfnnWA5lY=;
	b=MxH8Fo4GvDxYwp3XEe8ASKgfafYzVQ8N3fp1+dkhyqYpTMp4eWoQGifNQ7UijEHbnl
	XJre9hqmu4yWBnLaCyje8GkkNqivdbgwnHD4PB6Y3KlZEr3wqLCX9BiOT/WqJtqLp0fV
	6SwW3F8oWYOBbceeJbB2Op7AbshZ2T84qKxFs2vp0RdyEZUW/Ee86JsjIGFN6sjY6HWV
	jqog4sraje4lkQcZOhsta3tFyJW8XuR7poJBmyFuZJNNAqG8DKmYDk0snp+agWdxOEud
	tdfGEHM9JnCG7pSSpITa1CaTzzyllIwkGik+TkLdc3BOHDe0CA48XzlW0lgai5etw34z
	lNjg==
X-Gm-Message-State: AKS2vOyXxgcSjjOOT7IRpiGaARU9f59ZK1XBQ8GPtRRtSTqgeVkSmShC
	iONOAiLSE0m178eYc/FN7kz7gwMZdlxb
X-Received: by 10.55.100.130 with SMTP id y124mr2962271qkb.54.1498138322188;
	Thu, 22 Jun 2017 06:32:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 22 Jun 2017 06:31:41 -0700 (PDT)
In-Reply-To: <1498137794-29938-1-git-send-email-mikko.rapeli@bmw.de>
References: <20170622124857.jygx7aot2xm2kvll@hiutale>
	<1498137794-29938-1-git-send-email-mikko.rapeli@bmw.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Jun 2017 14:31:41 +0100
Message-ID: <CAJTo0LYziZ26FcnoK142=Msobhvesj62Z=0SFtW+PWtKg7KgBg@mail.gmail.com>
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: Poky Project <poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH v3] meta: Fix return value checks from subprocess.call()'s
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
X-List-Received-Date: Thu, 22 Jun 2017 13:32:01 -0000
Content-Type: multipart/alternative; boundary="94eb2c0585ae84f1ee05528c828f"

--94eb2c0585ae84f1ee05528c828f
Content-Type: text/plain; charset="UTF-8"

Thanks Mikko, applied to staging.

Ross

On 22 June 2017 at 14:23, Mikko Rapeli <mikko.rapeli@bmw.de> wrote:

> Python function subprocess.call() returns the return value of the
> executed process. If return values are not checked, errors may
> go unnoticed and bad things can happen.
>
> Change all callers of subprocess.call() which do not check for
> the return value to use subprocess.check_call() which raises
> CalledProcessError if the subprocess returns with non-zero value.
>
> https://docs.python.org/2/library/subprocess.html#using-
> the-subprocess-module
>
> All users of the function were found with:
>
> $ git grep "subprocess\.call" | \
>   egrep -v 'if.*subprocess\.call|=\ +subprocess\.call|return.*
> subprocess\.call'
>
> Tested similar patch on top of yocto jethro. Only compile tested
> core-image-minimal on poky master branch.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/classes/cml1.bbclass                | 2 +-
>  meta/classes/kernel-module-split.bbclass | 2 +-
>  meta/classes/sstate.bbclass              | 4 ++--
>  meta/lib/oeqa/utils/buildproject.py      | 2 +-
>  meta/lib/oeqa/utils/targetbuild.py       | 4 ++--
>  meta/recipes-extended/cups/cups.inc      | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)
>
> v3:
> rebased
>
> v2:
> split patches to bitbake, meta and scripts
>
> v1:
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2017-May/136901.html
>
> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> index 38e6613..eb8e790 100644
> --- a/meta/classes/cml1.bbclass
> +++ b/meta/classes/cml1.bbclass
> @@ -63,7 +63,7 @@ python do_diffconfig() {
>
>      if isdiff:
>          statement = 'diff --unchanged-line-format= --old-line-format=
> --new-line-format="%L" ' + configorig + ' ' + config + '>' + fragment
> -        subprocess.call(statement, shell=True)
> +        subprocess.check_call(statement, shell=True)
>
>          shutil.copy(configorig, config)
>
> diff --git a/meta/classes/kernel-module-split.bbclass
> b/meta/classes/kernel-module-split.bbclass
> index 5e10dcf..1035525 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -47,7 +47,7 @@ python split_kernel_module_packages () {
>          tf = tempfile.mkstemp()
>          tmpfile = tf[1]
>          cmd = "%sobjcopy -j .modinfo -O binary %s %s" %
> (d.getVar("HOST_PREFIX") or "", file, tmpfile)
> -        subprocess.call(cmd, shell=True)
> +        subprocess.check_call(cmd, shell=True)
>          f = open(tmpfile)
>          l = f.read().split("\000")
>          f.close()
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 0a12935..f446c3d 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -404,7 +404,7 @@ python sstate_hardcode_path_unpack () {
>              return
>
>          bb.note("Replacing fixme paths in sstate package: %s" %
> (sstate_hardcode_cmd))
> -        subprocess.call(sstate_hardcode_cmd, shell=True)
> +        subprocess.check_call(sstate_hardcode_cmd, shell=True)
>
>          # Need to remove this or we'd copy it into the target directory
> and may
>          # conflict with another writer
> @@ -453,7 +453,7 @@ def sstate_clean_manifest(manifest, d, prefix=None):
>      if os.path.exists(manifest + ".postrm"):
>          import subprocess
>          os.chmod(postrm, 0o755)
> -        subprocess.call(postrm, shell=True)
> +        subprocess.check_call(postrm, shell=True)
>          oe.path.remove(postrm)
>
>      oe.path.remove(manifest)
> diff --git a/meta/lib/oeqa/utils/buildproject.py b/meta/lib/oeqa/utils/
> buildproject.py
> index 487f08b..721f35d 100644
> --- a/meta/lib/oeqa/utils/buildproject.py
> +++ b/meta/lib/oeqa/utils/buildproject.py
> @@ -52,4 +52,4 @@ class BuildProject(metaclass=ABCMeta):
>
>      def clean(self):
>          self._run('rm -rf %s' % self.targetdir)
> -        subprocess.call('rm -f %s' % self.localarchive, shell=True)
> +        subprocess.check_call('rm -f %s' % self.localarchive, shell=True)
> diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/
> targetbuild.py
> index 9249fa2..1202d57 100644
> --- a/meta/lib/oeqa/utils/targetbuild.py
> +++ b/meta/lib/oeqa/utils/targetbuild.py
> @@ -69,7 +69,7 @@ class BuildProject(metaclass=ABCMeta):
>
>      def clean(self):
>          self._run('rm -rf %s' % self.targetdir)
> -        subprocess.call('rm -f %s' % self.localarchive, shell=True)
> +        subprocess.check_call('rm -f %s' % self.localarchive, shell=True)
>          pass
>
>  class TargetBuildProject(BuildProject):
> @@ -136,4 +136,4 @@ class SDKBuildProject(BuildProject):
>
>      def _run(self, cmd):
>          self.log("Running . %s; " % self.sdkenv + cmd)
> -        return subprocess.call(". %s; " % self.sdkenv + cmd, shell=True)
> +        return subprocess.check_call(". %s; " % self.sdkenv + cmd,
> shell=True)
> diff --git a/meta/recipes-extended/cups/cups.inc
> b/meta/recipes-extended/cups/cups.inc
> index c3fa459..699a34a 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -83,7 +83,7 @@ python do_package_append() {
>      import subprocess
>      # Change permissions back the way they were, they probably had a
> reason...
>      workdir = d.getVar('WORKDIR')
> -    subprocess.call('chmod 0511 %s/install/cups/var/run/cups/certs' %
> workdir, shell=True)
> +    subprocess.check_call('chmod 0511 %s/install/cups/var/run/cups/certs'
> % workdir, shell=True)
>  }
>
>  PACKAGES =+ "${PN}-lib ${PN}-libimage"
> --
> 1.9.1
>
> --
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>

--94eb2c0585ae84f1ee05528c828f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Mikko, applied to staging.<div><br></div><div>Ross<=
/div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 22 =
June 2017 at 14:23, Mikko Rapeli <span dir=3D"ltr">&lt;<a href=3D"mailto:mi=
kko.rapeli@bmw.de" target=3D"_blank">mikko.rapeli@bmw.de</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">Python function subp=
rocess.call() returns the return value of the<br>
executed process. If return values are not checked, errors may<br>
go unnoticed and bad things can happen.<br>
<br>
Change all callers of subprocess.call() which do not check for<br>
the return value to use subprocess.check_call() which raises<br>
CalledProcessError if the subprocess returns with non-zero value.<br>
<br>
<a href=3D"https://docs.python.org/2/library/subprocess.html#using-the-subp=
rocess-module" rel=3D"noreferrer" target=3D"_blank">https://docs.python.org=
/2/<wbr>library/subprocess.html#using-<wbr>the-subprocess-module</a><br>
<br>
All users of the function were found with:<br>
<br>
$ git grep &quot;subprocess\.call&quot; | \<br>
=C2=A0 egrep -v &#39;if.*subprocess\.call|=3D\ +subprocess\.call|return.*<w=
br>subprocess\.call&#39;<br>
<br>
Tested similar patch on top of yocto jethro. Only compile tested<br>
core-image-minimal on poky master branch.<br>
<br>
</span><span class=3D"">Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:m=
ikko.rapeli@bmw.de">mikko.rapeli@bmw.de</a>&gt;<br>
---<br>
</span><span class=3D"">=C2=A0meta/classes/cml1.bbclass=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/classes/kernel-module-<wbr>split.bbclass | 2 +-<br>
=C2=A0meta/classes/sstate.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 4 ++--<br>
=C2=A0meta/lib/oeqa/utils/<wbr>buildproject.py=C2=A0 =C2=A0 =C2=A0 | 2 +-<b=
r>
=C2=A0meta/lib/oeqa/utils/<wbr>targetbuild.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4=
 ++--<br>
=C2=A0meta/recipes-extended/cups/<wbr>cups.inc=C2=A0 =C2=A0 =C2=A0 | 2 +-<b=
r>
</span>=C2=A06 files changed, 8 insertions(+), 8 deletions(-)<br>
<br>
v3:<br>
rebased<br>
<span class=3D"im HOEnZb"><br>
v2:<br>
split patches to bitbake, meta and scripts<br>
<br>
v1:<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2017-M=
ay/136901.html" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/<wbr>pipermail/openembedded-core/<wbr>2017-May/136901.html</a><br>
<br>
</span><div class=3D"HOEnZb"><div class=3D"h5">diff --git a/meta/classes/cm=
l1.bbclass b/meta/classes/cml1.bbclass<br>
index 38e6613..eb8e790 100644<br>
--- a/meta/classes/cml1.bbclass<br>
+++ b/meta/classes/cml1.bbclass<br>
@@ -63,7 +63,7 @@ python do_diffconfig() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0if isdiff:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0statement =3D &#39;diff --unchanged-line-=
format=3D --old-line-format=3D --new-line-format=3D&quot;%L&quot; &#39; + c=
onfigorig + &#39; &#39; + config + &#39;&gt;&#39; + fragment<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.call(statement, shell=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call(<wbr>statement, shell=3D=
True)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.copy(configorig, config)<br>
<br>
diff --git a/meta/classes/kernel-module-<wbr>split.bbclass b/meta/classes/k=
ernel-module-<wbr>split.bbclass<br>
index 5e10dcf..1035525 100644<br>
--- a/meta/classes/kernel-module-<wbr>split.bbclass<br>
+++ b/meta/classes/kernel-module-<wbr>split.bbclass<br>
@@ -47,7 +47,7 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tf =3D tempfile.mkstemp()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfile =3D tf[1]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &quot;%sobjcopy -j .modinfo -O bi=
nary %s %s&quot; % (d.getVar(&quot;HOST_PREFIX&quot;) or &quot;&quot;, file=
, tmpfile)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.call(cmd, shell=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call(cmd, shell=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D open(tmpfile)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l =3D f.read().split(&quot;\000&quot;)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.close()<br>
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass<br>
index 0a12935..f446c3d 100644<br>
--- a/meta/classes/sstate.bbclass<br>
+++ b/meta/classes/sstate.bbclass<br>
@@ -404,7 +404,7 @@ python sstate_hardcode_path_unpack () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;Replacing fixme paths in ss=
tate package: %s&quot; % (sstate_hardcode_cmd))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.call(sstate_<wbr>hardcode_cmd, shel=
l=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call(sstate_<wbr>hardcode_cmd=
, shell=3DTrue)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Need to remove this or we&#39;d copy it=
 into the target directory and may<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# conflict with another writer<br>
@@ -453,7 +453,7 @@ def sstate_clean_manifest(<wbr>manifest, d, prefix=3DNo=
ne):<br>
=C2=A0 =C2=A0 =C2=A0if os.path.exists(manifest + &quot;.postrm&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import subprocess<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.chmod(postrm, 0o755)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.call(postrm, shell=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call(postrm, shell=3DTrue)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe.path.remove(postrm)<br>
<br>
=C2=A0 =C2=A0 =C2=A0oe.path.remove(manifest)<br>
diff --git a/meta/lib/oeqa/utils/<wbr>buildproject.py b/meta/lib/oeqa/utils=
/<wbr>buildproject.py<br>
index 487f08b..721f35d 100644<br>
--- a/meta/lib/oeqa/utils/<wbr>buildproject.py<br>
+++ b/meta/lib/oeqa/utils/<wbr>buildproject.py<br>
@@ -52,4 +52,4 @@ class BuildProject(metaclass=3D<wbr>ABCMeta):<br>
<br>
=C2=A0 =C2=A0 =C2=A0def clean(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._run(&#39;rm -rf %s&#39; % self.targ=
etdir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.call(&#39;rm -f %s&#39; % self.loca=
larchive, shell=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call(&#39;rm -f %s&#39; % sel=
f.localarchive, shell=3DTrue)<br>
diff --git a/meta/lib/oeqa/utils/<wbr>targetbuild.py b/meta/lib/oeqa/utils/=
<wbr>targetbuild.py<br>
index 9249fa2..1202d57 100644<br>
--- a/meta/lib/oeqa/utils/<wbr>targetbuild.py<br>
+++ b/meta/lib/oeqa/utils/<wbr>targetbuild.py<br>
@@ -69,7 +69,7 @@ class BuildProject(metaclass=3D<wbr>ABCMeta):<br>
<br>
=C2=A0 =C2=A0 =C2=A0def clean(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._run(&#39;rm -rf %s&#39; % self.targ=
etdir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.call(&#39;rm -f %s&#39; % self.loca=
larchive, shell=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_call(&#39;rm -f %s&#39; % sel=
f.localarchive, shell=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
<br>
=C2=A0class TargetBuildProject(<wbr>BuildProject):<br>
@@ -136,4 +136,4 @@ class SDKBuildProject(BuildProject):<br>
<br>
=C2=A0 =C2=A0 =C2=A0def _run(self, cmd):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.log(&quot;Running . %s; &quot; % sel=
f.sdkenv + cmd)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return subprocess.call(&quot;. %s; &quot; % se=
lf.sdkenv + cmd, shell=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return subprocess.check_call(&quot;. %s; &quot=
; % self.sdkenv + cmd, shell=3DTrue)<br>
diff --git a/meta/recipes-extended/cups/<wbr>cups.inc b/meta/recipes-extend=
ed/cups/<wbr>cups.inc<br>
index c3fa459..699a34a 100644<br>
--- a/meta/recipes-extended/cups/<wbr>cups.inc<br>
+++ b/meta/recipes-extended/cups/<wbr>cups.inc<br>
@@ -83,7 +83,7 @@ python do_package_append() {<br>
=C2=A0 =C2=A0 =C2=A0import subprocess<br>
=C2=A0 =C2=A0 =C2=A0# Change permissions back the way they were, they proba=
bly had a reason...<br>
=C2=A0 =C2=A0 =C2=A0workdir =3D d.getVar(&#39;WORKDIR&#39;)<br>
-=C2=A0 =C2=A0 subprocess.call(&#39;chmod 0511 %s/install/cups/var/run/cups=
/<wbr>certs&#39; % workdir, shell=3DTrue)<br>
+=C2=A0 =C2=A0 subprocess.check_call(&#39;chmod 0511 %s/install/cups/var/ru=
n/cups/<wbr>certs&#39; % workdir, shell=3DTrue)<br>
=C2=A0}<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-lib ${PN}-libimage&quot;<br>
--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
poky mailing list<br>
<a href=3D"mailto:poky@yoctoproject.org">poky@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/poky" rel=3D"noreferrer"=
 target=3D"_blank">https://lists.yoctoproject.<wbr>org/listinfo/poky</a><br=
>
</div></div></blockquote></div><br></div>

--94eb2c0585ae84f1ee05528c828f--
