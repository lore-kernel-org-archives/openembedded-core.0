Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web12.5189.1589000200157996874
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 21:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qaGxAerx;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id y26so3974326ioj.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2020 21:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G0WlBBsn0OeUolCgHGGK1BG5hoRy0fjRjrn/mqSTgpU=;
        b=qaGxAerxkaIbvXgI1e8L2Jk/2irnI2xwjmfC0op3RnWw6StbSif5iNmqYv3j1WlCqi
         TW784vSndkCIqWiSM6b3bOoL/a9TpmNMumrvt1wiGkXdWpWyUARW+VrljKEUb8Gp9lIf
         CZk2lipiLoCGf7bya82hfFvSb2x11sG77vEf3UG5dQc3YyZtz53hdcdgQY+hVgmZwcSk
         vUqm0q5MUd7qs5AREY2rWym5uDwN1F1kBghd31f/w1M40mPzxI8k9NH1LvkR9Iz6E3n5
         P4vdiVJlcdlrS9RK5ird1ioYMD+BqKUk48YcUQEJk/Ypae2GKOVXSpdqGl4PJHp4ISnE
         6+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G0WlBBsn0OeUolCgHGGK1BG5hoRy0fjRjrn/mqSTgpU=;
        b=EbA0RX6+veklpnxVIg5q3kNqvbfZ+SwFVQElqwzo1GYtJMwiuDRAb177lmr3yovU5g
         mkPPMVO45nR/pL4TqJYdhhUhHQWl+QlqqMFJEIGGC4w/EySjnQ5mER4x1aulIIvxnLVT
         Upm302IzXWaH0TOn9PW8tZ56GjV9hobu6VtC0Ldjy8TFz5uoO6kxNZMmB3+74zZMvpL0
         rBgD+f9SStSC7OonYJkJmKBeIKp4754GhEZY+/RhDOtcbqzwKraUKU0N0YHMz+TqRH9m
         ornt2oaHQS8I8JykIjREyp35cQ7B6l1dWGOGazWvGqkZz/m7Ek91sPew2kuMlG8dqlaH
         RvaQ==
X-Gm-Message-State: AGi0PuYh41QTF8iTeRaqhlwshgSVGUTCB0pd0yM//GadCoxJewiuJxKU
	i5/pEK8gksRAZm8NLU1tvE4NzTN2apCbglOYrXE=
X-Google-Smtp-Source: APiQypL6ZdpNlq7HYrBSQs6fEIIA6iuWhM2ei7hzhgD2zuhPOVSNbPbM/wIEEibBA6I7X4j0l3wWdP3ChC5ZyNs/v7M=
X-Received: by 2002:a02:6a6f:: with SMTP id m47mr5842820jaf.138.1589000199431;
 Fri, 08 May 2020 21:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <AM7PR05MB6881F29B1FAD006F027D07FEA8A20@AM7PR05MB6881.eurprd05.prod.outlook.com>
In-Reply-To: <AM7PR05MB6881F29B1FAD006F027D07FEA8A20@AM7PR05MB6881.eurprd05.prod.outlook.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 8 May 2020 21:56:28 -0700
Message-ID: <CANx9H-CQXEyXOU4o4x=Y_Hn-BgeK95C5cSAm4kJT59gYfSfK5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pypi.bbclass: mind package suffix on version check
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006f6db005a52ff043"

--0000000000006f6db005a52ff043
Content-Type: text/plain; charset="UTF-8"

We should only be updating to releases, not dev or alpha or any other
non-released state. That is why the regex is they way it is.

On Fri, May 8, 2020 at 4:37 AM Konrad Weihmann <kweihmann@outlook.com>
wrote:

> Some pypi packages do have suffixes like dev, or a0 or b1.
> When doing a version check on these, the version will get falsely
> trimmed down to a version without the suffix.
>
> E.g. 3.8.0a1 will become 3.8.0 which then also means that
> a version upgrade from 3.8.0a1 to 3.8.0a2 will not be detected.
>
> Fix that by inserting an optional suffix group with alphanumeric charset.
>
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/classes/pypi.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
> index e5d7ab3ce1..7d0f367a02 100644
> --- a/meta/classes/pypi.bbclass
> +++ b/meta/classes/pypi.bbclass
> @@ -23,4 +23,4 @@ SRC_URI += "${PYPI_SRC_URI}"
>  S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
>
>  UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
> -UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
> +UPSTREAM_CHECK_REGEX ?=
> "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+[a-z0-9]*)"
> --
> 2.20.1
>
> 
>

--0000000000006f6db005a52ff043
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">We should only be updating to releases, not dev or a=
lpha or any other non-released state. That is why the regex is they way it =
is.</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, May 8, 2020 at 4:37 AM Konrad Weihmann &lt;<a href=
=
=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Some pypi packages do have suffixes li=
ke dev, or a0 or b1.<br>
When doing a version check on these, the version will get falsely<br>
trimmed down to a version without the suffix.<br>
<br>
E.g. 3.8.0a1 will become 3.8.0 which then also means that<br>
a version upgrade from 3.8.0a1 to 3.8.0a2 will not be detected.<br>
<br>
Fix that by inserting an optional suffix group with alphanumeric charset.<=
br>
<br>
Signed-off-by: Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com=
" target=3D"_blank">kweihmann@outlook.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/pypi.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass<br>
index e5d7ab3ce1..7d0f367a02 100644<br>
--- a/meta/classes/pypi.bbclass<br>
+++ b/meta/classes/pypi.bbclass<br>
@@ -23,4 +23,4 @@ SRC_URI +=3D &quot;${PYPI_SRC_URI}&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/${PYPI_PACKAGE}-${PV}&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI ?=3D &quot;<a href=3D"https://pypi.python.org/pyp=
i/$%7BPYPI_PACKAGE%7D/" rel=3D"noreferrer" target=3D"_blank">https://pypi.p=
ython.org/pypi/${PYPI_PACKAGE}/</a>&quot;<br>
-UPSTREAM_CHECK_REGEX ?=3D &quot;/${PYPI_PACKAGE}/(?P&lt;pver&gt;(\d+[\.\-=
_]*)+)&quot;<br>
+UPSTREAM_CHECK_REGEX ?=3D &quot;/${PYPI_PACKAGE}/(?P&lt;pver&gt;(\d+[\.\-=
_]*)+[a-z0-9]*)&quot;<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000006f6db005a52ff043--
