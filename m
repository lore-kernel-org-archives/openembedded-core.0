Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id BE9A86F8DE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 19:50:37 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id hn18so4143399igb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Apr 2014 12:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=b920rtraJVZv02NQCR+s6xYCPXSs3SGZHEZClWVkkfE=;
	b=L8VGkYJ+bCZAxIEDOjREwU0isJWJ7ezTlqlVFxVm5/O9J4VxWuRCcGclf4hnW2gwCI
	+UnEWl4TB0nw5R+nO/9J+PYnzHhR17tarPzbToo9vLKIco1EBQZJS8HWMm3P5FpgcCnG
	MKM+S3mw3w/F0JBWy2Jnvue+2jgUTJIyMuf5kjF7IsMV3eRdeAGYUHalZL7wKU674Snc
	MjIhoweh9AUtFA7jpX8f0OmW9pI0cEY22HTpwhzZNuMSAk6Kq4xRm2G4I9wpn+V7iLHH
	i+LZPBVPZoHyyKLLavlPH7J5hFYGgkNbcrshrL24ZwmbxYANcI9npgnUG/W7IBJKy21n
	qZwg==
MIME-Version: 1.0
X-Received: by 10.50.43.170 with SMTP id x10mr299279igl.20.1396900238029; Mon,
	07 Apr 2014 12:50:38 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Mon, 7 Apr 2014 12:50:37 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Mon, 7 Apr 2014 12:50:37 -0700 (PDT)
In-Reply-To: <1396870039-26834-1-git-send-email-ming.liu@windriver.com>
References: <1396870039-26834-1-git-send-email-ming.liu@windriver.com>
Date: Mon, 7 Apr 2014 12:50:37 -0700
Message-ID: <CAMKF1soQs+xKTK3gQemohdN0Mgu05PWYAvbjXDopFM2H1qwGuw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] e2fsprogs: fix multilib header conflict - ext2_types.h
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
X-List-Received-Date: Mon, 07 Apr 2014 19:50:38 -0000
Content-Type: multipart/alternative; boundary=089e01176cad797b7404f6792e49

--089e01176cad797b7404f6792e49
Content-Type: text/plain; charset=UTF-8

On Apr 7, 2014 1:28 AM, "Ming Liu" <ming.liu@windriver.com> wrote:
>
> ext2_types.h conflicts between 32-bit and 64-bit versions.
>

can you explain the conflicts
may be they can be addressed

> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs.inc       | 3 +--
>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 2 ++
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> index a34df37..99447c1 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> @@ -22,5 +22,4 @@ DEPENDS = "util-linux"
>  SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-${PV}.tar.gz \
>             file://mkdir.patch"
>
> -inherit autotools gettext pkgconfig
> -
> +inherit autotools gettext pkgconfig multilib_header
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bbb/meta/recipes-devtools/e2fsprogs/
e2fsprogs_1.42.9.bb
> index 3a5d6ee..2bdd724 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
> @@ -52,6 +52,8 @@ do_install () {
>                 mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
>                 mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
>         fi
> +
> +       oe_multilib_header ext2fs/ext2_types.h
>  }
>
>  RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
> --
> 1.8.4.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--089e01176cad797b7404f6792e49
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br></p>
<p dir=3D"ltr">On Apr 7, 2014 1:28 AM, &quot;Ming Liu&quot; &lt;<a href=3D"=
mailto:ming.liu@windriver.com">ming.liu@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; ext2_types.h conflicts between 32-bit and 64-bit versions.<br>
&gt;</p>
<p dir=3D"ltr">can you explain the conflicts<br>
may be they can be addressed</p>
<p dir=3D"ltr">&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:ming.liu@=
windriver.com">ming.liu@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-devtools/e2fsprogs/e2fsprogs.inc =C2=A0 =C2=A0 =C2=
=A0 | 3 +--<br>
&gt; =C2=A0meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.42=
.9.bb">e2fsprogs_1.42.9.bb</a> | 2 ++<br>
&gt; =C2=A02 files changed, 3 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/reci=
pes-devtools/e2fsprogs/e2fsprogs.inc<br>
&gt; index a34df37..99447c1 100644<br>
&gt; --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc<br>
&gt; +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc<br>
&gt; @@ -22,5 +22,4 @@ DEPENDS =3D &quot;util-linux&quot;<br>
&gt; =C2=A0SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-${PV=
}.tar.gz \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mkdir.patch&quot;<br>
&gt;<br>
&gt; -inherit autotools gettext pkgconfig<br>
&gt; -<br>
&gt; +inherit autotools gettext pkgconfig multilib_header<br>
&gt; diff --git a/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fspro=
gs_1.42.9.bb">e2fsprogs_1.42.9.bb</a> b/meta/recipes-devtools/e2fsprogs/<a =
href=3D"http://e2fsprogs_1.42.9.bb">e2fsprogs_1.42.9.bb</a><br>
&gt; index 3a5d6ee..2bdd724 100644<br>
&gt; --- a/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.42=
.9.bb">e2fsprogs_1.42.9.bb</a><br>
&gt; +++ b/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.42=
.9.bb">e2fsprogs_1.42.9.bb</a><br>
&gt; @@ -52,6 +52,8 @@ do_install () {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${base_=
libdir}/e2initrd_helper ${D}${libdir}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${base_=
libdir}/pkgconfig ${D}${libdir}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 oe_multilib_header ext2fs/ext2_types.h<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0RDEPENDS_e2fsprogs =3D &quot;e2fsprogs-badblocks&quot;<br>
&gt; --<br>
&gt; 1.8.4.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--089e01176cad797b7404f6792e49--
