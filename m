Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web09.4159.1615261854774623308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 19:50:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KK71GqSP;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id e21so4087627vsh.5
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 19:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d4jVSee2cU6ToJ2QGlwl/C1VPnwR7mEpnLpf6tQy7tY=;
        b=KK71GqSPOH57w0Vr1397gVh1cRoojAZ10iMRHEhMpeXM7SHuML6A6Y29m50XsvfMp4
         6TCJL3n03/n+7UMsfN+LsmcLpnBI1rJGspGhGjJ2H2mBpHnqPUG8KReX75oXd+ZWVqQa
         AlnF6G9JL4vQG3uZSZhHWGm9DTVDG3Io33W0s5ZI99BxKCYtY9ejZlKAbjeOAOH5arV9
         fWtGPN0mMZWMJj1HN29OLJtxrPxLTkZ+JB/hWPDPFt3pbxBC72rlz9kZr1OlBP0hyBqj
         2ygyr2i5d0RLDIPPdNT1TkGw1daKnnKpDxep0LVZDkZf/AE2eYVbcVq8T8LX6+hUiw+T
         y5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d4jVSee2cU6ToJ2QGlwl/C1VPnwR7mEpnLpf6tQy7tY=;
        b=nT0Vgd6dvKunb7zQOh931zMbHMN2KX35GvI7axXj+/tzIsZ9MBnkki3PmrpYuYn4OT
         icIA16YUhCe3VQYgigKlIrGH6BbZqKVQldbY/8ISoWIzFbE5aT0G0gwCA1KqSMoBfQXf
         BbEdHnIZqIOSjTGindDr2gxOJp0hhEy6cvX57XfBDGyIgAKpK57l1Ph2WXs03bhcJSRC
         Du/u4mXjTbaYHrUEZTK0GekczBSPYYDfFZDBqB508ncSezjdP8n76M8sNrErR3jnpWtr
         XzBazT2EgkU25DQKwlkFFvS2SEHvOI4uwG7xAH6eHIILDbdcIu613rbZAPdNXcLXLEpd
         NcJw==
X-Gm-Message-State: AOAM531D58r3yVJNPcG8tY0/561N/boHFW4TaV9HcL6RJJ+kkyEW/wTf
	2VgF+dcurX0UGW8cNyB5JwJMno6NJhT7ZYhH2N8=
X-Google-Smtp-Source: ABdhPJwmEOTUVG8fviy21ShxcIzOkbBrh89QJk1WpRmgwTeKE61AUPsYuCJPYREX2i79cedPVKaOYc+Pjjzj9PqfUgQ=
X-Received: by 2002:a67:bc11:: with SMTP id t17mr13349444vsn.51.1615261853891;
 Mon, 08 Mar 2021 19:50:53 -0800 (PST)
MIME-Version: 1.0
References: <20210308235953.2230531-1-raj.khem@gmail.com>
In-Reply-To: <20210308235953.2230531-1-raj.khem@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 9 Mar 2021 04:50:43 +0100
Message-ID: <CANNYZj-bjpj0VFu-Db-x917m07nQLaVKNuvs-=UaLd=H-=h=VQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Use linker options to reduce memory overhead during linking
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000005414605bd12754b"

--00000000000005414605bd12754b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you please explain the context for this? Why would we want to support
building webkit on such constrained machines? 8g of ram means they can=E2=
=80=99t
run more than 4-6 gcc processes, so webkit builds will be unbearably slow
anyway.

Alex

On Tue 9. Mar 2021 at 1.00, Khem Raj <raj.khem@gmail.com> wrote:

> Helps builds on machines with less RAM ( 8G )
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../webkitgtk/reduce-memory-overheads.patch   | 22 +++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |  1 +
>  2 files changed, 23 insertions(+)
>  create mode 100644
> meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
>
> diff --git
> a/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
> b/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
> new file mode 100644
> index 0000000000..0493150a91
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
> @@ -0,0 +1,22 @@
> +From: Alberto Garcia <berto@igalia.com>
> +Subject: Reduce memory usage when not using the Gold linker
> +Bug-Debian: https://bugs.debian.org/949621
> +Forwarded: no
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +--- a/Source/cmake/OptionsCommon.cmake
> ++++ b/Source/cmake/OptionsCommon.cmake
> +@@ -95,6 +95,12 @@ option(GCC_OFFLINEASM_SOURCE_MAP
> +   "Produce debug line information for offlineasm-generated code"
> +   ${GCC_OFFLINEASM_SOURCE_MAP_DEFAULT})
> +
> ++# Pass --reduce-memory-overheads to the bfd linker in order to save
> memory
> ++if (NOT USE_LD_GOLD)
> ++    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}
> -Wl,--reduce-memory-overheads")
> ++    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}
> -Wl,--reduce-memory-overheads")
> ++endif ()
> ++
> + # Enable the usage of OpenMP.
> + #  - At this moment, OpenMP is only used as an alternative implementat=
ion
> + #    to native threads for the parallelization of the SVG filters.
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> index 2928b8e55b..a1dd76ce81 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> @@ -18,6 +18,7 @@ SRC_URI =3D "
> https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>             file://0001-Fix-build-with-musl.patch \
>             file://include_array.patch \
>             file://include_xutil.patch \
> +           file://reduce-memory-overheads.patch \
>             "
>  SRC_URI[sha256sum] =3D
> "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f"
>
> --
> 2.30.1
>
>
>=20
>
>

--00000000000005414605bd12754b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can you please explain the context for this? Why would we=
 want to support building webkit on such constrained machines? 8g of ram me=
ans they can=E2=80=99t run more than 4-6 gcc processes, so webkit builds wi=
ll be unbearably slow anyway.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue 9. Mar 2021 at 1.00, Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,=
204)">Helps builds on machines with less RAM ( 8G )<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../webkitgtk/reduce-memory-overheads.patch=C2=A0 =C2=A0| 22 +++++++=
++++++++++++<br>
=C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a>=C2=A0 |=C2=A0 1 =
+<br>
=C2=A02 files changed, 23 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-sato/webkit/webkitgtk/reduce-memory-=
overheads.patch<br>
<br>
diff --git a/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.pa=
tch b/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch<br>
new file mode 100644<br>
index 0000000000..0493150a91<br>
--- /dev/null<br>
+++ b/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch<br>
@@ -0,0 +1,22 @@<br>
+From: Alberto Garcia &lt;<a href=3D"mailto:berto@igalia.com" target=3D"_b=
lank">berto@igalia.com</a>&gt;<br>
+Subject: Reduce memory usage when not using the Gold linker<br>
+Bug-Debian: <a href=3D"https://bugs.debian.org/949621" rel=3D"noreferrer"=
 target=3D"_blank">https://bugs.debian.org/949621</a><br>
+Forwarded: no<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+--- a/Source/cmake/OptionsCommon.cmake<br>
++++ b/Source/cmake/OptionsCommon.cmake<br>
+@@ -95,6 +95,12 @@ option(GCC_OFFLINEASM_SOURCE_MAP<br>
+=C2=A0 =C2=A0&quot;Produce debug line information for offlineasm-generate=
d code&quot;<br>
+=C2=A0 =C2=A0${GCC_OFFLINEASM_SOURCE_MAP_DEFAULT})<br>
+ <br>
++# Pass --reduce-memory-overheads to the bfd linker in order to save memo=
ry<br>
++if (NOT USE_LD_GOLD)<br>
++=C2=A0 =C2=A0 set(CMAKE_EXE_LINKER_FLAGS &quot;${CMAKE_EXE_LINKER_FLAGS}=
 -Wl,--reduce-memory-overheads&quot;)<br>
++=C2=A0 =C2=A0 set(CMAKE_SHARED_LINKER_FLAGS &quot;${CMAKE_EXE_LINKER_FLA=
GS} -Wl,--reduce-memory-overheads&quot;)<br>
++endif ()<br>
++<br>
+ # Enable the usage of OpenMP.<br>
+ #=C2=A0 - At this moment, OpenMP is only used as an alternative implemen=
tation<br>
+ #=C2=A0 =C2=A0 to native threads for the parallelization of the SVG filt=
ers.<br>
diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5.b=
b" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a> b/meta/reci=
pes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5.bb" rel=3D"noreferrer" t=
arget=3D"_blank">webkitgtk_2.30.5.bb</a><br>
index 2928b8e55b..a1dd76ce81 100644<br>
--- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a><br>
+++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a><br>
@@ -18,6 +18,7 @@ SRC_URI =3D &quot;<a href=3D"https://www.webkitgtk.org/r=
eleases/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-build-with-musl.=
patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://include_array.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://include_xutil.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://reduce-memory-overheads.p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;7d0dab08e3c5ae07bec80b2822ef42e952765d5=
724cac86eb23999bfed5a7f1f&quot;<br>
<br>
-- <br>
2.30.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000005414605bd12754b--
