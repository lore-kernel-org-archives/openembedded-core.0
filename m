Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web08.9860.1616401900554836882
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 01:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ds4iIIC8;
 spf=pass (domain: gmail.com, ip: 209.85.221.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id d2so3608562vke.5
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 01:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mKqxaqxTHc+04RwqP5cdCXel1ypDhY4TuGbMLaB7ov0=;
        b=Ds4iIIC85L/Mj4FTFsVqekwGdSKrlcrNrEwpi8j6qOlw+i6ebnILsg6VFXYGQEWLKi
         Y9bbQLF9ADUSGAxOcnsVepq5QwBeGK859aZa+eEcs6E5Wo5wpgHXGmyKxU6QVoqNk033
         qeRWWJG+HqdmJBg0hGA+7zfDxu2Tp2CywIoqbEpbGMOXHhhZtYaTSegDlnjDphSJjXMs
         bIWxotAI9EPmJUrYbUAlQIkYk8RDFrnQ6tD5sPfze5GUzqXJ6biMqBiiOMQ64AdkIQZb
         tolWdRktUNJ44IMKKenBnl0mvmKByH5/tmTgkaoBeXKKuLcPo0GgYqKj5AwUTDy1ZUXg
         82UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mKqxaqxTHc+04RwqP5cdCXel1ypDhY4TuGbMLaB7ov0=;
        b=YOV2J/Z7dJ4Xog9LOBYp2fyWGThmx/0v/hAUzIlz0y3feK4EBnsGU5dzoCHe19gRNn
         HSkt49e2n2ZVVJl7NaeHipiNI8Nx3kuz9zgIvXAwtAUxGUdfIgYi1bBIal3SrhahiU2E
         qphONeAAkUqjAgBWb0V3VFUQaGVBHHght05KW7z9gXR9RjtZ/bG9F55Q0GsxJvvaxxYS
         +IPItqg4wGcC1hYJZmak14C359mGkI+UtCwiWTxaSgL2jSiG5Psn/8EXIJReAvDpIdiM
         q9Yjp//PwBJ3Se4yqkV1WFCxrXR1+TwunnkAQQdES5xhK4Y5+qzIfNHbiKTZy5zhpiH/
         kGfA==
X-Gm-Message-State: AOAM5307x/LvYN7/+8g1bKKDtXUrOllLpnVPXAjLgX7GRF5AcNvAvIRV
	CVJD3+AFvUWU6PmX02rMWPnLLyDjpzqPsRZJIOA=
X-Google-Smtp-Source: ABdhPJwTIyXJiwDXdJ+uqjigsL2NlL63CYcTVN/ZAkByh1HpAKBT7b/OdUXU8WqThA3QuBC7o0CQsomPLFcudG7XI/Q=
X-Received: by 2002:a1f:8fd1:: with SMTP id r200mr6407751vkd.10.1616401899675;
 Mon, 22 Mar 2021 01:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210322070718.20753-1-awais_belal@mentor.com>
In-Reply-To: <20210322070718.20753-1-awais_belal@mentor.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 22 Mar 2021 11:31:29 +0300
Message-ID: <CANNYZj-+6z3RJQR2eo2_zj9HExHhtGx=oZRa+aLK4mBD-gAV0g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs.py: mask run-postinsts systemd service when unneeded
To: Awais Belal <Awais_Belal@mentor.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000b643c05be1be54d"

--0000000000000b643c05be1be54d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why isn=E2=80=99t this seen in the tests? Can you add a test that shows the=
 issue
please? (Fails without the patch, passes with)

Alex

On Mon 22. Mar 2021 at 10.07, Awais Belal <Awais_Belal@mentor.com> wrote:

> The service is unnecessarily run even when it is unneeded.
> This was handled correctly for sysV systems however the
> service still runs on the systemd systems as it is not
> disabled/masked when not needed.
>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  meta/lib/oe/rootfs.py | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 249c685dcf..a29d1f6742 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -257,6 +257,10 @@ class Rootfs(object, metaclass=3DABCMeta):
>                  self._exec_shell_cmd(["update-rc.d", "-f", "-r",
>                                        self.d.getVar('IMAGE_ROOTFS'),
>                                        "run-postinsts", "remove"])
> +            if
> os.path.exists(self.d.expand("${IMAGE_ROOTFS}${systemd_unitdir}/system/r=
un-postinsts.service")):
> +                self._exec_shell_cmd(["systemctl",
> +                                        "--root",
> self.d.getVar('IMAGE_ROOTFS'),
> +                                        "mask", "run-postinsts"])
>
>          image_rorfs =3D bb.utils.contains("IMAGE_FEATURES",
> "read-only-rootfs",
>                                          True, False, self.d)
> --
> 2.17.1
>
>
>=20
>
>

--0000000000000b643c05be1be54d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Why isn=E2=80=99t this seen in the tests? Can you add a t=
est that shows the issue please? (Fails without the patch, passes with)</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 22. Mar 202=
1 at 10.07, Awais Belal &lt;<a href=3D"mailto:Awais_Belal@mentor.com">Awais=
_Belal@mentor.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;padding-left:1ex;border-left-color:rgb(204,204,204)">The service is u=
nnecessarily run even when it is unneeded.<br>
This was handled correctly for sysV systems however the<br>
service still runs on the systemd systems as it is not<br>
disabled/masked when not needed.<br>
<br>
Signed-off-by: Awais Belal &lt;<a href=3D"mailto:awais_belal@mentor.com" t=
arget=3D"_blank">awais_belal@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/rootfs.py | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py<br>
index 249c685dcf..a29d1f6742 100644<br>
--- a/meta/lib/oe/rootfs.py<br>
+++ b/meta/lib/oe/rootfs.py<br>
@@ -257,6 +257,10 @@ class Rootfs(object, metaclass=3DABCMeta):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._exec_s=
hell_cmd([&quot;update-rc.d&quot;, &quot;-f&quot;, &quot;-r&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.d.g=
etVar(&#39;IMAGE_ROOTFS&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ru=
n-postinsts&quot;, &quot;remove&quot;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(self.d.expand=
(&quot;${IMAGE_ROOTFS}${systemd_unitdir}/system/run-postinsts.service&quot;=
)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._exec_shell_=
cmd([&quot;systemctl&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-=
-root&quot;, self.d.getVar(&#39;IMAGE_ROOTFS&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;m=
ask&quot;, &quot;run-postinsts&quot;])<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image_rorfs =3D bb.utils.contains(&quot;=
IMAGE_FEATURES&quot;, &quot;read-only-rootfs&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0T=
rue, False, self.d)<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000000b643c05be1be54d--
