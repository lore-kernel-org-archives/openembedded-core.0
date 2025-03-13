Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DA9C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 10:51:30 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.11864.1741863085634968974
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 03:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GJEBXO4m;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223594b3c6dso13692885ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 03:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741863085; x=1742467885; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D1erYnCWQVeJrm3vBgN0kAI3KyGsjX/hWWS/WKcDWwQ=;
        b=GJEBXO4mymc2v9NxRHFTQByXSKWjhWGwQD17Dghlw9XJ7ei0b5xIguLbYK0HZWi+FW
         joGxWW1e+lWqg0wUyYMrWQgXtDg5S5PokahEN+o6umVWuoz5ikSjLH9v685iuvblMHmQ
         9NxrvYEAjYNaQ3kbn0UT1EdMEQVW1L/+W7pQF26eHVJJRcheFZbbMYxb/kSzndQ84baz
         EQ6ZRTKcAwNQ3LmtLg2oI6Hfzuwa1nvBtPFBrrXRhUQRp+Ui7RgVSoP5zLASqmToySDY
         JmSwscQoEKKJuvBpxe5zIB6JwYozKwRjozdoKgJCx+7nIC52En9/b0V0PBIQ9cQL9Qsv
         0gQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741863085; x=1742467885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1erYnCWQVeJrm3vBgN0kAI3KyGsjX/hWWS/WKcDWwQ=;
        b=aTG7Um2zIQdeRi9rNUt55/aVB8RPpn7Ouz1L71dtLIgl1TimWBVWbN/Agi+pjUIkJM
         97J5HgZzXkDNbYmPW/LsggAXfbWVCKeHoj4AvSuUoOiIZ+mTOO3VSZdy53iBZXo8WAzG
         XCiBlqbt+MwnQH3qhLGt30+nmeVzUljPi8Wh/ym0rJJMf9Ca6kOReofr+apel4wKH4C8
         LgP60FlrY/WNskFm9+ZU4xLHwFsc3BsYuO65T6CcsgFiCx8+2fZew8j72EjiyduNvgx7
         GpRItKJEu3gVDMbumzJ1Z7h0CQwxMCJqF9wwpJ0gtCajh4+QouhM39dEyXK6zcz+IkcR
         sBLQ==
X-Gm-Message-State: AOJu0YyuQEkd67oal8XVXSikHYchD4c1WXMvlXjXGqzJup3HkicIhRXm
	AaL9s5bG+26w62/6iKC/MvjHyNmqFnU0p9JJRJDaYrEhZ0u1mj+2goOqN4c56uqaQpAedB8LRWM
	O/iXMjMhlONEMI6UaxI/v4shE4Mg=
X-Gm-Gg: ASbGncvl2Ow5Z+gsxdSze3bSD/gmYHSAer65lO5mJxmPW42yFZhn7I1Ixc+v4o2rCEO
	4FO4H2suIrjGOINYeaUi25sW9QknrvR7j0Nb/m/giS7L6gnr6OacBEMlNAsVPCuMts6k9dVbl3F
	Q5NQG0tyjCwTkQSDubs0y5xHVGx3mkZwy7fdLs
X-Google-Smtp-Source: AGHT+IEGxHiB+ii5CaoLJ0eVh8wQ0d3je4lcILUAa09AYaw0XPeECsD6F1PS0IeyFS3/Vd5p0X4NAlndYcwRzkqkcfw=
X-Received: by 2002:a17:903:2405:b0:21b:d2b6:ca7f with SMTP id
 d9443c01a7336-22428be5c24mr384409145ad.32.1741863084823; Thu, 13 Mar 2025
 03:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250310094753.1985294-1-adrian.freihofer@siemens.com>
In-Reply-To: <20250310094753.1985294-1-adrian.freihofer@siemens.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 13 Mar 2025 11:51:13 +0100
X-Gm-Features: AQ5f1JqbwqZ_PuPjMzpNZjrsW4ITWtQtynavIq8hUzbG17nw2bJQHjEq_dOW8T4
Message-ID: <CAApg2=QPOhkVMQvKjKwNHaCrcjfkky3iuieZ+xRO6pCve4UDww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe-init-build-env: define umask
To: adrian.freihofer@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="0000000000006b1eee0630371a5b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 10:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212759

--0000000000006b1eee0630371a5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 10:48=E2=80=AFAM Adrian Freihofer via lists.openemb=
edded.org
<adrian.freihofer=3Dgmail.com@lists.openembedded.org> wrote:

> If umask is not suitable for bitbake it terminates with:
>   ERROR:  OE-core's config sanity checker detected a potential
>     misconfiguration.
>     Either fix the cause of this error or at your own risk disable
>     the checker (see sanity.conf). Following is the list of potential
>     problems / advisories:
>     Please use a umask which allows a+rx and u+rwx
>
> Set the umask flags in the oe-init-build-env script to prevent from this
> error.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  oe-init-build-env | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/oe-init-build-env b/oe-init-build-env
> index 82382f27078..5d830455f74 100755
> --- a/oe-init-build-env
> +++ b/oe-init-build-env
> @@ -57,3 +57,5 @@ unset OEROOT
>
>  [ -z "$BUILDDIR" ] || cd "$BUILDDIR"
>
> +# explicitly set relative umask to deal with security hardening
> +umask u+rwx,g+rx,o+rx
>
>
Hello Adrian,
Could you explain what situation it is needed?

Kind regards,
Marta

--0000000000006b1eee0630371a5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 10,=
 2025 at 10:48=E2=80=AFAM Adrian Freihofer via <a href=3D"http://lists.open=
embedded.org">lists.openembedded.org</a> &lt;adrian.freihofer=3D<a href=3D"=
mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">If=
 umask is not suitable for bitbake it terminates with:<br>
=C2=A0 ERROR:=C2=A0 OE-core&#39;s config sanity checker detected a potentia=
l<br>
=C2=A0 =C2=A0 misconfiguration.<br>
=C2=A0 =C2=A0 Either fix the cause of this error or at your own risk disabl=
e<br>
=C2=A0 =C2=A0 the checker (see sanity.conf). Following is the list of poten=
tial<br>
=C2=A0 =C2=A0 problems / advisories:<br>
=C2=A0 =C2=A0 Please use a umask which allows a+rx and u+rwx<br>
<br>
Set the umask flags in the oe-init-build-env script to prevent from this<br=
>
error.<br>
<br>
Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siem=
ens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
---<br>
=C2=A0oe-init-build-env | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/oe-init-build-env b/oe-init-build-env<br>
index 82382f27078..5d830455f74 100755<br>
--- a/oe-init-build-env<br>
+++ b/oe-init-build-env<br>
@@ -57,3 +57,5 @@ unset OEROOT<br>
<br>
=C2=A0[ -z &quot;$BUILDDIR&quot; ] || cd &quot;$BUILDDIR&quot;<br>
<br>
+# explicitly set relative umask to deal with security hardening<br>
+umask u+rwx,g+rx,o+rx<br><br></blockquote><div><br></div><div>Hello Adrian=
,</div><div>Could you explain what situation it is needed?</div><div><br></=
div><div>Kind regards,</div><div>Marta<br></div></div></div>

--0000000000006b1eee0630371a5b--

