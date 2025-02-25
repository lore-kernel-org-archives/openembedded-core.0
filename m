Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0595C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 10:22:00 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.5128.1740478915716710710
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 02:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3ZCOFuR6;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f2f783e4dso4614836f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 02:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1740478914; x=1741083714; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ieQEVVA4ZmNfQgstSXaN0vwEh7qmYJ2ceq2erqytYh8=;
        b=3ZCOFuR6z8aK5gfvSMkmvh/hPRy8/Ol1NRNmto+rStZvaHlCE95MeQJvECL4127sCL
         Pr0zaG1Iw5fmLBZ3YZc2Tii9pSKidctFH3rq1iSI3QxGaGz2UnsNkn0+oRuKAtJ7JOm5
         o4j4M3SrwktufM57uqBPsT7kMvdqgHfW1Q9KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478914; x=1741083714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieQEVVA4ZmNfQgstSXaN0vwEh7qmYJ2ceq2erqytYh8=;
        b=ucUFLFj7xy8GLqC1D6dHoqHfKLXNFndAo/aeX80CUPbM22N4KiLxkAUcy1lIdLIk2W
         EySe/DS/wqLmSb257Ww8NuPuuyD31m+YM1WiFJuEPJfkCFABvJiddAVQyE3l6j7GZiv8
         iUlaNTJU5qb9/wVjzYW06CD2r5LEXJC6rafHqMKCrBuzK9ONANPA0Ph2BNHyxwM8VdNa
         8hunh0f82xIXB7DQR0eUQszFZFIbxMRKoP65J1PB5dVvIk3PdR2UjSKjyP2E2JOZ13f4
         0VyzFSUGXZa2MvldxF3Ninz8Y92yEG58OIH4LzGqtWr7LAhYHSsFM9odQeR58HJ0kK6m
         AHzw==
X-Gm-Message-State: AOJu0YyyKcWQyD5TbcMDPup+1Q2jN0FsdN5oLGDnCYj/SUVre2+VfaK7
	n1RniJPf5//iGxMvOguqQfRLNNkorDz5P6e7uQNg8EDw12uGbEPmBsCw8G1MVbe1HVPV/ubzoMs
	y3BHw4Y9dXinpE4VBn8WKU66NeyEkVpmup0s13A==
X-Gm-Gg: ASbGncsJq50+FVLcBNxVbDyDG8drFx43y2wYHTQodMsz7TNLhx/eoXHcK3lr17kr8PQ
	3x/EyUAn4KJVv27XzMvJswnrq8XybBsnEoCrRuy1ZqGAXfi+3NBR/zRkUOuR3dkVKYYpA4hlR8T
	hsCQZPq37L1g==
X-Google-Smtp-Source: AGHT+IGYhXP9e0IDpgPiyReSwTkZZzkyqsNcOHmsdWPZIuxNWhBeGUo6ivfdtsFvNynjExPS6BjNARvx+dYKZRVKYqg=
X-Received: by 2002:a05:6000:186f:b0:38f:4f3c:e4f1 with SMTP id
 ffacd0b85a97d-38f6f0bc623mr14286026f8f.46.1740478913827; Tue, 25 Feb 2025
 02:21:53 -0800 (PST)
MIME-Version: 1.0
References: <20250225095755.12352-1-gavrosc.ref@yahoo.com> <20250225095755.12352-1-gavrosc@yahoo.com>
In-Reply-To: <20250225095755.12352-1-gavrosc@yahoo.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 25 Feb 2025 11:21:27 +0100
X-Gm-Features: AQ5f1JroLRIHasPFg_pdrVRUGn8ZH0D97gkSgbwuWCUyoSfQPI6MqU4fqjP0kzA
Message-ID: <CAMSfU+5ZksWM8oy6-=fpJ5CsR6A5XwtxRtxZM+nHFPuOzSwikQ@mail.gmail.com>
Subject: Re: [PATCH v2] oeqa/selftest: add a newline in local.conf (newbuilddir)
To: Christos Gavros <gavrosc@yahoo.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000065f37c062ef4d349"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 10:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211870

--00000000000065f37c062ef4d349
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Chistos,

Le mar. 25 f=C3=A9vr. 2025 =C3=A0 10:58, Christos Gavros <gavrosc@yahoo.com=
> a =C3=A9crit :

> If the build-st/conf/local.conf does not end with a newline
> when is generated then add one
> Fixes [YOCTO #15734]
>
> CC: Randy MacLeod <randy.macleod@windriver.com>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
>
FYI, you can't add a Reviewed-by from someone without an explicit email
(Often stating the full line "Reviewed-by: Xxx Yyy <...@...>").
On your v1, I merely commented, that is not sufficient for adding my
reviewed-by.

Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> ---
> v1->v2
> * the comment is changed
> * last_line is initialized to "None"
> * add a new line by using f.write("\n")
> ---
>  meta/lib/oeqa/selftest/context.py | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/context.py
> b/meta/lib/oeqa/selftest/context.py
> index 5eb4cc44fd..9145cbd72b 100644
> --- a/meta/lib/oeqa/selftest/context.py
> +++ b/meta/lib/oeqa/selftest/context.py
> @@ -102,6 +102,15 @@ class OESelftestTestContext(OETestContext):
>          oe.path.copytree(builddir + "/cache", newbuilddir + "/cache")
>          oe.path.copytree(selftestdir, newselftestdir)
>
> +        # if the last line of local.conf in newbuilddir is not empty and
> does not end with newline then add one
> +        localconf_path =3D newbuilddir + "/conf/local.conf"
> +        with open(localconf_path, "r+", encoding=3D"utf-8") as f:
> +            last_line =3D None
> +            for line in f:
> +                last_line =3D line
> +            if last_line and not last_line.endswith("\n"):
> +                f.write("\n")
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

--=20
Yoann Congal
Smile ECS - Tech expert

--00000000000065f37c062ef4d349
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Chistos,</div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 25 f=
=C3=A9vr. 2025 =C3=A0=C2=A010:58, Christos Gavros &lt;<a href=3D"mailto:gav=
rosc@yahoo.com">gavrosc@yahoo.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">If the build-st/conf/local.co=
nf does not end with a newline<br>
when is generated then add one<br>
Fixes [YOCTO #15734]<br>
<br>
CC: Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com" target=
=3D"_blank">randy.macleod@windriver.com</a>&gt;<br>
Reviewed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" targ=
et=3D"_blank">yoann.congal@smile.fr</a>&gt;<br></blockquote><div>FYI, you c=
an&#39;t add a Reviewed-by from someone without an explicit email (Often st=
ating the full line &quot;Reviewed-by: Xxx Yyy &lt;...@...&gt;&quot;).</div=
><div>On your v1, I merely commented, that is not sufficient for adding my =
reviewed-by.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
Signed-off-by: Christos Gavros &lt;<a href=3D"mailto:gavrosc@yahoo.com" tar=
get=3D"_blank">gavrosc@yahoo.com</a>&gt;<br>
---<br>
v1-&gt;v2<br>
* the comment is changed<br>
* last_line is initialized to &quot;None&quot;<br>
* add a new line by using f.write(&quot;\n&quot;)<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/context.py | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/con=
text.py<br>
index 5eb4cc44fd..9145cbd72b 100644<br>
--- a/meta/lib/oeqa/selftest/context.py<br>
+++ b/meta/lib/oeqa/selftest/context.py<br>
@@ -102,6 +102,15 @@ class OESelftestTestContext(OETestContext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe.path.copytree(builddir + &quot;/cache&=
quot;, newbuilddir + &quot;/cache&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe.path.copytree(selftestdir, newselftest=
dir)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # if the last line of local.conf in newbuilddi=
r is not empty and does not end with newline then add one<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 localconf_path =3D newbuilddir + &quot;/conf/l=
ocal.conf&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(localconf_path, &quot;r+&quot;, enco=
ding=3D&quot;utf-8&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 last_line =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 last_line =3D line=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if last_line and not last_line.e=
ndswith(&quot;\n&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;\n&q=
uot;)<br>
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
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--00000000000065f37c062ef4d349--

