Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8CD1377E87
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 14:16:58 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id z21so66287ywz.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 07:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LIVhMaTYj5Hmv2KQ9kO/NQfj1F2MmlaoAbOtQ4VGzQ0=;
	b=JqTWaT9ItyQa4YAlZTrUjB3+0sz1arftYEcguVr5I7ZRHSswRLd/5I96H10sralpmQ
	wTWQ9FqzxAHZQlCwsGWbJ3RPF/1uHxtIMQYJNVJplgpDHMjDuZUHnEnUTRfAay4YMa4m
	sQlp7qPIEghhxXCYaW69eNv0WaSkQ9WlT1akwxeJ0b4+tMuGe2H8qlwucDWG6yGb7P4G
	36Uqj4ZHR0cGcnrw01wpvoIeYE2eDj9PQH8DZXgjwnGWCo2zENUy3etqEU1etnfEp3Jh
	KfEicJGmuKgatJeekdaZKMxaty9Qo7D34IhYDs8g44gSKCcf/UhrdFMYpconAMWUDab5
	3hyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LIVhMaTYj5Hmv2KQ9kO/NQfj1F2MmlaoAbOtQ4VGzQ0=;
	b=IqSS3fp+4J9BIMRltJWeI1zy5osdDpizCxOo1+XGgfr5/SUejEMNeLugchSzBIdEon
	EWDnzxyCl9T17OZoGL+jgcUEUb90bfV9UwNvjeBoFGv96MtZPsrV1H6o+oULc0gnJ7LA
	MoA6XR4/Ss2TS4v8Ow3OZV0n+JR64pkD86uBDJs7gaez58cA5w3GjU6A3NcwaUCu6mhf
	+hdsWM8JGryQax2aiuitvcnHfA0aIV/+DdLaQ7W3LH8tuJimGwU1NoSBgOHELbtyexiV
	kILBP8GMLpvmuczHbpIJuvczD97Rycgw0RyKV7e5P58Xjb5xylRp2HSAhX9Qj7MewdPs
	NFWg==
X-Gm-Message-State: AIVw113jrQ4x1mSlCdwpiMxsiE9gbPsXwuw1B3r2g9UKnQZAGsXMZeRh
	1gnVLzRifwjOFkXUvtXVH+aNLJgsUw==
X-Received: by 10.13.230.12 with SMTP id p12mr117264ywe.276.1499782620145;
	Tue, 11 Jul 2017 07:17:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Tue, 11 Jul 2017 07:16:59 -0700 (PDT)
In-Reply-To: <20170711140546.23414-1-raj.khem@gmail.com>
References: <20170711140546.23414-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Jul 2017 15:16:59 +0100
Message-ID: <CA+chaQcZbeocSbAhDUyzP4FLKbBe5Wsw6RL-Xp0paNt-JYGb1w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross: Fix linker and fortran symlinks
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
X-List-Received-Date: Tue, 11 Jul 2017 14:17:00 -0000
Content-Type: multipart/alternative; boundary="94eb2c05d334507b4405540b5ab6"

--94eb2c05d334507b4405540b5ab6
Content-Type: text/plain; charset="UTF-8"

Shouldn't the symlink be created in ${D}${STAGING_DIR_NATIVE} as suggested
in:
http://lists.openembedded.org/pipermail/openembedded-core/2014-April/091480.html

On Tue, Jul 11, 2017 at 3:05 PM, Khem Raj <raj.khem@gmail.com> wrote:

> If we used -fuse-ld gcc option, then it does not work
> ending in
>
> collect2: fatal error: cannot find 'ld'
>
>
>            compilation terminated.
>
> This is because we are not creating proper symlinks for BFD
> and Gold linker in gcc installation
>
> Secondly, we end up with dangling fortran compiler symlinks
> if fortran is not enabled when confguring gcc, therefore
> create these symlinks only when fortran support is enabled
> in gcc
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-cross.inc | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc
> b/meta/recipes-devtools/gcc/gcc-cross.inc
> index b08bc197ba..1e184a60db 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -161,17 +161,19 @@ do_install () {
>
>         install -d ${D}${target_base_libdir}
>         install -d ${D}${target_libdir}
> -
> +
>         # Link gfortran to g77 to satisfy not-so-smart configure or hard
> coded g77
>         # gfortran is fully backwards compatible. This is a safe and
> practical solution.
> -       ln -sf ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gfortran
> ${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}g77 || true
> +       if [ -n "${@d.getVar('FORTRAN')}" ]; then
> +               ln -sf ${STAGING_DIR_NATIVE}${prefix_
> native}/bin/${TARGET_PREFIX}gfortran ${STAGING_DIR_NATIVE}${prefix_
> native}/bin/${TARGET_PREFIX}g77 || true
> +               fortsymlinks="g77 gfortran"
> +       fi
>
> -
>         # Insert symlinks into libexec so when tools without a prefix are
> searched for, the correct ones are
>         # found. These need to be relative paths so they work in different
> locations.
>         dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
>         install -d $dest
> -       for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp
> gfortran; do
> +       for t in ar as ld ld.bfd ld.gold nm objcopy objdump ranlib strip
> gcc cpp $fortsymlinks; do
>                 ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
>                 ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t
> ${dest}${TARGET_PREFIX}$t
>         done
> --
> 2.13.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c05d334507b4405540b5ab6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Shouldn&#39;t the symlink be created in ${D}${STAGING_DIR_=
NATIVE} as suggested in:<div><a href=3D"http://lists.openembedded.org/piper=
mail/openembedded-core/2014-April/091480.html">http://lists.openembedded.or=
g/pipermail/openembedded-core/2014-April/091480.html</a></div></div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jul 11, 2017 at =
3:05 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">If we used -fuse-ld gcc option, then it does not work<=
br>
ending in<br>
<br>
collect2: fatal error: cannot find &#39;ld&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0compilation terminated.<br>
<br>
This is because we are not creating proper symlinks for BFD<br>
and Gold linker in gcc installation<br>
<br>
Secondly, we end up with dangling fortran compiler symlinks<br>
if fortran is not enabled when confguring gcc, therefore<br>
create these symlinks only when fortran support is enabled<br>
in gcc<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-<wbr>cross.inc | 10 ++++++----<br>
=C2=A01 file changed, 6 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/gcc/<wbr>gcc-cross.inc b/meta/recipes-de=
vtools/gcc/<wbr>gcc-cross.inc<br>
index b08bc197ba..1e184a60db 100644<br>
--- a/meta/recipes-devtools/gcc/<wbr>gcc-cross.inc<br>
+++ b/meta/recipes-devtools/gcc/<wbr>gcc-cross.inc<br>
@@ -161,17 +161,19 @@ do_install () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${target_base_libdir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${target_libdir}<br>
-<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Link gfortran to g77 to satisfy not-so-smart =
configure or hard coded g77<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # gfortran is fully backwards compatible. This =
is a safe and practical solution.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${STAGING_DIR_NATIVE}${prefix_<wbr>nativ=
e}/bin/${TARGET_PREFIX}<wbr>gfortran ${STAGING_DIR_NATIVE}${prefix_<wbr>nat=
ive}/bin/${TARGET_PREFIX}<wbr>g77 || true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${@d.getVar(&#39;FORTRAN&#39;)}&q=
uot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${STAGING_DI=
R_NATIVE}${prefix_<wbr>native}/bin/${TARGET_PREFIX}<wbr>gfortran ${STAGING_=
DIR_NATIVE}${prefix_<wbr>native}/bin/${TARGET_PREFIX}<wbr>g77 || true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fortsymlinks=3D&quo=
t;g77 gfortran&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Insert symlinks into libexec so when tools wi=
thout a prefix are searched for, the correct ones are<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # found. These need to be relative paths so the=
y work in different locations.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dest=3D${D}${libexecdir}/gcc/${<wbr>TARGET_SYS}=
/${BINV}/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d $dest<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for t in ar as ld nm objcopy objdump ranlib str=
ip g77 gcc cpp gfortran; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for t in ar as ld ld.bfd ld.gold nm objcopy obj=
dump ranlib strip gcc cpp $fortsymlinks; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${BINRELPATH=
}/${TARGET_PREFIX}<wbr>$t $dest$t<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${BINRELPATH=
}/${TARGET_PREFIX}<wbr>$t ${dest}${TARGET_PREFIX}$t<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c05d334507b4405540b5ab6--
