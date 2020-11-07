Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web08.7954.1604774944685608317
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2020 10:49:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ld2wKwDu;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id o20so4611178eds.3
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2020 10:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E3ucEW9JVDKOsVhC4YaLZU5CxzMs4uGhHNNY7RvULaA=;
        b=ld2wKwDuHUaysPMBvWzg5i09qqVBrhBiurA2uZ6l3OohSB0NA3MAgCTlfPpKMX28zt
         RSridBDXFoEVGkl7hc9WcLFmaFNY9V4ABZw19j0QGaWyE7+fTtO/WetfZoKyjn9aka4J
         UqXTkWab3Ms+/JYG2HEsNjX+WH0eWFLwftoBB9VNz8TnBURkA/ks/Y/n5cjKYJKcBtFO
         gn+5RSQMilAthRfCF2uhjQUs9am83ODmq8sfzgxO5/Xj3a3eWDyeqBvCLIY5zDaUFwxJ
         jARTkXk7RraKeq+uYILq/1+fnmj+r3XjZzffwirvjRF9x1nTVyMQbBf81AV9Ffr6f7L1
         5wIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E3ucEW9JVDKOsVhC4YaLZU5CxzMs4uGhHNNY7RvULaA=;
        b=NjLWX2s+DrjbrvDXkmmIRL54tzkm8FcYt8o2KjBhqRZIqSj86FrZqAmfai2Iw1kRak
         +ZMsvUxP5lgXO8X8QICXwk+ezEEKrgZbjkfm9tYnEY0r/2OSUvy874EjSpipKF8sbN1J
         AiHjPmweDlaRaHPwkmc4nR+laVdliv/XDfhAWfGXLNeRK37fcXTId4xPpWPq1ghiKHh4
         H+I6b3h65IL0VVTZ76NFq0QiPinNp30sf/Z00ZVby4JtdHdpuSMzf2qai/2IiE4EVzcr
         IPqK9lxcjQjXHfZJRGDpm9SnMoIsGtF23fVMnKE0FC6BcYTsZB0LxEwUrzbQo7+y7mb2
         k8Gg==
X-Gm-Message-State: AOAM533uiqBiGVuapnzxOD4GuaoYieXDi/4mQu3fUXtKVU7jXyKqvbtE
	VYLyeY5v+U9roIWOkMOyOkgLGodq4YloUT+R0YE=
X-Google-Smtp-Source: ABdhPJw+wkYIXlfaOZB0DV0choDm5QGWdnhUHlMOJFBrlTvZXb0zGLZbYErEUC13Fgdd397RNMaUwD12ifx6rVccZg0=
X-Received: by 2002:a50:d751:: with SMTP id i17mr7961891edj.337.1604774943013;
 Sat, 07 Nov 2020 10:49:03 -0800 (PST)
MIME-Version: 1.0
References: <20201107184119.3033956-1-raj.khem@gmail.com>
In-Reply-To: <20201107184119.3033956-1-raj.khem@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 7 Nov 2020 19:48:52 +0100
Message-ID: <CA+chaQemfW9vKrGvzpA1kKpvYhuv_5JqSOKupiT+AHwqwBSHiw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2 1/2] lto: Add global LTO distro policy file
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006c3e8105b388c860"

--0000000000006c3e8105b388c860
Content-Type: text/plain; charset="UTF-8"

Does this actually work (I don't see lto added to OVERRIDES) and why is
this needed?

PACKAGE_DEBUG_SPLIT_STYLE_lto = "debug-without-src"

On Sat, Nov 7, 2020 at 7:41 PM Khem Raj <raj.khem@gmail.com> wrote:

> Distros which want to enable LTO can utilize this file, it only covers
> packages from OE-Core, other layers should include there own exclusion
> list for recipe which dont work with LTO
>
> Document the needed changes in local.conf.extended
>
> debug file generator does  not generate debugsrc packages when lto is
> enabled therefore disable it
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Include feeedback for adding DISTRO_FEATURE knob
>
>  meta/conf/distro/include/lto.inc     | 30 ++++++++++++++++++++++++++++
>  meta/conf/local.conf.sample.extended |  4 ++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/conf/distro/include/lto.inc
>
> diff --git a/meta/conf/distro/include/lto.inc
> b/meta/conf/distro/include/lto.inc
> new file mode 100644
> index 0000000000..1f76ec7c16
> --- /dev/null
> +++ b/meta/conf/distro/include/lto.inc
> @@ -0,0 +1,30 @@
> +# To enable LTO, add following in local.conf
> +# require conf/distro/include/lto.inc
> +# DISTRO_FEATURES_append = " lto"
> +#
> +
> +# Disable LTO for following packages
> +LTO_pn-glibc = ""
> +LTO_pn-gcc-runtime = ""
> +LTO_pn-libgcc-initial = ""
> +LTO_pn-libgcc = ""
> +LTO_pn-libpam = ""
> +LTO_pn-elfutils = ""
> +LTO_pn-perl = ""
> +LTO_pn-busybox = ""
> +LTO_pn-libxcrypt = ""
> +LTO_pn-curl = ""
> +LTO_pn-libcap = ""
> +LTO_pn-libproxy = ""
> +LTO_pn-libbsd = ""
> +
> +# Override it for additional or different options if needed e.g.
> +# with clang thin-lto might be better for compile speed
> +LTO ?= "-flto"
> +
> +SELECTED_OPTIMIZATION_append = "${@bb.utils.contains('DISTRO_FEATURES',
> 'lto', ' ${LTO}', '', d)}"
> +TARGET_LDFLAGS_append_class-target =
> "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
> +
> +SELECTED_OPTIMIZATION[vardeps] += "LTO"
> +
> +PACKAGE_DEBUG_SPLIT_STYLE_lto = "debug-without-src"
> diff --git a/meta/conf/local.conf.sample.extended
> b/meta/conf/local.conf.sample.extended
> index 9aa226a2d0..2c4b8ad8cb 100644
> --- a/meta/conf/local.conf.sample.extended
> +++ b/meta/conf/local.conf.sample.extended
> @@ -417,3 +417,7 @@
>  # ERR_REPORT_UPLOAD_ALL = "1"
>  #
>  # INHERIT += "report-error"
> +
> +# Enable LTO Distro-wide
> +# require conf/distro/include/lto.inc
> +# DISTRO_FEATURES_append = " lto"
> --
> 2.29.2
>
>
> 
>
>

--0000000000006c3e8105b388c860
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Does this actually work (I don&#39;t see lto added to OVER=
RIDES) and why is this needed?<div><br></div><div>PACKAGE_DEBUG_SPLIT_STYLE=
_lto =3D &quot;debug-without-src&quot;<br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 7, 2020 at 7:41=
 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Di=
stros which want to enable LTO can utilize this file, it only covers<br>
packages from OE-Core, other layers should include there own exclusion<br>
list for recipe which dont work with LTO<br>
<br>
Document the needed changes in local.conf.extended<br>
<br>
debug file generator does=C2=A0 not generate debugsrc packages when lto is=
<br>
enabled therefore disable it<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
v2: Include feeedback for adding DISTRO_FEATURE knob<br>
<br>
=C2=A0meta/conf/distro/include/lto.inc=C2=A0 =C2=A0 =C2=A0| 30 +++++++++++=
+++++++++++++++++<br>
=C2=A0meta/conf/local.conf.sample.extended |=C2=A0 4 ++++<br>
=C2=A02 files changed, 34 insertions(+)<br>
=C2=A0create mode 100644 meta/conf/distro/include/lto.inc<br>
<br>
diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/l=
to.inc<br>
new file mode 100644<br>
index 0000000000..1f76ec7c16<br>
--- /dev/null<br>
+++ b/meta/conf/distro/include/lto.inc<br>
@@ -0,0 +1,30 @@<br>
+# To enable LTO, add following in local.conf<br>
+# require conf/distro/include/lto.inc<br>
+# DISTRO_FEATURES_append =3D &quot; lto&quot;<br>
+#<br>
+<br>
+# Disable LTO for following packages<br>
+LTO_pn-glibc =3D &quot;&quot;<br>
+LTO_pn-gcc-runtime =3D &quot;&quot;<br>
+LTO_pn-libgcc-initial =3D &quot;&quot;<br>
+LTO_pn-libgcc =3D &quot;&quot;<br>
+LTO_pn-libpam =3D &quot;&quot;<br>
+LTO_pn-elfutils =3D &quot;&quot;<br>
+LTO_pn-perl =3D &quot;&quot;<br>
+LTO_pn-busybox =3D &quot;&quot;<br>
+LTO_pn-libxcrypt =3D &quot;&quot;<br>
+LTO_pn-curl =3D &quot;&quot;<br>
+LTO_pn-libcap =3D &quot;&quot;<br>
+LTO_pn-libproxy =3D &quot;&quot;<br>
+LTO_pn-libbsd =3D &quot;&quot;<br>
+<br>
+# Override it for additional or different options if needed e.g.<br>
+# with clang thin-lto might be better for compile speed<br>
+LTO ?=3D &quot;-flto&quot;<br>
+<br>
+SELECTED_OPTIMIZATION_append =3D &quot;${@bb.utils.contains(&#39;DISTRO_F=
EATURES&#39;, &#39;lto&#39;, &#39; ${LTO}&#39;, &#39;&#39;, d)}&quot;<br>
+TARGET_LDFLAGS_append_class-target =3D &quot;${@bb.utils.contains(&#39;DI=
STRO_FEATURES&#39;, &#39;lto&#39;, &#39; ${LTO}&#39;, &#39;&#39;, d)}&quot;=
<br>
+<br>
+SELECTED_OPTIMIZATION[vardeps] +=3D &quot;LTO&quot;<br>
+<br>
+PACKAGE_DEBUG_SPLIT_STYLE_lto =3D &quot;debug-without-src&quot;<br>
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.s=
ample.extended<br>
index 9aa226a2d0..2c4b8ad8cb 100644<br>
--- a/meta/conf/local.conf.sample.extended<br>
+++ b/meta/conf/local.conf.sample.extended<br>
@@ -417,3 +417,7 @@<br>
=C2=A0# ERR_REPORT_UPLOAD_ALL =3D &quot;1&quot;<br>
=C2=A0#<br>
=C2=A0# INHERIT +=3D &quot;report-error&quot;<br>
+<br>
+# Enable LTO Distro-wide<br>
+# require conf/distro/include/lto.inc<br>
+# DISTRO_FEATURES_append =3D &quot; lto&quot;<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000006c3e8105b388c860--
