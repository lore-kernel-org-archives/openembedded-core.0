Return-Path: <matt.hoosier@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6681778E65
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 14:41:10 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id d126-v6so2161093ywa.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=ku3vqK6+9/4i7Bywx7/0wgSay+NbLCl9jN+SMZXyM64=;
	b=uubjli0QzQij/WfCkBTs1ACvUoC9NDs9d9tDK7ppc1jJVmRsj30Q3J67ej/yW6SX05
	CF49vRuWnTMEKy+pudEKnrSSBZDZqIXARMIaRWTPtA/WRoI+67H5KYLH37duuw9mbEjU
	ipiWlCDOMWySyQsRuNbZc6K8Xtx4Od3O/vAct+zCZu4AyajcP0QccbCc11SGiXo/mNsH
	rfiCUZExiTMtCmeU6nuysQIFi1Sf2leZuwVhJ1rkzOsZDO5TLtX5QAgBH+PFMnHs5LA0
	7vAZneTnXV98IVueDSEzgL0OSAKsJ1HFpSo/7Ssv7bzwKCNU/qx+s3z0ebuoXzqCmHiZ
	IDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=ku3vqK6+9/4i7Bywx7/0wgSay+NbLCl9jN+SMZXyM64=;
	b=P+mHzW4V0mzIUOE1imh3DJ8zt5pThOPIqbqenghhsaSg7Rnyw6Bb0bocxCyckGivp4
	4wu6nrt/ZaO0FAepBgQtstcZPdWvGDeUm8HO2Lyzvo0c0K06OlWha9DZ5sIguEP6vBHM
	fGkVroj7mCxob8ZHQ+I20FVSjWjLICbCsukiBPByYgzFw1TdW5zr/GCzU9zO6mmzmRGH
	Qi2zwVLI5VVAzBJiRedFoGjL+6S5Iw45ylZ87Y+n+t735LDtgUPez/nheeD46zoHdxeO
	ICa6bc12or7vsnXt55dRDTWFVy9X9Qri1sOIbVqDaI/gakm+H0pkNCCHH5RIeWICNiPh
	L9ZA==
X-Gm-Message-State: AGRZ1gJniW1LDUgm0kePt/GpYkDsANBHd7mjP7OeiPA0JfItX5xy/OOU
	kk6wOex5n4+UR/xT5XmQsv5CoPPT6rI7c8kW+GOZZQ==
X-Google-Smtp-Source: AJdET5cDXZQOuUpc0Q6ERm5z6VEgL5YisalFeim0kdEOXjkKtkFmhGAAkkN4ujTBl/4soULDbynEOyMkdK2C/xe7gNc=
X-Received: by 2002:a81:6cc2:: with SMTP id
	h185-v6mr2476356ywc.219.1540392070766; 
	Wed, 24 Oct 2018 07:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20181019160455.4606-1-matt.hoosier@gmail.com>
In-Reply-To: <20181019160455.4606-1-matt.hoosier@gmail.com>
From: Matt Hoosier <matt.hoosier@gmail.com>
Date: Wed, 24 Oct 2018 09:40:34 -0500
Message-ID: <CAJgxT3_WUvjS5tfYSi7K-p0HmwL_ds-m+GHFDhBvrcobqU8fOw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] volatile-binds: use overlayfs if available
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
X-List-Received-Date: Wed, 24 Oct 2018 14:41:10 -0000
Content-Type: multipart/alternative; boundary="0000000000003165710578fa7a41"

--0000000000003165710578fa7a41
Content-Type: text/plain; charset="UTF-8"

Hi; any interest in this one?

On Fri, Oct 19, 2018 at 11:04 AM Matt Hoosier <matt.hoosier@gmail.com>
wrote:

> From: Matt Hoosier <matt.hoosier@garmin.com>
>
> Copying files from the read-only root filesystem to the tmpfs
> providing the volatile directories can be slow and waste memory.
> If the kernel supports the overlay filesystem, use it to mount
> a writable tmpfs on top of the read-only directory from the
> rootfs and avoid copies.
>
> Analogous to the modification made to initscripts's
> read-only-rootfs-hook in 370fda1b2e8d5dc011522131bba4106de26bfb19.
>
> Signed-off-by: Matt Hoosier <matt.hoosier@gmail.com>
> ---
>  .../volatile-binds/files/mount-copybind       | 30 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/volatile-binds/files/mount-copybind
> b/meta/recipes-core/volatile-binds/files/mount-copybind
> index 2aeaf84ddb..fddf520053 100755
> --- a/meta/recipes-core/volatile-binds/files/mount-copybind
> +++ b/meta/recipes-core/volatile-binds/files/mount-copybind
> @@ -8,7 +8,10 @@ if [ $# -lt 2 ]; then
>      exit 1
>  fi
>
> +# e.g. /var/volatile/lib
>  spec=$1
> +
> +# e.g. /var/lib
>  mountpoint=$2
>
>  if [ $# -gt 2 ]; then
> @@ -20,15 +23,34 @@ fi
>  [ -n "$options" ] && options=",$options"
>
>  mkdir -p "${spec%/*}"
> +
>  if [ -d "$mountpoint" ]; then
> -    if [ ! -d "$spec" ]; then
> +
> +    if [ -d "$spec" ]; then
> +        specdir_existed=yes
> +    else
> +        specdir_existed=no
>          mkdir "$spec"
> -        cp -pPR "$mountpoint"/. "$spec/"
> +    fi
> +
> +    # Fast version of calculating `dirname ${spec}`/.`basename
> ${spec}`-work
> +    overlay_workdir="${spec%/*}/.${spec##*/}-work"
> +    mkdir "${overlay_workdir}"
> +
> +    # Try to mount using overlay, which is must faster than copying files.
> +    # If that fails, fall back to slower copy.
> +    if ! mount -t overlay overlay
> -olowerdir="$mountpoint",upperdir="$spec",workdir="$overlay_workdir"
> "$mountpoint" > /dev/null 2>&1; then
> +
> +        if [ "$specdir_existed" != "yes" ]; then
> +            cp -pPR "$mountpoint"/. "$spec/"
> +        fi
> +
> +        mount -o "bind$options" "$spec" "$mountpoint"
>      fi
>  elif [ -f "$mountpoint" ]; then
>      if [ ! -f "$spec" ]; then
>          cp -pP "$mountpoint" "$spec"
>      fi
> -fi
>
> -mount -o "bind$options" "$spec" "$mountpoint"
> +    mount -o "bind$options" "$spec" "$mountpoint"
> +fi
> --
> 2.17.2
>
>

--0000000000003165710578fa7a41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>Hi; any interest in this o=
ne?</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">On Fri, Oct 19, 2018 a=
t 11:04 AM Matt Hoosier &lt;<a href=3D"mailto:matt.hoosier@gmail.com">matt.=
hoosier@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Fr=
om: Matt Hoosier &lt;<a href=3D"mailto:matt.hoosier@garmin.com" target=3D"_=
blank">matt.hoosier@garmin.com</a>&gt;<br>
<br>
Copying files from the read-only root filesystem to the tmpfs<br>
providing the volatile directories can be slow and waste memory.<br>
If the kernel supports the overlay filesystem, use it to mount<br>
a writable tmpfs on top of the read-only directory from the<br>
rootfs and avoid copies.<br>
<br>
Analogous to the modification made to initscripts&#39;s<br>
read-only-rootfs-hook in 370fda1b2e8d5dc011522131bba4106de26bfb19.<br>
<br>
Signed-off-by: Matt Hoosier &lt;<a href=3D"mailto:matt.hoosier@gmail.com" t=
arget=3D"_blank">matt.hoosier@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../volatile-binds/files/mount-copybind=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3=
0 ++++++++++++++++---<br>
=C2=A01 file changed, 26 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/volatile-binds/files/mount-copybind b/meta/r=
ecipes-core/volatile-binds/files/mount-copybind<br>
index 2aeaf84ddb..fddf520053 100755<br>
--- a/meta/recipes-core/volatile-binds/files/mount-copybind<br>
+++ b/meta/recipes-core/volatile-binds/files/mount-copybind<br>
@@ -8,7 +8,10 @@ if [ $# -lt 2 ]; then<br>
=C2=A0 =C2=A0 =C2=A0exit 1<br>
=C2=A0fi<br>
<br>
+# e.g. /var/volatile/lib<br>
=C2=A0spec=3D$1<br>
+<br>
+# e.g. /var/lib<br>
=C2=A0mountpoint=3D$2<br>
<br>
=C2=A0if [ $# -gt 2 ]; then<br>
@@ -20,15 +23,34 @@ fi<br>
=C2=A0[ -n &quot;$options&quot; ] &amp;&amp; options=3D&quot;,$options&quot=
;<br>
<br>
=C2=A0mkdir -p &quot;${spec%/*}&quot;<br>
+<br>
=C2=A0if [ -d &quot;$mountpoint&quot; ]; then<br>
-=C2=A0 =C2=A0 if [ ! -d &quot;$spec&quot; ]; then<br>
+<br>
+=C2=A0 =C2=A0 if [ -d &quot;$spec&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 specdir_existed=3Dyes<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 specdir_existed=3Dno<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir &quot;$spec&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -pPR &quot;$mountpoint&quot;/. &quot;$spec/=
&quot;<br>
+=C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 # Fast version of calculating `dirname ${spec}`/.`basename $=
{spec}`-work<br>
+=C2=A0 =C2=A0 overlay_workdir=3D&quot;${spec%/*}/.${spec##*/}-work&quot;<b=
r>
+=C2=A0 =C2=A0 mkdir &quot;${overlay_workdir}&quot;<br>
+<br>
+=C2=A0 =C2=A0 # Try to mount using overlay, which is must faster than copy=
ing files.<br>
+=C2=A0 =C2=A0 # If that fails, fall back to slower copy.<br>
+=C2=A0 =C2=A0 if ! mount -t overlay overlay -olowerdir=3D&quot;$mountpoint=
&quot;,upperdir=3D&quot;$spec&quot;,workdir=3D&quot;$overlay_workdir&quot; =
&quot;$mountpoint&quot; &gt; /dev/null 2&gt;&amp;1; then<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$specdir_existed&quot; !=3D &quot;y=
es&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -pPR &quot;$mountpoint&quot;/=
. &quot;$spec/&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount -o &quot;bind$options&quot; &quot;$spec&=
quot; &quot;$mountpoint&quot;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0elif [ -f &quot;$mountpoint&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0if [ ! -f &quot;$spec&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -pP &quot;$mountpoint&quot; &quot;$spe=
c&quot;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
-fi<br>
<br>
-mount -o &quot;bind$options&quot; &quot;$spec&quot; &quot;$mountpoint&quot=
;<br>
+=C2=A0 =C2=A0 mount -o &quot;bind$options&quot; &quot;$spec&quot; &quot;$m=
ountpoint&quot;<br>
+fi<br>
-- <br>
2.17.2<br>
<br>
</blockquote></div></div>

--0000000000003165710578fa7a41--
