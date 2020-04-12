Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web10.14365.1586709059298216288
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2020 09:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K40FrtIE;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id f12so468795vsk.8
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2020 09:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PM6gFHSZDxIjdH/o9yRx33ke94JEk5Ce1hkutiiaSBU=;
        b=K40FrtIE3kNYliTiVPckM5dDzrPHH4h0/eHO3JMKu1hKenlM3H0EHTIT63HMhj10uf
         gb9zllCGVCIUaOytDC5AGAWjGXuJ5H1/doN4rs1DdzSel7vCIb2ulzU9OH9e8SCdSitg
         mePLY/uSZpMMUvZ97YLbKxpK9CJ77Ccf2LVm15bZtzNVELKI9X18bCHpGXSeZaww8qsw
         c4bFtH4fURfw7VRpzDyMIJeinVeHjDovkxK6B+kbv9NqGaT6NijR4K2PLy6QV3FH8eDf
         vYHRPjKDVtepmgCFgCV1GhNEhbKi+t6+quqrNCSptjJmk1DUvdzHJ1w1rnNykMX4+3Z0
         BfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PM6gFHSZDxIjdH/o9yRx33ke94JEk5Ce1hkutiiaSBU=;
        b=XjUywxYvWk31RfGPeGTobxpBgxTaqAkoiQ2sviOMnjANTjZG4bUAEbeKhV5Z+7oj89
         K1fi9ht1xj6QFWH1pXLLNkwFES2/4dqe1T/iHoY1QUlfFhqoU3pH/wqxKXpVaRQgmkQl
         m2ehbJctGPQwoRByE+Vm11qngeq2FBHoN+O5M3ct37dQOJ6eBf1/e8I2fTm3M7pgTdqY
         bAdu8kH6NEoosrpzKiQS6LrjQSmu9K7A7U8gOvlpYNA0Aw1kgvKUUzyWOnkUnSiVbGfR
         M6cDsBaKfO44O0HSqbs127qlVW9Wfm1ETmmKADTe27rNnC6lXy2L2tY+ix4pKPFZu29E
         DWJA==
X-Gm-Message-State: AGi0PubF9iE1cCHm019ChDZBfSZ7xrj/OlsIfAKGB8mKj09AM6eqpAU/
	P3krB9Qxk1W80ckN0xoJ3i8KrcZH6hlUKLucY60=
X-Google-Smtp-Source: APiQypLCpzy01TVuvOUTLiWuc8IMDhYXH/QGBcDaWl0e2MhGkC8BncjTRCGbPasM6J/yftECynrkVU1BNc1lMnCX0Ks=
X-Received: by 2002:a05:6102:31b7:: with SMTP id d23mr9364596vsh.25.1586709058437;
 Sun, 12 Apr 2020 09:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200412132223.15582-1-bjarne_michelsen@hotmail.com>
In-Reply-To: <20200412132223.15582-1-bjarne_michelsen@hotmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 12 Apr 2020 18:30:47 +0200
Message-ID: <CANNYZj8d-T4CVJ3T3wUQGgfFWewY-xHOU0ZwvC90yZQYbKytmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: fix error where no license checksum was found in recipe
To: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ca451205a31a7dfd"

--000000000000ca451205a31a7dfd
Content-Type: text/plain; charset="UTF-8"

Wait, what error are you seeing exactly? For me this works just fine even
if the recipe has only sha256sum: the checksummer calculates the values
from the actual tarball, and not from the recipe:

@@ -215,6 +215,7 @@ def _extract_new_source(newpv, srctree, no_patch,
srcrev, srcbranch, branch, kee
         if ftmpdir and keep_temp:
             logger.info('Fetch temp directory is %s' % ftmpdir)

+        logger.info(str(checksums))
         md5 = checksums['md5sum']
         sha256 = checksums['sha256sum']

prints

{'md5sum': '3f486f2f4435ef14b81814dbbc7b48bb', 'sha256sum':
'186c6bfe6ecfba7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629975da3f35',
'sha1sum': '238e001ea1fbf19ede43e36209c37c1a636bb51f', 'sha384sum':
'8985fc9f65c4c2fbbed1ec972bee339eeeb7362e96bdf85dc4652d20e517bdb03ffc222b51e34c15bd391c569caaf158',
'sha512sum':
'b00bd9b5ad5298fbceeec6bb19c1ab0c106ca5cfb31178497c58bf7e0e0cf30fcc19c20f84e23af31cc126bf2447d3e4f8461db97bafa7bd78f69561932f000c'}

Alex

On Sun, 12 Apr 2020 at 15:22, Bjarne Michelsen <bjarne_michelsen@hotmail.com>
wrote:

> devtool upgrade currently assumes that a md5 and sha256 sum is available
> in the recipe, no matter what is the value of LICENSE.
> This fix will just default to an empty checksum, if the parameter is not
> found in the recipe.
>
> Signed-off-by: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
> ---
>  scripts/lib/devtool/upgrade.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/lib/devtool/upgrade.py
> b/scripts/lib/devtool/upgrade.py
> index cb6dce378a..7066ddd51e 100644
> --- a/scripts/lib/devtool/upgrade.py
> +++ b/scripts/lib/devtool/upgrade.py
> @@ -215,8 +215,8 @@ def _extract_new_source(newpv, srctree, no_patch,
> srcrev, srcbranch, branch, kee
>          if ftmpdir and keep_temp:
>              logger.info('Fetch temp directory is %s' % ftmpdir)
>
> -        md5 = checksums['md5sum']
> -        sha256 = checksums['sha256sum']
> +        md5 = checksums.get('md5sum', '')
> +        sha256 = checksums.get('sha256sum', '')
>
>          tmpsrctree = _get_srctree(tmpdir)
>          srctree = os.path.abspath(srctree)
> --
> 2.17.1
>
> 
>

--000000000000ca451205a31a7dfd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Wait, what error are you seeing exactly? For me this =
works just fine even if the recipe has only sha256sum: the checksummer calc=
ulates the values from the actual tarball, and not from the recipe:</div><d=
iv><br></div><div>@@ -215,6 +215,7 @@ def _extract_new_source(newpv, srctre=
e, no_patch, srcrev, srcbranch, branch, kee<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0if ftmpdir and keep_temp:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<a href=3D"http://logger.info">logger.info</a>(&#39;Fetch temp d=
irectory is %s&#39; % ftmpdir)<br>=C2=A0<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://logger.info">logger.info</a>(str(checksums))<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0md5 =3D checksums[&#39;md5sum&#39;]<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0sha256 =3D checksums[&#39;sha256sum&#39;]<br></div=
><div><br></div><div>prints</div><div><br></div><div>{&#39;md5sum&#39;: &#3=
9;3f486f2f4435ef14b81814dbbc7b48bb&#39;, &#39;sha256sum&#39;: &#39;186c6bfe=
6ecfba7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629975da3f35&#39;, &#39;sha1sum=
&#39;: &#39;238e001ea1fbf19ede43e36209c37c1a636bb51f&#39;, &#39;sha384sum&#=
39;: &#39;8985fc9f65c4c2fbbed1ec972bee339eeeb7362e96bdf85dc4652d20e517bdb03=
ffc222b51e34c15bd391c569caaf158&#39;, &#39;sha512sum&#39;: &#39;b00bd9b5ad5=
298fbceeec6bb19c1ab0c106ca5cfb31178497c58bf7e0e0cf30fcc19c20f84e23af31cc126=
bf2447d3e4f8461db97bafa7bd78f69561932f000c&#39;}</div><div><br></div><div>A=
lex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sun, 12 Apr 2020 at 15:22, Bjarne Michelsen &lt;<a href=3D"=
mailto:bjarne_michelsen@hotmail.com">bjarne_michelsen@hotmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">devtool up=
grade currently assumes that a md5 and sha256 sum is available<br>
in the recipe, no matter what is the value of LICENSE.<br>
This fix will just default to an empty checksum, if the parameter is not<b=
r>
found in the recipe.<br>
<br>
Signed-off-by: Bjarne Michelsen &lt;<a href=3D"mailto:bjarne_michelsen@hot=
mail.com" target=3D"_blank">bjarne_michelsen@hotmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/devtool/upgrade.py | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.=
py<br>
index cb6dce378a..7066ddd51e 100644<br>
--- a/scripts/lib/devtool/upgrade.py<br>
+++ b/scripts/lib/devtool/upgrade.py<br>
@@ -215,8 +215,8 @@ def _extract_new_source(newpv, srctree, no_patch, srcr=
ev, srcbranch, branch, kee<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ftmpdir and keep_temp:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://logger.i=
nfo" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39;Fetch temp d=
irectory is %s&#39; % ftmpdir)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 md5 =3D checksums[&#39;md5sum&#39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sha256 =3D checksums[&#39;sha256sum&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 md5 =3D checksums.get(&#39;md5sum&#39;, &#39;=
&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sha256 =3D checksums.get(&#39;sha256sum&#39;,=
 &#39;&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpsrctree =3D _get_srctree(tmpdir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srctree =3D os.path.abspath(srctree)<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div>

--000000000000ca451205a31a7dfd--
