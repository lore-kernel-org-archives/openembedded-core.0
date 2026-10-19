Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA31FCCF2E5
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:33:01 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35993.1792420374182728613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b8g0s2ES;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b042c0759so1367025f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792420372; x=1793025172; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=r4uMfKCq2GLM6RZa/ffx+wi9/G5jz747t1l1fgyBfHQ=;
        b=b8g0s2ESIKIuwmYNAmQPp1VqlQE89GkskQg5yfUGThBZSMCWZPsWwG6NDZVUlTZhCn
         OShQHltslDEcHOQwVuFJqyffQfBAk/pK+PEZp5mQK/34CCBpBwqzev0PfYGYdRjYkk53
         MvsLfuJ4peh/adTNVfzacCjnO9hmATEX2Wstg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420372; x=1793025172;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4uMfKCq2GLM6RZa/ffx+wi9/G5jz747t1l1fgyBfHQ=;
        b=VFCwh9Stqf/i2HN1jdeSuHN4OAVsfHYaPQe4h0fDY95oseHZaPdLJDerfBMUM5CH9K
         mVazo5H/gzZVI4DhXdRNmj9pp3QTcX3jbATOWl6WQ5noHN47YLFwXH4qQJg+QqWsDMyx
         WH75KrKWz4DdyU/ZOVM+CzLwS3SCl/+iFOBSgoekSfGLiezY8wBNG05ua3kYUtmbyu78
         QZvqUlHORvRulcZpL3JFr3AhnZyqwppbNFuRXeHXfGD6kvvRjNG0HZXWJjKTQRXrtvd5
         VBHjI9Mannsm3LUkpPOr3WC7JmPi+irK0mAU5rf2h7Qbv5iFXYxY1DKpjRw4YLopVxXk
         IUbA==
X-Forwarded-Encrypted: i=1; AKwUvBzahbpbHSOiLEtHAKzm/pX9h7mn3w/v9J8Hwi37uVqxDJ+P7IMaLWIw88v1GemWzPzEzmDXlUxzVsy/EN/5917w5A==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJXuwI2nbscR+V/GirlKasJpw4sy+IQYXzSM+qpCadqX6jEkDgO
	Ft1kjm2+wHWw43aub99Rj8nBYo0YASC3HwF5jig4oSehiYcc34VHuKBVj42bowV3JYk=
X-Gm-Gg: AYBFou2lzs0v7v5mWDQGJIoEQOX9oCAHtAdsAsVQcDIjLWAhnQxf942hgT0m+BjB6d7
	XWOV1Lyi13O6nTLswShqMVU83ZVU1RiEgUouf3S3lQsQeG2zzy6QO62PtPeoDveYwMWUwcj8i9N
	fhKCf/hacU6yLvs+aEOTlFAb9fowEi/UVg5cZNWRD1mRtKRF9Xg7T9igZPoz7eHdYzg53DPLXXo
	sHXPPgatxAN0jROy71hzR1OrZ42tO/EYFj4fvOr/HZJ3LNdczu0pNXJ+pr7Hym++HMD5eoeEpNg
	txVzvPv/FJDg6MwAdMPsxKvZDSjax8XQWWrarSYvevbkMpn3+YeHkpSlE2oJwegfxeKBr9e3XEv
	vt8SXLB5oewg2nnFX/2ceJ7qiz/wssLy/HzZ14Ly2CE7cNoTCoRxoNw2e9rUfH63ScuuKEa27Cr
	0ygjFtKJ3aIXnPTXL1C9JaVvT1kG+1ZojiM2R3J/cOt0T91eWea6gKoooxVsdmv77ZssqrW0Xko
	ceQzjsrtM96ZkalN+VNm97+M3OUw48mbChShawEVFCyz6eyVHerGtE78wS/ot48xicr
X-Received: by 2002:adf:fccb:0:b0:488:8931:b1b2 with SMTP id ffacd0b85a97d-48e07fbc4bemr10444315f8f.28.1792420372104;
        Mon, 19 Oct 2026 07:32:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2c01:6d06:43:9326? ([2001:8b0:aba:5f3c:2c01:6d06:43:9326])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd50ae5esm26080661f8f.51.2026.10.19.07.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:32:51 -0700 (PDT)
Message-ID: <4232634fb1f980a47b824214413690f1e98b3295.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: Squash rust-cross-canadian.inc into the
 recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, 
	openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Mon, 19 Oct 2026 15:32:50 +0100
In-Reply-To: <20261012101812.1485365-1-Deepesh.Varatharajan@windriver.com>
References: <20261012101812.1485365-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10build1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248174

On Mon, 2026-10-12 at 03:18 -0700, Varatharajan, Deepesh via lists.openembe=
dded.org wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>=20
> It was only used by rust-cross-canadian recipe.
>=20
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
> =C2=A0.../rust/rust-cross-canadian.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 72 ------------------
> =C2=A0.../rust/rust-cross-canadian_1.99.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 73 ++++++++++++++++++-
> =C2=A02 files changed, 72 insertions(+), 73 deletions(-)
> =C2=A0delete mode 100644 meta/recipes-devtools/rust/rust-cross-canadian.i=
nc
>=20

Whilst in general we have been cleaning up .inc files where there is no
need, I think these ones (and the ones in gcc) do serve a purpose since
they allow multiple recipe versions more easily. I therefore think
these should stay as they are...

Cheers,

Richard

