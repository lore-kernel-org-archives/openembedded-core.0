Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.2701.1628241917514040236
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 02:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DhcWJHW0;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id k9so12179554edr.10
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 02:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5mXd5kTRknj/0LHOC9pTYl5x+8vYzqIJCNgmKpBTmO0=;
        b=DhcWJHW0hjoJUO6/07SqnuG3Rl9nWk41usRqOhgjII9Q85FaCUdmOFP6SRCf6in3Tw
         EsNh8tOvITPN6oaL4wyu9GBAHo6v0mK1WjT24GRSX6ks/acyCqR+Oc9h76D6snNIszlb
         U+l4WOmXxij76ym6nOYS5F4rG9RFqtE77GOZb996YXOaBCNYRvjtsBviqNOJTP+nP5eH
         z1ihiVlBffICqHIi1BQ1EP501CyOrRpH4oToDAe372quM4Y+7kAvO4t5SRZ55Kc3EMM2
         JQKiPjJC3UnA1Q3FHzfya6+8NYIDvMMFnGaOb6VgjcKvNRX3s3I7wlXgbTVo8pDBX2lO
         DADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5mXd5kTRknj/0LHOC9pTYl5x+8vYzqIJCNgmKpBTmO0=;
        b=O3WrSxmu+jajcAU0PqZXYh31GbkOy93KpDV0yVGpys3DDWBEUvZZ5NgYfvCaiQPDYX
         vVUHvrWkVV+EVfdhsUnB5BosfpD2ykE8jjx3oLH69MsFxGjMMECbs2FxSQjKXHug7qHH
         LNnN9amweP/H2yRQx8RkW81EKVSGkyGIvW9KokNULdH6w9xsiwrlHX/8PA9xxuM4Gdxc
         nbpwdEz38SwQtiBZZpimpBNGtBX0UNhAXytMRP2WlVqJcYm/+ZVXg9t46be4ZpXmp68Z
         Hk0nIAdhVZ7jhJz2jOI0K05nyHLK36bZlAXjos8w7jYM1NKwmPMV318QXqdrWoYUgOu4
         D1PQ==
X-Gm-Message-State: AOAM533LeEfb5f9LSbSBjn2H0/xCXRr94vi4P1JUO7xwwvvwZ5dTz0FR
	athVw1pLU7jWeZR8Y8/ni71VswxChn+b1DqCRjSOESVw64c=
X-Google-Smtp-Source: ABdhPJzbNkCqZ+AWR0a1GMLjzjoxLDUMHtB8TPTAFhP9uoNfJ83Q69TNztEtBq6KmBpW50M4EGon39rsR/urjJ/JnOw=
X-Received: by 2002:a05:6402:94b:: with SMTP id h11mr11629738edz.76.1628241916192;
 Fri, 06 Aug 2021 02:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210806090332.14065-1-Qi.Chen@windriver.com>
In-Reply-To: <20210806090332.14065-1-Qi.Chen@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 6 Aug 2021 11:25:05 +0200
Message-ID: <CA+chaQdFS4pb7QOsdd3Rwqi7Qva9z-Wh7EAd=g7+96=fd1C_wQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] convert-overrides.py: also convert comments without a leading whitespace
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000005ead305c8e09d40"

--00000000000005ead305c8e09d40
Content-Type: text/plain; charset="UTF-8"

Can you please bump the script version as well?

On Fri, Aug 6, 2021 at 11:03 AM Chen Qi <Qi.Chen@windriver.com> wrote:

> Currently lines like below are converted.
>   e.g.
>   # IMAGE_INSTALL_append = " A"
>
> But lines without a leading whitespace are not converted.
>   e.g.
>   #IMAGE_INSTALL_append = " A"
>
> We should be converting both.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  scripts/contrib/convert-overrides.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/contrib/convert-overrides.py
> b/scripts/contrib/convert-overrides.py
> index e4a310d1d6..4d41a4c475 100755
> --- a/scripts/contrib/convert-overrides.py
> +++ b/scripts/contrib/convert-overrides.py
> @@ -69,15 +69,15 @@ packagevars = packagevars + imagevars
>
>  vars_re = {}
>  for exp in vars:
> -    vars_re[exp] = (re.compile('((^|[\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_'
> + exp), r"\1:" + exp)
> +    vars_re[exp] = (re.compile('((^|[#\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_'
> + exp), r"\1:" + exp)
>
>  shortvars_re = {}
>  for exp in shortvars:
> -    shortvars_re[exp] =
> (re.compile('((^|[\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp +
> '([\(\'"\s:])'), r"\1:" + exp + r"\3")
> +    shortvars_re[exp] =
> (re.compile('((^|[#\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp +
> '([\(\'"\s:])'), r"\1:" + exp + r"\3")
>
>  package_re = {}
>  for exp in packagevars:
> -    package_re[exp] = (re.compile('(^|[\'"\s\-\+]+)' + exp + '_' +
> '([$a-z"\'\s%\[<{\\\*].)'), r"\1" + exp + r":\2")
> +    package_re[exp] = (re.compile('(^|[#\'"\s\-\+]+)' + exp + '_' +
> '([$a-z"\'\s%\[<{\\\*].)'), r"\1" + exp + r":\2")
>
>  # Other substitutions to make
>  subs = {
> --
> 2.30.2
>
>
> 
>
>

--00000000000005ead305c8e09d40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you please bump the script version as well?</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug=
 6, 2021 at 11:03 AM Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Q=
i.Chen@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Currently lines like below are converted.<br>
=C2=A0 e.g.<br>
=C2=A0 # IMAGE_INSTALL_append =3D &quot; A&quot;<br>
<br>
But lines without a leading whitespace are not converted.<br>
=C2=A0 e.g.<br>
=C2=A0 #IMAGE_INSTALL_append =3D &quot; A&quot;<br>
<br>
We should be converting both.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0scripts/contrib/convert-overrides.py | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert=
-overrides.py<br>
index e4a310d1d6..4d41a4c475 100755<br>
--- a/scripts/contrib/convert-overrides.py<br>
+++ b/scripts/contrib/convert-overrides.py<br>
@@ -69,15 +69,15 @@ packagevars =3D packagevars + imagevars<br>
<br>
=C2=A0vars_re =3D {}<br>
=C2=A0for exp in vars:<br>
-=C2=A0 =C2=A0 vars_re[exp] =3D (re.compile(&#39;((^|[\&#39;&quot;\s\-\+])[=
A-Za-z0-9_\-:${}\.]+)_&#39; + exp), r&quot;\1:&quot; + exp)<br>
+=C2=A0 =C2=A0 vars_re[exp] =3D (re.compile(&#39;((^|[#\&#39;&quot;\s\-\+])=
[A-Za-z0-9_\-:${}\.]+)_&#39; + exp), r&quot;\1:&quot; + exp)<br>
<br>
=C2=A0shortvars_re =3D {}<br>
=C2=A0for exp in shortvars:<br>
-=C2=A0 =C2=A0 shortvars_re[exp] =3D (re.compile(&#39;((^|[\&#39;&quot;\s\-=
\+])[A-Za-z0-9_\-:${}\.]+)_&#39; + exp + &#39;([\(\&#39;&quot;\s:])&#39;), =
r&quot;\1:&quot; + exp + r&quot;\3&quot;)<br>
+=C2=A0 =C2=A0 shortvars_re[exp] =3D (re.compile(&#39;((^|[#\&#39;&quot;\s\=
-\+])[A-Za-z0-9_\-:${}\.]+)_&#39; + exp + &#39;([\(\&#39;&quot;\s:])&#39;),=
 r&quot;\1:&quot; + exp + r&quot;\3&quot;)<br>
<br>
=C2=A0package_re =3D {}<br>
=C2=A0for exp in packagevars:<br>
-=C2=A0 =C2=A0 package_re[exp] =3D (re.compile(&#39;(^|[\&#39;&quot;\s\-\+]=
+)&#39; + exp + &#39;_&#39; + &#39;([$a-z&quot;\&#39;\s%\[&lt;{\\\*].)&#39;=
), r&quot;\1&quot; + exp + r&quot;:\2&quot;)<br>
+=C2=A0 =C2=A0 package_re[exp] =3D (re.compile(&#39;(^|[#\&#39;&quot;\s\-\+=
]+)&#39; + exp + &#39;_&#39; + &#39;([$a-z&quot;\&#39;\s%\[&lt;{\\\*].)&#39=
;), r&quot;\1&quot; + exp + r&quot;:\2&quot;)<br>
<br>
=C2=A0# Other substitutions to make<br>
=C2=A0subs =3D {<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000005ead305c8e09d40--
