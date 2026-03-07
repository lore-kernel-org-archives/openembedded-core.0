Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66717F55110
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:16:06 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18502.1772921758407574802
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:15:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dQXvj8OY;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-798374d0f44so150767737b3.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:15:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772921757; cv=none;
        d=google.com; s=arc-20240605;
        b=YCeYAeluIC0xQliZ3kWdFxDcui/Zs5XrIaicAcmQN8Cjo/mOIaGR8ACJtuyTbLlXcH
         eaw/v/Ph7QEZ7qZhquvqz8aZ3wtAwMIkY6unum1C0Ji7CHCc0tTx5uXVf8TBt6yr7qaU
         FDBOVts66F78hxlqz4ETB9FnN3s0kIQdiEEGj2Gk+GOTn7CeFj4xV+79vVaU7z3PjT09
         Ibjsqg8ybN4Hxszq+pYb6CP+o4GHMyICB7UQC/4kVDzQ8Mzlh1dyI2sZki6tthHgB3fS
         /omeJV9BJQSC+2L1P/VNIbk4YO5dVFf7e1qyNuvyWeLPcFsWyNiueYPkn/dnEM30OEGY
         K8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tpUQC6m9ISfOEMT12VwuwEHH/zXAAoPuTeyKr949AuE=;
        fh=aX9SpBcc1D+i0sBLZeYvRNp2cqEQvxp/jAk+Y+9zDH4=;
        b=REdXQS6CP93qrvNkXVazy6IQ6zBl6HMIm69pf3ZS9V8KK1OMZ/nS7XakgqNRxzKDhS
         rFjd0Fb8T/pwJW3Zgy8IIEI7Ma2HVoPy7Cb1og90VSRWdtphRntHwaiWN8DUop2VRJR1
         QC5lwYK7uk7l27mwXEn93kiwnjt+Es94swOm89IjcbTlljwcoBl/GzCfuVQdz/f3LVyz
         e4cHhT1a+H4MbE0wiM4g3zHDZNUZL83sygPHW9SMeiySrcxMpkC1rFfyhIDmwYlFvfiC
         azJsuvYyxBwUILv7yr0SDstTPLg83VrY2lvyu6teB5F2ddQgyGSJLa5vpVMTajdBAYdi
         QYAw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772921757; x=1773526557; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpUQC6m9ISfOEMT12VwuwEHH/zXAAoPuTeyKr949AuE=;
        b=dQXvj8OY0uH8EkcayknZ9ePqyXx9KAIM3jH5va3v9mLgktK03cO4MWWUnVqBxaO1k8
         rF0skcQRJ9qn/IZJN7ZJOdQ5QcQObwC3CzVlFFlihrtKefM0HB7TO8MXVchmZtuZJCbT
         xcFJyUQdaG5AJgKs5cqyg090GUPpZTCc7LxJvuIR87SbwJ2jPxOcuf2lP/K05zr1jdgw
         j+sLre97/NU687Cv3HLcICDxrIt87TWaG69+wEuBBMHONVSf/p4T4qC+Q8OoTjMy32c3
         OgYlTwXbTqeI9mcEKScYjg3zLblOQKfh/PrK6UvbN5klwhCQz8IB4Tq+CrUr4oGMu2h2
         7kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772921757; x=1773526557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tpUQC6m9ISfOEMT12VwuwEHH/zXAAoPuTeyKr949AuE=;
        b=VxsRIw+edvZQCfj0xe3mv0CHAAVyrEfHfYJt2jXy3fA48+kFl9kLUTJuaNBRk3RUbw
         vA/Ne06WzukzGrVcZnSLIFumXx3zsZlDx7sElh9sBHun9utnuyXG0CmeE4ayAaEvFZnA
         eYLFPAnrMUmu9zFPQIUnGUXrXJxB4X8UKzmKaCts5SOMU/EbbBrilgnHjoKakyoYySpz
         7BsbbUVapnLUeHojTHGQ2H+RZdwK6OKMX1mlrCYzYmpi7C2T249QvAWkla2EDsBX73vc
         sYu2XoenYyh5xZdnzZ4Bj75ngsLbPCC3SuS+2IBdvrmte31TeiDsZJovSoSNLXx/yiPd
         9Zgg==
X-Gm-Message-State: AOJu0YxP5faCrV4IgNIssRneAtbRVid/V+ewduwB8qq6+17qbOXhdEqK
	kmFwvuT6wohpccOaSSD/ZeBAwdrYOPYWhWJw5Yx0wnc6T8h3Ose32MmNSsCsoBP2YF+Ah1LLQWh
	xialbajrG7QigCKJEeXwOn0P0cgkJoZk=
X-Gm-Gg: ATEYQzy4vwL3AP4eLc1PAD8ELdcB6WzjhWQGcb0cgJPaDtcQBn0zZhMvNgC7zrJEof9
	iwoB7PgYYRA2AHHxh25b331uLOH+5Z0ZGyDkQO/dj3QMRLIwsFfW3xYEYWO7pl/bYOe7i8IHnQR
	dF/p4RCEvdhl8uCKA4Gk1WKVDwyYkOQGs5AAdexKJN5mjF1Oh4PIgdQChDGFhCqt2LRbrIkV++X
	Bsz5NwgJt4vuyUwfMTz4Q+YNURo+ccasLSWfwp2ZU5utzARalZkAGf3ksm5SlMIqKe7dSCWHcpU
	/auC0cXn+hrXuPoMCWN4ug==
X-Received: by 2002:a05:690c:350c:b0:796:28aa:62eb with SMTP id
 00721157ae682-798d1f28e05mr99730057b3.32.1772921757500; Sat, 07 Mar 2026
 14:15:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com> <abdb92236f1ac104a31051d71890afeec6ba566b.1772805096.git.stefano.tondo.ext@siemens.com>
In-Reply-To: <abdb92236f1ac104a31051d71890afeec6ba566b.1772805096.git.stefano.tondo.ext@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 7 Mar 2026 15:15:45 -0700
X-Gm-Features: AaiRm519SJEHf45FO0Qu_-a13KyELZEdn3bByCx8J4bnaj6ihodUY78HMCDtBGY
Message-ID: <CAJdd5GYSyvkGrchQE20ADK=ubOyB=cOYYE9YdVcEcSmr5-mN_w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v7 03/10] spdx30: Add ecosystem-specific PURL generation
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, joshua.watt@garmin.com, 
	ross.burton@arm.com, adrian.freihofer@siemens.com, Peter.Marko@siemens.com, 
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232620

On Fri, Mar 6, 2026 at 7:00=E2=80=AFAM Stefano Tondo via
lists.openembedded.org <stondo=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Add a function that identifies ecosystem-specific PURLs (cargo, golang,
> pypi, npm, cpan, nuget, maven) for dependency packages, working alongside
> oe.purl.get_base_purl() which provides pkg:yocto PURLs.
>
> Key design decision: Does NOT return pkg:generic fallback. This ensures:
> - No overlap with the base pkg:yocto generation
> - Packages get BOTH purls: pkg:yocto/layer/pkg@ver AND pkg:cargo/pkg@ver
> - Maximum traceability for compliance tools
>
> Detects ecosystems via:
> - Unambiguous file extensions (.crate for Rust)
> - Recipe inheritance (pypi, npm, cpan, nuget, maven classes)
> - BitBake variables (GO_IMPORT, PYPI_PACKAGE, MAVEN_GROUP_ID)
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 113 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 113 insertions(+)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 0888d9d7e4..11945a622d 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -13,12 +13,125 @@ import oe.spdx30
>  import oe.spdx_common
>  import oe.sdk
>  import os
> +import re
>
>  from contextlib import contextmanager
>  from datetime import datetime, timezone
>  from pathlib import Path
>
>
> +
> +def extract_dependency_metadata(d, file_name):
> +    """Extract ecosystem-specific PURL for dependency packages.
> +
> +    Uses recipe metadata to identify ecosystem PURLs (cargo, golang, pyp=
i,
> +    npm, cpan, nuget, maven). Returns (version, purl) or (None, None).
> +    Does NOT return pkg:generic; base pkg:yocto is handled by get_base_p=
url().
> +    """
> +
> +    pv =3D d.getVar("PV")
> +    version =3D pv if pv else None
> +    purl =3D None
> +
> +    # Rust crate (.crate extension is unambiguous)
> +    if file_name.endswith('.crate'):
> +        crate_match =3D re.match(r'^(.+?)-(\d+\.\d+\.\d+(?:\.\d+)?(?:[-+=
][\w.]+)?)\.crate$', file_name)
> +        if crate_match:
> +            name =3D crate_match.group(1)
> +            version =3D crate_match.group(2)
> +            purl =3D f"pkg:cargo/{name}@{version}"
> +            return (version, purl)
> +
> +    # Go module via GO_IMPORT variable
> +    go_import =3D d.getVar("GO_IMPORT")
> +    if go_import and version:
> +        purl =3D f"pkg:golang/{go_import}@{version}"
> +        return (version, purl)
> +
> +    # Go module from filename with explicit hosting domain
> +    go_match =3D re.match(
> +        r'^((?:github|gitlab|gopkg|golang|go\.googlesource)\.com\.[\w.]+=
(?:\.[\w-]+)*?)-(v?\d+\.\d+\.\d+(?:[-+][\w.]+)?)\.',
> +        file_name
> +    )
> +    if go_match:
> +        module_path =3D go_match.group(1).replace('.', '/', 1)
> +        parts =3D module_path.split('/', 1)
> +        if len(parts) =3D=3D 2:
> +            domain =3D parts[0]
> +            path =3D parts[1].replace('.', '/')
> +            module_path =3D f"{domain}/{path}"
> +
> +        version =3D go_match.group(2)
> +        purl =3D f"pkg:golang/{module_path}@{version}"
> +        return (version, purl)
> +
> +    # PyPI package
> +    if bb.data.inherits_class("pypi", d) and version:

I'm not really a big fan of bb.data.inherits_class. I think it makes
more sense for pypi.bbclass to implement a way to do this behavior and
set the recipe PURL when that class is inherited. Same for the rest of
these, and maybe the GO_IMPORT case above?

> +        pypi_package =3D d.getVar("PYPI_PACKAGE")
> +        if pypi_package:
> +            # Normalize per PEP 503
> +            name =3D re.sub(r"[-_.]+", "-", pypi_package).lower()
> +            purl =3D f"pkg:pypi/{name}@{version}"
> +            return (version, purl)
> +
> +    # NPM package
> +    if bb.data.inherits_class("npm", d) and version:
> +        bpn =3D d.getVar("BPN")
> +        if bpn:
> +            name =3D bpn[4:] if bpn.startswith('npm-') else bpn
> +            purl =3D f"pkg:npm/{name}@{version}"
> +            return (version, purl)
> +
> +    # CPAN package
> +    if bb.data.inherits_class("cpan", d) and version:
> +        bpn =3D d.getVar("BPN")
> +        if bpn:
> +            if bpn.startswith('perl-'):
> +                name =3D bpn[5:]
> +            elif bpn.startswith('libperl-'):
> +                name =3D bpn[8:]
> +            else:
> +                name =3D bpn
> +            purl =3D f"pkg:cpan/{name}@{version}"
> +            return (version, purl)
> +
> +    # NuGet package
> +    if (bb.data.inherits_class("nuget", d) or bb.data.inherits_class("do=
tnet", d)) and version:
> +        bpn =3D d.getVar("BPN")
> +        if bpn:
> +            if bpn.startswith('dotnet-'):
> +                name =3D bpn[7:]
> +            elif bpn.startswith('nuget-'):
> +                name =3D bpn[6:]
> +            else:
> +                name =3D bpn
> +            purl =3D f"pkg:nuget/{name}@{version}"
> +            return (version, purl)
> +
> +    # Maven package
> +    if bb.data.inherits_class("maven", d) and version:
> +        group_id =3D d.getVar("MAVEN_GROUP_ID")
> +        artifact_id =3D d.getVar("MAVEN_ARTIFACT_ID")
> +
> +        if group_id and artifact_id:
> +            purl =3D f"pkg:maven/{group_id}/{artifact_id}@{version}"
> +            return (version, purl)
> +        else:
> +            bpn =3D d.getVar("BPN")
> +            if bpn:
> +                if bpn.startswith('maven-'):
> +                    name =3D bpn[6:]
> +                elif bpn.startswith('java-'):
> +                    name =3D bpn[5:]
> +                else:
> +                    name =3D bpn
> +                purl =3D f"pkg:maven/{name}@{version}"
> +                return (version, purl)
> +
> +    # Base pkg:yocto PURL is handled by oe.purl.get_base_purl()
> +    return (version, None)
> +
> +
>  def walk_error(err):
>      bb.error(f"ERROR walking {err.filename}: {err}")
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232569): https://lists.openembedded.org/g/openembedde=
d-core/message/232569
> Mute This Topic: https://lists.openembedded.org/mt/118170494/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

