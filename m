Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web11.5642.1618816949766830731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 00:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rRpFFFy2;
 spf=pass (domain: gmail.com, ip: 209.85.221.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id k12so4004207vkn.7
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 00:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IPC0OIkJJ1UbnXmnCbUi1iFA2e8rsVorQjlBdyPSRUE=;
        b=rRpFFFy2/jyQa7+XL/PRRxCGoYp+EM4YL4NY/kXSW9A7HYBg+VHckVNxnoTGkTXOiR
         /X20VifKs4GHTmkL1JuLgbaGrx91VrUknOEOkUbrtBfM4WhEvSfs/jasS9n/nHbENIYH
         al7Omz+ZfyVCdb9ErHote7CjzJ+hCe5mza2joBjvMdBmUC81l4V1Cj7EvzsyDiZdgfua
         7mkcmUhzRUGOWrMevC8IPz0NohSBOFrgX9kikhF+D7bVtM48lpUC/zwB6VNQ0YHCIaw3
         SCGUIA1tlWB+avOsGui/uoWY9OMjx8i26vgR5+F01GV06NMuFP56uPZaYPqCB5Z2lb1m
         OPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IPC0OIkJJ1UbnXmnCbUi1iFA2e8rsVorQjlBdyPSRUE=;
        b=sKGW5Pq/DKOvbADrZYoCxUEwTR++Ed4lT2q+PRdVRkm6bxWMBQ8NtzzAcr8frCk3jn
         nel/n97ZsA51zXWmqnURhUoqb8Cq/VvZuepoQrKbgo6cujfgz/RLiEIKaKr/3AAJHdU5
         AGgOXMANd6PwzcsKD3nPchk5NMTIyeUmczvFtHsJtBxHz7ZAaJnhkIyg44XAdI/aLOZi
         3T1W+NbDkU6Z/Lx3FHcuHwZaG/KXziviixenaZ0C6IWhqkdxwrxUcoRLF6ZUtt+/UA/g
         VTcly0vppNSf5q3Hw38nr/e5c54UTlfLwjMZiBzu+yYbm2xiLBh4qbjhzWaVNvdPu3aQ
         89vA==
X-Gm-Message-State: AOAM533yBrPDjtq5Swnt+gT7767NHDJkWl/JvcIAgGKN6pldMGvx8+1i
	1JMGvPmH8wY1I3P8JnArMEOKCHfhKyv1VfskOcE=
X-Google-Smtp-Source: ABdhPJweKo1WV8K/8rEexXDB3Rgb2dUswIc3SpYxGJI8jAABJitUyrnN03v87broMI8spIoROefzHnUrkjK9R6Zda58=
X-Received: by 2002:a1f:5506:: with SMTP id j6mr1933355vkb.7.1618816948844;
 Mon, 19 Apr 2021 00:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <1618530602-26607-1-git-send-email-wangmy@fujitsu.com> <2044e75fb6ae49a297d7114cc55337c1@intel.com>
In-Reply-To: <2044e75fb6ae49a297d7114cc55337c1@intel.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 19 Apr 2021 09:22:16 +0200
Message-ID: <CANNYZj_Z-Nhv2EJxsLo8G3tG7F57AExOjmJ-Xopm2zz23t5mvw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: upgrade 21.0.1 -> 21.0.2
To: Naveen Saini <naveen.kumar.saini@intel.com>
Cc: wangmy <wangmy@fujitsu.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000313f5d05c04e319e"

--000000000000313f5d05c04e319e
Content-Type: text/plain; charset="UTF-8"

Seems like mesa has regressed to using softpipe instead of virgl on target,
but only on Fedora 32. It's odd, because other selftest workers in the same
a-full run (Debian, Ubuntu) are fine.

OpenGL ES 2.x information:

  version: "OpenGL ES 3.1 Mesa 21.0.2"
  shading language version: "OpenGL ES GLSL ES 3.10"
  vendor: "Mesa/X.org"
  renderer: "softpipe"

Can you re-run the selftest on Fedora 32?

Alex


On Mon, 19 Apr 2021 at 05:24, Naveen Saini <naveen.kumar.saini@intel.com>
wrote:

> [SWAT]
> Oe-selftest on fedora failed.
>
> RESULTS - virgl.VirglTest.test_kmscube: FAILED (0.30s)
>
> AssertionError: 'renderer: "virgl"' not found in 'Using display
> 0x55dccc0562e0 with EGL version 1.4
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/2005
>
> Regards,
> Naveen
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of wangmy
> > Sent: Friday, April 16, 2021 7:50 AM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Wang Mingyu <wangmy@fujitsu.com>
> > Subject: [OE-core] [PATCH v2] mesa: upgrade 21.0.1 -> 21.0.2
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../mesa/{mesa-gl_21.0.1.bb => mesa-gl_21.0.2.bb}               | 0
> >  meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
> >  meta/recipes-graphics/mesa/{mesa_21.0.1.bb => mesa_21.0.2.bb}   | 0
> >  3 files changed, 1 insertion(+), 1 deletion(-)  rename meta/recipes-
> > graphics/mesa/{mesa-gl_21.0.1.bb => mesa-gl_21.0.2.bb} (100%)  rename
> > meta/recipes-graphics/mesa/{mesa_21.0.1.bb => mesa_21.0.2.bb} (100%)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb
> b/meta/recipes-
> > graphics/mesa/mesa-gl_21.0.2.bb
> > similarity index 100%
> > rename from meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb
> > rename to meta/recipes-graphics/mesa/mesa-gl_21.0.2.bb
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
> > graphics/mesa/mesa.inc
> > index caf3c62ad8..5705ae0f08 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -21,7 +21,7 @@ SRC_URI =
> > "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> >
>  file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
> >             "
> >
> > -SRC_URI[sha256sum] =
> > "379fc984459394f2ab2d84049efdc3a659869dc1328ce72ef0598506611712bb"
> > +SRC_URI[sha256sum] =
> > "46c1dc5bb54a372dee43ec3c067229c299187d5bdadf1402756bbf66a6df5b88"
> >
> >  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa_21.0.1.bb b/meta/recipes-
> > graphics/mesa/mesa_21.0.2.bb
> > similarity index 100%
> > rename from meta/recipes-graphics/mesa/mesa_21.0.1.bb
> > rename to meta/recipes-graphics/mesa/mesa_21.0.2.bb
> > --
> > 2.25.1
>
>
> 
>
>

--000000000000313f5d05c04e319e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"height:18px">Seems like mesa has regressed t=
o using softpipe instead of virgl on target, but only on Fedora 32. <span c=
lass=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><span class=3D"gmail-">=
It&#39;s odd, because other selftest workers in the same a-full run (Debian=
, Ubuntu) are fine.</span></span></div><div style=3D"height:18px"><span cla=
ss=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><span class=3D"gmail-"><b=
r></span></span></div><div style=3D"height:18px"><span class=3D"gmail-no-wr=
ap gmail-log_o gmail-ng-binding"><span class=3D"gmail-">OpenGL ES 2.x infor=
mation:</span></span></div><div><pre class=3D"gmail-row gmail-log" style=3D=
"height:1032.15px;overflow-y:auto;display:block"><span style=3D"font-family=
:arial,sans-serif"><span class=3D"gmail-ng-scope"><div style=3D"height:18px=
"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><span class=3D=
"gmail-">  version: &quot;OpenGL ES 3.1 Mesa 21.0.2&quot;</span></span></di=
v><div style=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail=
-ng-binding"><span class=3D"gmail-">  shading language version: &quot;OpenG=
L ES GLSL ES 3.10&quot;</span></span></div><div style=3D"height:18px"><span=
 class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><span class=3D"gmail-=
">  vendor: &quot;Mesa/X.org&quot;</span></span></div><div style=3D"height:=
18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><span clas=
s=3D"gmail-">  renderer: &quot;softpipe&quot;</span></span></div><div style=
=
=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding=
"><span class=3D"gmail-"><br></span></span></div><div style=3D"height:18px"=
><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><span class=3D"=
gmail-">Can you re-run the selftest on Fedora 32?<br></span></span></div><d=
iv style=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-=
binding"><span class=3D"gmail-"><br></span></span></div></span>Alex</span><=
br></pre></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, 19 Apr 2021 at 05:24, Naveen Saini &lt;<a href=3D"=
mailto:naveen.kumar.saini@intel.com">naveen.kumar.saini@intel.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">[SWAT]<br>
Oe-selftest on fedora failed. <br>
<br>
RESULTS - virgl.VirglTest.test_kmscube: FAILED (0.30s)<br>
<br>
AssertionError: &#39;renderer: &quot;virgl&quot;&#39; not found in &#39;Us=
ing display 0x55dccc0562e0 with EGL version 1.4<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/86/buil=
ds/2005" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/86/builds/2005</a><br>
<br>
Regards,<br>
Naveen<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedde=
d-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core=
@lists.openembedded.org</a>&gt; On Behalf Of wangmy<br>
&gt; Sent: Friday, April 16, 2021 7:50 AM<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_=
blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH v2] mesa: upgrade 21.0.1 -&gt; 21.0.2<br>
&gt; <br>
&gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" =
target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../mesa/{<a href=3D"http://mesa-gl_21.0.1.bb" rel=3D"noreferre=
r" target=3D"_blank">mesa-gl_21.0.1.bb</a> =3D&gt; <a href=3D"http://mesa-g=
l_21.0.2.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.2.bb</a>}=C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>
&gt;=C2=A0 meta/recipes-graphics/mesa/{<a href=3D"http://mesa_21.0.1.bb" r=
el=3D"noreferrer" target=3D"_blank">mesa_21.0.1.bb</a> =3D&gt; <a href=3D"h=
ttp://mesa_21.0.2.bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.0.2.bb</=
a>}=C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 3 files changed, 1 insertion(+), 1 deletion(-)=C2=A0 rename met=
a/recipes-<br>
&gt; graphics/mesa/{<a href=3D"http://mesa-gl_21.0.1.bb" rel=3D"noreferrer=
" target=3D"_blank">mesa-gl_21.0.1.bb</a> =3D&gt; <a href=3D"http://mesa-gl=
_21.0.2.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.2.bb</a>} (10=
0%)=C2=A0 rename<br>
&gt; meta/recipes-graphics/mesa/{<a href=3D"http://mesa_21.0.1.bb" rel=3D"=
noreferrer" target=3D"_blank">mesa_21.0.1.bb</a> =3D&gt; <a href=3D"http://=
mesa_21.0.2.bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.0.2.bb</a>} (1=
00%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.=
0.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.1.bb</a> b/meta/r=
ecipes-<br>
&gt; graphics/mesa/<a href=3D"http://mesa-gl_21.0.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">mesa-gl_21.0.2.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0=
.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.1.bb</a><br>
&gt; rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.2=
.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.2.bb</a><br>
&gt; diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-<br>
&gt; graphics/mesa/mesa.inc<br>
&gt; index caf3c62ad8..5705ae0f08 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; +++ b/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; @@ -21,7 +21,7 @@ SRC_URI =3D<br>
&gt; &quot;<a href=3D"https://mesa.freedesktop.org/archive/mesa-$%7BPV%7D.=
tar.xz" rel=3D"noreferrer" target=3D"_blank">https://mesa.freedesktop.org/a=
rchive/mesa-${PV}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-futex.h-De=
fine-__NR_futex-if-it-does-not-exist.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; <br>
&gt; -SRC_URI[sha256sum] =3D<br>
&gt; &quot;379fc984459394f2ab2d84049efdc3a659869dc1328ce72ef0598506611712b=
b&quot;<br>
&gt; +SRC_URI[sha256sum] =3D<br>
&gt; &quot;46c1dc5bb54a372dee43ec3c067229c299187d5bdadf1402756bbf66a6df5b8=
8&quot;<br>
&gt; <br>
&gt;=C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D &quot;mesa-(?P&lt;pver&gt;\d+(\.=
\d+)+)&quot;<br>
&gt; <br>
&gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_21.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.0.1.bb</a> b/meta/recipes=
-<br>
&gt; graphics/mesa/<a href=3D"http://mesa_21.0.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">mesa_21.0.2.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa_21.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.0.1.bb</a><br>
&gt; rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa_21.0.2.bb=
" rel=3D"noreferrer" target=3D"_blank">mesa_21.0.2.bb</a><br>
&gt; --<br>
&gt; 2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000313f5d05c04e319e--
