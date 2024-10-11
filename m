Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC94CFD342
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 11:02:29 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.8915.1728644544938326030
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 04:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B0nEzFi2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-430f6bc9ca6so14759895e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 04:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728644543; x=1729249343; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JXntG8ce4z1QyBcN/n40lJMVCTcpyH0iF8Qalq/6n7E=;
        b=B0nEzFi29wPSZH6EntrQLVoLoRmnyYKvJyoNz4ODfvuXhk4wyRedeuykRrSf8H6Nru
         SVvBf18i51GQUcq8McTHwySTukFLEmXbtAiql7RAI9AofEJc9Df1z44GSPs//3MahI+3
         VvCbKPeGxJ/fYLmeiZQ2q+5pg9kOnVMdc9RLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728644543; x=1729249343;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JXntG8ce4z1QyBcN/n40lJMVCTcpyH0iF8Qalq/6n7E=;
        b=KB3T4aS8fQnOBHGOWlj5tRkf7SnWkSNKwY9Udsoe6cvw7Vo8muOKR8fjGcsukQd/99
         UFUa00WixCrAVTZB7D24S7fXu83HUCA3LDKhBEPK76UfKmt2eWXxThb+96eeBAs83LT7
         eEFVfs3e7x6V04hZpRk5T57XX/ykh2N+tVRExTwcO2dI8TfvWj34pyf48pz4FHXNwyAE
         HVtc/KEjGKODQRsAlpcPG3Hfp5g2AO1tu2XXZBpNlPr0q05Qhx9YMD8euictcD17jkQk
         ahb1w7Do+LdAjy4EfV/0zUas5l19q4eS0zs5q1B6MJyFqfYPImjtx/cX6VbW/heh/Ya+
         wFHA==
X-Gm-Message-State: AOJu0YzcM2XyI2HKqqdfEBpEXIY++IlHTPfG9ffVpKZf8bJWkR3btdTZ
	r+XINf4NrUjUw9tBU2UjsjnYqJueBQLG+c21BjsjZnRbXjGoOSoygxK0WyJwV47O/FDMvAYIwJd
	R
X-Google-Smtp-Source: AGHT+IE2/B392GLCH6UMKPRBTg7Ft3RX+4/6Wxnya6VeCo89ZOGAwvsnA/6/GRRjx+RJeJlEQniEUg==
X-Received: by 2002:a5d:6089:0:b0:37d:3115:9845 with SMTP id ffacd0b85a97d-37d551c0884mr1443425f8f.18.1728644543084;
        Fri, 11 Oct 2024 04:02:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8145:ba6d:a6de:28af? ([2001:8b0:aba:5f3c:8145:ba6d:a6de:28af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a881bsm3669400f8f.16.2024.10.11.04.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 04:02:22 -0700 (PDT)
Message-ID: <8281d9cb51a5e652f99ed998fd71c7b6a84e1e63.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-check-update-nvd2-native: Incremement
 DL_DIR database location
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>, Steve Sakoman
	 <steve@sakoman.com>
Date: Fri, 11 Oct 2024 12:02:21 +0100
In-Reply-To: <17FD60BEC9A54A4B.2207@lists.openembedded.org>
References: <17FD60BEC9A54A4B.2207@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 11:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205669

On Fri, 2024-10-11 at 11:56 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> We're seeing a lot of sqlite database corruption issues in our automated
> testing. It is unclear why this is happening. There were process
> imrpovements implemented in master and it is unclear if older releases
> are somehow making those changes ineffective or if the problem is
> elsewhere.
>=20
> By changing the location in DL_DIR, we split the two sets of accesses
> to be separate and can isolate whether the master changes really did
> improve things or not. If successful, we may consider backporting those
> changes to the stable releases.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> =C2=A0meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/reci=
pes-core/meta/cve-update-nvd2-native.bb
> index 2d23d28c3e2..a7e568e3079 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -34,7 +34,7 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?=3D "10368000"
> =C2=A0# Number of attempts for each http query to nvd server before givin=
g up
> =C2=A0CVE_DB_UPDATE_ATTEMPTS ?=3D "5"
> =C2=A0
> -CVE_CHECK_DB_DLDIR_FILE ?=3D "${DL_DIR}/CVE_CHECK/${CVE_CHECK_DB_FILENAM=
E}"
> +CVE_CHECK_DB_DLDIR_FILE ?=3D "${DL_DIR}/CVE_CHECK2/${CVE_CHECK_DB_FILENA=
ME}"
> =C2=A0CVE_CHECK_DB_DLDIR_LOCK ?=3D "${CVE_CHECK_DB_DLDIR_FILE}.lock"
> =C2=A0CVE_CHECK_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_FILE}.tmp"

I now do have an example of a corrupted database:

https://valkyrie.yocto.io/pub/shared-failure-data/nvdcve_2-1.db

I'm not sure why this is happening but the older releases are all
accessing the DB over NFS which makes me nervous. We're seeing a lot of
failures on the new cluster, hopefully this will help isolate the
problem.

Cheers,

Richard


