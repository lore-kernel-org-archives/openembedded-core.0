Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8B9C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 12:22:17 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.114702.1738671734232401825
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 04:22:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hcbpf2/y;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30219437e63so67454541fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 04:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738671732; x=1739276532; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjTAUi85+gwgFAQNGRLwqje0Yk6FFzCJKvHiGjAJITw=;
        b=hcbpf2/yIZzDqUUuwddHwd3SoqWEI0Qjg8s5sTIzV2y1saXN7PhaqUyQR6VswMXecz
         kIY8ctstLocRlADMgzut4frqsA4bn3j3O4pTBCNQFDxM/gkB42SS0qXfrCtcwmz/1Jpb
         JdKQtsZKZqPMg4m4M5/0RHoOSswLksrgvdKrLrsdKsJXO5LTW3vArE3cLIXmKh5YakJp
         EF1G7fJSRiP0M9O06KAigQgkap30bUj/oWEpS8EZFKGpf78IQYxKhYhgxOxcvAy5t3pm
         zJXhDFg3X3eVcYwpYPOIGZ2I6l/uSm9xas0ezObjzk6YlrRLcjfhioH1bF4c+hMgljeK
         H7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738671732; x=1739276532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjTAUi85+gwgFAQNGRLwqje0Yk6FFzCJKvHiGjAJITw=;
        b=mmIy0KbMIcqdgF+69zrgCVmGrgpsFqGMMpz1LIHzQqvd+hoKzZkPQ7GhMYmOWHQGV9
         ne5CqVL/Qomt8jUx8l7LxqmBSsu70ejj94ATGUH6fC1OeFX2FgpmM86RwN6EtBj1o2r+
         F9lTwdhnyoJgP7zorsxZBxu/3yuMdcmgdt10y8kMNxugnCwx0mUlZu43BMDHXk5zf3Ub
         e0ONfswd5gfcVF+C7AzzJILK4Ob+VT9/ZpC9mwRyHpNxUO8Se0g+nz2QaixaNjMGZq0E
         KUuGfQ3EspnWp6saGLc+kc233/0UWB4Bba9qP/Q1fEvzkQGst/cFr4Z9kOZ/Pz4LdcD+
         AehQ==
X-Gm-Message-State: AOJu0YzFQlW/RVQPnAD4Lmsi2uQj4CU5PkO3B74cBxv2fxzjAKsVWSyg
	edeuTNyMwEMK+4qYyBDQMWABGQ91OoIuPI5fAElDwD7eP+GFYXOEqkrU5FghgRFnXFx796pZ++A
	o34kjSc8cQ2bxf44AS0lCqS2bSm4=
X-Gm-Gg: ASbGncsv/4TvP4mZ4aZq8piP02kAg/WaWVWlIPx6lxQMpSnkuNCu0TgsTx3mk07BMY6
	dXbgiBVgOLIRUQ+X47/LMRTEdDmqYBgL2beKby5mkd8tjpYShz+0EOpHW0noMterX5IKKJLdCfD
	8=
X-Google-Smtp-Source: AGHT+IHO6g1ksWHl9AcdDEpv1AE/fY3KhdOJ7fdiOl92JbW/zmwzxJcafCusnUPg5vyuwcfbfTmLuZVfOI/l+OkWw7k=
X-Received: by 2002:a2e:94cc:0:b0:302:2097:392f with SMTP id
 38308e7fff4ca-307c68deb5emr9015531fa.7.1738671732124; Tue, 04 Feb 2025
 04:22:12 -0800 (PST)
MIME-Version: 1.0
References: <20250130165359.137315-1-raj.khem@gmail.com>
In-Reply-To: <20250130165359.137315-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 4 Feb 2025 13:21:59 +0100
X-Gm-Features: AWEUYZncLfX8jj2037N-PS6YUA0DCICoIgmWhsZqiB-Rjm2HJKbIIWsEjhRNYyc
Message-ID: <CA+chaQc834fd6cdX5NrxZ+7TzJ0KmG0jeuTTYbMmmPrxy90yuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.41 release
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 12:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210778

On Thu, Jan 30, 2025 at 5:54=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
...
> diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/=
recipes-devtools/libmodulemd/libmodulemd_git.bb
> index d3bef833062..82749d94cde 100644
> --- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> +++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
> @@ -22,3 +22,5 @@ BBCLASSEXTEND =3D "native nativesdk"
>  GIR_MESON_OPTION =3D 'skip_introspection'
>  GIR_MESON_ENABLE_FLAG =3D 'false'
>  GIR_MESON_DISABLE_FLAG =3D 'true'
> +
> +GI_DATA_ENABLED:toolchain-clang =3D "False"

Is this libmodulemd_git.bb part included by accident?

