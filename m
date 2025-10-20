Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E72CCD1A5
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 20:03:03 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.web10.1900.1760990573600368948
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 13:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Exe7dAQe;
 spf=softfail (domain: sakoman.com, ip: 74.125.224.54, mailfrom: steve@sakoman.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-63e0c6f0adfso4898210d50.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 13:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760990573; x=1761595373; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoPxn2ffeXyvcxkMrOoQTa4uv0bOZcks9ka2rssqM14=;
        b=Exe7dAQek/cjzHVOnmdUBzIQVK70KfXFzfVFRTEe7lNim2rgSxph0Nc6m51RHxEXnv
         oqWli/6Mz5lNaoJu0LXMCKlo7CmyCfwOwF4jNrdRslZbtB9QL9SC9J/9skANC3ICFYkD
         OzEGfSJbsY3QE8u6b/TU3NfepoZz0VbUfdOKo2xwkEkg6ckP+iG+v7hUUhd0rxeQ9FqH
         mtbNyDVNtZyo70Yzg2TEPD+42LcNsm4PMu+2c2Tlu/+Jsv6Tt7Dxpou6zlbKrGZYG9F+
         D2uvbCfVxanxEIxQ0ykDZ4h8C9M9FxbQRBpgU3wtozB+EMOve/Mx8UoKzL7dWvoDjhaU
         jAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760990573; x=1761595373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoPxn2ffeXyvcxkMrOoQTa4uv0bOZcks9ka2rssqM14=;
        b=hWk9sPg+BnsN0ECME1QRLgSUfcviXGl3FuqSSm+RGaE9B/vA2GBrB1/WVj4dfZRyAK
         a21r73NzTCLzRNqxiEQr06/h3PMnXvamfeYT93fscYOz1n/Z9MH3GuAv5Uk5D61/j7dh
         EZGHGpEi4EwBsjKYBJpYceU2hNVAaKplEhchjk3vVfS5upLZNjL0ZIy/kwMYls7pqEB5
         WWkBbquINSxz9ZpRD+6HzltUGfyRRbRGNKyU98bZB7iI0Hn0W/GiGPRC+VnH/P2Ytikf
         L9A+Kk5btj2W3qhq/vIuXvOAto7kyLGh9Cw/DkG2N30ZvBnIkgbuUXQeM9cNLwPPT1YK
         YKtw==
X-Gm-Message-State: AOJu0Yz4EDVAy5A8ne/X/6ukdLYvdtmiC0aH3mJUjgCPOU2A8ooqoD0K
	kcPQFdPY+mGUPEKENyp9tqSDGpUjIvJch28Nl/kGRLnBxY6Ki/pE12CA0CNlC79PTtLMvU2WYeo
	nBJTSUI6HHa4QpN2i8WKHtMW6ur63AWC8yPohaMf9MA==
X-Gm-Gg: ASbGnctEWbN7XTE7DBem8ONrJoqPZih26krwpKs0yE9SnliLVLWwtjMz+AsNRgILHOm
	H47+tzZeACHTGNRIeUeBiLs0v2FaZ3HZTcz+Ajwetb8h5iVVNDXkYw8Fo6iDi3Ml+i9Uy4Df3II
	liYzflSIL6IwzH70Kiwk6Uf4dFL7gYXNfWHUlCJyBMGZSuNx4qAfA/sJNaV7Z0hqW/pUoROs27l
	RF+G6Tlq50fS3LoEFmW9wk1yzjrUJ/5tFAq5Sce3Ml7trgW1VNW8vETxTzIK8OER2j0Pd1x/bvh
	uj6jXLmzA3z74MsVA4e6+tV3mAM=
X-Google-Smtp-Source: AGHT+IHsLYFk+M6Ebkp9znNtwJBQQ9sz/jVcUU8MiswMePXcRk66tAfqN1SUUDtH/NOBZ5204/2EPUluoARR78d6lzk=
X-Received: by 2002:a05:690e:1345:b0:63e:27e7:c792 with SMTP id
 956f58d0204a3-63e27e7cbffmr7680767d50.24.1760990572595; Mon, 20 Oct 2025
 13:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
In-Reply-To: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 20 Oct 2025 13:02:41 -0700
X-Gm-Features: AS18NWCywP0kSoQUpFrF5U84cvl6nqdnlCUacz9QsQUGSurhUpA5EqBQ4R2GMwQ
Message-ID: <CAOSpxdYubmiWhhSS5U21jiUMUu-ubprkYDm7oKfcCgMszmqe4w@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap v2 00/11] backport: SPDX 3.0 support to Scarthgap
To: kamel.bouhara@bootlin.com
Cc: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com, 
	thomas.petazzoni@bootlin.com, Miquel Raynal <miquel.raynal@bootlin.com>, 
	mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com, 
	Pascal Eberhard <pascal.eberhard@se.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 20:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225132

Testing this series on the autobuilder shows oeselftest failing with a
number of spdx related issues.

See:

https://errors.yoctoproject.org/Errors/Details/885530/

Thanks,

Steve

On Mon, Oct 20, 2025 at 12:10=E2=80=AFAM Kamel Bouhara via
lists.openembedded.org
<kamel.bouhara=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> This v2 series backports SPDX 3.0 support from the upstream Walnascar
> branch to Scarthgap (Yocto Project 5.0 LTS), including the corresponding
> test suite and fixes for integration issues found during testing.
>
> The motivation remains the same as in v1, to bring complete SPDX 3.0
> support to the latest LTS release, ensuring that long-term supported
> builds benefit SBOM generation capabilities. Scarthgap is under
> maintenance until 2028, and SPDX 3.0 is now an essential part of
> compliance workflows.
>
> Kamel
>
> Hongxu Jia (1):
>   oeqa/selftest: Add SPDX 3.0 include source case for work-share
>
> Joshua Watt (7):
>   classes-global/license: Move functions to library code
>   lib/license: Move package license skip to library
>   lib: oe: license: Add missing import
>   classes-recipe/image: Add image file manifest
>   selftest: spdx: Add SPDX 3.0 test cases
>   lib: oeqa: spdx: Add tests for extra options
>   spdx 3.0: Rework how SPDX aliases are linked
>
> Kamel Bouhara (Schneider Electric) (3):
>   backport: SPDX 3.0 fixes and tasks from upstream version Walnascar
>   spdx30_tasks: fix FetchData attribute in add_download_files
>   spdx30_tasks: adapt CVE handling to new cve-check API
>
>  meta/classes-global/base.bbclass              |   41 +-
>  meta/classes-global/license.bbclass           |  165 -
>  .../create-spdx-image-3.0.bbclass             |   85 +
>  .../create-spdx-sdk-3.0.bbclass               |   74 +
>  meta/classes-recipe/image.bbclass             |   58 +
>  meta/classes-recipe/license_image.bbclass     |   14 +-
>  meta/classes-recipe/nospdx.bbclass            |   13 +
>  meta/classes/create-spdx-3.0.bbclass          |  200 +
>  meta/classes/spdx-common.bbclass              |   99 +
>  meta/lib/oe/__init__.py                       |    2 +-
>  meta/lib/oe/license.py                        |  203 +
>  meta/lib/oe/sbom30.py                         | 1096 ++++
>  meta/lib/oe/spdx30.py                         | 5593 +++++++++++++++++
>  meta/lib/oe/spdx30_tasks.py                   | 1343 ++++
>  meta/lib/oe/spdx_common.py                    |  244 +
>  meta/lib/oeqa/selftest/cases/spdx.py          |  248 +-
>  16 files changed, 9262 insertions(+), 216 deletions(-)
>  create mode 100644 meta/classes-recipe/create-spdx-image-3.0.bbclass
>  create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbclass
>  create mode 100644 meta/classes-recipe/nospdx.bbclass
>  create mode 100644 meta/classes/create-spdx-3.0.bbclass
>  create mode 100644 meta/classes/spdx-common.bbclass
>  create mode 100644 meta/lib/oe/sbom30.py
>  create mode 100644 meta/lib/oe/spdx30.py
>  create mode 100644 meta/lib/oe/spdx30_tasks.py
>  create mode 100644 meta/lib/oe/spdx_common.py
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225098): https://lists.openembedded.org/g/openembedde=
d-core/message/225098
> Mute This Topic: https://lists.openembedded.org/mt/115849813/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

