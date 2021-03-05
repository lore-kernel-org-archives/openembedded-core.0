Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web10.10053.1614939815015018146
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 02:23:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BTIfGX88;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id s7so601738uag.7
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 02:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fmv6kykcbqcwR1hYRLqzoYWiKWb47UvfNT7Awo0H0O8=;
        b=BTIfGX88ZY8eZfHRdRGFwrZJDX73VJHdgnHV6njDTD/WxaW40MGOXyDcS6uFtGqEwH
         fTvWZEoO9trw4kvXeGpGj1i/W0yDXyQMEsbCkkXyxM3ccMPuLxzvK/7gbmKizeTY02gM
         tICOzrRXN8p+6xmragU6nnLhOf1IhHPJ6yLCbSJdT27Yd7hlH+ZDUsWvm3iDZy2ENMc5
         w6osrO9VCycSE55M0QG1qEIv6XonBrH5Wj2Fm/gX0etDaszf/wojGKj0QtT/Nh9Elezk
         KSF84sSP5+93r7ffxdTt8MSKuZpZj8NmQZnDXW+MxlCUuNKeUG6FY7ja5gCCb4MjgFTm
         +ZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fmv6kykcbqcwR1hYRLqzoYWiKWb47UvfNT7Awo0H0O8=;
        b=tx302tObRyVXUDb4tYDM6XkCioFCvqSWxqEZM1o2I5KoObnfblhppajiRhIi7EYrht
         se29H/hL5eBM7fdxvGr1UDum8asNCKxr80zOgixoUHpp1MOH8kVWWQN3xKSoHOTMnyrY
         TO7P2D/jjPfDxXmloGhzQwmlFDHBUi8pGSEd8FFdNtBQAgZjGdV6xY3Y6r8Uo2EfVdwL
         AN0Byc1V+RGxfXRVkxuv7/UBpYQxiNt8jwMcIhVCace0cKS/NQhq110yRHH0cyWRva9L
         kjvkhXvCc5zGOkt7towxIDYqxw7plgNCVefVL4gNgM3GA5zA+nWMTXmBXsAJoYd9UcJR
         e1sA==
X-Gm-Message-State: AOAM531XZ7j3SC6r9wVF3yYDa+S4ztZEK7O/xQhgY9Tlp5hSrJwTNQ0F
	MDfP5Dg1kvb7o0483QaqdJlxRnaoPEduFZF9GPo=
X-Google-Smtp-Source: ABdhPJxUZcgs4ARjFgQUj/RhKOGZlXEkt57eS+YhHuIdTRnv+QLnT/fjrQ0cI8UtJZbbTGpCF/+SDsoYElo3ePhl/t0=
X-Received: by 2002:ab0:29d2:: with SMTP id i18mr5330448uaq.71.1614939814104;
 Fri, 05 Mar 2021 02:23:34 -0800 (PST)
MIME-Version: 1.0
References: <20210304233526.3373832-1-andrei@gherzan.com>
In-Reply-To: <20210304233526.3373832-1-andrei@gherzan.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 5 Mar 2021 11:23:22 +0100
Message-ID: <CANNYZj-+T3kSDRQQ-qKiXf3XG-ifJod5UYjJnYwa2V_d5Tyxag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] gcr: Add support for building without x11
To: Andrei Gherzan <andrei@gherzan.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: multipart/alternative; boundary="000000000000f4103505bcc779e8"

--000000000000f4103505bcc779e8
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Mar 2021 at 00:36, Andrei Gherzan <andrei@gherzan.com> wrote:

>  GNOMEBASEBUILDCLASS = "meson"
>  GTKDOC_MESON_OPTION = "gtk_doc"
>  inherit gnomebase gtk-icon-cache gtk-doc features_check
> upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
> -# depends on gtk+3, but also x11 through gtk+-x11
> -REQUIRED_DISTRO_FEATURES = "x11"
>
>  SRC_URI[archive.sha256sum] =
> "17fcaf9c4a93a65fb1c72b82643bb102c13344084687d5886ea66313868d9ec9"
>
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+',
> '', d)}"
> +PACKAGECONFIG[gtk+] = ",--without-gtk,gtk+3"
>

This does not look like a meson option, and needs a on-setting as well.
Please test the new options both ways.

Alex

--000000000000f4103505bcc779e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 5 Mar 2021 at 00:36, Andrei Gherzan &lt;<a href=3D"mailto:an=
drei@gherzan.com">andrei@gherzan.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">=C2=A0GNOMEBASEBUILDCLASS =3D &quot;mes=
on&quot;<br>
=C2=A0GTKDOC_MESON_OPTION =3D &quot;gtk_doc&quot;<br>
=C2=A0inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-vers=
ion-is-even vala gobject-introspection gettext mime mime-xdg<br>
-# depends on gtk+3, but also x11 through gtk+-x11<br>
-REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
<br>
=C2=A0SRC_URI[archive.sha256sum] =3D &quot;17fcaf9c4a93a65fb1c72b82643bb102=
c13344084687d5886ea66313868d9ec9&quot;<br>
<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, =
&#39;x11&#39;, &#39;gtk+&#39;, &#39;&#39;, d)}&quot;<br>
+PACKAGECONFIG[gtk+] =3D &quot;,--without-gtk,gtk+3&quot;<br></blockquote><=
div><br></div><div>This does not look like a meson option, and needs a on-s=
etting as well. Please test the new options both ways.<br></div><div><br></=
div><div>Alex<br></div></div></div>

--000000000000f4103505bcc779e8--
