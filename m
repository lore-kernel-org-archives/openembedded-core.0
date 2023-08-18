Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECADAC71157
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 14:27:42 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.12598.1692368858601346962
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 07:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=FOdzX/Vu;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9936b3d0286so127947766b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 07:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692368857; x=1692973657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBvBmV1LzswRox0HVJvDxQl/QzBwCFegwB4SQ6xfCPM=;
        b=FOdzX/VuCvom7C/ICIpAqcyUM5CZeAtcbHrcBaTZQr3hyVdVGi5OWhkq/xTCcguMZ6
         CWbi6sZjhH+DhTuzl4vSflGP8aYjb6a6o6ACgUWCN0GbZ+4XJCmUjMVkVuDaRS9oE8jz
         c0c1yrOUc1qBTcVeLl/r5ivSRe3r9uQDLbIAtFaSfjAzZOMZSePViuEKTIV7D9TlYt0G
         7n8u9IL1IsFRi+Yv1epVAYx6SZW5VKBt/AGPQY+MGE6gacmEgJDrWcqmbeO83lukYSbm
         dAum5RZv0yuXDJnOJLk9FqXVkIba2GdFfNsGVKCB7uAduia9iplMWURAnMIDEUxOSBVs
         BJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692368857; x=1692973657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBvBmV1LzswRox0HVJvDxQl/QzBwCFegwB4SQ6xfCPM=;
        b=At9nN8XirL/UbiOT6cKVFHojWPuZwpHoO2xizYNr6fRImqVO/rubvkOdOjt69FdElP
         pl+AniKm8PBC0ItFjAe4zLh3lo9bFcLGdxKEKa5HnYK5/VUSDMBHIHkIGwngqp5XFUll
         Qt29/NpS63foCWsxteJnaZWWKN1F8pf1YBiNIVXcRADyb/Jk5F++fyj3XZdgz/pHQOul
         cV6ghuf24E30e9K6sqd5cZkRJoMmHsnutIsxIMuRSY60xbRtRmXmijyZohxmC/Qca03G
         zsenQ6DHJucx3UM04U9KpY6MdsNfMhp7xmuMcCjmzMh2cK3KPrju+bhm63rm4r8D63Hw
         KZWQ==
X-Gm-Message-State: AOJu0Yz3j1GV28V5nKuKkiyMd+FIMBqgh7dB+D6zEOqfZF6cUhyNAyXz
	Jx3770846KDUW+6bxMqhvZlI5feAfqcCDv6FF0YqkQ==
X-Google-Smtp-Source: AGHT+IEogvBLESmxdOyC55cDP8B+8zmSJttW8HCuRtgDzkvclcqK9Xgc15XtE4UYMTX5WE5rb5Cuxs80whfyGTTz2yc=
X-Received: by 2002:a17:907:2c41:b0:99c:a93a:432f with SMTP id
 hf1-20020a1709072c4100b0099ca93a432fmr1900397ejc.1.1692368856650; Fri, 18 Aug
 2023 07:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230817125226.1455928-2-eekmecic@snap.com>
In-Reply-To: <20230817125226.1455928-2-eekmecic@snap.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 18 Aug 2023 04:27:25 -1000
Message-ID: <CAOSpxdaU=jU2cBkO-OmWH+o704eo7aud9CmWbV6pg4JGnA7VYA@mail.gmail.com>
Subject: Re: [[OE-core][kirkstone][PATCH] Add GCP fetcher to list of supported protocols
To: eekmecic@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 14:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186374

On Thu, Aug 17, 2023 at 2:52=E2=80=AFAM Emil Ekme=C4=8Di=C4=87 via
lists.openembedded.org <eekmecic=3Dsnap.com@lists.openembedded.org>
wrote:
>
> From: Emil Ekme=C4=8Di=C4=87 <eekmecic@snap.com>
>
> Requesting a backport of this patch to Kirkstone to support use of
> the GCP fetcher internally at our company.

It is against stable branch policy to add new features, so I'm not
able to take these two patches.

Steve

> Signed-off-by: Emil Ekme=C4=8Di=C4=87 <eekmecic@snap.com>
> ---
>  meta/classes/own-mirrors.bbclass | 1 +
>  meta/classes/sanity.bbclass      | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.=
bbclass
> index 30c7ccd8e7..2fffc78d19 100644
> --- a/meta/classes/own-mirrors.bbclass
> +++ b/meta/classes/own-mirrors.bbclass
> @@ -12,4 +12,5 @@ ftp://.*/.*     ${SOURCE_MIRROR_URL} \
>  npm://.*/?.*    ${SOURCE_MIRROR_URL} \
>  s3://.*/.*      ${SOURCE_MIRROR_URL} \
>  crate://.*/.*   ${SOURCE_MIRROR_URL} \
> +gs://.*/.*      ${SOURCE_MIRROR_URL} \
>  "
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 293e405f62..6463321913 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -867,7 +867,8 @@ def check_sanity_everybuild(status, d):
>      mirror_vars =3D ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
>      protocols =3D ['http', 'ftp', 'file', 'https', \
>                   'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
> -                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', 'az', 'ftps',=
 'crate']
> +                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3', \
> +                 'az', 'ftps', 'crate', 'gs']
>      for mirror_var in mirror_vars:
>          mirrors =3D (d.getVar(mirror_var) or '').replace('\\n', ' ').spl=
it()
>
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186315): https://lists.openembedded.org/g/openembedde=
d-core/message/186315
> Mute This Topic: https://lists.openembedded.org/mt/100799584/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

