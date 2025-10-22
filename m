Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D428BCCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 11:12:04 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.6275.1761131523571007335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 04:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i0MAap0r;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-879b99b7ca8so92192196d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 04:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761131522; x=1761736322; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BtHz7bAAlLfNVJt5oN6WzKDbgCzsYm1hUv5V7e49iTU=;
        b=i0MAap0rR1fiX2KkJOI0e6ArrN9aGL9riOJfjFkgQUw8l0ulZ4sVDJvHvVV8K76u2o
         o+YTJaniPnb/kZuvp74A43jtdg7k+WpGyTsSwvdy7t4YdZ9ZUUp8KY2PoOPu9EEYkNVv
         oOt+vQcfWKUiAvm6VenH5MA/AGpEY10nG/KNou8GjspQ5bCA8+uWRKFqVAeEQPWtAySy
         8oc41oToULxJ3noEg/CNnusFOcSx2F4Ot702JIE4unhGZvzb6RSy8+UOyCMCIpSMcVqC
         WJII6tyKPGeZ+7rptLSKcBa0DAKNvmAoqR7GEKrUYS81VqqigjlVJsJTiSfJC2xxYl7H
         tmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131522; x=1761736322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtHz7bAAlLfNVJt5oN6WzKDbgCzsYm1hUv5V7e49iTU=;
        b=jwG4Kr03mDCIkrtBW/MvgKpgTS73bkrfZi5jczIHsDdpG4zgQC9pTLlOHM2GInocXC
         s1Cpotm9D9ZEEVotz6CFDrmAee3lvxsXhUJ/C19+utfvpLF6nns16YC425L86E9PwKux
         xouIdzH3TirAuSN+EZH4TNsjgKpnr7L9rNaIzYgbkIXDCA/dQj+QSJrOIZl5LjFz5KUT
         Uk99ZyhNoFNcm5rcOJJfxXnt1tTs6uC9hcrsdUgJYqRRF1C9QVmMARCM9XEsVQC72o2Z
         jai863Smrsjgr8MISj65N2LHIJVUHntqhMN2EQONAVKRAzUQOIVjcJ0tayzYA1j+9tXj
         S9Cw==
X-Gm-Message-State: AOJu0YxTAosSL1NGhS2nKgr3BYn8iEIwdorESo2VoPQGq0qKhRe7ADyP
	hOxNMCCczM6M2ylkxJEen1ew3lb7pc5KmArih9jkKNlXYvk9cXKGlql7X+lm5qD2yc+UAwmEdY3
	Gm8hpzDo/dsGvzMg6sbSZvBlTAEGqDiFayQ==
X-Gm-Gg: ASbGncsbGRKsvjIc2XJmylZIKIwfS0GBzcJWCXlR9l1h82sw4xou6pFVsjkUnAz4Wsf
	e2FB+KDhKDCVVHxGUY80yMYeOaPVKF/WH8XlkZo/Gs2QaKS8z1pn4AohcJQDMvDDJrKsG9LO+8R
	VHgS2YJ5m3Hpwuelr5HslBf6pRny67MqXEPX51Cyzex+DPNinKsDNCqfOMjNpi+2bGnCXZI6G+e
	NDk0FPJBPVg2Gu29tZ+OjxErVj+j4Ppeq8lJv7t25M5vs7KqHXM2+5n1POZhqO/EgS8xC70nV6Y
	Hr2fhAJVJwjJsn5OpaiMmWxtvR1ISzxfeC8fxRuVNCd1/azdnGWE/5pCW3whO4GeIoUY
X-Google-Smtp-Source: AGHT+IEW4MAuxhtpgsKsGy0HIxw1GvSEmwZBROlF36Bp1XD2c3y9TjM4Osysz4D316PVCHwPbci0R8s1rEYMOFLE+6E=
X-Received: by 2002:a05:6214:2529:b0:879:b99b:993c with SMTP id
 6a1803df08f44-87c20745387mr256512776d6.18.1761131522483; Wed, 22 Oct 2025
 04:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <567bf317-620c-4f00-827c-50a511d431c7@munisense.com>
In-Reply-To: <567bf317-620c-4f00-827c-50a511d431c7@munisense.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Oct 2025 13:11:51 +0200
X-Gm-Features: AS18NWA3J5WVqSoB8OE2APCpO9W4dDn2TEAjVG1Hlb4XMxpmCxXThtWQdTi9VP8
Message-ID: <CANNYZj8WZ+hx_OvO+=m_JsayTZEB9GmC6ma4xEp-qPqXso=aog@mail.gmail.com>
Subject: Re: [OE-core] Ubuntu 25.10: base-passwd fails to chown. (pseudo issue)
To: gijs.peskens@munisense.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 11:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225185

On Wed, 22 Oct 2025 at 11:56, Gijs Peskens via lists.openembedded.org
<gijs.peskens=munisense.com@lists.openembedded.org> wrote:
> I'm just posting this here as a reference so others who run into this
> can hopefully find it, as it took me a while to figure out what was
> happening ;)
>
> Ubuntu 25.10 obviously isn't supported, so I'm aware I'm on my own....
>
> On Ubuntu 25.10 packages will fail to chown, this is due to Ubuntu
> having moved away from gnu coreutils to the rust based uutils coreutils.
> I'm presuming that Pseudo works by overriding libC provided functions,
> and thus intercepting the syscalls, and that the rust based coreutils do
> their syscalls directly (without a libC), which breaks pseudo and will
> result in failure to chown errors (and possibly other errors as well).
>
> As a work-around, on 25.10, it's still possible to switch back to
> gnu-coreutils:
> sudo apt-get remove --allow-remove-essential coreutils-from-uutils
>
> (at your own risk)

Thanks for the report. I was dreading the day this happens, and I'm
sure others as well. Chances are, other distros will follow, and then
Yocto project has a problem.

Should we build C based native coreutils as early as possible, and
then use only that? That might buy some time, but isn't a real
solution, if GNU stops their development.

Alex

