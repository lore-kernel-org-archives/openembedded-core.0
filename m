Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8598EC4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 17:18:23 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.208824.1672334293861465510
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 09:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LC+CRgiY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id bg10so13591110wmb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 09:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JWV0aCwgEZrs1ySqlj9pAurLUUsQaupUNeYXAxYoPTA=;
        b=LC+CRgiYSBtYv2UMmjO9l5QipmMm5BnpxMC1O1nl7SPytrCU2LvLxPHZIRidTZd2if
         ICjndIAAW7E3ixZNVb1a8oe4Chyskm68+NRP8n+RSafnS58fAfLnJhCdfNSTp5dvc1jl
         85dbPeDV4Pjp4KSUq9tllp1Iztj+WkdwXOf0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JWV0aCwgEZrs1ySqlj9pAurLUUsQaupUNeYXAxYoPTA=;
        b=ejOLZmmDMU4Oh0tX7XgmM1ZkQgt9kMAEUxsJeX3gkZhxBDQ5BgJkpC6Gqo386pfmfP
         t/znqTvZz0Rwj9CArD/zMBnZfdeaBbIpMPa9hXHUTG3x3I0SI1x3uMboah1L3VMAflhN
         FozBzP8oakGFAhlzqUazRiQR3WVvA8AQ3CalZoxvK0ay6svQ5fzqFQFl4m0RS2Fcrmr5
         4J67NM6U6pwyl6V2TyL5DmMZTASR4hV+/rq2aQdabTHdpUD+kjuZVazncJ3j1oZOpXKi
         mVWlfTgHuZhLAMWT4Uv8aQwrQtYKrob1AuI1O6qKK1MdRG3YqF6+oDR2HSUMyqy8AAvg
         SA+Q==
X-Gm-Message-State: AFqh2ko6yUhV3jesJdKy3Nzbnin20R21zKxzc4CFOlZBA52qzY9Xq+Ak
	qQlyMryvWYV063SJ2oUXGLDptw==
X-Google-Smtp-Source: AMrXdXtBHL7D1vn71NpdTyMCKt26y3mZoo4WmSBVnJItXgBimTWU4KpciHAT/q5ZCLE0TMbVVAgwuA==
X-Received: by 2002:a05:600c:4fcf:b0:3cf:68f8:790b with SMTP id o15-20020a05600c4fcf00b003cf68f8790bmr21320960wmq.11.1672334292288;
        Thu, 29 Dec 2022 09:18:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:43af:59a1:5bcf:54fb? ([2001:8b0:aba:5f3c:43af:59a1:5bcf:54fb])
        by smtp.gmail.com with ESMTPSA id n36-20020a05600c3ba400b003b49bd61b19sm31454218wms.15.2022.12.29.09.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 09:18:12 -0800 (PST)
Message-ID: <8d3ef066511b1bcec928822519aa7986f0bb0184.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/10] devtool: process local files only for
 the main branch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Thu, 29 Dec 2022 17:18:11 +0000
In-Reply-To: <20221229160110.255775-1-alex@linutronix.de>
References: <20221229160110.255775-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 17:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175123

On Thu, 2022-12-29 at 17:01 +0100, Alexander Kanavin wrote:
> devtool modify/upgrade are not currently equipped to handle conditional l=
ocal files
> in SRC_URI, and provide only the main no-override set in a workspace unde=
r
> source/component/oe-local-files/ (this is done via meta/classes/devtool-s=
ource.bbclass).
>=20
> On the other hand, updating the changes from workspace into a recipe
> is run iteratively against all overrides; this works for patches (as they
> all are directed into their own override branches in the workspace
> git source tree), but breaks down when trying to match local files
> in a workspace against local files in overridden SRC_URI lists, resulting=
 in
> bad recipe breakage.
>=20
> Implementing multiple sets of local files is significant work; let's for =
now
> simply not touch local files in recipes except when on the no-override va=
riant.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  scripts/lib/devtool/standard.py | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
> index f46ce34ad1..f3349f98e9 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -1409,6 +1409,18 @@ def _export_local_files(srctree, rd, destdir, srct=
reebase):
>      updated =3D OrderedDict()
>      added =3D OrderedDict()
>      removed =3D OrderedDict()
> +
> +    # Get current branch and return early with empty lists
> +    # if on one of the override branches
> +    # (local files are provided only for the main branch and processing
> +    # them against lists from recipe overrides will result in mismatches
> +    # and broken modifications to recipes).
> +    stdout, _ =3D bb.process.run('git rev-parse --abbrev-ref HEAD',
> +                               cwd=3Dsrctree)
> +    branchname =3D stdout.rstrip()
> +    if branchname.startswith(override_branch_prefix):
> +        return (updated, added, removed)
> +
>      local_files_dir =3D os.path.join(srctreebase, 'oe-local-files')
>      git_files =3D _git_ls_tree(srctree)
>      if 'oe-local-files' in git_files:

Is there something we should be adding to the devtool tests to cover
this issue?

Cheers,

Richard


