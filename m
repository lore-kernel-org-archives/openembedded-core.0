Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.2243.1588752005419711351
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 01:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=odCldX14;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: aehs29@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id t11so530739lfe.4
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 01:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=winls1Zr+EKb/7PLoom5MC6XEWvG9IBkokVS2L8ImnM=;
        b=odCldX14ubwbpP/HnvSN3xgeax/BzsC1hljkQltci7tZA1RBvtbWbIxHem0Ws2HKgo
         dxgpdE+SYywJ1dqd2nfLfPvVGjGewxDH2eP9WNEEs9MsaUWCBCzKpaVG/MqyoBS7Os0o
         LodXI6uiG1lnGKJ81WsekEsXR1Xe42JmBVCFN2jD/NEte3vh9l6RNUly3vWblM2DOdCq
         DiePGJprWOoYKbVPf6sfGyY9LXnmTQfLYcu4MFfqnzJgf71d8e2a3mg2x/iqTfS+kjB6
         ucsT2DqfoLaWikfmfx+iCE9ocZQg0Xa7cLT1BOgiXjhEzRhrJNat1duDNweZTUQ8RJwd
         mqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=winls1Zr+EKb/7PLoom5MC6XEWvG9IBkokVS2L8ImnM=;
        b=KmK97LayG3vWoSbqjod2PlWREmeXkhyNa91du0Eb7lIn1KGRrWn1lxX0RP+o1hWL4j
         gqdY6dSKl13ARw33NudHcWtD3TzwshbfPSQnYQcvArBFkzkrBSjj78kUvsm0hXgMe42s
         6KKWZJsYU+CidLYu+u7sUwBj2fPhQM6xjkl5qIepiWT+MSzsa+cao60eHkTjHi8bpmBx
         AletSvmqK2e2igquN3V+rwYGPpMB0Ks8HJV/qm0DEdry8ibCw5VUKw+2MF6bK4HTsVUO
         e8q3QJ8NgXTpV4tnKjoUvUereu5k3ZEm14LNH5k+tHP6LXF2fanjF6lFB/oLgSktzeC5
         BWdg==
X-Gm-Message-State: AGi0PuaTapUFB5oDYQk5dGLOYt2MqsALt7mQbMLOaW3LAfx5tlo3aYVg
	H/PwDw2uLOyATYcjZXCjC4WqxNCnUcY+1HyrNe+D0fo6
X-Google-Smtp-Source: APiQypK6w1LUGQ15t1rWBfpOEQ65lUt+X+YIS4u6cPdznDKR/epDKfCnJf/Cqy9z+RE0G8SSrhbAted1at2JECEJYgY=
X-Received: by 2002:ac2:442f:: with SMTP id w15mr4115636lfl.73.1588752003005;
 Wed, 06 May 2020 01:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200503162559.946-1-alex.kanavin@gmail.com> <20200503162559.946-14-alex.kanavin@gmail.com>
In-Reply-To: <20200503162559.946-14-alex.kanavin@gmail.com>
From: "Alejandro Hernandez" <alejandro@enedino.org>
Date: Wed, 6 May 2020 01:59:51 -0600
Message-ID: <CAHMutra7BzDZa3nY75AcYRrFoNw6YGp=-tGNHxbAGQzmikwXig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 14/17] connman: update to 1.38
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c6809f05a4f6262c"

--000000000000c6809f05a4f6262c
Content-Type: text/plain; charset="UTF-8"

Hey Alex,

Pretty sure this is causing:

ERROR: connman-1.38-r0 do_package: QA Issue: connman: Files/directories
were installed but not shipped in any package:
/usr/lib/connman/scripts/vpn-script
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.
connman: 1 installed and not shipped files. [installed-vs-shipped]

Which probably slipped because the PACKAGECONFIG isn't enabled by default,
I can submit a patch but will have to wait till tomorrow.

Cheers,
Alejandro


On Sun, 3 May 2020 at 10:26, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Drop a patch merged upstream.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-connectivity/connman/connman.inc |  1 +
>  ...-gweb-fix-segfault-with-musl-v1.1.21.patch | 34 -------------------
>  ...ve-musl-does-not-implement-res_ninit.patch | 20 +++++------
>  .../connman/connman_1.37.bb                   | 17 ----------
>  .../connman/connman_1.38.bb                   | 16 +++++++++
>  5 files changed, 26 insertions(+), 62 deletions(-)
>  delete mode 100644
> meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch
>  delete mode 100644 meta/recipes-connectivity/connman/connman_1.37.bb
>  create mode 100644 meta/recipes-connectivity/connman/connman_1.38.bb
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc
> b/meta/recipes-connectivity/connman/connman.inc
> index d3eeb3be1c..b60178cefc 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -53,6 +53,7 @@ PACKAGECONFIG[nftables] = "--with-firewall=nftables
> ,,libmnl libnftnl,,kernel-mo
>  PACKAGECONFIG[iptables] = "--with-firewall=iptables ,,iptables,iptables"
>  PACKAGECONFIG[nfc] = "--enable-neard, --disable-neard, neard, neard"
>  PACKAGECONFIG[client] = "--enable-client,--disable-client,readline"
> +PACKAGECONFIG[wireguard] = "--enable-wireguard,--disable-wireguard,libmnl"
>
>  INITSCRIPT_NAME = "connman"
>  INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
> diff --git
> a/meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch
> b/meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch
> deleted file mode 100644
> index 30f1432cd3..0000000000
> ---
> a/meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-with-musl-v1.1.21.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From f0a8c69971b30ea7ca255bb885fdd1179fa5d298 Mon Sep 17 00:00:00 2001
> -From: Nicola Lunghi <nick83ola@gmail.com>
> -Date: Thu, 23 May 2019 07:55:25 +0100
> -Subject: [PATCH] gweb: fix segfault with musl v1.1.21
> -
> -In musl > v1.1.21 freeaddrinfo() implementation changed and
> -was causing a segmentation fault on recent Yocto using musl.
> -
> -See this commit:
> -
> -
> https://git.musl-libc.org/cgit/musl/commit/src/network/freeaddrinfo.c?id=d1395c43c019aec6b855cf3c656bf47c8a719e7f
> -
> -Upstream-Status: Submitted
> ----
> - gweb/gweb.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/gweb/gweb.c b/gweb/gweb.c
> -index 393afe0a..12fcb1d8 100644
> ---- a/gweb/gweb.c
> -+++ b/gweb/gweb.c
> -@@ -1274,7 +1274,8 @@ static bool is_ip_address(const char *host)
> -       addr = NULL;
> -
> -       result = getaddrinfo(host, NULL, &hints, &addr);
> --      freeaddrinfo(addr);
> -+      if(!result)
> -+              freeaddrinfo(addr);
> -
> -       return result == 0;
> - }
> ---
> -2.19.1
> -
> diff --git
> a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
> b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
> index 639ccfa2a2..942b9c97b6 100644
> ---
> a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
> +++
> b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
> @@ -1,7 +1,7 @@
> -From 10b0d16d04b811b1ccd1f9b0cfe757bce8d876a1 Mon Sep 17 00:00:00 2001
> +From c7734e1547db967eccf242fe4b9e8a30b9ff141c Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 6 Apr 2015 23:02:21 -0700
> -Subject: [PATCH 2/3] resolve: musl does not implement res_ninit
> +Subject: [PATCH] resolve: musl does not implement res_ninit
>
>  ported from
>
> http://git.alpinelinux.org/cgit/aports/plain/testing/connman/libresolv.patch
> @@ -9,12 +9,13 @@
> http://git.alpinelinux.org/cgit/aports/plain/testing/connman/libresolv.patch
>  Upstream-Status: Pending
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
>  ---
> - gweb/gresolv.c | 33 ++++++++++++---------------------
> - 1 file changed, 12 insertions(+), 21 deletions(-)
> + gweb/gresolv.c | 34 +++++++++++++---------------------
> + 1 file changed, 13 insertions(+), 21 deletions(-)
>
>  diff --git a/gweb/gresolv.c b/gweb/gresolv.c
> -index 5cf7a9a..3ad8e70 100644
> +index 38a554e..a9e8740 100644
>  --- a/gweb/gresolv.c
>  +++ b/gweb/gresolv.c
>  @@ -36,6 +36,7 @@
> @@ -25,7 +26,7 @@ index 5cf7a9a..3ad8e70 100644
>
>   #include "gresolv.h"
>
> -@@ -875,8 +875,6 @@ GResolv *g_resolv_new(int index)
> +@@ -877,8 +878,6 @@ GResolv *g_resolv_new(int index)
>         resolv->index = index;
>         resolv->nameserver_list = NULL;
>
> @@ -34,7 +35,7 @@ index 5cf7a9a..3ad8e70 100644
>         return resolv;
>   }
>
> -@@ -916,8 +914,6 @@ void g_resolv_unref(GResolv *resolv)
> +@@ -918,8 +917,6 @@ void g_resolv_unref(GResolv *resolv)
>
>         flush_nameservers(resolv);
>
> @@ -43,7 +44,7 @@ index 5cf7a9a..3ad8e70 100644
>         g_free(resolv);
>   }
>
> -@@ -1020,24 +1016,19 @@ guint g_resolv_lookup_hostname(GResolv *resolv,
> const char *hostname,
> +@@ -1022,24 +1019,19 @@ guint g_resolv_lookup_hostname(GResolv *resolv,
> const char *hostname,
>         debug(resolv, "hostname %s", hostname);
>
>         if (!resolv->nameserver_list) {
> @@ -80,6 +81,3 @@ index 5cf7a9a..3ad8e70 100644
>                 }
>
>                 if (!resolv->nameserver_list)
> ---
> -2.5.1
> -
> diff --git a/meta/recipes-connectivity/connman/connman_1.37.bb
> b/meta/recipes-connectivity/connman/connman_1.37.bb
> deleted file mode 100644
> index 00852bf0d6..0000000000
> --- a/meta/recipes-connectivity/connman/connman_1.37.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -require connman.inc
> -
> -SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
> -
> file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
> -
> file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
> -            file://0001-gweb-fix-segfault-with-musl-v1.1.21.patch \
> -            file://connman \
> -            file://no-version-scripts.patch \
> -"
> -
> -SRC_URI_append_libc-musl = "
> file://0002-resolve-musl-does-not-implement-res_ninit.patch"
> -
> -SRC_URI[md5sum] = "75012084f14fb63a84b116e66c6e94fb"
> -SRC_URI[sha256sum] =
> "6ce29b3eb0bb16a7387bc609c39455fd13064bdcde5a4d185fab3a0c71946e16"
> -
> -RRECOMMENDS_${PN} = "connman-conf"
> -RCONFLICTS_${PN} = "networkmanager"
> diff --git a/meta/recipes-connectivity/connman/connman_1.38.bb
> b/meta/recipes-connectivity/connman/connman_1.38.bb
> new file mode 100644
> index 0000000000..027c41e9af
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman_1.38.bb
> @@ -0,0 +1,16 @@
> +require connman.inc
> +
> +SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
> +
>  file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
> +
>  file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
> +           file://connman \
> +           file://no-version-scripts.patch \
> +           "
> +
> +SRC_URI_append_libc-musl = "
> file://0002-resolve-musl-does-not-implement-res_ninit.patch"
> +
> +SRC_URI[md5sum] = "1ed8745354c7254bdfd4def54833ee94"
> +SRC_URI[sha256sum] =
> "cb30aca97c2f79ccaed8802aa2909ac5100a3969de74c0af8a9d73b85fc4932b"
> +
> +RRECOMMENDS_${PN} = "connman-conf"
> +RCONFLICTS_${PN} = "networkmanager"
> --
> 2.26.1
>
> 
>

--000000000000c6809f05a4f6262c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace;font-size:small">Hey Alex,</div><div class=3D"gmail_defa=
ult" style=3D"font-family:monospace;font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-family:monospace;font-size:small">Pretty =
sure this is causing:</div><div class=3D"gmail_default" style=3D"font-famil=
y:monospace;font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-family:monospace;font-size:small"><span style=3D"white-space:pre-=
wrap">ERROR: connman-1.38-r0 do_package: QA Issue: connman: Files/directori=
es were installed but not shipped in any package:</span></div><div class=3D=
"gmail_default" style=3D"font-family:monospace;font-size:small"><span style=
=
=3D"white-space:pre-wrap">/usr/lib/connman/scripts/vpn-script</span></div>=
<div class=3D"gmail_default" style=3D"font-family:monospace;font-size:small=
"><span style=3D"white-space:pre-wrap">Please set FILES such that these ite=
ms are packaged. Alternatively if they are unneeded, avoid installing them =
or delete them within do_install.</span></div><div class=3D"gmail_default" =
style=3D"font-family:monospace;font-size:small"><span style=3D"white-space:=
pre-wrap">connman: 1 installed and not shipped files. [installed-vs-shipped=
]</span></div><div class=3D"gmail_default" style=3D"font-family:monospace;f=
ont-size:small"><span style=3D"white-space:pre-wrap"><br></span></div><div =
class=3D"gmail_default" style=3D"font-family:monospace;font-size:small"><sp=
an style=3D"white-space:pre-wrap">Which probably slipped because the PACKAG=
ECONFIG isn&#39;t enabled by default, I can submit a patch but will have to=
 wait till tomorrow.</span></div><div class=3D"gmail_default" style=3D"font=
-family:monospace;font-size:small"><span style=3D"white-space:pre-wrap"><br=
></span></div><div class=3D"gmail_default" style=3D"font-family:monospace;f=
ont-size:small"><span style=3D"white-space:pre-wrap">Cheers,</span></div><d=
iv class=3D"gmail_default" style=3D"font-family:monospace;font-size:small">=
<span style=3D"white-space:pre-wrap">Alejandro</span></div><div class=3D"gm=
ail_default" style=3D"font-family:monospace;font-size:small"><div class=3D"=
gmail-bolt-fixed-height-list-row gmail-scroll-hidden gmail-absolute gmail-f=
ocused" tabindex=3D"-1" style=3D"box-sizing:border-box;overflow:hidden;widt=
h:1623.99px;height:20px"><div class=3D"gmail-line-row gmail-flex-row gmail-=
flex-grow" style=3D"box-sizing:border-box;display:flex;padding:0px 12px;whi=
te-space:pre-wrap"><span class=3D"gmail-line-area gmail-flex-center gmail-f=
lex-row gmail-flex-grow gmail-justify-start" style=3D"box-sizing:border-box=
;display:flex"><span class=3D"gmail-link" style=3D"box-sizing:border-box;he=
ight:20px;margin-right:25px"><span class=3D"gmail-fontSizeM gmail-flex-nosh=
rink gmail-fabric-icon gmail-ms-Icon--Link" style=3D"box-sizing:border-box;=
font-size:0.875rem;display:inline-flex;font-family:AzureDevOpsMDL2Assets"><=
/span></span></span></div></div><div class=3D"gmail-bolt-fixed-height-list-=
row gmail-scroll-hidden gmail-absolute" tabindex=3D"-1" style=3D"box-sizing=
:border-box;overflow:hidden;width:1623.99px;height:20px"><div class=3D"gmai=
l-line-row gmail-flex-row gmail-flex-grow" style=3D"box-sizing:border-box;d=
isplay:flex;padding:0px 12px;white-space:pre-wrap"><span class=3D"gmail-lin=
e-area gmail-flex-center gmail-flex-row gmail-flex-grow gmail-justify-start=
" style=3D"box-sizing:border-box;display:flex"><span class=3D"gmail-flex-no=
shrink gmail-flex-self-start gmail-line" style=3D"box-sizing:border-box;tex=
t-align:right;padding-left:20px;min-width:33px;font-family:Menlo,Consolas,&=
quot;Courier New&quot;,monospace;font-size:15px;background-color:rgb(0,43,5=
4)"></span><br class=3D"gmail-Apple-interchange-newline"></span></div></div=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, 3 May 2020 at 10:26, Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Drop a patch merged upstream=
.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/connman/connman.inc |=C2=A0 1 +<br>
=C2=A0...-gweb-fix-segfault-with-musl-v1.1.21.patch | 34 -----------------=
--<br>
=C2=A0...ve-musl-does-not-implement-res_ninit.patch | 20 +++++------<br>
=C2=A0.../connman/<a href=3D"http://connman_1.37.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">connman_1.37.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 ----------<br>
=C2=A0.../connman/<a href=3D"http://connman_1.38.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">connman_1.38.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 +++++++++<br>
=C2=A05 files changed, 26 insertions(+), 62 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/connman/connman/0001-gw=
eb-fix-segfault-with-musl-v1.1.21.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/connman/<a href=3D"http=
://connman_1.37.bb" rel=3D"noreferrer" target=3D"_blank">connman_1.37.bb</a=
><br>
=C2=A0create mode 100644 meta/recipes-connectivity/connman/<a href=3D"http=
://connman_1.38.bb" rel=3D"noreferrer" target=3D"_blank">connman_1.38.bb</a=
><br>
<br>
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-=
connectivity/connman/connman.inc<br>
index d3eeb3be1c..b60178cefc 100644<br>
--- a/meta/recipes-connectivity/connman/connman.inc<br>
+++ b/meta/recipes-connectivity/connman/connman.inc<br>
@@ -53,6 +53,7 @@ PACKAGECONFIG[nftables] =3D &quot;--with-firewall=3Dnfta=
bles ,,libmnl libnftnl,,kernel-mo<br>
=C2=A0PACKAGECONFIG[iptables] =3D &quot;--with-firewall=3Diptables ,,iptab=
les,iptables&quot;<br>
=C2=A0PACKAGECONFIG[nfc] =3D &quot;--enable-neard, --disable-neard, neard,=
 neard&quot;<br>
=C2=A0PACKAGECONFIG[client] =3D &quot;--enable-client,--disable-client,rea=
dline&quot;<br>
+PACKAGECONFIG[wireguard] =3D &quot;--enable-wireguard,--disable-wireguard=
,libmnl&quot;<br>
<br>
=C2=A0INITSCRIPT_NAME =3D &quot;connman&quot;<br>
=C2=A0INITSCRIPT_PARAMS =3D &quot;start 05 5 2 3 . stop 22 0 1 6 .&quot;<b=
r>
diff --git a/meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfa=
ult-with-musl-v1.1.21.patch b/meta/recipes-connectivity/connman/connman/000=
1-gweb-fix-segfault-with-musl-v1.1.21.patch<br>
deleted file mode 100644<br>
index 30f1432cd3..0000000000<br>
--- a/meta/recipes-connectivity/connman/connman/0001-gweb-fix-segfault-wit=
h-musl-v1.1.21.patch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-From f0a8c69971b30ea7ca255bb885fdd1179fa5d298 Mon Sep 17 00:00:00 2001<br=
>
-From: Nicola Lunghi &lt;<a href=3D"mailto:nick83ola@gmail.com" target=3D"=
_blank">nick83ola@gmail.com</a>&gt;<br>
-Date: Thu, 23 May 2019 07:55:25 +0100<br>
-Subject: [PATCH] gweb: fix segfault with musl v1.1.21<br>
-<br>
-In musl &gt; v1.1.21 freeaddrinfo() implementation changed and<br>
-was causing a segmentation fault on recent Yocto using musl.<br>
-<br>
-See this commit:<br>
-<br>
- <a href=3D"https://git.musl-libc.org/cgit/musl/commit/src/network/freead=
drinfo.c?id=3Dd1395c43c019aec6b855cf3c656bf47c8a719e7f" rel=3D"noreferrer" =
target=3D"_blank">https://git.musl-libc.org/cgit/musl/commit/src/network/fr=
eeaddrinfo.c?id=3Dd1395c43c019aec6b855cf3c656bf47c8a719e7f</a><br>
-<br>
-Upstream-Status: Submitted<br>
----<br>
- gweb/gweb.c | 3 ++-<br>
- 1 file changed, 2 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/gweb/gweb.c b/gweb/gweb.c<br>
-index 393afe0a..12fcb1d8 100644<br>
---- a/gweb/gweb.c<br>
-+++ b/gweb/gweb.c<br>
-@@ -1274,7 +1274,8 @@ static bool is_ip_address(const char *host)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D NULL;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D getaddrinfo(host, NULL, &amp;hints,=
 &amp;addr);<br>
--=C2=A0 =C2=A0 =C2=A0 freeaddrinfo(addr);<br>
-+=C2=A0 =C2=A0 =C2=A0 if(!result)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 freeaddrinfo(addr);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return result =3D=3D 0;<br>
- }<br>
--- <br>
-2.19.1<br>
-<br>
diff --git a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-d=
oes-not-implement-res_ninit.patch b/meta/recipes-connectivity/connman/connm=
an/0002-resolve-musl-does-not-implement-res_ninit.patch<br>
index 639ccfa2a2..942b9c97b6 100644<br>
--- a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not=
-implement-res_ninit.patch<br>
+++ b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not=
-implement-res_ninit.patch<br>
@@ -1,7 +1,7 @@<br>
-From 10b0d16d04b811b1ccd1f9b0cfe757bce8d876a1 Mon Sep 17 00:00:00 2001<br=
>
+From c7734e1547db967eccf242fe4b9e8a30b9ff141c Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 6 Apr 2015 23:02:21 -0700<br>
-Subject: [PATCH 2/3] resolve: musl does not implement res_ninit<br>
+Subject: [PATCH] resolve: musl does not implement res_ninit<br>
<br>
=C2=A0ported from<br>
=C2=A0<a href=3D"http://git.alpinelinux.org/cgit/aports/plain/testing/conn=
man/libresolv.patch" rel=3D"noreferrer" target=3D"_blank">http://git.alpine=
linux.org/cgit/aports/plain/testing/connman/libresolv.patch</a><br>
@@ -9,12 +9,13 @@ <a href=3D"http://git.alpinelinux.org/cgit/aports/plain/=
testing/connman/libresolv.patch" rel=3D"noreferrer" target=3D"_blank">http:=
//git.alpinelinux.org/cgit/aports/plain/testing/connman/libresolv.patch</a>=
<br>
=C2=A0Upstream-Status: Pending<br>
<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
- gweb/gresolv.c | 33 ++++++++++++---------------------<br>
- 1 file changed, 12 insertions(+), 21 deletions(-)<br>
+ gweb/gresolv.c | 34 +++++++++++++---------------------<br>
+ 1 file changed, 13 insertions(+), 21 deletions(-)<br>
<br>
=C2=A0diff --git a/gweb/gresolv.c b/gweb/gresolv.c<br>
-index 5cf7a9a..3ad8e70 100644<br>
+index 38a554e..a9e8740 100644<br>
=C2=A0--- a/gweb/gresolv.c<br>
=C2=A0+++ b/gweb/gresolv.c<br>
=C2=A0@@ -36,6 +36,7 @@<br>
@@ -25,7 +26,7 @@ index 5cf7a9a..3ad8e70 100644<br>
<br>
=C2=A0 #include &quot;gresolv.h&quot;<br>
<br>
-@@ -875,8 +875,6 @@ GResolv *g_resolv_new(int index)<br>
+@@ -877,8 +878,6 @@ GResolv *g_resolv_new(int index)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 resolv-&gt;index =3D index;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 resolv-&gt;nameserver_list =3D NULL;<br>
<br>
@@ -34,7 +35,7 @@ index 5cf7a9a..3ad8e70 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return resolv;<br>
=C2=A0 }<br>
<br>
-@@ -916,8 +914,6 @@ void g_resolv_unref(GResolv *resolv)<br>
+@@ -918,8 +917,6 @@ void g_resolv_unref(GResolv *resolv)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 flush_nameservers(resolv);<br>
<br>
@@ -43,7 +44,7 @@ index 5cf7a9a..3ad8e70 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(resolv);<br>
=C2=A0 }<br>
<br>
-@@ -1020,24 +1016,19 @@ guint g_resolv_lookup_hostname(GResolv *resolv, c=
onst char *hostname,<br>
+@@ -1022,24 +1019,19 @@ guint g_resolv_lookup_hostname(GResolv *resolv, c=
onst char *hostname,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 debug(resolv, &quot;hostname %s&quot;, hostnam=
e);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!resolv-&gt;nameserver_list) {<br>
@@ -80,6 +81,3 @@ index 5cf7a9a..3ad8e70 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!resolv-&gt;na=
meserver_list)<br>
--- <br>
-2.5.1<br>
-<br>
diff --git a/meta/recipes-connectivity/connman/<a href=3D"http://connman_1=
.37.bb" rel=3D"noreferrer" target=3D"_blank">connman_1.37.bb</a> b/meta/rec=
ipes-connectivity/connman/<a href=3D"http://connman_1.37.bb" rel=3D"norefer=
rer" target=3D"_blank">connman_1.37.bb</a><br>
deleted file mode 100644<br>
index 00852bf0d6..0000000000<br>
--- a/meta/recipes-connectivity/connman/<a href=3D"http://connman_1.37.bb"=
 rel=3D"noreferrer" target=3D"_blank">connman_1.37.bb</a><br>
+++ /dev/null<br>
@@ -1,17 +0,0 @@<br>
-require connman.inc<br>
-<br>
-SRC_URI=C2=A0 =3D &quot;${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.ta=
r.xz \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-plugin.h-Change-vis=
ibility-to-default-for-debug-symb.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-connman.service-sto=
p-systemd-resolved-when-we-use-co.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-gweb-fix-segfault-w=
ith-musl-v1.1.21.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://connman \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://no-version-scripts.patch=
 \<br>
-&quot;<br>
-<br>
-SRC_URI_append_libc-musl =3D &quot; file://0002-resolve-musl-does-not-imp=
lement-res_ninit.patch&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;75012084f14fb63a84b116e66c6e94fb&quot;<br>
-SRC_URI[sha256sum] =3D &quot;6ce29b3eb0bb16a7387bc609c39455fd13064bdcde5a=
4d185fab3a0c71946e16&quot;<br>
-<br>
-RRECOMMENDS_${PN} =3D &quot;connman-conf&quot;<br>
-RCONFLICTS_${PN} =3D &quot;networkmanager&quot;<br>
diff --git a/meta/recipes-connectivity/connman/<a href=3D"http://connman_1=
.38.bb" rel=3D"noreferrer" target=3D"_blank">connman_1.38.bb</a> b/meta/rec=
ipes-connectivity/connman/<a href=3D"http://connman_1.38.bb" rel=3D"norefer=
rer" target=3D"_blank">connman_1.38.bb</a><br>
new file mode 100644<br>
index 0000000000..027c41e9af<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/connman/<a href=3D"http://connman_1.38.bb"=
 rel=3D"noreferrer" target=3D"_blank">connman_1.38.bb</a><br>
@@ -0,0 +1,16 @@<br>
+require connman.inc<br>
+<br>
+SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-plugin.h-Change-visi=
bility-to-default-for-debug-symb.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-connman.service-stop=
-systemd-resolved-when-we-use-co.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://connman \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://no-version-scripts.patch =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+SRC_URI_append_libc-musl =3D &quot; file://0002-resolve-musl-does-not-imp=
lement-res_ninit.patch&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;1ed8745354c7254bdfd4def54833ee94&quot;<br>
+SRC_URI[sha256sum] =3D &quot;cb30aca97c2f79ccaed8802aa2909ac5100a3969de74=
c0af8a9d73b85fc4932b&quot;<br>
+<br>
+RRECOMMENDS_${PN} =3D &quot;connman-conf&quot;<br>
+RCONFLICTS_${PN} =3D &quot;networkmanager&quot;<br>
-- <br>
2.26.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000c6809f05a4f6262c--
