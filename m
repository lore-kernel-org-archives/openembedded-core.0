Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B373EE83F1F
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 13:58:17 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20908.1770213488006680673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 05:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KHEwk6vd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-480706554beso75876445e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 05:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770213486; x=1770818286; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YSpQDovYda/yAUGxNOhZopykKbrEeANYLPV3kp3ELXc=;
        b=KHEwk6vdm0nVFkYPxtiHHvGO75FITsYJ5SgcQlq0ie1y7e9ZtkyLRlNNdv8ELtdLFl
         SODXktt2jcDBiV1Hyi5PPt2h/6YXTuTUsrv6MB00fD4FVjGykb7M0HUOZ8Wub2QqKrA6
         PLssO5lX+Zp1HJiLkLv+KRscIp2hmQPFFyGHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770213486; x=1770818286;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YSpQDovYda/yAUGxNOhZopykKbrEeANYLPV3kp3ELXc=;
        b=cVs3wwaj4FD3nmRQku7rd9N2g6Cg2oFw6HWNetUea9HyeNQCUEWhqcl7viSlexLNtS
         yFdeFTLqezrX5LUJqiGdTnrt0n+jzqA9VzZJRzZJ18dP2/9FdXP9TgnTyeZ95/bSTNiv
         qcqfhjigB6x/H9RXAELeSlBBQ5smzqyxJ93EnA6moVUvPEd4lJmyDryZrx5Zk0i3KtKf
         UBCAq+4kIDNAKw/zGoIJRsp1YR9DBVjqckxcExK7AvgHRzuHGQtT4iXQ0eUYjE/Z9UG1
         UKHEGZ5632SlJyQJXeuESlKx4R0BBLSTVE7MDug1u7Sa5hDjeXTIqt8HkaRuplj2ncfO
         RhPw==
X-Gm-Message-State: AOJu0Yzdde0v8Pf5qQEJWnTnJgn7YMoeKHsHJd0BMaq3TGR3VShFD1Hm
	qoH7Ph9K2W472BswO+Jv1zi/roUxaFCrNFY3/E5sodch6GNEqwgcPI9d4jUlkDSYrd51GpuwqW7
	1J2T87l1YyA==
X-Gm-Gg: AZuq6aLpVGuBlr02bPHOigOHRpXv7jACwOtMEqXEmtPSKmdovZn1MvekA68JRmJGKYH
	NsEBsYhJfUn6hG6Hq2Z+z/gY5xAuoK6x+YfkQz1/6xtHzntdOXTKdWpRewuYpUGmNEg0ibXKllo
	gd7feSQiYiR5b32HQPgFwfwt+1qX3WKNvVpK3DViEMqTy1cCe6UpM4XJ1C4+dWqTpN6TnkhiqnQ
	xCHXszg/D8usPpqDmR3Lii7/Y8GU0oSUqqGA+vTUoSKddFJMAC2gBHeBoGSl19GqJmCwRADoI/Z
	y40RCAKXbFgNQEGj8Y36mY/AoEpvwSBiENtaTbg0nv0MwxbBFqFyFDg8itq2WNgsCQxByyveP65
	j+9iij7p/ZzmfOlYhxk2p3XUkbKZ/Yl6Ocll9NGDRxWw6j354BzD8vt86w3uSznnExs7GYyY5yZ
	raUzssVt9LVeu7bldob+zwzuEK1ir4QImwbutFi42Hi15iw6KGiyqRSA+vzDKpfFZ2gETRUkFh/
	za8nXsZvTjZPw==
X-Received: by 2002:a05:600c:34c3:b0:480:1a3a:5ce6 with SMTP id 5b1f17b1804b1-4830e93ddd9mr42169255e9.14.1770213486195;
        Wed, 04 Feb 2026 05:58:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac04:f180:6f5c:7b1d? ([2001:8b0:aba:5f3c:ac04:f180:6f5c:7b1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4831084dd88sm47149915e9.6.2026.02.04.05.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 05:58:05 -0800 (PST)
Message-ID: <71fa18fd1ae7612c9d3f8161c6aeb2575d22e280.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] module.bbclass: check whether CONFIG_MODULES
 set
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com, kai.kang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 04 Feb 2026 13:58:04 +0000
In-Reply-To: <CADkTA4PZ9df8xCge6F+m4M02OTXbiOhYJ7S7hPvze95ah5BWDQ@mail.gmail.com>
References: <20260204020908.864912-1-kai.kang@windriver.com>
	 <CADkTA4PZ9df8xCge6F+m4M02OTXbiOhYJ7S7hPvze95ah5BWDQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 13:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230529

On Wed, 2026-02-04 at 08:46 -0500, Bruce Ashfield via lists.openembedded.or=
g wrote:
>=20
>=20
> On Tue, Feb 3, 2026 at 9:09=E2=80=AFPM Kai Kang via lists.openembedded.or=
g <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
> > From: Kai Kang <kai.kang@windriver.com>
> >=20
> > Check whether kernel config CONFIG_MODULES set or not before do_compile
> > and do_install in module.bbclass. If not set, it cannot build and
> > install external modules.
> >=20
>=20
>=20
> This isn't the place to do that check.
>=20
> If modules are disabled get modules_do_compile out of the tasks.

Does it make sense to have something including module.bbclass which
doesn't have CONFIG_MODULES set?

Cheers,

Richard

