Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D367C021B2
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 23:38:06 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.57204.1740267482712956578
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Feb 2025 15:38:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LWGX1O0U;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f1e8efef5so1915066f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Feb 2025 15:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1740267481; x=1740872281; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PiRefaCn1ipCoNnIu1UrxAyp/psS1UEr3sbOQJEBTaQ=;
        b=LWGX1O0Ublbnq316w7ZSsT1SEks9NXv7b4iceB/bliU7XqJq5O04Xr1J+mTw7Q1QYA
         uyx1LCnmv9It0M8FKBjRvgDZBIwoT3u5DuhZNlstPmpREKLfmsrmoddqi+cLOrwJWiI4
         Mn8VbHkfiA0bLwbhawP3TNpewHhPWiPHyTMb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740267481; x=1740872281;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PiRefaCn1ipCoNnIu1UrxAyp/psS1UEr3sbOQJEBTaQ=;
        b=ZJr6+C17CoiJxRFAQJ1XncN8D9+mewtqm9YgEhMYpqNwEEkyJzJX6uo6Bvtq89+mQy
         077lhXRAYKfZIj3+g7/PicEVWcp+BRjQSkzXi4aLvBwzCLvsN1yjbwYBMJ/AoExUORYU
         1PAw8Z56FxLA4cQxWolm0UTUxfUgMmxqSdLKG2TzSz9j+i+a0RGHE+XQJF5wYBH19bGV
         vsIsDjZoRQfuLaRVZiVNbmQLHxO1GQxmBUoZog3sWS3u0V2KmQH+enAsI92E7ZXLF25U
         3LfjZE7JhNGAI+6bqjPDYI5Nhj9Dk66uXsRsSr00LZ5D8uiyaRCH/6pt/VPuiUveKEtq
         CDiQ==
X-Gm-Message-State: AOJu0YxktJNRnQYA5h5qlgdq20wkKtkP+Tx8jumskS4lWfpVThLgKeHQ
	omKxlwnOCcST4w7J1p/61vKquq2gZKtTr0tBlT9ny02R4XXBAr8V/ewfVQmP8r2URAT2vh+fqpL
	JkYF5trgrt+B8O/HrgseUZaVY/AAQNo6t8ZCA/g==
X-Gm-Gg: ASbGncv+vg6Df9nmg3vn5UWUXF2rqTxgOAePNbh5auxvdsrwMlKmx8iF9DjY2AFr/s5
	p7QMRmF/Xo8hb4Xzc16g/GCK49I62WJkYKhPcANHRPMhKDv+yAXZhg9aWrLIX7qKfCajR1bC++5
	Dj36vZxs+7TGacmbQH49GLM1anJTrSRXhSXxwgfx2l
X-Google-Smtp-Source: AGHT+IFHiWIQzRD7n55XeIaC9vVeHuBa7Lck33raOfCwL7AA+RzZ6aR0nLqkiFvg5nRbIC9yI300sGxF5+KfsHr5t9Q=
X-Received: by 2002:a5d:47ad:0:b0:38d:a90c:d489 with SMTP id
 ffacd0b85a97d-38f6f0bb640mr7878702f8f.45.1740267480772; Sat, 22 Feb 2025
 15:38:00 -0800 (PST)
MIME-Version: 1.0
References: <20250222125822.385265-1-gavrosc.ref@yahoo.com> <20250222125822.385265-1-gavrosc@yahoo.com>
In-Reply-To: <20250222125822.385265-1-gavrosc@yahoo.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sun, 23 Feb 2025 00:37:34 +0100
X-Gm-Features: AWEUYZkPDXFKvshWByGQJmRwQXFFBfAl75Mx8AwsvGVlAPNc7-QJYziWV230o14
Message-ID: <CAMSfU+7QX_n6+-rYbm9eoLZYA5bbjr7PwAdK=+QkiP2NrX+FPQ@mail.gmail.com>
Subject: Re: [PATCH] oeqa/selftest: add a newline in local.conf (newbuilddir)
To: Christos Gavros <gavrosc@yahoo.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000019171062ec39909"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Feb 2025 23:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211822

--000000000000019171062ec39909
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le sam. 22 f=C3=A9vr. 2025 =C3=A0 13:59, Christos Gavros <gavrosc@yahoo.com=
> a =C3=A9crit :

> If the build-st/conf/local.conf does not end with a newline
> when is generated then add one
> Fixes [YOCTO #15734]
>
> CC: Yoann Congal <yoann.congal@smile.fr>
> CC: Randy MacLeod <randy.macleod@windriver.com>
> Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> ---
>

Thanks for looking into this!


>  meta/lib/oeqa/selftest/context.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/context.py
> b/meta/lib/oeqa/selftest/context.py
> index 5eb4cc44fd..986fe8e1db 100644
> --- a/meta/lib/oeqa/selftest/context.py
> +++ b/meta/lib/oeqa/selftest/context.py
> @@ -102,6 +102,16 @@ class OESelftestTestContext(OETestContext):
>          oe.path.copytree(builddir + "/cache", newbuilddir + "/cache")
>          oe.path.copytree(selftestdir, newselftestdir)
>
> +        # if the last line of local.conf in newbuilddir is not empty or
> does not end with newline then add one
>
That comment should read  "... is not empty AND does not end with
newline..." ?

+        localconf_path =3D newbuilddir + "/conf/local.conf"
> +        last_line =3D ""
> +        with open(localconf_path, "r", encoding=3D"utf-8") as f:
> +            for line in f:
> +                last_line =3D line
> +
> +        if last_line !=3D "" and not last_line.endswith("\n"):
> +            subprocess.check_output("echo >> %s/conf/local.conf" %
> newbuilddir, cwd=3Dnewbuilddir, shell=3DTrue)
>

I'm no Python expert but I would simplify by writing the "\n" directly from
Python with something like (using the "update" mode "r+"):

with open(localconf_path, "r+", encoding=3D"utf-8") as f:
    last_line=3DNone
    for line in f:
        last_line =3D line
    if last_line and not last_line.endswith("\n"):
        f.write("\n")

Also, I find using None instead of "" better to mean "missing value"

> +
>          subprocess.check_output("git init && git add * && git commit -a
> -m 'initial'", cwd=3Dnewselftestdir, shell=3DTrue)
>
>          # Tried to used bitbake-layers add/remove but it requires recipe
> parsing and hence is too slow
> --
> 2.34.1
>
>
Regards,
--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000019171062ec39909
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 22 f=C3=A9vr=
. 2025 =C3=A0=C2=A013:59, Christos Gavros &lt;<a href=3D"mailto:gavrosc@yah=
oo.com">gavrosc@yahoo.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">If the build-st/conf/local.conf does =
not end with a newline<br>
when is generated then add one<br>
Fixes [YOCTO #15734]<br>
<br>
CC: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_bl=
ank">yoann.congal@smile.fr</a>&gt;<br>
CC: Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com" target=
=3D"_blank">randy.macleod@windriver.com</a>&gt;<br>
Signed-off-by: Christos Gavros &lt;<a href=3D"mailto:gavrosc@yahoo.com" tar=
get=3D"_blank">gavrosc@yahoo.com</a>&gt;<br>
---<br></blockquote><div><br></div><div>Thanks for looking into this!</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0meta/lib/oeqa/selftest/context.py | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/con=
text.py<br>
index 5eb4cc44fd..986fe8e1db 100644<br>
--- a/meta/lib/oeqa/selftest/context.py<br>
+++ b/meta/lib/oeqa/selftest/context.py<br>
@@ -102,6 +102,16 @@ class OESelftestTestContext(OETestContext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe.path.copytree(builddir + &quot;/cache&=
quot;, newbuilddir + &quot;/cache&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe.path.copytree(selftestdir, newselftest=
dir)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # if the last line of local.conf in newbuilddi=
r is not empty or does not end with newline then add one<br></blockquote><d=
iv>That comment should read=C2=A0 &quot;... is not empty AND does not end w=
ith newline...&quot; ?</div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 localconf_path =3D newbuilddir + &quot;/conf/l=
ocal.conf&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 last_line =3D &quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(localconf_path, &quot;r&quot;, encod=
ing=3D&quot;utf-8&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 last_line =3D line=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if last_line !=3D &quot;&quot; and not last_li=
ne.endswith(&quot;\n&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_output(&quot;ec=
ho &gt;&gt; %s/conf/local.conf&quot; % newbuilddir, cwd=3Dnewbuilddir, shel=
l=3DTrue)<br></blockquote><div><br></div><div>I&#39;m no Python expert but =
I would simplify by writing the &quot;\n&quot; directly from Python with so=
mething like (using the &quot;update&quot; mode &quot;r+&quot;):</div><div>=
<br></div><div>with open(localconf_path, &quot;r+&quot;, encoding=3D&quot;u=
tf-8&quot;) as f:<br></div><div>=C2=A0 =C2=A0 last_line=3DNone</div><div>=
=C2=A0=C2=A0=C2=A0 for line in f:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 last_line =
=3D line</div><div>=C2=A0=C2=A0=C2=A0 if last_line and not last_line.endswi=
th(&quot;\n&quot;):<br>=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 f.write(&quot;=
\n&quot;)</div><div><br></div><div>Also, I find using None instead of &quot=
;&quot; better to mean &quot;missing value&quot;</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check_output(&quot;git init &a=
mp;&amp; git add * &amp;&amp; git commit -a -m &#39;initial&#39;&quot;, cwd=
=3Dnewselftestdir, shell=3DTrue)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Tried to used bitbake-layers add/remove=
 but it requires recipe parsing and hence is too slow<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><div><br clear=3D"all"></div>Regards,<div><span class=3D=
"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font>=
<div><font face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></di=
v></div></div></div></div>

--000000000000019171062ec39909--

