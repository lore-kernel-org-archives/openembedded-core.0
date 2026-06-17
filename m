Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475D2CD98ED
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:47:52 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10261.1781682468177422043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BJWWVlE4;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ccf6a63a45so68941036d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781682467; cv=none;
        d=google.com; s=arc-20240605;
        b=i5HyLHeMV6IS2IiuQkuYB4v+1n2PT6qvoyFllTOinpcqI38F1uz1BYjco8WmbJ6vfm
         YDpghJYuZv7i73LrqPuTikHEAZ9XVT5dFLAcohpsUYigvR1A+DFVd0QwkzKpKHsYJw4u
         CczF9XEkQr7YSNiWCZjsDA9sKcW4V9rwIZSSuT2rAwKTIrSJJQsgvUNubZhVWs8keoE8
         CiaEJUBp0ag1SM4HH3mhncqi8/Rql0J60uZnyX/grhyOfFE7mgKUWdw4WAmk8Cd4jwhb
         GRB97+0hXs7kMVRbG90eE2d1HDR5dMGKM/RDi/9tQ/uh15tGvoft5Uizns2bvaJfjutl
         8ywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e+gP+qe7/e3SqKHdTGFUF9eewAXO3gCLWz+Pv2Oqb5A=;
        fh=LNxevAtvBi6bfDQAyZ56YjLH9JWSxYKaB8GzS46aOrw=;
        b=Q0M1C6Pa0q1Hl/BV+Cw+2HJHD5aLp1nso6nLvK2NMFMY9c1uCr4I+iVGZ/X4zlp6pU
         EHRG+kZcpXK8FYFUghMBRKzkyX1kZGNO7cqlochPCWNDFio+Oh6EA7dh3tjSfXFNeyQ1
         8g3gBWfAkKDkVr95aTV1eEmLVqEtOmN5ohbEDZZ1/WvhmzcbYIH4cXG2Au5Kr083Sa0M
         LOCbDKQEOQkFk0nQAxYIhNjsnkBG+M5E6FsWHp7CM/owPuZIg2dehNipe7GXJKtf93GB
         eNKIHU31DobOSg9UYCZL6WWwm/bRJeU2wGulPVIYBZRnOprwZJTanD911FvHR2aVYHpa
         6YLw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781682467; x=1782287267; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+gP+qe7/e3SqKHdTGFUF9eewAXO3gCLWz+Pv2Oqb5A=;
        b=BJWWVlE47mqtx2kS66ZqPCQz1u/jzVE5aXko0bNlBl9ovYqP5gAUQwGcImS4w80CrD
         3nxlXZYg7fwU3RIxWBuUBwH6LxbAiDX3XzbalmdeQumJ8NZ8l9rjQQ0PComtqB9qnhdo
         jkvHoqwi6JPTVi1DNYTVzVF+jUWsfnbvDhArzwRvyQINEFtG51nX5+I5Cs2Ymiww7u++
         ywuzb7SxDEANuiPGJO/X9wJpICfIGXkhvJR5w20Te8hMD9uUGDE9E7eitqczFqFEPEnU
         HY+HFP2cyR823yUztAp7Dhnllg287Sg6eorg6By9jyExpkIXmDydQZRX73ISp0Ty7/Eg
         yUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682467; x=1782287267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e+gP+qe7/e3SqKHdTGFUF9eewAXO3gCLWz+Pv2Oqb5A=;
        b=ZD4aDJlTVuaF/zNV+DxKhUcanxdAJi7UEtmAGwfgkNxhpqmg/t6vE7STdAlv/tJJNU
         vqqdzLYd908buQUIXiLr36XfXZdEkpJ91w98PgSNratQthj32hdL7GuSHFldpOv0lqsR
         +uebZ54rjY5QuPa5DCenavualiCpHfF25gkRq9uVUgPajDt6i987UMZM+844FP2guCv/
         qn1xVovATqGHWvDnBj4uEzTTp54eNtLGs8xD+K+qyl/vaRQaINjsZUp+uOuhB5hioY9v
         RWIo7PZyzqMyqUOBmITG0BW2nK8UCCK5uOYDIZU4ILlO32MzAfShnXxauEWoyytu3ciW
         3TOw==
X-Gm-Message-State: AOJu0YyJBCzwcDuRf1dqbgoyDA4eYcqkpT04HR2fKkoL9NFQcge9quCa
	J/nIzj3ShcVQpg8SzfVBXaVKRZvUiaH7zYVqd4N3fJBNOOj0pUl5rrudIjwRFhQidjNEgBGm/dx
	FMqQqNhQ+o49iuaWQ/yDYP8o1VffvZo8=
X-Gm-Gg: AfdE7cmVLdHGHlTs7tNUXVOU25MK2tsCK1CpFHwx0htD/QqEpmoWlYu4XFakzZDtl1G
	C4mlaFDh5lpWjeAKujT5KwktLimVj9dOy5meAYfj9IWjM1i6fuzzppvzSVw7+64GAzxJ85ZYfmL
	mjv5EMC+sxeMaXAJTBFAIWvEGxr2tKYu9NjuNWLoAJt0Kbt1H3lRf8gbfkyXCdLjUxLtpwjPKpK
	qeNxwp5mM8k8PDFe/SV74TCw8eoUwtUkxfjkEWg/NlaaqyFnCvRKqT/KMY8LIJRAZOxxf32EWOz
	kmdAHRHi6/bjUQY8KcRF6/NRAR2RqQw=
X-Received: by 2002:a05:6214:1c46:b0:8dc:1f0:9f2f with SMTP id
 6a1803df08f44-8dc01f0a0f7mr13442856d6.17.1781682466921; Wed, 17 Jun 2026
 00:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260608125956.3297942-1-tdarote@qti.qualcomm.com>
 <PH0PR02MB113174F1DADB824C840153CD48F1C2@PH0PR02MB11317.namprd02.prod.outlook.com>
 <PH0PR02MB11317F83EBCE38D3ECD196DAF8FE42@PH0PR02MB11317.namprd02.prod.outlook.com>
In-Reply-To: <PH0PR02MB11317F83EBCE38D3ECD196DAF8FE42@PH0PR02MB11317.namprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Jun 2026 09:47:26 +0200
X-Gm-Features: AVVi8Ceo1F3slW3mNFWo_TX5DrqHT489OuwB6Ova2MInzozgJfWBEgaU7DZAyAo
Message-ID: <CANNYZj_OwmdmytrfWXmKqCSygoyuVUnVCJam6tGRRJqT6gGkbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-bad: handle padded buffers
 in wl_shm buffer creation
To: tdarote@qti.qualcomm.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239014

On Wed, 17 Jun 2026 at 08:13, Tushar Darote via lists.openembedded.org
<tdarote=3Dqti.qualcomm.com@lists.openembedded.org> wrote:
> The patch "gstreamer1.0-plugins-bad: handle padded buffers in wl_shm buff=
er creation" has been merged into OE-Core master.
> gstreamer1.0-plugins-bad: handle padded buffers in wl_shm buffer crea=E2=
=80=A6 =C2=B7 openembedded/openembedded-core@866915f
> This fix addresses incorrect rendering with DMA-backed buffers that inclu=
de padding or custom strides by correctly handling stride, offset, and buff=
er size using GstVideoMeta.
> Given the relevance of this issue for Wayland-based rendering paths, coul=
d you please consider backporting this change to the OE-Core wrynose LTS br=
anch?
> If needed, I=E2=80=99d be happy to assist with preparing or validating th=
e backport.

You need to prepare, test, and send the patch; there's no dedicated
team handling backport requests like this one, but actual patches will
be considered. Use --subject-prefix to indicate what is the target
branch.

Alex

