Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web11.11300.1620732658156220910
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 04:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sbphF2Ge;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id 66so10001066vsk.9
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 04:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Oum1P9EFvataPyAPoB9SYc4p00k1Smb1pn2pcvFvak=;
        b=sbphF2GeG+eru9IaQjdW1sPQhTh9Rtk9Q9zCGyWj5AUBBXl2CnukgA0ni/tiviFZOX
         U+pGOZ3PpCukRVHmH33qC+Y3PwS95jo7GdHMRpW27uC2H8yCu9Ni24VRKbZWczCrrXbb
         I4ka3WpdVEpwbKjc2aUT6UIyEMqgQlrh9oz6gVV5UtFTIoBLjld5SJnUiPEZb1gSA/mw
         zkDh+3VEgoq6k7Y5YQPRDm0nZuPZ+vzQ56UN3V5oL9BZCkDMxRtbm3je4QN2P18BpOQk
         dkHZHC0EM6OnGnY4LZc4UwOzmYCcFp4ZzCtNjfDWCHQy2xI/UuxuAbBiikJ0xjB5nlBp
         51CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Oum1P9EFvataPyAPoB9SYc4p00k1Smb1pn2pcvFvak=;
        b=ECfyF0QFpEWOf4rpbqQlIeOzIP9oC0Zmq+0HwW9lWt8mEOFWXJbVv3F4lJRTkibUZS
         S+U7yHYNdMF4qpXdvORvsF5x7LOGXYEoiKhhk+SlIB3/JCHAeXULrDHMZtNsk5pynWED
         MTNY48itB0Zf08iUSuGAEgypqboym3GdqLHcM5Wnj35i/KpDxl91t4ryZuxn/2zfgzbT
         IEI9vZ4soyhzGASXmGxOF4TsXj4GoesIrFXjeJ20Hj/fMnjHK+9nHPv8TodOCXE/GyJN
         XKFlXaWu3nNWtjuA3/Dfu2Fm5+CdzPmFVoiO07sPKx2/AoAc3rmrtZpRBn4L0VLwpsK/
         Usrg==
X-Gm-Message-State: AOAM53388ttn/NZhTIMRaEImv08TOijINDGynVxAdJBReYZjRacdU7XL
	f0RJ1JO6G4EruJiao2HREnUiEvY9YdUBifNAL5I=
X-Google-Smtp-Source: ABdhPJxySP7c93ukih9bzabpHs1rN2kX5UXMNQxByaW5DVJWgA9GQBaPmqmN0syW7tU7AhLnnUoEQcHbCz7PrC/GqaY=
X-Received: by 2002:a67:d715:: with SMTP id p21mr16447115vsj.31.1620732657316;
 Tue, 11 May 2021 04:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210511011101.1859568-1-raj.khem@gmail.com>
In-Reply-To: <20210511011101.1859568-1-raj.khem@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 11 May 2021 13:30:45 +0200
Message-ID: <CANNYZj9UUyKEPox7L0Wzq_JdoE1hQO7wpqc+qHr83g_n1LvbMQ@mail.gmail.com>
Subject: Re: [PATCH] ffmpeg: Fix build on mips
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000050b5f405c20c3ae9"

--00000000000050b5f405c20c3ae9
Content-Type: text/plain; charset="UTF-8"

Thanks Khem, good that it can be done without patches.

Alex

On Tue, 11 May 2021 at 03:11, Khem Raj <raj.khem@gmail.com> wrote:

> configure is not able to decode, right options to compiler, it needs to
> be set according to default tune manually. Fixes build issue on mips
> e.g.
>
>  {standard input}: Assembler messages:
> | {standard input}:2162: Error: opcode not supported on this processor:
> mips32r2 (mips32r2) `dmult $22,$22'
> | {standard input}:2164: Error: opcode not supported on this processor:
> mips32r2 (mips32r2) `dsrl $5,$5,32'
> | make: ***
> [/mnt/b/yoe/master/build/tmp/work/mips32r2-yoe-linux/ffmpeg/4.4-r0/ffmpeg-4.4/ffbuild/common.mak:67:
> libavcodec/aptxenc.o] Error 1
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb | 22 +++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> index 19a8e58370..384e07362a 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> @@ -103,15 +103,15 @@ EXTRA_OECONF = " \
>      \
>      --cross-prefix=${TARGET_PREFIX} \
>      \
> -    --ld="${CCLD}" \
> -    --cc="${CC}" \
> -    --cxx="${CXX}" \
> +    --ld='${CCLD}' \
> +    --cc='${CC}' \
> +    --cxx='${CXX}' \
>      --arch=${TARGET_ARCH} \
> -    --target-os="linux" \
> +    --target-os='linux' \
>      --enable-cross-compile \
> -    --extra-cflags="${CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
> -    --extra-ldflags="${LDFLAGS}" \
> -    --sysroot="${STAGING_DIR_TARGET}" \
> +    --extra-cflags='${CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}' \
> +    --extra-ldflags='${LDFLAGS}' \
> +    --sysroot='${STAGING_DIR_TARGET}' \
>      ${EXTRA_FFCONF} \
>      --libdir=${libdir} \
>      --shlibdir=${libdir} \
> @@ -121,6 +121,14 @@ EXTRA_OECONF = " \
>  "
>
>  EXTRA_OECONF_append_linux-gnux32 = " --disable-asm"
> +
> +EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa64r6',
> '--disable-mips64r2 --disable-mips32r2', '', d)}"
> +EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa64r2',
> '--disable-mips64r6 --disable-mips32r6', '', d)}"
> +EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mips32r2',
> '--disable-mips64r6 --disable-mips32r6', '', d)}"
> +EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mips32r6',
> '--disable-mips64r2 --disable-mips32r2', '', d)}"
> +EXTRA_OECONF_append_mips = " --extra-libs=-latomic --disable-mips32r5
> --disable-mipsdsp --disable-mipsdspr2 \
> +                             --disable-loongson2 --disable-loongson3
> --disable-mmi --disable-msa --disable-msa2"
> +
>  # gold crashes on x86, another solution is to --disable-asm but thats
> more hacky
>  # ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
>
> --
> 2.31.1
>
>

--00000000000050b5f405c20c3ae9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Khem, good that it can be done without patches=
.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 11 May 2021 at 03:11, Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">configure =
is not able to decode, right options to compiler, it needs to<br>
be set according to default tune manually. Fixes build issue on mips<br>
e.g.<br>
<br>
=C2=A0{standard input}: Assembler messages:<br>
| {standard input}:2162: Error: opcode not supported on this processor: mip=
s32r2 (mips32r2) `dmult $22,$22&#39;<br>
| {standard input}:2164: Error: opcode not supported on this processor: mip=
s32r2 (mips32r2) `dsrl $5,$5,32&#39;<br>
| make: *** [/mnt/b/yoe/master/build/tmp/work/mips32r2-yoe-linux/ffmpeg/4.4=
-r0/ffmpeg-4.4/ffbuild/common.mak:67: libavcodec/aptxenc.o] Error 1<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=
=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_4.4.bb</a> | 22 +++++++++++++-----=
--<br>
=C2=A01 file changed, 15 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.4.bb=
" rel=3D"noreferrer" target=3D"_blank">ffmpeg_4.4.bb</a> b/meta/recipes-mul=
timedia/ffmpeg/<a href=3D"http://ffmpeg_4.4.bb" rel=3D"noreferrer" target=
=3D"_blank">ffmpeg_4.4.bb</a><br>
index 19a8e58370..384e07362a 100644<br>
--- a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_4.4.bb</a><br>
+++ b/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_4.4.bb</a><br>
@@ -103,15 +103,15 @@ EXTRA_OECONF =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0--cross-prefix=3D${TARGET_PREFIX} \<br>
=C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 --ld=3D&quot;${CCLD}&quot; \<br>
-=C2=A0 =C2=A0 --cc=3D&quot;${CC}&quot; \<br>
-=C2=A0 =C2=A0 --cxx=3D&quot;${CXX}&quot; \<br>
+=C2=A0 =C2=A0 --ld=3D&#39;${CCLD}&#39; \<br>
+=C2=A0 =C2=A0 --cc=3D&#39;${CC}&#39; \<br>
+=C2=A0 =C2=A0 --cxx=3D&#39;${CXX}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0--arch=3D${TARGET_ARCH} \<br>
-=C2=A0 =C2=A0 --target-os=3D&quot;linux&quot; \<br>
+=C2=A0 =C2=A0 --target-os=3D&#39;linux&#39; \<br>
=C2=A0 =C2=A0 =C2=A0--enable-cross-compile \<br>
-=C2=A0 =C2=A0 --extra-cflags=3D&quot;${CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_=
OPTIONS}&quot; \<br>
-=C2=A0 =C2=A0 --extra-ldflags=3D&quot;${LDFLAGS}&quot; \<br>
-=C2=A0 =C2=A0 --sysroot=3D&quot;${STAGING_DIR_TARGET}&quot; \<br>
+=C2=A0 =C2=A0 --extra-cflags=3D&#39;${CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_O=
PTIONS}&#39; \<br>
+=C2=A0 =C2=A0 --extra-ldflags=3D&#39;${LDFLAGS}&#39; \<br>
+=C2=A0 =C2=A0 --sysroot=3D&#39;${STAGING_DIR_TARGET}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0${EXTRA_FFCONF} \<br>
=C2=A0 =C2=A0 =C2=A0--libdir=3D${libdir} \<br>
=C2=A0 =C2=A0 =C2=A0--shlibdir=3D${libdir} \<br>
@@ -121,6 +121,14 @@ EXTRA_OECONF =3D &quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0EXTRA_OECONF_append_linux-gnux32 =3D &quot; --disable-asm&quot;<br>
+<br>
+EXTRA_OECONF +=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39=
;mipsisa64r6&#39;, &#39;--disable-mips64r2 --disable-mips32r2&#39;, &#39;&#=
39;, d)}&quot;<br>
+EXTRA_OECONF +=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39=
;mipsisa64r2&#39;, &#39;--disable-mips64r6 --disable-mips32r6&#39;, &#39;&#=
39;, d)}&quot;<br>
+EXTRA_OECONF +=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39=
;mips32r2&#39;, &#39;--disable-mips64r6 --disable-mips32r6&#39;, &#39;&#39;=
, d)}&quot;<br>
+EXTRA_OECONF +=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39=
;mips32r6&#39;, &#39;--disable-mips64r2 --disable-mips32r2&#39;, &#39;&#39;=
, d)}&quot;<br>
+EXTRA_OECONF_append_mips =3D &quot; --extra-libs=3D-latomic --disable-mips=
32r5 --disable-mipsdsp --disable-mipsdspr2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-loongson2 --disable-loongson3 --di=
sable-mmi --disable-msa --disable-msa2&quot;<br>
+<br>
=C2=A0# gold crashes on x86, another solution is to --disable-asm but thats=
 more hacky<br>
=C2=A0# ld.gold: internal error in relocate_section, at ../../gold/i386.cc:=
3684<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div>

--00000000000050b5f405c20c3ae9--
