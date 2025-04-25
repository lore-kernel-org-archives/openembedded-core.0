Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20EFC369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 07:12:06 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.1667.1745565115652455946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 00:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E1aPRl5p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso10467855e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 00:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745565114; x=1746169914; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92r1rkUnZcJ/XrG2q2H1Y4A4eIta/hSnMfba92oh000=;
        b=E1aPRl5p2k02jPxq13YcceeZbgd3eVUor2IHeHwgvMHPYAlyYeh2qquIRaZ/b02+Pn
         HskQJBuIrnP4a8Gp8MPI1ud79S4S8W/g4Php26gA2Qw/UObsKNSNueVPi/VUBwWS+9Y3
         ftJYVbJen8TC14EtUBYqvJ/NKG/bZatmxo/PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745565114; x=1746169914;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=92r1rkUnZcJ/XrG2q2H1Y4A4eIta/hSnMfba92oh000=;
        b=L4J3opOvuAX+cfbOaaJ3V72qacLkmiPzRqyOhBPsXgBR9iebUlfOL1Gf28nnmXyTnj
         1Zsw7Zzxco4CxU862IlcfOekcseFz4JaHO4cYVeXKU68vYM3c9uSD6n11qhX+xYkNWx5
         zMO9nl/AM7HU1bA1mXm423tzg7EJ8KKrmUYiDZMYPPmghVcmTWbEveapJYQ6UBKOj8xi
         YsOnZqoWqYbWszVp0LjMZ64gKcZJQ5nPfy5VQ+P3GM0LdXNi5t4AY0O/4f4eT3rl3Sgk
         70vnZcnIySqzKkLi8vHaeB/gHBOWGC+EPwFXJKpMgT6wqqsxsYPZl0mik+puAHVyaC8r
         V4XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwEBVnDqL0JnLFiSt2HMLxwnEX6VbNG9ZcdGiIIGWJJQ1qEaK6JA1AZi9XJM6ZNe0HNA7q1PM255nj4YzgnuGGGA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxw90M7jEsWfQ/RfY2NF1wo8E95xrScwMpUDEppz7PM44oQf5ks
	ynNFHwFrCuXHDudPZuG+CysTuqXWJfn8fZMTO535s8rFUdr3EZhW4AT5VDpRlhA=
X-Gm-Gg: ASbGnctvH3wG0gJ7J9hT7qGJMAtAcx3fMnA89x0K4CtFlNNokHet4N+y6JyO6KXcQF/
	WClbEm099KKDKCwAFfECGkLIDr9h3qa1pt8z/3KI6KB92ghN8j6ack+OYE2OXEiscx02fza1QH5
	qif3fI+ZHT0zSJCprdE8tsisK3fMdw0avIgrY7SCBtzdrN1E4WHYtonWgk3MEUOUh4TF7mLEaym
	nE0oYFia8PEDIiw+edqNsTBrAy/qiXl3U7rTSP//sex7YhHQUzgmdskQTn/ZfkwrsdgQlOjHTk0
	1PFrjn+evExD21aZX8ydJ+5r1XBEMbRjrwUl9K30X/LcyhmtfxGQ/ixz5RcC8iRbuZx9Zz4/Kke
	q1T32T6W/DhIpPV8Q9w+qMqKSHWf4+g==
X-Google-Smtp-Source: AGHT+IGvUzjyOB1V6vqa49b5gnX+J4h5YpVrAZgigLcfDhm/Q4XJYPZ7q5Kfuq5BWb5Kiy6OMs0M7A==
X-Received: by 2002:a05:600c:1d97:b0:440:67f8:7589 with SMTP id 5b1f17b1804b1-440a66143f0mr10247345e9.16.1745565113859;
        Fri, 25 Apr 2025 00:11:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4b43:cc8c:5e78:12c1? ([2001:8b0:aba:5f3c:4b43:cc8c:5e78:12c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm14842535e9.7.2025.04.25.00.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:11:53 -0700 (PDT)
Message-ID: <434d8a287a4e2842c74b1d952583765688237f51.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2 v2] sassc: fix runtime version
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yi.zhao@eng.windriver.com, openembedded-core@lists.openembedded.org
Date: Fri, 25 Apr 2025 08:11:50 +0100
In-Reply-To: <20250425065438.377577-2-yi.zhao@windriver.com>
References: <20250425065438.377577-1-yi.zhao@windriver.com>
	 <20250425065438.377577-2-yi.zhao@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 07:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215431

On Fri, 2025-04-25 at 14:54 +0800, Yi Zhao via lists.openembedded.org wrote=
:
> The sassc_version.h should be generated from sassc_version.h.in. But
> there is already a sassc_version.h file in source directory. When ${S}
> !=3D ${B}, the sassc_version.h is generated in build directory, and the
> original sassc_version.h in source directory is not overwritten.
> However, the latter is used during the build, resulting in a missing
> runtime version. Remove sassc_version.h from source directory to ensure
> that the one in build directory is used during the build.
>=20
> Before the fix:
> $ sassc --version
> sassc: [NA]
> libsass: [NA]
> sass2scss: 1.1.1
> sass: 3.5
>=20
> After the fix:
> $ sassc=C2=A0 --version
> sassc: 3.6.2
> libsass: 3.6.6
> sass2scss: 1.1.1
> sass: 3.5
>=20
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
> =C2=A0...assc_version.h-from-source-directory.patch | 61 ++++++++++++++++=
+++
> =C2=A0meta/recipes-support/sass/sassc_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> =C2=A02 files changed, 64 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 meta/recipes-support/sass/sassc/0001-Remove-sass=
c_version.h-from-source-directory.patch
>=20
> diff --git a/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-=
from-source-directory.patch b/meta/recipes-support/sass/sassc/0001-Remove-s=
assc_version.h-from-source-directory.patch
> new file mode 100644
> index 0000000000..04f42d7322
> --- /dev/null
> +++ b/meta/recipes-support/sass/sassc/0001-Remove-sassc_version.h-from-so=
urce-directory.patch
> @@ -0,0 +1,61 @@
> +From b5d03d5313d4cc19a7e6e9ba5fd74d1f8400cd46 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Thu, 24 Apr 2025 21:28:55 +0800
> +Subject: [PATCH] Remove sassc_version.h from source directory
> +
> +The sassc_version.h should be generated from sassc_version.h.in. If the
> +build directory is out of the source directory, the sassc_version.h is
> +generated in build directory and the original sassc_version.h in source
> +directory is not overwritten. However, the latter is used during the
> +build, resulting in a missing runtime version:
> +
> +$ sassc --version
> +sassc: [NA]
> +libsass: [NA]
> +sass2scss: 1.1.1
> +sass: 3.5
> +
> +Remove sassc_version.h from source directory to ensure that the
> +sassc_version.h in build directory is used during the build.
> +
> +Also remove '--dirty' option from 'git describe' command line in
> +version.sh to get rid of '-dirty' suffix from version number that
> +was introduced with this change.
> +
> +Upstream-Status: Inactive-Upstream [lastcommit: 2020 lastrelease: 2020]

I think this is still worth submitting upstream since the rest of the
project is active and it may be this component hasn't needed changes
rather than being inactive.

I'd note "Add a deprecation message to the readme":

https://github.com/sass/sassc/pull/275/commits/0d4b8c835b79baa776a8636be0cb=
74ed4a969d64

which may mean we should look at what is using this in core and if
changes should be made. It looks like the only user is libadwaita and
the dependency is optional there...

Cheers,

Richard

