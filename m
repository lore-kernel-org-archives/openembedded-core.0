Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web08.32061.1609074520280816046
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Dec 2020 05:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s+QjdvTz;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id z16so4332451vsp.5
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Dec 2020 05:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nNrCl6hyRDgayNS/7EhyVXV1PA9KKF8jVkjaUGn8v2g=;
        b=s+QjdvTzJ4DN8Qpz2W/cdhkcBYslkMflo6eASTknzGXIwgbFMrnRg6x/v+CEE3SlAo
         cScoKWq/HwVHmnWbZ2qxwb0FX9XwiCRFfmgjX2A+NS66Gqw3LM2x2gmc6Sbk/SiHReEa
         vOBP+o4oefoCbqkf3Hp+KZrhyw2b+ishGmQg/DYWGZYVTFIoDbxOT1l5jm+aSAHdPfK+
         d1s2npU7X+jTHhaUZuGuJBkPHiUXyBTFVg6w/WnoIXX1APIBhOZXKLv7UXmW2u4SB8KV
         CganxMq/K5m3+iYTGAWHqNoHjkehkHosIYZUUvA8B0/oT74NR/Fi9c0bOlu7udQkGK2E
         NH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nNrCl6hyRDgayNS/7EhyVXV1PA9KKF8jVkjaUGn8v2g=;
        b=qRbAa9eMyuE8fooPbC03YA87ddNj14m/Jp/xFUkN7yt2HeQch+d59QPPTIfYmGB8td
         5uH1vqE5TDDQ8Fxi0rNvw0I2H5M9VBPwWCOzCfJw/tg1S+yAHAmGJu06xn4ilNGeo/1n
         uXZG7cc15Qtji3vryf3Lyp4Ipvsyw0J+rpfrsEjveIW+YCWV6xpRxMdHPS0EUGllnygx
         gzlyD/0SPVMarpz4uuoFAlyvoGEvgYI31E3/g4inGmmJC+oAL7p0K575Btn8teocthJ/
         bv0wgNTRNwUYjPbcjv/LrQ6CEpdW4RtFkkbwyRSs10X1U9Als/62hTkvSQ3hY1wdU7zc
         GSWw==
X-Gm-Message-State: AOAM5306DPnw+X7GvlUojMSmqKWIu9G+5QbCtMIITV4bhnHU/HXpNFYH
	GNdHGYlGhSYWiBcAF+TrwHwwPEffBL4wI4MRAQY=
X-Google-Smtp-Source: ABdhPJwS8yCDWhpydxDIh3WMb679P7fuwLfUlqZSzemBh1JDrBQhwlcIxmrIKkcrCtItYGyVIzGLhh0Yjzc+WQdXx6U=
X-Received: by 2002:a67:c89e:: with SMTP id v30mr25266293vsk.54.1609074519419;
 Sun, 27 Dec 2020 05:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20201227120952.139650-1-richard.purdie@linuxfoundation.org> <20201227120952.139650-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20201227120952.139650-2-richard.purdie@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 27 Dec 2020 14:08:28 +0100
Message-ID: <CANNYZj8Ag7L1k-ZMpnKefTcHA9Lf0q=O=Ek_XqSxOPfWQEzXYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] selftest/reproducible: Add useradd-staticids to reproducible builds tests
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000025ada605b771dbd2"

--00000000000025ada605b771dbd2
Content-Type: text/plain; charset="UTF-8"

I wonder if this also addresses some of the existing entries on the
exception list?

Alex

On Sun 27. Dec 2020 at 13.10, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Its surprising we've made it this far without this, add in some specific
> uid/gid settings to ensure these don't cause false positives to the tests.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py
> b/meta/lib/oeqa/selftest/cases/reproducible.py
> index e3597d5081a..eee494e5cc8 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -249,6 +249,10 @@ class ReproducibleTests(OESelftestTestCase):
>              TMPDIR = "{tmpdir}"
>              LICENSE_FLAGS_WHITELIST = "commercial"
>              DISTRO_FEATURES_append = ' systemd pam'
> +            USERADDEXTENSION = "useradd-staticids"
> +            USERADD_ERROR_DYNAMIC = "skip"
> +            USERADD_UID_TABLES += "files/static-passwd"
> +            USERADD_GID_TABLES += "files/static-group"
>              ''').format(package_classes=' '.join('package_%s' % c for c
> in self.package_classes),
>                          tmpdir=tmpdir)
>
> --
> 2.27.0
>
>
> 
>
>

--00000000000025ada605b771dbd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I wonder if this also addresses some of the existing entr=
ies on the exception list?</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Sun 27. Dec 2020 at 13.10, Richard Purdie &lt;<a href=3D"mai=
lto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)">Its surprising we&#39;ve made it t=
his far without this, add in some specific<br>
uid/gid settings to ensure these don&#39;t cause false positives to the te=
sts.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/reproducible.py | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/=
selftest/cases/reproducible.py<br>
index e3597d5081a..eee494e5cc8 100644<br>
--- a/meta/lib/oeqa/selftest/cases/reproducible.py<br>
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py<br>
@@ -249,6 +249,10 @@ class ReproducibleTests(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TMPDIR =3D &quot;{tmpdir}&=
quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSE_FLAGS_WHITELIST =
=3D &quot;commercial&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DISTRO_FEATURES_append =3D=
 &#39; systemd pam&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 USERADDEXTENSION =3D &quot;user=
add-staticids&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 USERADD_ERROR_DYNAMIC =3D &quot=
;skip&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 USERADD_UID_TABLES +=3D &quot;f=
iles/static-passwd&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 USERADD_GID_TABLES +=3D &quot;f=
iles/static-group&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#39;&#39;).format(pa=
ckage_classes=3D&#39; &#39;.join(&#39;package_%s&#39; % c for c in self.pac=
kage_classes),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0tmpdir=3Dtmpdir)<br>
<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000025ada605b771dbd2--
