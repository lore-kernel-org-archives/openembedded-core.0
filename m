Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBA6C54EBE
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 22:32:41 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.71139.1673562756003585386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 14:32:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AspPku0Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id ja17so14190033wmb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 14:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8O1aRzO3iyomossijTxCT/lCQB0rRWeURf1sxUjUHmw=;
        b=AspPku0YzfbqrLLK5wfk22BtRY1H7vWqCp/Z8CCGpXqk2q2ezvz0tmwqxuFX83xjCr
         lskg1MaDQX9WSm4gXHSWyzhApLl5jamGGQ5QKMuzl2uTsoL8fBgYEqPvgp7WKjvS8Xx/
         jAVch3X00E5TC0o4xOg0/7bTl93kE43s6naw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8O1aRzO3iyomossijTxCT/lCQB0rRWeURf1sxUjUHmw=;
        b=SNxYfwifeVsHTFR1PwAw/3gmQjTTiOnI6m6gR4p/rwxi/okhUnjt+1cFVdta/bZEeD
         SKp4FZ3Mziscj7DtJ0UBolJmVNMq2qS/BcZf8/iHTx3b10LS8K6ZKi2+dWn6a/d51cwn
         Dv2xJLAtAYnnZloqbioz4ZCd2QRoQXLX2eLLY0dKEniEzMtVfLl0rafhuMtkGMwiRbHs
         gDYNXcSfQmUj4bUzH56ZeEW8i9Nf5OSeQigxJqWvmyb179uD7NOPU6Bbtw+QINfk8Drj
         jBe2qJTsrFdMItUsSfkWDDMd5N59w76uz+8jQFZJv3lMSErc+1Ux6cSvj8Ka9Uf8ipVO
         K2/A==
X-Gm-Message-State: AFqh2kqLwC9wme82qHMBosfSIheZlQqIKhI84YEkMjw90xuuDVnGW6Ea
	2sgbsewJPY+pBzY0cwT5dFR6DQ==
X-Google-Smtp-Source: AMrXdXsBC8or1rJe9mP1gYytPZKcfBM/cDNCcFmYbz3g4bhpxkvyj59tI2JMg6K0lB914dJlumWKMw==
X-Received: by 2002:a05:600c:4fd4:b0:3d3:4877:e556 with SMTP id o20-20020a05600c4fd400b003d34877e556mr59097021wmq.29.1673562754188;
        Thu, 12 Jan 2023 14:32:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:615d:b1e6:6cd2:7fd3? ([2001:8b0:aba:5f3c:615d:b1e6:6cd2:7fd3])
        by smtp.gmail.com with ESMTPSA id i8-20020a05600c354800b003cf894dbc4fsm25111824wmq.25.2023.01.12.14.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 14:32:33 -0800 (PST)
Message-ID: <a956c7ec6640cfee5bebb41720beec74e8b663cf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package_rpm: allow arch overriding
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sergey Zhmylev <s.zhmylev@yadro.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2023 22:32:18 +0000
In-Reply-To: <20230112213301.11768-1-s.zhmylev@yadro.com>
References: <20230112213301.11768-1-s.zhmylev@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 22:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175807

On Fri, 2023-01-13 at 00:33 +0300, Sergey Zhmylev wrote:
> From: Sergei Zhmylev <s.zhmylev@yadro.com>
>=20
> Currently arch is being calculated from either MACHINE_ARCH or
> TUNE_PKGARCH.  Some recipes do override PACKAGE_ARCH intentionally.
> This commit makes possible to override ARCH for RPM packages
> separately in order to simplify common rpm naming conformance.
>=20
> Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
> ---
>  meta/classes-global/package_rpm.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-globa=
l/package_rpm.bbclass
> index 85d0bd7fce..3fb7466778 100644
> --- a/meta/classes-global/package_rpm.bbclass
> +++ b/meta/classes-global/package_rpm.bbclass
> @@ -678,6 +678,10 @@ python do_package_rpm () {
>      bb.utils.mkdirhier(pkgwritedir)
>      os.chmod(pkgwritedir, 0o755)
> =20
> +    rpm_arch_override =3D d.getVar("RPM_ARCH_OVERRIDE")
> +    if package_arch !=3D "noarch" and rpm_arch_override:
> +        pkgarch =3D rpm_arch_override
> +
>      cmd =3D rpmbuild
>      cmd =3D cmd + " --noclean --nodeps --short-circuit --target " + pkga=
rch + " --buildroot " + pkgd
>      cmd =3D cmd + " --define '_topdir " + workdir + "' --define '_rpmdir=
 " + pkgwritedir + "'"

This makes me very nervous. PACKAGE_ARCH can be overridden and I know
of BSPs which inject a whole new level of architecture into the system
but they don't need to make rpm backend specific changes to make it
work.

If we were to add such a thing we'd need a much clearer picture of when
it should be used and why it is needed. Wouldn't all package backends
need to adjust this?

Cheers,

Richard

