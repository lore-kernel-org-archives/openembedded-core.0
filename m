Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.7384.1625218972907703347
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 02:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gvUsYgfp;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id hp26so2459965ejc.6
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 02:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SUnhJEUolqLKt1eTIXrbOuBmW0rpyI1S0F+kbwGyLVk=;
        b=gvUsYgfpYKh+e9ZHeb2SOl1Gmj0xMMIqIyITgYonTPNpAH3x/r8M0rHmPXOXsbgxXU
         6uyKmfCcD5zrY9ciJCmgVp2MH5Mry2WjW51gmcEPWS0PGKlyFYc3M0XZ5yCCg9f6yn0h
         577tFbi4nONoaW8cVMZswQDXkcYlUf/ELUN5BuE5C3+etwcgSzjWb2vWOyf2hpcf6a8K
         DFrVmnyjH1deVTcVwp73Cmwt3cU2FfDFeg39kYUXn2KxdiP9gZ4oqDPjwTgfPKOiLKYI
         81FEpH8+dMGXvjrhvEnQdikn6LCoevXdOQ0smRvKYMes5DepeJ9kU34dHxC48G38eOD2
         vG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SUnhJEUolqLKt1eTIXrbOuBmW0rpyI1S0F+kbwGyLVk=;
        b=kqegp0fhwy3VTlu30pZIrV5n+tVccyDMLcdHL2CpIrbe48bTqMmY7oJYQNNcGH+TeV
         LxFCY6eUXG2mWBAsp1BIWli6qtIFDRoMfZdGO1qGeSkf21q7BZVMd2kiUxbKYlXnmm6Q
         ntTVrONa/pe8mOf19i2LLzhq9QtO9wTO+DxOB1mPVZZZXUd96mc1J+6wRC1FZYWY5Nnm
         pwIdZlCXJnKBGoEXr1+N9Qt3BcUlWK55sfL75M++VfXKE346LlS2WwGCeb00U+sZzucx
         lb3PIH1ABry9sDONs/jBVgIjk7KEuwKkptl7ge08lxwUS+8dWmwODxHHr9kO3MOaq6E5
         EBXw==
X-Gm-Message-State: AOAM5301WvIyzFQkeKPGk7nFu9F2OwSVDSQX11yf0ZMh8Cq3oHad5YRm
	SXFKd88unEQFQC13vSyPX4hXQxo18gZdLpABTHU=
X-Google-Smtp-Source: ABdhPJzcvZt0JV6H3hGHYSEVC5FgWJrHc17kTC9cj/KMS18PRBW4RyBbF+sL5DB6HbBKMF9SAsmMCWe87hfftqWS69U=
X-Received: by 2002:a17:907:72cf:: with SMTP id du15mr4556176ejc.54.1625218971308;
 Fri, 02 Jul 2021 02:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210623083403.2060507-1-alex.kanavin@gmail.com>
In-Reply-To: <20210623083403.2060507-1-alex.kanavin@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 2 Jul 2021 11:42:40 +0200
Message-ID: <CA+chaQfyEEPdvQqqfKw0NKQK2A2RS_ChnNja4jeHYbgr4vuRiw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] pypi: set SRC_URI with _prepend, not with +=
To: Alexander Kanavin <alex.kanavin@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007797d005c620c7f8"

--0000000000007797d005c620c7f8
Content-Type: text/plain; charset="UTF-8"

FYI this breaks podman-compose in meta-virtualization which was setting own
git:// SRC_URI after pypi inherit and now both entries end in SRC_URI and
fetch fails with:

ERROR: podman-compose-0.1.5-r0 do_fetch: No checksum specified for
'/OE/build/oe-core/downloads/podman-compose-0.1.5.tar.gz', please add at
least one to the recipe:
SRC_URI[sha256sum] =
"fb229362f188980ea3fbdee2a25d0a2dd6a0b886d925d5213e22e09f1062ebe9"
ERROR: podman-compose-0.1.5-r0 do_fetch: Fetcher failure for URL: '
https://files.pythonhosted.org/packages/source/p/podman-compose/podman-compose-0.1.5.tar.gz'.
Missing SRC_URI checksum

I'll send fix for Bruce.

On Wed, Jun 23, 2021 at 10:34 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> This did not cause problems in builds, but broke some devtool
> workflows such as version upgrades or checking the latest version
> from upstream. Tarballs should come first, not the patches.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/classes/pypi.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
> index 87b4c85fc0..384a209874 100644
> --- a/meta/classes/pypi.bbclass
> +++ b/meta/classes/pypi.bbclass
> @@ -19,7 +19,7 @@ PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
>
>  HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
>  SECTION = "devel/python"
> -SRC_URI += "${PYPI_SRC_URI}"
> +SRC_URI_prepend = "${PYPI_SRC_URI} "
>  S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
>
>  UPSTREAM_CHECK_URI ?= "https://pypi.org/project/${PYPI_PACKAGE}/"
> --
> 2.31.1
>
>
> 
>
>

--0000000000007797d005c620c7f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FYI this breaks podman-compose in meta-virtualization whic=
h was setting own git:// SRC_URI after pypi inherit and now both entries en=
d in SRC_URI and fetch fails with:<div><br><div>ERROR: podman-compose-0.1.5=
-r0 do_fetch: No checksum specified for &#39;/OE/build/oe-core/downloads/po=
dman-compose-0.1.5.tar.gz&#39;, please add at least one to the recipe:<br>S=
RC_URI[sha256sum] =3D &quot;fb229362f188980ea3fbdee2a25d0a2dd6a0b886d925d52=
13e22e09f1062ebe9&quot;<br>ERROR: podman-compose-0.1.5-r0 do_fetch: Fetcher=
 failure for URL: &#39;<a href=3D"https://files.pythonhosted.org/packages/s=
ource/p/podman-compose/podman-compose-0.1.5.tar.gz">https://files.pythonhos=
ted.org/packages/source/p/podman-compose/podman-compose-0.1.5.tar.gz</a>&#3=
9;. Missing SRC_URI checksum<br></div></div><div><br></div><div>I&#39;ll se=
nd fix for Bruce.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Wed, Jun 23, 2021 at 10:34 AM Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This did=
 not cause problems in builds, but broke some devtool<br>
workflows such as version upgrades or checking the latest version<br>
from upstream. Tarballs should come first, not the patches.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/pypi.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass<br>
index 87b4c85fc0..384a209874 100644<br>
--- a/meta/classes/pypi.bbclass<br>
+++ b/meta/classes/pypi.bbclass<br>
@@ -19,7 +19,7 @@ PYPI_SRC_URI ?=3D &quot;${@pypi_src_uri(d)}&quot;<br>
<br>
=C2=A0HOMEPAGE ?=3D &quot;<a href=3D"https://pypi.python.org/pypi/$%7BPYPI=
_PACKAGE%7D/" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/=
pypi/${PYPI_PACKAGE}/</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
-SRC_URI +=3D &quot;${PYPI_SRC_URI}&quot;<br>
+SRC_URI_prepend =3D &quot;${PYPI_SRC_URI} &quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/${PYPI_PACKAGE}-${PV}&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI ?=3D &quot;<a href=3D"https://pypi.org/project/$%=
7BPYPI_PACKAGE%7D/" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/p=
roject/${PYPI_PACKAGE}/</a>&quot;<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000007797d005c620c7f8--
