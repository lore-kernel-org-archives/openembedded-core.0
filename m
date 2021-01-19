Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web12.10233.1611056367623050757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 03:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=aAUjIn5r;
 spf=pass (domain: google.com, ip: 209.85.166.49, mailfrom: gmouse@google.com)
Received: by mail-io1-f49.google.com with SMTP id q1so38844949ion.8
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 03:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=LGRf6nQLfpRcvVMkGjBKBt02+SpsiELledLedRQEG30=;
        b=aAUjIn5rU32e2DdFi1XNVh3h8agzpL9rJmjosbdvuWQ/9znBzyNHHVWI3+CmJfa6Gl
         CT1/H0ADLL/P+1Z8OAyXmfhxHZzQo+0Yvkr4jDoPDXRdbnqpGYgKAk3WSWgDtOum35VK
         YuYnXvpAm/QrNuAt9wpVxS+UW0paVU3OpZGM+SKaaxu81eFnCJugvoI8yxuNCQVTI+ip
         hPJ+7Kmi8UwwGAN+Eoen8GXLCvi3llnTtfhfTJEry0vHbXZRWDiarVNCnlLOussy6XeS
         bM2ITDt/9HmBHHIctDk2BihXpkzklZ3oxH+pgwTYg+t7S+uqs6B7WDcZ0jLezOcsxLRl
         Y80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=LGRf6nQLfpRcvVMkGjBKBt02+SpsiELledLedRQEG30=;
        b=IDjSBfWwENtYk909Ukwu2JmPUTmIWg073CT+bUjgxdKLTOvk0YHaVxFqH4N1n1rxpT
         nqzScl8C4KV+rJlLtLtWXpSB4C8Vt67G4Dr7MMWa3GU6sI2dESJF7xTJ8jalSowee0JM
         MYeivqRa9JA5QtsVmSsPE2jOXIyDTBNTZT8wIBEyZjFKqPBVD96FLfkqjQUp3AzXBXkK
         N5i4mhZPhe90zrp4cvvNm5zc0Z0yV4J6njbr1pRb3fgngWKkT+Jga6jkDUAi7hvw30nt
         nW/ciF+x7jBqF4J60K9fzBnR+9RpnK7THVSQcThjVW7HKwAt4cJlTC0cDLi2mHglLIAB
         Q+5A==
X-Gm-Message-State: AOAM530FLutHQbsWKX8YQ5JIGnVSPotJiRiKT2iL6hXKlC5TLbBCZlaK
	WwB9rvY6u6+tQ25XnnZGGNjqW07+RUrEMqUXNpTJYmFnGQxhig==
X-Google-Smtp-Source: ABdhPJyUu9ZgUPYFNaQxzYS5/DSGF7z7n5EM2uyJyjEAlDSvc2J/XEkhx1MzPrYfYo+ztXzJeFCTMVLiUeFzGqRomAU=
X-Received: by 2002:a05:6e02:1b0c:: with SMTP id i12mr1998973ilv.200.1611056366573;
 Tue, 19 Jan 2021 03:39:26 -0800 (PST)
MIME-Version: 1.0
References: <165A723B7A040876.29781@lists.openembedded.org>
In-Reply-To: <165A723B7A040876.29781@lists.openembedded.org>
From: "Anton Kachalov" <rnouse@google.com>
Date: Tue, 19 Jan 2021 12:39:15 +0100
Message-ID: <CADVsX8-aLgbLwqT_zVAh3jBG11KrPMvGKR8Kpi087y75Ao__ow@mail.gmail.com>
Subject: Re: [OE-core] [poky][PATCH] rootfs: add option to allow delayed postinsts on read-only rootfs
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000071bda805b93f4ab2"

--00000000000071bda805b93f4ab2
Content-Type: text/plain; charset="UTF-8"

Ping on the patch

On Fri, 15 Jan 2021 at 16:43, Anton Kachalov via lists.openembedded.org
<rnouse=google.com@lists.openembedded.org> wrote:

> Example use case in OpenBMC: rootfs is squashfs and the system has either
> overlayfs for whole rootfs or for some parts (e.g. /etc).
>
> This option will allow to create migration one-shot postinsts using
> "pkg_postinst_ontarget_${PN}" routines defined in recipes to fix
> files under upper workdir in overlayfs.
>
> Signed-off-by: Anton D. Kachalov <rnouse@google.com>
> ---
>  meta/classes/image.bbclass | 2 +-
>  meta/lib/oe/rootfs.py      | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 045f4494c8..3239d5cf5e 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -33,7 +33,7 @@ INHIBIT_DEFAULT_DEPS = "1"
>  # IMAGE_FEATURES may contain any available package group
>  IMAGE_FEATURES ?= ""
>  IMAGE_FEATURES[type] = "list"
> -IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs
> stateless-rootfs empty-root-password allow-empty-password allow-root-login
> post-install-logging"
> +IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs
> read-only-rootfs-delayed-postinsts stateless-rootfs empty-root-password
> allow-empty-password allow-root-login post-install-logging"
>
>  # Generate companion debugfs?
>  IMAGE_GEN_DEBUGFS ?= "0"
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 4b747dd0f4..249c685dcf 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -217,6 +217,9 @@ class Rootfs(object, metaclass=ABCMeta):
>              self.progress_reporter.next_stage()
>
>          if bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
> +                         True, False, self.d) and \
> +           not bb.utils.contains("IMAGE_FEATURES",
> +                         "read-only-rootfs-delayed-postinsts",
>                           True, False, self.d):
>              delayed_postinsts = self._get_delayed_postinsts()
>              if delayed_postinsts is not None:
> --
> 2.30.0.284.gd98b1dd5eaa7-goog
>
>
> 
>
>

--00000000000071bda805b93f4ab2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping on the patch</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, 15 Jan 2021 at 16:43, Anton Kacha=
lov via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;rnouse=3D<a href=3D"mailto:google.com@lists.openembedded.org">google.=
com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr">Example use case in OpenBMC: roo=
tfs is squashfs and the system has either<br>overlayfs for whole rootfs or =
for some parts (e.g. /etc).<br><br>This option will allow to create migrati=
on one-shot postinsts using<br>&quot;pkg_postinst_ontarget_${PN}&quot; rout=
ines defined in recipes to fix<br>files under upper workdir in overlayfs.<b=
r><br>Signed-off-by: Anton D. Kachalov &lt;<a href=3D"mailto:rnouse@google.=
com" target=3D"_blank">rnouse@google.com</a>&gt;<br>---<br>=C2=A0meta/class=
es/image.bbclass | 2 +-<br>=C2=A0meta/lib/oe/rootfs.py =C2=A0 =C2=A0 =C2=A0=
| 3 +++<br>=C2=A02 files changed, 4 insertions(+), 1 deletion(-)<br><br>dif=
f --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass<br>index =
045f4494c8..3239d5cf5e 100644<br>--- a/meta/classes/image.bbclass<br>+++ b/=
meta/classes/image.bbclass<br>@@ -33,7 +33,7 @@ INHIBIT_DEFAULT_DEPS =3D &q=
uot;1&quot;<br>=C2=A0# IMAGE_FEATURES may contain any available package gro=
up<br>=C2=A0IMAGE_FEATURES ?=3D &quot;&quot;<br>=C2=A0IMAGE_FEATURES[type] =
=
=3D &quot;list&quot;<br>-IMAGE_FEATURES[validitems] +=3D &quot;debug-tweak=
s read-only-rootfs stateless-rootfs empty-root-password allow-empty-passwor=
d allow-root-login post-install-logging&quot;<br>+IMAGE_FEATURES[validitems=
] +=3D &quot;debug-tweaks read-only-rootfs read-only-rootfs-delayed-postins=
ts stateless-rootfs empty-root-password allow-empty-password allow-root-log=
in post-install-logging&quot;<br>=C2=A0<br>=C2=A0# Generate companion debug=
fs?<br>=C2=A0IMAGE_GEN_DEBUGFS ?=3D &quot;0&quot;<br>diff --git a/meta/lib/=
oe/rootfs.py b/meta/lib/oe/rootfs.py<br>index 4b747dd0f4..249c685dcf 100644=
<br>--- a/meta/lib/oe/rootfs.py<br>+++ b/meta/lib/oe/rootfs.py<br>@@ -217,6=
 +217,9 @@ class Rootfs(object, metaclass=3DABCMeta):<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.progress_reporter.next_stage()<br>=C2=
=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.utils.contains(&quot;IMAGE_=
FEATURES&quot;, &quot;read-only-rootfs&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 True, False, s=
elf.d) and \<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 not bb.utils.contains(=
&quot;IMAGE_FEATURES&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;read-only-rootfs-delayed-p=
ostinsts&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 True, False, self.d):<br>=C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0delayed_postinsts =3D self._get_delayed_=
postinsts()<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if delayed_p=
ostinsts is not None:<br>-- <br>2.30.0.284.gd98b1dd5eaa7-goog<br><br></div>
<br>
<br>
<br>
</blockquote></div>

--00000000000071bda805b93f4ab2--
