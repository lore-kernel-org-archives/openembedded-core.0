Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.5836.1622845843654759886
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 15:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TpZuk2mf;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: kergoth@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id b9so16691251ejc.13
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 15:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lr8/WZ0W/x/g41wMfiE1siS1UkInzwWN/5NBJ7RK2mE=;
        b=TpZuk2mfn306ghFWouc8mEidLbgOfvD5iqlfrLy/rtz8q8kG8K6ctCP1YMx2qB13vJ
         o44eaodhbCoSw0IWmsg/p2S1fHo5jFQZ9QY3+2U9Aob0ESTCSDQOpsaIyw1UfVsMZhdZ
         4S4VfN7q+jBX4dvOp1WkgocI/+0TsxusM3MPtMsu4xLZ8HIPnZOMBFPLaqoqv5eARHQA
         6NQZz9uP5nUYzm9orZ2MJouk/skHqhPBVmq5eAtBbQp4+7a92qVWqJC26fP3l/FKxlm3
         LWTZ83dvAUVT6DoKFp9hgZ6LTqZBNneKcW06biBA9IM0KkTITOBVNeuylu2dc7iCuhsA
         Tkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lr8/WZ0W/x/g41wMfiE1siS1UkInzwWN/5NBJ7RK2mE=;
        b=mdJND/TNd7Ma0NisYlYGDKQ9046Jl9R2nlkpTDrakBYlN0KcyERa2qqPI0I+PSvhSa
         TVYqRsSvrv/wvU+M12MCNiDOiXCfnVRLzRk+8kYJ0Eu/KQ2fpslSJ6tmoqK3vUjviytn
         6v9+mXhQL4tqg3qxFVopDpM17OLqFASUEZVsc1empxsxmY4YC71twa0PXDiJwNxY1l/i
         +UYHfS2+L3UoBSr6eHA+PmWtLGq11qjQFxjZgGdor0jR3CJvtHo+GlHmwtXQoV3S5Lb+
         sFDc+8NEfraaHiH8UiYABMGlGwoIQJtzBjg/4yc368qHiSjJlZdshz84xpm7IANsseis
         G5AQ==
X-Gm-Message-State: AOAM5334o2+6WKPlEKACcNnLrD1K8pMQUSvox37i+4Hr3zffXjmo0Z0Z
	ZD88Y4lbsJi65lNHHKavQvbGFyZF217NtB+HZlA=
X-Google-Smtp-Source: ABdhPJy/x3xN0TWqnUSsigmQYFEs4WDo7vxWzgavAZSLIlrhQOQaDC0amyoT50yc56qTaykO16aon5Gjm72K+zutHtg=
X-Received: by 2002:a17:906:4d56:: with SMTP id b22mr6170705ejv.78.1622845841833;
 Fri, 04 Jun 2021 15:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210603222356.2971294-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210603222356.2971294-1-richard.purdie@linuxfoundation.org>
From: "Christopher Larson" <kergoth@gmail.com>
Date: Fri, 4 Jun 2021 15:30:29 -0700
Message-ID: <CABcZAN=U07G8N9YwWeYntCFWPUJMQxLhsVn_pDehMtWBkpVQ8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] selftest/fetch: Avoid occasional selftest failure from poor temp file name choice
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ed845c05c3f83daf"

--000000000000ed845c05c3f83daf
Content-Type: text/plain; charset="UTF-8"

Couldn't we also create a temporary directory and create a file with a
consistent name there, rather than retrying the named file approach?

On Thu, Jun 3, 2021 at 3:24 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> The temp file name may contain "_" characters. Avoid this to avoid errors
> like:
>
> bb.data_smart.ExpansionError: Failure expanding variable PN, expression was
> ${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[0] or
> 'defaultpkgname'}
> which triggered exception ParseError:
> ParseError in /tmp/tmpd_f2__to.bb: Unable to generate default variables
> from
> filename (too many underscores)
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/selftest/cases/fetch.py | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/fetch.py
> b/meta/lib/oeqa/selftest/cases/fetch.py
> index 67e85d3e4c7..1d223c0778f 100644
> --- a/meta/lib/oeqa/selftest/cases/fetch.py
> +++ b/meta/lib/oeqa/selftest/cases/fetch.py
> @@ -57,6 +57,8 @@ MIRRORS_forcevariable = "git://.*/.*
> http://downloads.yoctoproject.org/mirror/so
>  class Dependencies(OESelftestTestCase):
>      def write_recipe(self, content):
>          f = tempfile.NamedTemporaryFile(mode="wt", suffix=".bb")
> +        while "_" in f.name:
> +            f = tempfile.NamedTemporaryFile(mode="wt", suffix=".bb")
>          f.write(content)
>          f.flush()
>          return f
> --
> 2.30.2
>
>
> 
>
>

-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000ed845c05c3f83daf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Couldn&#39;t we also create a temporary directory and crea=
te a file with a consistent name there, rather than retrying the named file=
 approach?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, Jun 3, 2021 at 3:24 PM Richard Purdie &lt;<a href=3D"mail=
to:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Th=
e temp file name may contain &quot;_&quot; characters. Avoid this to avoid =
errors like:<br>
<br>
bb.data_smart.ExpansionError: Failure expanding variable PN, expression wa=
s<br>
${@bb.parse.vars_from_file(d.getVar(&#39;FILE&#39;, False),d)[0] or &#39;d=
efaultpkgname&#39;}<br>
which triggered exception ParseError:<br>
ParseError in /tmp/<a href=3D"http://tmpd_f2__to.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">tmpd_f2__to.bb</a>: Unable to generate default variables fr=
om<br>
filename (too many underscores)<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/fetch.py | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/fetch.py b/meta/lib/oeqa/selftes=
t/cases/fetch.py<br>
index 67e85d3e4c7..1d223c0778f 100644<br>
--- a/meta/lib/oeqa/selftest/cases/fetch.py<br>
+++ b/meta/lib/oeqa/selftest/cases/fetch.py<br>
@@ -57,6 +57,8 @@ MIRRORS_forcevariable =3D &quot;git://.*/.* <a href=3D"h=
ttp://downloads.yoctoproject.org/mirror/so" rel=3D"noreferrer" target=3D"_b=
lank">http://downloads.yoctoproject.org/mirror/so</a><br>
=C2=A0class Dependencies(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0def write_recipe(self, content):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D tempfile.NamedTemporaryFile(mode=
=3D&quot;wt&quot;, suffix=3D&quot;.bb&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 while &quot;_&quot; in <a href=3D"http://f.na=
me" rel=3D"noreferrer" target=3D"_blank">f.name</a>:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D tempfile.NamedTemporaryFi=
le(mode=3D&quot;wt&quot;, suffix=3D&quot;.bb&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(content)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.flush()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return f<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christop=
her Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></=
div>

--000000000000ed845c05c3f83daf--
