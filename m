Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7BDCCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 15:29:57 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.11476.1760110187992018849
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 08:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cAhLADIU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso813421f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 08:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760110186; x=1760714986; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ydMp5rh40GalZy2SsqEb4NbOnzzGyrdKMGZspsVhxic=;
        b=cAhLADIU68yCsXkCZLg1SxigGuYnfYlt5Rujkdk1iVYmbxonWGqpKxRT/n9g2FQlWy
         S+qikE2sLMZiLNvejfxbSgGUTlfvb1B2T7WvlL3bY6oGqYwW7jpcNAgShOTGqrvoHQmm
         kebtnSkndeGI4TLhVANO4Lf0QmYfQelu4AjgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760110186; x=1760714986;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ydMp5rh40GalZy2SsqEb4NbOnzzGyrdKMGZspsVhxic=;
        b=E0D3Rpqm+nUfyl9EBTzIxK5ksNeYfWWyQBv3+APAy1uzpdcWdrRLoCKZHaM5JddeC1
         2VyxK6VzR8XggkSkG52l8remFlWOiBX+zsiEpUUPfzdXuF+IJQNh80cz0rsLApk04I1n
         3tp9n2r5SxmJHKoewDqqGBw8evW599GPo/8+CiJKNEmzmQGmUh58DSgLaOv3Txe9shtS
         k7SWGs5vSd0U8p6Itit12ekozpiHilMumFGnnOmPmAruoXbwkMfLo5gK5Bqu/lBaxzZH
         Ut6L9fYwBg8erNEZL8nPVkLV+0PeHgIPLYRzypa6xFasG67QvVZndu/Xzc3Ue1lf9neD
         I4Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWPYFsFNAUzGCbQnqlo7fppqBipFCRwE4wLchCfLe0Yi8XPOUW8+5w+SYSSL9NALQnM4bEEOuaP4yGvEiRKdat2AA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YysVB++uYuOAeJrOlb3PPSuQFDmD8T2otpDH/i788Q+5Mnba41B
	4KEk8BVGYBsWZENcOZEhkjS+6+zhny4V+z1EXzedSAXl392uivGudjwNqw79v7xnpQI=
X-Gm-Gg: ASbGncsuP0ENXIybw0snvdha5/vQaRchgqfUHCbrDf/Vd+M3/e6zRYdi1INrZHhTfuj
	KxSYOZcPxX2lp2TI2pysKvLxXKzdVpelAebvuuvuOMbLd2qJH5kqGZycfxP/eGA5Lqnx1LJOTlP
	CwrimiT15sEWf4JdSjVbh96KNkyZ/R0fuVdTydCr+OYmntYg8jjR/afGaHdKZUmxuC4Zanpz/GJ
	EKSUOe4eX79vH3fyzBSTqZFZtw+KRJVdJYdfo89qVkxdlerHWATSJ//CTj7EcZCpvQpxpbUfZ92
	pk2hlDYL3etKLrUKs7n97eXwhYLkOXZDWD0ICVnifDBulaUCsTqDxJUVigB2sx3KRgKNcFubJSx
	vYubH4pUmjFE8jRVNTrYhLyTUUBGiG/h0oJ7C9o6F/wzC42FWO6s/UR/2a/pcdfxbm0LNd5J6Je
	X4M40WhTElV5sM9GysGul7z/1hPityKKcpp63HUXFx
X-Google-Smtp-Source: AGHT+IHUbvVuH6fuQcBN0pWO4nCwCbX8U+tCrx5H2GYbJt9ZKCJr/5r5Dgjh0n8B/ZlpHRv7NfBVbA==
X-Received: by 2002:a05:6000:186c:b0:3ea:6680:8fcd with SMTP id ffacd0b85a97d-4266e7cec48mr7954797f8f.13.1760110186302;
        Fri, 10 Oct 2025 08:29:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3d6b:fc42:c556:a557? ([2001:8b0:aba:5f3c:3d6b:fc42:c556:a557])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e8141sm4532298f8f.48.2025.10.10.08.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 08:29:45 -0700 (PDT)
Message-ID: <0f0773981e12d39f55edeb24a82aa5793b3f80b5.camel@linuxfoundation.org>
Subject: Re: [OE-core] rust: building UEFI software in OE
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: dmitry.baryshkov@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>
Date: Fri, 10 Oct 2025 16:29:44 +0100
In-Reply-To: <rkasjmloevi7fplsyvh2s5z5wxmulvyrewrol6kjlcgn64oe63@5ajr7yfw547a>
References: 
	<rkasjmloevi7fplsyvh2s5z5wxmulvyrewrol6kjlcgn64oe63@5ajr7yfw547a>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 15:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224690

On Fri, 2025-10-10 at 16:27 +0300, Dmitry Baryshkov via lists.openembedded.=
org wrote:
> Hi,
>=20
> I have tried using OE to package the UEFI binary built using Rust ([1]).
> So far I can compile the crates with minimal hacks to OE, but the
> linking stage fails. The ccld wrapper tries to use the (non-existing)
> "aarch64-unknown-uefi-gcc" (and fails). The aarch64-unknown-uefi
> toolchain installed through rustup uses rust-lld for linking, but we
> cannot even try building rust-lld because Rust doesn't allow building
> LLD with the external LLVM.
>=20
> So, several connected questions:
>=20
> - What is the reason for rust / rust-llvm split? Would it make sense to
> =C2=A0 squash them together and enable building of lld (which we won't us=
e by
> =C2=A0 default)

There are patches merging them on the list!

Cheers,

Richard

