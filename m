Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A66C982CC
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 11:35:38 +0000 (UTC)
Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9841.1789734378796324947
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 05:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@googlemail.com header.s=20251104 header.b=c9QevH2m;
 spf=pass (domain: googlemail.com, ip: 74.125.228.99, mailfrom: mrksvolk@googlemail.com)
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a99cd5115bso947428a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 05:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789734377; cv=none;
        d=google.com; s=arc-20260327;
        b=oDsXRK38qtXaD+Ikw29df7HcJpHbtjHDjh1pn8J8Vux+KztgLXMEOm/HoPwwbHze5u
         kENfnGLki8wqnl5/OHI2zMUMzh+rK55qFdhhDsP/VR04Y5L9YymAWI9Drq+hqSbdOMQN
         zdGvapyCanUbM/Lh3ejhf6vbyBDHXEQIcfnOUOvHFPLOUZeGRmjlabzm1H6gOx3h/XIY
         4/1hb8f713YOYynXVzeX8zU61oBRUy2nDM/2dJ9/rnNzaX/xr4XAY1DubttsBk2FLQmV
         wZqueZ95xZbcHlAAp3wPGfRp7w9dUwnjAS0LvbD8GBlJQNp75VrSL8E+rpHBlDSbY6B2
         Ocng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lwbTwdMixDLE1dGzNjpt5n4bXHMZFJk8INqulVv8HxQ=;
        fh=U6ORsb83GB/F4jwSs2hM28jRclivJIsjEGqSisGJMBE=;
        b=RfG/57pkqi6j7v6AEAJ9ktDtMeKNz9OYF8eQ8bLkTBI5u7k1L+6WV2eGzE2RtKJFLx
         t7VhN3WnIXj1kdZg8MzdRJRnE4dJam1gRJYmGTo4wJnsXPFAYbZXsI7sOjDWtnisF3eL
         uS6zVEN10lhmkm/jscLCQnzPaXT7FlUi9Z2Y4iMlG9LYrAsntHCBDfQXD2sL4W27dLlx
         S7NF8lokxVDQH0YxMvnUgt/C1b47dy9ayZ7MDLrRtRZ2B8VR+A5zF+l1TaAjy5tPceHk
         H+HYYQcuiK7V+eTYCN1DiDd9wfmiZBF61MR2OyWa7WjgseDg+tvg3Eq0JxuVcJi7hQvc
         EEdw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789734377; x=1790339177; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwbTwdMixDLE1dGzNjpt5n4bXHMZFJk8INqulVv8HxQ=;
        b=c9QevH2m/M89jKBSDs3DsGHhpNP37QUfy6lnVUq8QIhEFTq7oNljWjE4jtas2Xoo/r
         tJ7NWuHgMmzcXS3gtJHelU1HgfJd2BEUmdbKXATasb6zrNCnHVlHQCpMnZdb+OIxdhn7
         USu7nHW/wzN/0nyvNDz4bUKt+BPU55bjO033A+XVimTHOfaC10CdSMU+cHR81wsaIuhi
         l4aMnQQuWL7deH1+iV420m8nGS4/R8P2AYiMUUgBugIc1ZT6z+8IsSOm8cTn9dKcM7Py
         L5k6djFPzh7EsuoNXcPxIVkkg1KeRA7+CNzPKmSfY+Z25glAgaPiE72akggwCVnuL5/Z
         in4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734377; x=1790339177;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lwbTwdMixDLE1dGzNjpt5n4bXHMZFJk8INqulVv8HxQ=;
        b=dWSiBjfPgPIeOerP0EztceEVQ69v4CEN5rkjEGEUOpFhFmFOUhWOs5f7jaAWXXrJl6
         W8e8+kEg7IMDCeJ23n83cHyBrtM7oAaN1jB6YJP+U6XmKeYWCCUT6Gt9VhA10x9Wedcn
         wRli5KgkjAK/SDYZiQYDQs7QaIfzfWGpI6ccE1mNYpyJUEsnJS/QW+SbHe65DoXSMzcA
         6dHpMBv5CVZfFhp2Vx3tu8f5TuwZ/zgq72n4QlwX68thS6LLKe27i2c62L639NqDTXzU
         y1YJ9yFjJwpx3Xua6OWUW3C0NJXLpc3XrS1ZbpS1j/c9/DFrym8pipyvzPTPScUU+vU0
         8TpQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4kqhDrc7GM67W73R83ptWHosMKZ8o6du8z5dZmIQKuPFBk/17O0g1tYzu8RVM3DNJ0ftYDAHmrLKGiDhNni/hCA==@lists.openembedded.org
X-Gm-Message-State: AFuF++llS0nKoRYJVMFSWOG1IS6TnsVxHO47JfmpsclMHU1eAcEa+kXD
	xXKYmlfiaUiDbMrk9IiiZ2ZKlayPlslyhrsqew9zWkl+jROcdbWInEWtR+2ILQQjhOgRXa6Q4P2
	584nu8sVTpoMWrKq3ZkuPx5TTgFusRhfOtU2IVtM=
X-Gm-Gg: AYBFou3BReiXqNvc/wMwa3r1MV/18hopdI670BChZpB6LSDJRHVaP1EYy6DqZcTGuCO
	nYjANxx1lwhhNHeTUeekfoirafi3+UOUe6POcwgTWu+vmLn8ylGk5A1+Sa+lkk5Q0TvDVwP8r7O
	d4qKHIAQ1y+Z3sBVuVShMfmJeaj2J8tChg0cS3KnV223Ki+T6wMOv1lYHavipHVwad7rFBvW5/r
	nTEOo2dxjh83i4+DqVMhNR2ifBDnqpw+DPTxTuiXba4pSJFgB+jKGFKLosZIYKV5+g2kQqllnM/
	Tfwzrx7AMaZUTPCPvD1y49my5tUHvFf/5vAdoBT/LnQfZg7YU8rOPSmI
X-Received: by 2002:a05:6512:1293:b0:5b4:ab7a:8275 with SMTP id
 2adb3069b0e04-5b8c17f5ea5mr762251e87.3.1789733939193; Fri, 18 Sep 2026
 05:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260916055325.3396270-1-f_l_k@t-online.de> <DLGPQ1X40IXU.3E13NLLX5ZW3M@bootlin.com>
 <4F8AC12D-97C5-4997-9FEC-2F9CD54334C1@arm.com>
In-Reply-To: <4F8AC12D-97C5-4997-9FEC-2F9CD54334C1@arm.com>
From: Markus Volk <mrksvolk@googlemail.com>
Date: Fri, 18 Sep 2026 14:18:47 +0200
X-Gm-Features: AcwNN1UNnDr0BKWnLX225rdxTV3xkVFKGVVUgu_WBdJ7Xni3yB1M5UpPw6klROk
Message-ID: <CAGMZJCeG9bmmTpxXm7qH7kbDQL+LEGWH4MWOb5=XRw57qPcfig@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/3] gtk4: upgrade 4.22.5 -> 4.24.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: "antonin.godard@bootlin.com" <antonin.godard@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b02eff065bc0e73f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 11:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246235

--000000000000b02eff065bc0e73f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That's what claude "thinks" about the issue:
The root cause is not in meson. It is the combination of a gcc configure
bug that only hits 32-bit ARM and a weakness in dwarfsrcfiles that hides
the problem everywhere else. That is why only beaglebone-alt failed and
why neither of us can reproduce it on x86-64.

What is the same on every architecture:

meson passes the unity file to the compiler by its relative path,
gtk/svg/libgtk_svg.a.p/gtk_svg-unity0.c. Because gcc.bbclass adds
-fcanon-prefix-map, gcc canonicalises it and stores the remapped absolute
path as the CU name:

  DW_AT_name     :
/usr/src/debug/gtk4/4.24.0/gtk/svg/libgtk_svg.a.p/gtk_svg-unity0.c
  DW_AT_comp_dir : /usr/src/debug/gtk4/4.24.0

dwarfsrcfiles unconditionally prints comp_dir + "/" + name for the CU, so
for an absolute name it produces a doubled path:


/usr/src/debug/gtk4/4.24.0//usr/src/debug/gtk4/4.24.0/gtk/svg/libgtk_svg.a.=
p/gtk_svg-unity0.c

copydebugsources strips the prefix, is left with an absolute path, and
cpio cannot find that below ${B}. So via the CU name the file is never
copied. That is why there is no libgtk_svg.a.p/ in your -src package.

What is different on ARM:

Whether the file is copied anyway depends on the line table. I built a
gcc-cross-arm and compiled a minimal unity file with both toolchains and
the same flags:

  x86-64: DWARF 5 line table built by gas, unity file only as entry 0,
          which dwarfsrcfiles skips (its loop starts at 1)
  arm:    DWARF 3 line table built by gas, unity file as entry 1,
          listed by dwarfsrcfiles as
          /usr/src/debug/gtk4/4.24.0/gtk/svg/libgtk_svg.a.p/gtk_svg-unity0.=
c

With that path copydebugsources copies the file from ${B} into -src, and
it carries the #include lines with the absolute build directory, hence
the buildpaths QA error.

The reason is gcc's configure. On the arm cross compiler
HAVE_AS_WORKING_DWARF_N_FLAG is not defined, on x86-64 and aarch64 it is.
The preceding check "--gdwarf-4 with the APP marker" uses a hard-coded
"ret" instruction instead of $insn, which does not assemble on ARM:

  checking assembler for --gdwarf-4 with the APP marker
  conftest.s:14: Error: bad instruction `ret'

So the real check is never run, gas is not passed --gdwarf-5, and the
whole ".file 0" logic in dwarf2out.cc is disabled on 32-bit ARM. gcc then
emits the main file as ".file 1", which is exactly what dwarfsrcfiles
picks up.

So: unity builds by nature generate a source file with absolute include
paths in the build directory, and OE copies sources referenced from the
debug info out of ${B} into -src. That it does not show up on x86-64 is
an accident of dwarfsrcfiles, not proof that it is fine. Fixing
dwarfsrcfiles to not prepend comp_dir to absolute CU names would make the
error reproducible on every architecture. The workaround in v2 is
therefore justified; a more general fix would be to apply the prefix
rewriting to files copied out of ${B} in copydebugsources. The gcc
configure bug is worth reporting upstream separately.



Am Fr., 18. Sept. 2026 um 13:19 Uhr schrieb Ross Burton <Ross.Burton@arm.co=
m
>:

> On 16 Sep 2026, at 12:43, Antonin Godard via lists.openembedded.org
> <antonin.godard=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > ERROR: gtk4-4.24.0-r0 do_package_qa: QA Issue: File
> /usr/src/debug/gtk4/4.24.0/gtk/svg/libgtk_svg.a.p/gtk_svg-unity0.c in
> package gtk4-src contains reference to TMPDIR [buildpaths]
> > ERROR: gtk4-4.24.0-r0 do_package_qa: QA Issue: File
> /usr/src/debug/gtk4/4.24.0/gtk/svg/libgtk_svg.a.p/gtk_svg-unity0.c in
> package gtk4-src contains a reference to the build host HOME directory. I=
f
> upstream hardcodes a directory path that matches your home, you can set
> OEQA_BUILDPATHS_SKIP =3D "/srv/pokybuild" in the recipe. [buildpaths]
> >
> > Full log:
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/8949458/raw_inl=
ine
> > Parent build:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/4634
>
> I know that there=E2=80=99s a v2 with a workaround for this, but I was cu=
rious
> where the root of the failure is and if this is actually a problem with
> meson.  However, I can=E2=80=99t reproduce it locally, in fact there is n=
o
> libgtk_svg.a.p/ directory in my -src package at all.
>
> Do either of you have any idea what could have been triggering this?
>
> Cheers,
> Ross

--000000000000b02eff065bc0e73f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That&#39;s what claude &quot;thinks&quot; about the issue:=
<div>The root cause is not in meson. It is the combination of a gcc configu=
re<br>bug that only hits 32-bit ARM and a weakness in dwarfsrcfiles that hi=
des<br>the problem everywhere else. That is why only beaglebone-alt failed =
and<br>why neither of us can reproduce it on x86-64.<br><br>What is the sam=
e on every architecture:<br><br>meson passes the unity file to the compiler=
 by its relative path,<br>gtk/svg/libgtk_svg.a.p/gtk_svg-unity0.c. Because =
gcc.bbclass adds<br>-fcanon-prefix-map, gcc canonicalises it and stores the=
 remapped absolute<br>path as the CU name:<br><br>=C2=A0 DW_AT_name =C2=A0 =
=C2=A0 : /usr/src/debug/gtk4/4.24.0/gtk/svg/libgtk_svg.a.p/gtk_svg-unity0.c=
<br>=C2=A0 DW_AT_comp_dir : /usr/src/debug/gtk4/4.24.0<br><br>dwarfsrcfiles=
 unconditionally prints comp_dir + &quot;/&quot; + name for the CU, so<br>f=
or an absolute name it produces a doubled path:<br><br>=C2=A0 /usr/src/debu=
g/gtk4/4.24.0//usr/src/debug/gtk4/4.24.0/gtk/svg/libgtk_svg.a.p/gtk_svg-uni=
ty0.c<br><br>copydebugsources strips the prefix, is left with an absolute p=
ath, and<br>cpio cannot find that below ${B}. So via the CU name the file i=
s never<br>copied. That is why there is no libgtk_svg.a.p/ in your -src pac=
kage.<br><br>What is different on ARM:<br><br>Whether the file is copied an=
yway depends on the line table. I built a<br>gcc-cross-arm and compiled a m=
inimal unity file with both toolchains and<br>the same flags:<br><br>=C2=A0=
 x86-64: DWARF 5 line table built by gas, unity file only as entry 0,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 which dwarfsrcfiles skips (its loop star=
ts at 1)<br>=C2=A0 arm: =C2=A0 =C2=A0DWARF 3 line table built by gas, unity=
 file as entry 1,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 listed by dwarfsrcf=
iles as<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/src/debug/gtk4/4.24.0/gt=
k/svg/libgtk_svg.a.p/gtk_svg-unity0.c<br><br>With that path copydebugsource=
s copies the file from ${B} into -src, and<br>it carries the #include lines=
 with the absolute build directory, hence<br>the buildpaths QA error.<br><b=
r>The reason is gcc&#39;s configure. On the arm cross compiler<br>HAVE_AS_W=
ORKING_DWARF_N_FLAG is not defined, on x86-64 and aarch64 it is.<br>The pre=
ceding check &quot;--gdwarf-4 with the APP marker&quot; uses a hard-coded<b=
r>&quot;ret&quot; instruction instead of $insn, which does not assemble on =
ARM:<br><br>=C2=A0 checking assembler for --gdwarf-4 with the APP marker<br=
>=C2=A0 conftest.s:14: Error: bad instruction `ret&#39;<br><br>So the real =
check is never run, gas is not passed --gdwarf-5, and the<br>whole &quot;.f=
ile 0&quot; logic in dwarf2out.cc is disabled on 32-bit ARM. gcc then<br>em=
its the main file as &quot;.file 1&quot;, which is exactly what dwarfsrcfil=
es<br>picks up.<br><br>So: unity builds by nature generate a source file wi=
th absolute include<br>paths in the build directory, and OE copies sources =
referenced from the<br>debug info out of ${B} into -src. That it does not s=
how up on x86-64 is<br>an accident of dwarfsrcfiles, not proof that it is f=
ine. Fixing<br>dwarfsrcfiles to not prepend comp_dir to absolute CU names w=
ould make the<br>error reproducible on every architecture. The workaround i=
n v2 is<br>therefore justified; a more general fix would be to apply the pr=
efix<br>rewriting to files copied out of ${B} in copydebugsources. The gcc<=
br>configure bug is worth reporting upstream separately.<br><br><br></div><=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">Am Fr., 18. Sept. 2026 um 13:19=C2=A0Uhr schrieb Ross =
Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&g=
t;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 16 Sep 20=
26, at 12:43, Antonin Godard via <a href=3D"http://lists.openembedded.org" =
rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;antonin=
.godard=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org" target=3D"_=
blank">bootlin.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; ERROR: gtk4-4.24.0-r0 do_package_qa: QA Issue: File /usr/src/debug/gtk=
4/4.24.0/gtk/svg/libgtk_svg.a.p/gtk_svg-unity0.c in package gtk4-src contai=
ns reference to TMPDIR [buildpaths]<br>
&gt; ERROR: gtk4-4.24.0-r0 do_package_qa: QA Issue: File /usr/src/debug/gtk=
4/4.24.0/gtk/svg/libgtk_svg.a.p/gtk_svg-unity0.c in package gtk4-src contai=
ns a reference to the build host HOME directory. If upstream hardcodes a di=
rectory path that matches your home, you can set OEQA_BUILDPATHS_SKIP =3D &=
quot;/srv/pokybuild&quot; in the recipe. [buildpaths]<br>
&gt; <br>
&gt; Full log: <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/api=
/v2/logs/8949458/raw_inline" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/valkyrie/api/v2/logs/8949458/raw_inline</a><br>
&gt; Parent build: <a href=3D"https://autobuilder.yoctoproject.org/valkyrie=
/#/builders/10/builds/4634" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/4634</a><br>
<br>
I know that there=E2=80=99s a v2 with a workaround for this, but I was curi=
ous where the root of the failure is and if this is actually a problem with=
 meson.=C2=A0 However, I can=E2=80=99t reproduce it locally, in fact there =
is no libgtk_svg.a.p/ directory in my -src package at all.<br>
<br>
Do either of you have any idea what could have been triggering this?<br>
<br>
Cheers,<br>
Ross</blockquote></div>

--000000000000b02eff065bc0e73f--

