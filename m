Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37065C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 10:02:35 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.55709.1749463347232376835
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 03:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hkh5sRUZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so32384465e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 03:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749463345; x=1750068145; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N544censr98gbBPlO8CD9R2HuvRUvSVJwUzXMQ3rfJQ=;
        b=Hkh5sRUZGT77Lq6stC34rg58vMuofMX57GKkm2ej7ZtMuSS5T17A4wzpZCjh0EpD6B
         ZDvkt5cwLW3Mm0XpCgyBSe0+8mEIEpxWext/ZVOPcbzfZhCv9vAhwq+Xs4wC9O7nLB6M
         g41O1y4m0lI5gpZowZvr5lJ4mlCBDGESEoV24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749463345; x=1750068145;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N544censr98gbBPlO8CD9R2HuvRUvSVJwUzXMQ3rfJQ=;
        b=ZdLK/KilMs4pzF5nXwZWkTpGCLwS61Byoo9dhjvHwbd5mwnfvl7YyC6zZ6nr9enz8I
         7h7iB4jwV8NewGZ04QGOtux+Lr0vdj67ax2PyaCX/3dY5zLeke+nl5YZBqmuHXer68Hf
         eGbTZEzjfys/GClHm2rPG24DlLqebU6N7JgCl+aG5v8X0lwGE7udB1x478LbSXt1aLwI
         HjeTpfVgq74wpg5mx4GwYF4yGxRC4XHQq5s1uZOQIE3vnCwhnpvZrthuyOOgPhlwMWQt
         dx74AwcrsD/3vZqRhSOp3DL7ALC+WsC9P+/k2Nj8PKBoABPfhu913hFX0uGLMJSbNyRY
         bXkA==
X-Gm-Message-State: AOJu0YyEhMzlQtJnuR9lsNDZA2Ew3VjL3p41qsHYtpVucyPO0zgF0ko5
	dK4IpIcMtckDp2p8yYzArscUPkqGIq1R0u5rKy/2s/7fkbzKq1OLZIEGWUMeUciOYdeDJrJ9+El
	R5Shm4Hs=
X-Gm-Gg: ASbGncu89wnOmF+xJvSqGg62xA83P4HQK7s2Oi3/ziwJ25xaEtWnJzE7aJstttDhCZa
	Uhs7YQGl6QcywQ+PW9kNpD/jKNPX23c8i/EQCZeodBmXVEND9vbGbsIc4CvCjVjH10yhUK2vIrw
	7mRxlOgl8tVzAr/31OS3Ku4tPR/z/Cf5d7HAiJfslkwW6mn5K8bA2UTTrZzvTSJrJQuEZDXdQBc
	iufAd45LwSh+ijCnHiN35abdkHGaE7R/N2h9cTY3X02/Fn5i2dKnlRAd/o3ilTCD8VzhtyZqRH4
	uuNoYDGKL4WC/XxC6msDUmVayMdJAn7mbqaaW6vNc7izdbMmtlf/+OF4tVFxpIdYiVTeGuLXTW9
	dqKUl1A3GKn+b9Zh+OxdTv+l1E68W8q4+yM9i8ejSZDiws6oEqJyv6i3jm8yQnw==
X-Google-Smtp-Source: AGHT+IFSeInVPMrJ26N+y3Zxn6fR8KNKWS9n962AyHVmnGiM4NpTFHh2m08+MstapaDp5TD2IlfShA==
X-Received: by 2002:a7b:c5d1:0:b0:450:d3b9:a5fc with SMTP id 5b1f17b1804b1-4520151ecb2mr70294855e9.27.1749463345154;
        Mon, 09 Jun 2025 03:02:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f? ([2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244ee34sm9201449f8f.72.2025.06.09.03.02.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:02:24 -0700 (PDT)
Message-ID: <8c8f48ec278b0600bc0c4a3e50aff6d15d24d9b2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/5] base: Add deferred class event handler
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 09 Jun 2025 11:02:23 +0100
In-Reply-To: <1847577DCFEECC9B.11623@lists.openembedded.org>
References: <1847577DCFEECC9B.11623@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 10:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218261

On Mon, 2025-06-09 at 10:59 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> Use the new deferred class event to set the class overrides earlier.
> This improves interaction of the override with PACKAGECONFIG values
> that control conditional inherits (such as python support).
>=20
> This also allows toolchain configuration in an easier and more user
> friendly way.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> =C2=A0meta/classes-global/base.bbclass | 11 ++++++++++-
> =C2=A01 file changed, 10 insertions(+), 1 deletion(-)

The first set of 5 patches I just sent are probably ready to merge and
good changes in general.=C2=A0

This second set are the more interesting ones and enable toolchain
selection. They depend on three bitbake patches I just sent and there
are elements in here I don't really like. This is the best method of
enabling toolchain selection I've been able to find though after
spending a lot of time on it.

I'm open to better ideas...

Cheers,

Richard


