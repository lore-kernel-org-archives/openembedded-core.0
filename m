Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9935DC5DF88
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 06:30:51 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1841.1787293850221469792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 23:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iQPyRaiT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4957eefd361so4176215e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 23:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787293848; x=1787898648; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aU0zex9giuFPE9TthPEC8aSlXCuYnNcGYTh/UA9LLto=;
        b=iQPyRaiTyaisqqQZm6oZnWoXnHsp300g7F4Cka7RfHkJCH5/cMehudIQgY7A+iUYKk
         wBtEEMQ1KVoF/u6Z3OuuoyfxNzmGI9Z9oj3USGBFbUiFMuxh5C62KKJFtomtFZMfPKUA
         xSV3oKVwHwsfIxG29g9WWUpXj/3jL0U2cMs70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787293848; x=1787898648;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aU0zex9giuFPE9TthPEC8aSlXCuYnNcGYTh/UA9LLto=;
        b=fFYx5Jz4EJDZrzKn4Xt4S5wYgOvOmJ0DcNY7lmqHO44/oTj1hUnGlP6kiwlmiFyHKQ
         OxvVFIwHhI5TQHi/hLl/EyKsqkt624OKxyCuA5Dwpb6bE0WNsqejg6kyzaC/Sj6CGALd
         GRClvG0gIhcuz/0Iy0UlpYdjiCDy+bP8HSBoQ32n3TxWj/QAVNOLe/mrV+N+GyOQd/yX
         gMdmKLNQk/jpCErNQRBy9tcgPv6gycyCeCtzNdEjeKtZ+svAXHv3UUYeVet0oN48FvmZ
         /I2LBrGX78bFCc1FqNnMVGEw3QoBg+DVTF4QRRqyhfEZpgEAeXK7aFp+8m3pBgoeIMPJ
         GiIw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1BG0EEDHuqUpgzKZi+ODGh+sfCt4wIghaYj4k0sOZzgekaGz6a2c+e0Bc/RmtBnPGwP4Zxl8cxNcsoadlPdSg+w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwO3Y6Kcg5B3vZQNtXkOPzdHmjMmZy4zb6XEnnB3GkEV/nSS+aD
	zVHcjgthPYAX8VkyFZ4WpiKergzRsncuIFVoCS1ocD8bAK78Teuh1MhhmFJAqetCygA=
X-Gm-Gg: AR+sD1155AiRRpTv+ITDc8JiL53Mw2DZICXVUU6DEyiLAzugNwSXfIYvivcviw86lhD
	V8/hlUFHqqXE7rdoJDfsIxMkAcOlWT7iPWQvF6Wkqu3PQ/m+UfzbTfEhdQLdMo6pdoRNtMDj1WX
	w6UrD6yQMeU+bBnxdR7+nj7TlwWDG+l96uMnxgK2oKVtH/WLMZLo/ptTKRbEQw3vXCoKRm5gLWf
	H1Gvo3j5wyoGUVl5nLaPM3TK/wGK4P99FQ54Bxu8w4CgZs037okC0ReujC1+Ego9YYhVUGyqDIS
	hiZShb+vdJ5gyZWQ36I4iCVzg5zzbjHv553Zzvo8zBNzHOurCcpi904WZ0SOysts0G0v2zoJfRh
	rh0o4KS1E0yOBAGBeIjcu/gjK6c/fDfcjDSpCuOfF/GOEVw4BNFiGC8qBmS0fRn/AtSrYDLEcJe
	HVNCqR2GNKpR9GwxJLs7VnvdZx2JdrfMkVsYncvzh1FHhvI/7ebhzQOdjz3xRKek46m8AyjEt5N
	kQwgck+LtGIfXeU3w1azv6QGUOwxCXTKiFXikutpi7l9hdnHdq8iQ==
X-Received: by 2002:a05:600c:a087:b0:499:84fe:5f3e with SMTP id 5b1f17b1804b1-499b8461384mr63248455e9.9.1787293848464;
        Thu, 20 Aug 2026 23:30:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e5fd:eed9:eff8:d030? ([2001:8b0:aba:5f3c:e5fd:eed9:eff8:d030])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9ae6d91sm8787875e9.1.2026.08.20.23.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 23:30:47 -0700 (PDT)
Message-ID: <a63d458443daeedcb04fccbe9a9b07209ca77949.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] elfutils: upgrade 0.195 -> 0.196
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 21 Aug 2026 07:30:45 +0100
In-Reply-To: <20260819105724.61332-1-jaipaul.cheernam@est.tech>
References: <20260819105724.61332-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 06:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243894

Hi Jaipaul,

On Wed, 2026-08-19 at 12:57 +0200, Jaipaul Cheernam via lists.openembedded.=
org wrote:
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
> Changes in v2:
> - Install libdw.a for ptest (new elf-from-memory test needs it)
> - Add stackprof to ptest (new tool in 0.196)
> - XFAIL stackprof systemwide tests on qemu (no userspace activity)
> ---
> =C2=A0.../{elfutils_0.195.bb =3D> elfutils_0.196.bb}=C2=A0 |=C2=A0 9 +++-=
-
> =C2=A0...001-config-eu.am-do-not-force-Werror.patch |=C2=A0 4 +--
> =C2=A0...u-objects-to-libelf.a-static-archive.patch | 35 ----------------=
---
> =C2=A0...-check-data_list.data.d.d_buf-before.patch |=C2=A0 2 +-
> =C2=A0...-skip-the-test-when-gcc-not-deployed.patch |=C2=A0 2 +-
> =C2=A0...m-compile-test_nlist-with-standard-C.patch |=C2=A0 6 ++--
> =C2=A0...cvt_gunhash-if-dest-and-src-are-same.patch |=C2=A0 2 +-
> =C2=A0.../elfutils/files/0003-fixheadercheck.patch=C2=A0 |=C2=A0 2 +-
> =C2=A0.../elfutils/files/0003-musl-utils.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 12 +++----
> =C2=A0.../elfutils/files/ptest.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++---
> =C2=A010 files changed, 25 insertions(+), 57 deletions(-)
> =C2=A0rename meta/recipes-devtools/elfutils/{elfutils_0.195.bb =3D> elfut=
ils_0.196.bb} (95%)
> =C2=A0delete mode 100644 meta/recipes-devtools/elfutils/files/0001-libelf=
-Add-libeu-objects-to-libelf.a-static-archive.patch

This merged but we have since seen this failure:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4668

which is an elfutils-native failure. Not sure if it is an issue
building on Ubuntu2404 or some kind of make race...

Cheers,

Richard




