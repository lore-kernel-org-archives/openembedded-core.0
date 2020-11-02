Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.29087.1604311064939940033
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 01:57:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gpfKf5qo;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id w13so4565257eju.13
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 01:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5gRp81zHMRze1PksCx51sFDs+Tm70wMCH/gK1X/1EHE=;
        b=gpfKf5qonuuwtYTb6UpxswwHRpE64/+rjEhO1iPclgAc67eYFQqHXBAgW8AeqgWQxx
         YkQX1BJWCPH/9diCjg1ga6wjPVsLvkNfkdgCOdSyh2x8sQJyHoTuahNX5Yfr9DFQCqrb
         jt2iJQifEm8WcyHxbeR85Y3s53wEVpDBQcU8z+KcmB/ASTNnM7/xrnu3ZfOapklVKBY5
         RuutJVdPiVgK9uhmDONe8kpUhLxXMCQEvG5sY3srOthQHUny0Sxym8W6gJG8XwePWL0G
         S4anex7syacZUsKjf2lCPQRiDoL7YNQSvpNY+dJ1bu/T45rpRdpw+4/9Leypw7/5tqUX
         Zh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5gRp81zHMRze1PksCx51sFDs+Tm70wMCH/gK1X/1EHE=;
        b=QZW7RkzfegeeA8nrs7tV57SMdtX4hf2s2CS5DWtuVqNCbutsXJggXsA+KKbMEIIcj/
         WC7TUlEC0MVVW7HwwZbKz51YLkO6a5bizj0qRgYT6hIaSMWbxffj8bEqZh5E2CBbWU2n
         96iIT1LopKV+JH1cwrirkB1TYkbz450+BnDG12f4NETH4Jf+3pG2bq/it0p9cZASUcQj
         NoDSuIdSYdbj6bbhBwMW6vuvtEgMskB98lZ3Wj3hdbXzzgpiRRRJaqTTUD+Ociv/9xE4
         vlvwnXwrdN89bjt+H8OMGXiRAD4+KjfDeRvWcHmVsz6aB17MHqPgZsgaFWCZtnRBagCe
         tMUg==
X-Gm-Message-State: AOAM533iNodw6nC1eJEyvm4vKCE6hZ4aI5TQ2x4LvTZR2owplQZpw6kh
	avtrPWNCqMMRDrnupwkWY6Pe0Ce9vTt/0lc1v48=
X-Google-Smtp-Source: ABdhPJxJgtp2FbdGPkuKcNH15uj7LKfVSLjxdDQcMMI3Y6bg5oTo4+5re4z/7fMe9wG891pVZrVD3+XmVm4rVUbQyMc=
X-Received: by 2002:a17:906:249a:: with SMTP id e26mr14312869ejb.484.1604311063265;
 Mon, 02 Nov 2020 01:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
In-Reply-To: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 2 Nov 2020 09:57:32 +0000
Message-ID: <CANPvuRmmZoqHZP7pbNqHtPBqBo0VqTrftmBhh+nK7iTE_gF=wA@mail.gmail.com>
Subject: Re: [gastesgarth][PATCH 01/12] gstreamer1.0: Fix reproducibility issue around libcap
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think I already know the answer but Is there any possibility to use
gstreamer 1.18 on gastesgarth ?

Martin Jansa <martin.jansa@gmail.com> escreveu no dia domingo,
1/11/2020 =C3=A0(s) 00:44:
>
> From: Jose Quaresma <quaresma.jose@gmail.com>
>
> Currently gstreamer configuration depends libcap and on whether
> setcap is found on the host system.
>
> Removing libcap from DEPENDS and only use it when the 'setcap' is enabled=
.
>
>     * 0004-capfix.patch
>       Removed as the same goals can be achieved only with the PACKAGECONF=
IG 'setcap'
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  .../gstreamer/gstreamer1.0/capfix.patch       | 37 -------------------
>  .../gstreamer/gstreamer1.0_1.16.2.bb          |  5 +--
>  2 files changed, 2 insertions(+), 40 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix=
.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
> deleted file mode 100644
> index 7ca3d5ad4a..0000000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -Currently gstreamer configuration depends on whether setcap is found on =
the host
> -system. Turn this into a configure option to make builds deterinistic.
> -
> -RP 2020/2/19
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Upstream-Status: Pending
> -
> -Index: gstreamer-1.16.1/libs/gst/helpers/meson.build
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gstreamer-1.16.1.orig/libs/gst/helpers/meson.build
> -+++ gstreamer-1.16.1/libs/gst/helpers/meson.build
> -@@ -73,7 +73,12 @@ if have_ptp
> -     endif
> -   endif
> -
> --  setcap =3D find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap',=
 required : false)
> -+  setcap_feature =3D get_option('setcap')
> -+  if setcap_feature.disabled()
> -+    setcap =3D find_program('dontexist', required : false)
> -+  else
> -+    setcap =3D find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap=
', required : false)
> -+  endif
> -
> -   # user/group to change to in gst-ptp-helper
> -   ptp_helper_setuid_user =3D get_option('ptp-helper-setuid-user')
> -Index: gstreamer-1.16.1/meson_options.txt
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gstreamer-1.16.1.orig/meson_options.txt
> -+++ gstreamer-1.16.1/meson_options.txt
> -@@ -26,6 +26,7 @@ option('libunwind', type : 'feature', va
> - option('libdw', type : 'feature', value : 'auto', description : 'Use li=
bdw to generate better backtraces from libunwind')
> - option('dbghelp', type : 'feature', value : 'auto', description : 'Use =
dbghelp to generate backtraces')
> - option('bash-completion', type : 'feature', value : 'auto', description=
 : 'Install bash completion files')
> -+option('setcap', type : 'feature', value : 'auto', description : 'Use s=
etcap')
> -
> - # Common feature options
> - option('examples', type : 'feature', value : 'auto', yield : true)
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb b/m=
eta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
> index 50a872e292..9d92fe1439 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
> @@ -6,7 +6,7 @@ BUGTRACKER =3D "https://bugzilla.gnome.org/enter_bug.cgi?=
product=3DGstreamer"
>  SECTION =3D "multimedia"
>  LICENSE =3D "LGPLv2+"
>
> -DEPENDS =3D "glib-2.0 glib-2.0-native libcap libxml2 bison-native flex-n=
ative"
> +DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 bison-native flex-native"
>
>  inherit meson pkgconfig gettext upstream-version-is-even gobject-introsp=
ection gtk-doc
>
> @@ -21,7 +21,6 @@ SRC_URI =3D " \
>      file://0002-meson-build-gir-even-when-cross-compiling-if-introsp.pat=
ch \
>      file://0003-meson-Add-valgrind-feature.patch \
>      file://0004-meson-Add-option-for-installed-tests.patch \
> -    file://capfix.patch \
>  "
>  SRC_URI[md5sum] =3D "0e661ed5bdf1d8996e430228d022628e"
>  SRC_URI[sha256sum] =3D "e3f044246783fd685439647373fa13ba14f7ab0b346eadd0=
6437092f8419e94e"
> @@ -40,7 +39,7 @@ PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Denabled,-Dlibu=
nwind=3Ddisabled,libunwind"
>  PACKAGECONFIG[dw] =3D "-Dlibdw=3Denabled,-Dlibdw=3Ddisabled,elfutils"
>  PACKAGECONFIG[bash-completion] =3D "-Dbash-completion=3Denabled,-Dbash-c=
ompletion=3Ddisabled,bash-completion"
>  PACKAGECONFIG[tools] =3D "-Dtools=3Denabled,-Dtools=3Ddisabled"
> -PACKAGECONFIG[setcap] =3D "-Dsetcap=3Denabled,-Dsetcap=3Ddisabled,libcap=
 libcap-native"
> +PACKAGECONFIG[setcap] =3D ",,libcap libcap-native"
>
>  # TODO: put this in a gettext.bbclass patch
>  def gettext_oemeson(d):
> --
> 2.27.0
>


--=20
best regards,
Jos=C3=A9 Quaresma
