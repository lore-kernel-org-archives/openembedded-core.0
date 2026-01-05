Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A86CC79FBA
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 19:11:13 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72360.1767640268756263732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 11:11:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dPGdRETc;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79045634f45so3788757b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 11:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767640268; x=1768245068; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZNe51/nUiaY1AdEPBaq8CXxubiWs2QJgqM8r+oDASY=;
        b=dPGdRETcqTs7Q6FSGf03k4UBVV0hcvXjF/SwSUoR5slF0kRS9yZwfJYDVNwEUM8H30
         tqbSiRct7EqOqOwOHKCtENIcDGQdAphXBC7ZpR6eWorCc+3KbJ7eEHtnNesi3N0EIwG2
         Wxhuc12FkxcSdT0kVWlj3I5DzaSOy7Qu5LEzUAbVGLxDIwjh95y6mAzVzFm+r8ZTDbNt
         bD71hQ40POo0JHdVirL+5u0PLOIU7fCcmk+7QGiROdG0nDLNH5lavv9jbWB9h/euJRxK
         QTWXKJBYu+mZ2VmSKszM5btZXkWIa8QA3u+6E0Uas8gbqj4zDTgaGoxKtNtVnKQQVwql
         AfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767640268; x=1768245068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mZNe51/nUiaY1AdEPBaq8CXxubiWs2QJgqM8r+oDASY=;
        b=r3rLlZIu3714gHKN1SJYmmvidqh3wrzquvJTWKLq8+I0wqBqCjSqXHJn1KNQjoWlFE
         Zj4Kzec717O6X1iBLyWZYDcVlocdtPvp6sIOD2ObbFp8TkJ5YXgzBoYqPJpwz43sxpH0
         pySYtZBtGf1vzfeddF6vL9MPp2UItgiAlFYKUrC2vrAERspR1MEIPSj06RwW17evozfn
         ljGhTAgLi5Xy9W3U84gteEtt/6X70mIvdzq5x80FRMs8HdEL3/nPYsg2hKutgQB6/1yD
         LnNC7hMQWE+q5wx+jDbd+zkJIK92MOjkhYjyyCI3q8xF1M+RfjjstutQwttd2REew9Q9
         JusA==
X-Gm-Message-State: AOJu0YxWXYsAFvJABi/3lrpDF0QImHTKQefdXb+M6JixJ2SHEvbR/eW4
	pZte/l2vQDTH3mCUEbTJcOu6tS7xOGcKwY6regezA7PpAwvAwC0jtipHvAK7tsuqf5X97V4JmsG
	eKI6iEuWHSEBhs5Xz4n9QLeCJEnaT+lU=
X-Gm-Gg: AY/fxX5uSGzjJs/CbVwawS4d1+0YB0+0v0rxZLFo+xSUMvHtAZVN8QQ+PgNISXgMCiZ
	rxYnfkJVylXLwxgPNwFHmgdoK/gVq0HaZ4ZRrxX/Jdc52Sd8hYu3Y4ybd5sa5LmhMC7an7rT+ta
	9FXxnt4gnZF/VC4T5ARxx7jO/pwPyPSZpzfVCckwiV/KTiJdBCrqvuIxlkknPXc/yKbH1GN9xvy
	VlHirAkwC66xJUz7fQ2/DVVjEaubFDNEag+K90IZ+N+05tz25bzPuaCCbH2sXwhhA9kEVx+7tl5
	kzr40jMGsg==
X-Google-Smtp-Source: AGHT+IHMvmsFOc0+knzdngnSq6WX6YPlXgHiT0S82AHu6Zspm/0CmZkFfST6RF2BUTRY5CMZv7rezGciqoX2l4OO5+g=
X-Received: by 2002:a05:690c:67c7:b0:78f:c5fa:89ed with SMTP id
 00721157ae682-790a8a5d858mr5746257b3.21.1767640267709; Mon, 05 Jan 2026
 11:11:07 -0800 (PST)
MIME-Version: 1.0
References: <20251218120139.104155-1-stondo@gmail.com> <20251218120139.104155-2-stondo@gmail.com>
In-Reply-To: <20251218120139.104155-2-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 5 Jan 2026 12:10:56 -0700
X-Gm-Features: AQt7F2oN_KUoP1lav9y4JsECz02DYZD3eua4o0WWwOXmLtl3HP17wDWJXIZB5_U
Message-ID: <CAJdd5Ga1pi3FumNeqQU5DS0ZSgBwUx9hVGiON4FKCP-h-ZPYiA@mail.gmail.com>
Subject: Re: [OE-core] [OE-core 1/2] spdx30_tasks: Add summary field with
 fallback chain
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, stefano.tondo.ext@siemens.com, 
	peter.marko@siemens.com, adrian.freihofer@siemens.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 19:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228874

On Thu, Dec 18, 2025 at 5:01=E2=80=AFAM Stefano Tondo via
lists.openembedded.org <stondo=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Add automatic population of summary field with intelligent fallback
> chain to improve SBOM human-readability and documentation completeness.
>
> The summary field provides a brief description of each package in the
> SBOM, making it easier for humans to understand the purpose of components
> without reading full descriptions. The implementation uses a fallback
> chain to ensure every package has a meaningful summary:
>
>   SUMMARY:${package} =E2=86=92 SUMMARY =E2=86=92 DESCRIPTION =E2=86=92 ge=
nerated description
>
> This improvement addresses SBOM documentation quality requirements and
> makes SBOMs more useful for security review and compliance documentation.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>

LGTM thanks.

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

> ---
>  meta/lib/oe/spdx30_tasks.py | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index f731a709e3..286a08ed9b 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -636,7 +636,22 @@ def create_spdx(d):
>              set_var_field(
>                  "HOMEPAGE", spdx_package, "software_homePage", package=
=3Dpackage
>              )
> -            set_var_field("SUMMARY", spdx_package, "summary", package=3D=
package)
> +
> +            # Add summary with fallback to DESCRIPTION
> +            summary =3D None
> +            if package:
> +                summary =3D d.getVar("SUMMARY:%s" % package)
> +            if not summary:
> +                summary =3D d.getVar("SUMMARY")
> +            if not summary:
> +                # Fallback to DESCRIPTION if SUMMARY not available
> +                summary =3D d.getVar("DESCRIPTION")
> +            if not summary:
> +                # Last resort: generate from package name
> +                summary =3D f"Package {package or d.getVar('PN')}"
> +            if summary:
> +                spdx_package.summary =3D summary
> +
>              set_var_field("DESCRIPTION", spdx_package, "description", pa=
ckage=3Dpackage)
>
>              if d.getVar("SPDX_PACKAGE_URL:%s" % package) or d.getVar("SP=
DX_PACKAGE_URL"):
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228118): https://lists.openembedded.org/g/openembedde=
d-core/message/228118
> Mute This Topic: https://lists.openembedded.org/mt/116840956/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

