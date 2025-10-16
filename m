Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF90DCCD19A
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 12:21:32 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.6800.1760617282738947204
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 05:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HuvGpsPn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so383277f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760617281; x=1761222081; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nB71qOAM0fp02mKiqZz4t3OjhD3SQz7ae1n+Ndr35Y=;
        b=HuvGpsPnlZ4WEUBCIXmYRLt8LyEWkavIReELvcvSqTO2Dxgm9PXn/I5HxqsPDkfDyE
         KRJRCS4e3ja+KPlK6HrEU6FLfQGrPsgMe2iXIc6vOkZ4jLYHQeR5uMUjzlqlbcnXstqz
         RFy2mRnrNsla+tNKmthsgL0/XA3TwxrigwUOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760617281; x=1761222081;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7nB71qOAM0fp02mKiqZz4t3OjhD3SQz7ae1n+Ndr35Y=;
        b=LLHbPAjEL0x9pumgv0fmvrZpeTNOJFm/oRR1+gUSOGWoSvAuvn55pg9uvSsiP853wa
         g0jiq6I7SwXqBgZ0373NmGvw2uhsFOcwkG9NI7U/OpSgkWtQOndNLlKWl/HDcAmtvKkw
         35jXWnL808aNthuJbkmaMmZgH6j9cLqfUJ+qtCLcg41MSJ4k6hGt2Phy3WxnoIMnj+12
         uFVCznK3cWmZFrUUMuep94dxSAcWT2MHY3ExAiFTRMrFtVr8VbbKiOIaOzNOC6NXC/VT
         SvnTl9oq94xPw4iwlfuikS/yUh9t1zLK0C1nBXtiKiMIDmouFqNNwxoOHOvFsKWe+vVA
         IhyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2z56AHd/87quLDOB0i0YToVhQJyd93YQW8VHvzddvOKtGsZG98WJmZKEFXNVJlUrGw8BbxJRYTft2fFEyigZieg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzrCM0Pnv0YSD4Vu25KylLz1I3b98PAf/55qli6F95jrMpiXpD0
	jDCoRBx6gUqDX+dJjlOJyMPAdfo23A0N6Ip6SEvK/V2OyITeC4A6AGF8HEU6WG6N1Sc=
X-Gm-Gg: ASbGncvrD6ocf8m7Mve3CAooGdcbhTSeyKtHKE7LoR8/F1H4knxtHEvqWJQ2o3qbjPt
	WwXAOZppJUO8FvwBncrRFOp5M/JW942qCZGWqL/6dx3WJVVx2EyY6rqguMidPnSHxp0O4y13GOT
	RSLJzh9UC7FRv4KnpmDJNAOFQPjuEYKz0TWW5G/YgOOZiEqvHfg0JlM5M51iZEwRD+CttND5KdJ
	zYz6AWwc4c/4YgQUdL/rL1iMRQj0vkRRzmwPacZAvQvK72Xuddb3rPNk4zy9GFVdq7SduKpgVrH
	ULIAfHJ96I0bZAZzFlMcMgpwJcf2w6jwJ3qiZxiIT6lE2HbwweVf4Xj94m4FN5ZDDZ9p9qTNjVE
	cih5aYi995B1PECssYm/CtubX+R/yM5FafV1LMARchDoo3pFd63c8SppkDFLYK11owdlpH3iDVz
	728JEw2hW8Uchzw591qS+HxtX1FeHgitKHpfSkrKvnZE6q17kl4HZgzUKRDQL0/sXN
X-Google-Smtp-Source: AGHT+IEp/1xrgZBM5r+9lO6vDazE1KjQW8Pgjz5PfMczaoBJxtFExfDpQ2Up8gkfbP9rxjpuPmZsNw==
X-Received: by 2002:a05:6000:2506:b0:3e5:190b:b04e with SMTP id ffacd0b85a97d-4266e8d8c08mr19597858f8f.37.1760617281036;
        Thu, 16 Oct 2025 05:21:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5c57:ae18:7f42:815d? ([2001:8b0:aba:5f3c:5c57:ae18:7f42:815d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426f6773726sm8927410f8f.49.2025.10.16.05.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 05:21:20 -0700 (PDT)
Message-ID: <a35665ab177747ae7482dc097e2cc0f57e762176.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.0.2 -> 10.0.5
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
Date: Thu, 16 Oct 2025 13:21:19 +0100
In-Reply-To: <20251014191245.581962-1-peter.marko@siemens.com>
References: <20251014191245.581962-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 12:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224964

On Tue, 2025-10-14 at 21:12 +0200, Peter Marko via lists.openembedded.org w=
rote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Handles CVE-2024-8354.
> Drop patch included in (backported to) this release.
>=20
> Reference:
> * https://security-tracker.debian.org/tracker/CVE-2024-8354
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> =C2=A0...native_10.0.2.bb =3D> qemu-native_10.0.5.bb} |=C2=A0 0
> =C2=A0...10.0.2.bb =3D> qemu-system-native_10.0.5.bb} |=C2=A0 0
> =C2=A0meta/recipes-devtools/qemu/qemu.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0...move-deprecated-get_event_loop-calls.patch | 85 ----------------=
---
> =C2=A0.../qemu/{qemu_10.0.2.bb =3D> qemu_10.0.5.bb}=C2=A0=C2=A0 |=C2=A0 0
> =C2=A05 files changed, 1 insertion(+), 87 deletions(-)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-native_10.0.2.bb =3D> qemu-=
native_10.0.5.bb} (100%)
> =C2=A0rename meta/recipes-devtools/qemu/{qemu-system-native_10.0.2.bb =3D=
> qemu-system-native_10.0.5.bb} (100%)
> =C2=A0delete mode 100644 meta/recipes-devtools/qemu/qemu/0012-Remove-depr=
ecated-get_event_loop-calls.patch
> =C2=A0rename meta/recipes-devtools/qemu/{qemu_10.0.2.bb =3D> qemu_10.0.5.=
bb} (100%)

I did put this in for testing but we saw a lot of weird failures,
particularly on arm and riscv targets in runtime testing. Whilst I'm
not 100% sure it was this, we noticed a few arm/riscv changes upstream
on this branch after the 10.0.5 release.

Since we're trying to get M3 built and stable, I'm holding off this
until we can work out what is going on, CVE or not.

Cheers,

Richard

