Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345BCC4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 16:38:10 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.16393.1704904686877436018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 08:38:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dyQlwI0q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e4f692d06so12727755e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 08:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704904685; x=1705509485; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUF3FNtuGvgl3B07CpGRX9TgnUP/4XCu27geJfrE8SA=;
        b=dyQlwI0qp8F8DUH/tmQjunlKJoks0gdJENt9N74xHSmsYyhZCQjJto5k6W3OokV3Gj
         QQF4UFtZPO1gWTEGRMo5sDQdjJTA2t9IqeYUSApzrlg1TAOG7H34CwG9ChtdrQzfs+ot
         WLjnUOSYAmObFOw4GP1pUwaRCNduh58mJzpm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704904685; x=1705509485;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RUF3FNtuGvgl3B07CpGRX9TgnUP/4XCu27geJfrE8SA=;
        b=orhYJCGnPDuIUR4j5S5Si4S/V8/ef4qZZlC/Ejlxn9GtSeAij+QjdAs7Eh2TR2RZhK
         yiHlCSiIuLFgCdv0RNeQSncqNWQnq9wnHPk3uhqHNpx4cd4NaI9qb4Zs5l3l15yINO8R
         9DboL9nlG1a4XO47MdVaB2UlpImODEmPaMM9umH5ycI6MVCaPLMLlVGPo5uDnaS48oMG
         vvAqnCNu5VAPAm3cY/ag2yOlD/cqdA4s7QXgcFYyN2qKSwnkC3Vd9/JhFz3yLufwTXIU
         5jKyTpR4/Wk3PoQa16HJFmShJhcSE7NWH8PPRD1sNBFkQ1W+yF+nbq5/ie1h3v5NpL90
         YIUQ==
X-Gm-Message-State: AOJu0YyUWPvcACshrW+SjTxRJQ4SLyK18wEPChx9RBYVEw8w8to6Qhwn
	EEugiIym7W5pA9AYF3Ns/IqC8Zr6EMzB9ATVRg9eNyToPLs=
X-Google-Smtp-Source: AGHT+IFhb1dry3elQnsepxdShCU8E27/zCU6iUPQ3z/rcSi/BkF20zBeoOcAn5IyxckOhFD35JokgQ==
X-Received: by 2002:a05:600c:470e:b0:40e:4519:f450 with SMTP id v14-20020a05600c470e00b0040e4519f450mr198301wmo.46.1704904685173;
        Wed, 10 Jan 2024 08:38:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd40:945a:4f08:4810? ([2001:8b0:aba:5f3c:bd40:945a:4f08:4810])
        by smtp.gmail.com with ESMTPSA id g16-20020a05600c4ed000b0040d3db8186fsm2756540wmq.5.2024.01.10.08.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 08:38:04 -0800 (PST)
Message-ID: <cf4d74d6018223097d3e74ce3120d84422037bde.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] package_rpm: proposal to use internal
 dependency generator
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 10 Jan 2024 16:38:03 +0000
In-Reply-To: <20240109075641.993044-1-xiangyu.chen@eng.windriver.com>
References: <20240109075641.993044-1-xiangyu.chen@eng.windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 16:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193516

On Tue, 2024-01-09 at 15:56 +0800, Xiangyu Chen wrote:
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>=20
> Currently we are using external dependency generator, the rpm upstream al=
ready
> marked it as "Old Style Dependency Generators"[1], they also added a warn=
ing message
> in rpm source code to inform that the external dependency generator is de=
precated[2].
>=20
> Since it is only kept for backwards compatibility and may get removed in =
a future
> release of rpm, so here is a proposal to use internal dependency generato=
r by default.
>=20
> [1] https://rpm-software-management.github.io/rpm/manual/dependency_gener=
ators.html
> [2] https://github.com/rpm-software-management/rpm/commit/cfcdd942
>=20
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  meta/classes-global/package_rpm.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-globa=
l/package_rpm.bbclass
> index 2fc18fe98c..05cecee7d7 100644
> --- a/meta/classes-global/package_rpm.bbclass
> +++ b/meta/classes-global/package_rpm.bbclass
> @@ -681,7 +681,7 @@ python do_package_rpm () {
>      cmd =3D cmd + " --define '_topdir " + workdir + "' --define '_rpmdir=
 " + pkgwritedir + "'"
>      cmd =3D cmd + " --define '_builddir " + d.getVar('B') + "'"
>      cmd =3D cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RE=
LEASE}.%%{ARCH}.rpm'"
> -    cmd =3D cmd + " --define '_use_internal_dependency_generator 0'"
> +    cmd =3D cmd + " --define '_use_internal_dependency_generator 1'"
>      cmd =3D cmd + " --define '_binaries_in_noarch_packages_terminate_bui=
ld 0'"
>      cmd =3D cmd + " --define '_build_id_links none'"
>      cmd =3D cmd + " --define '_source_payload %s'" % rpmbuild_compmode

This will not work since we have some significant use of the external
dependency generation elsewhere in the codebase. I'd also not that
message was from 2016, so probably not urgent at this point.

Cheers,

Richard

