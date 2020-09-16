Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.663.1600270251190589101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 08:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S/a/56PC;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: kergoth@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id p9so10941124ejf.6
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D9eaPvk16IiMY2KsMp6o2mx8wv4QdyqEIfJK8rboBZQ=;
        b=S/a/56PC3olCq+A4J0NQyFICNSj8WnhLY8V3PleFBziWDeP+In0I17PLsGrUYBXOPX
         ARrVpVlzR4zZTg5Zzqq8xfu7Xz3OrhfM1k+iBRx/AMXbOiwDRI7swPEGnqAEfo7Dj+r1
         Sa2MeecJXoSX4N/48PrUjyj12hUucVfjGO00fAnWQSNu6u0zP7quiPKnuTS/ChvXCOED
         hcXjjw/VO5J2T/K5f/vVWx7Qe93YOIzGaXv14ZNO8oQI5GBwe3lfkxwPW7OiNgm3sTGU
         usH5CiA5Bio8HJxJL/m7gPsN8y/+CJlmXuLNolFPuiXBBEjJvUyrf5EYxTrFGpZ04bqM
         TRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D9eaPvk16IiMY2KsMp6o2mx8wv4QdyqEIfJK8rboBZQ=;
        b=c7Pzt2dPoIetLd9ln0eL9d3nG3aBEc8BDnwG9WhOWTwQRn608GQFldozPx/PQaoNb3
         Qbg3OTe6GcCTkRA95fvaIUQttyEZsGHaYXzg/QyZpPNzfnxG6iNBwkmWva2amIvzv9tC
         qXEphuq5vYeT/qEHoEZ9RRyUYsizM7BV4ozr36V88llHJG7o/8Fso7yH7VTabZiDstKZ
         ykavqWseSGiBeMrLv2abFiyiJOcrC+qJtwlrMZay/+bWzzQCk35a6EwjM+jikqzr7cv8
         MrJUAhJj8EQeo/3gPZansDkboQPmwdL5kfIoY9ciNbuH9x2PuyB/K18l5M6F5+f0jB33
         Sq+w==
X-Gm-Message-State: AOAM53392jYxHFThRECHT6wQs/rncwhUgwKCw4/bFVbkN7xzOGRobZIt
	h/TgM9bHvYedM0NckyYlaqbKQLZQV65EkwDNIE0=
X-Google-Smtp-Source: ABdhPJxAdKEJGuANMl74YIDgNHKwg4GUhdt5upDS5l1eKmpFH7ITFRq8agy/f7/95qgfQeImwtg7+vHtT52KYOv9TCw=
X-Received: by 2002:a17:907:70cb:: with SMTP id yk11mr25626745ejb.312.1600270249553;
 Wed, 16 Sep 2020 08:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAGFuAuz+8M62V2qkc5HutJZDDLXxacF2ajr-4wuZaOKqZ1i-nw@mail.gmail.com>
In-Reply-To: <CAGFuAuz+8M62V2qkc5HutJZDDLXxacF2ajr-4wuZaOKqZ1i-nw@mail.gmail.com>
From: "Christopher Larson" <kergoth@gmail.com>
Date: Wed, 16 Sep 2020 08:30:38 -0700
Message-ID: <CABcZAN=LCFfzCi=RVqggOno1sxcsC=F9SEj2hDL7MQHu=SM=yQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe-setup-builddir: create conf/multiconfig/ from TEMPLATECONF
To: gr embeter <grembeter@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c4f33a05af6ff3e6"

--000000000000c4f33a05af6ff3e6
Content-Type: text/plain; charset="UTF-8"

Why copy this from TEMPLATECONF when they can be supplied by any layer in
your BBLAYERS?

On Wed, Sep 16, 2020 at 8:10 AM gr embeter <grembeter@gmail.com> wrote:

> Retrieve multiconfig automatically from meta-layer if it exists,
> so that it is possible to use it "out-of-the-box".
>
> Signed-off-by: Grygorii Tertychnyi <
> grygorii.tertychnyi@leica-geosystems.com>
> ---
>  scripts/oe-setup-builddir | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index 30eaa8efbe1f..0077c13110b9 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -65,6 +65,7 @@ if [ -n "$TEMPLATECONF" ]; then
>      OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
>      OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
>      OECORENOTESCONF="$TEMPLATECONF/conf-notes.txt"
> +    OECOREMULTICONF="$TEMPLATECONF/multiconfig"
>  fi
>
>  unset SHOWYPDOC
> @@ -80,6 +81,9 @@ for more information as common configuration options
> are commented.
>
>  EOM
>      cp -f $OECORELOCALCONF "$BUILDDIR/conf/local.conf"
> +    if [ -d "$OECOREMULTICONF" ]; then
> +        cp -af -t "$BUILDDIR/conf" "$OECOREMULTICONF"
> +    fi
>      SHOWYPDOC=yes
>  fi
>
> --
> 2.25.1
>
> 
>
>

-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000c4f33a05af6ff3e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why copy this from TEMPLATECONF when they can be supplied =
by any layer in your BBLAYERS?</div><br><div class=3D"gmail_quote"><div dir=
=
=3D"ltr" class=3D"gmail_attr">On Wed, Sep 16, 2020 at 8:10 AM gr embeter &=
lt;<a href=3D"mailto:grembeter@gmail.com">grembeter@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Retrieve multi=
config automatically from meta-layer if it exists,<br>
so that it is possible to use it &quot;out-of-the-box&quot;.<br>
<br>
Signed-off-by: Grygorii Tertychnyi &lt;<a href=3D"mailto:grygorii.tertychn=
yi@leica-geosystems.com" target=3D"_blank">grygorii.tertychnyi@leica-geosys=
tems.com</a>&gt;<br>
---<br>
=C2=A0scripts/oe-setup-builddir | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir<br>
index 30eaa8efbe1f..0077c13110b9 100755<br>
--- a/scripts/oe-setup-builddir<br>
+++ b/scripts/oe-setup-builddir<br>
@@ -65,6 +65,7 @@ if [ -n &quot;$TEMPLATECONF&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0OECORELAYERCONF=3D&quot;$TEMPLATECONF/bblayers.conf.sa=
mple&quot;<br>
=C2=A0 =C2=A0 =C2=A0OECORELOCALCONF=3D&quot;$TEMPLATECONF/local.conf.sampl=
e&quot;<br>
=C2=A0 =C2=A0 =C2=A0OECORENOTESCONF=3D&quot;$TEMPLATECONF/conf-notes.txt&q=
uot;<br>
+=C2=A0 =C2=A0 OECOREMULTICONF=3D&quot;$TEMPLATECONF/multiconfig&quot;<br>
=C2=A0fi<br>
<br>
=C2=A0unset SHOWYPDOC<br>
@@ -80,6 +81,9 @@ for more information as common configuration options<br>
are commented.<br>
<br>
=C2=A0EOM<br>
=C2=A0 =C2=A0 =C2=A0cp -f $OECORELOCALCONF &quot;$BUILDDIR/conf/local.conf=
&quot;<br>
+=C2=A0 =C2=A0 if [ -d &quot;$OECOREMULTICONF&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -af -t &quot;$BUILDDIR/conf&quot; &quot;$O=
ECOREMULTICONF&quot;<br>
+=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0SHOWYPDOC=3Dyes<br>
=C2=A0fi<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christop=
her Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></=
div>

--000000000000c4f33a05af6ff3e6--
