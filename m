Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F080D105A594
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 12:13:49 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20030.1773317623269390793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 05:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XUN4Eq/V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48534237460so9866835e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 05:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773317621; x=1773922421; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ADT6kt4To9gSoV1DjqgFPnqY6fg08MBHOodILvcOrMc=;
        b=XUN4Eq/VS9WkHoHU7SnVPZuUlcfviIk6dwOJyFeGG5JCiooLn4rR82G4Z43L8N5GQ/
         N8EekMH+HDHxHJJPXztet5ktVIOYvzbNGYmL/VjOD67nZH0LFT2Rl5oGZQLxllc3eJL1
         GMJmskv9PSAAvBpjiJEeue6ksTtajmiQusZCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773317621; x=1773922421;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADT6kt4To9gSoV1DjqgFPnqY6fg08MBHOodILvcOrMc=;
        b=NNemvgBBwDdEyypwPVXS1L2efuQ+TFBUX5OqEKad6pGTDQ6b6Zlis5ztmAa+2YN6qC
         usyvPrB5jjOJzAEqXk+7k90BVqsebzmFGZQYn3xhf8R21rr69RQB56XFRcCQkUi0DdAf
         FCIBHBNUZXNJ4y/KbqOCVVOFHUlUu0yRNySQagvSMsRhGxp5Xmr3znKK4kbwuxwBqHMf
         08fkzb9smAD5DbeMBJwQYpU+9ug+hGjHPKMdIz0DGyhmSZ007DRfAW/s2iJRSO0LsZV0
         Ub6aEH89HmGTHQ2Poxb2Eow5a/g1n5Av2ZWFXof+YuY6tMBAUN0I65TEI99qhV3RbDMU
         hkuQ==
X-Gm-Message-State: AOJu0Yxl49uvfV2Aii/v9f92KbtxlkObyRIDivRPDZ4qZFUFP8zOAI5D
	I/pvLEN4VVcKH8L1DizSuNoOLfcpMh0SluD922t1fbLiW6sRKxZjA53OHbqVrkRDUwc=
X-Gm-Gg: ATEYQzy1ADSRBAxRkHiZ7DHN1FuSlLQRJHiM/784JsNCIMqTAaoTBZyr7NQrU4uba1+
	x/SkVenxNEc0vsHQ6FEx8zeEVhg0fSZPRmojJ1PRrmj8FtfJHrE9H+WGR2XyJRpZyUuY7zJ8LXm
	HqXObqOx3bWVuMoDRBP2o7NtJALwxB2RLmkFQNDgxqkIy8h70mpDtaYpldzsEfIKDrCY69kr7kH
	ornGj2sBvY5QLn9hHHH6MOPB1cnz3ppOzjeM67jugjsy8c0RkGBAI9GXtrnbdMlVJ8hMNQhJCas
	5BCR43hrN1Tgb7N7Qx6Ne4pZJSoaScQ6qMHdOsfxoFE8cCBuTiWVDKCIzGmdI51AuM20lXnG8ua
	pAMKaxlUSfzMIFBUK7Ssx0WWbKG0Ic6doGL49foH5KFYzGb+c20Urhrv7vHpz6P0dYs5q8ayVwi
	l1IHVqapgnK2iDk74W8Sftiofy6uhFYxyS3FAaPGanQx9OzimBd78r0/393bKu7KqmjbdV+e57a
	iftnWYlmPVY
X-Received: by 2002:a05:600c:4e56:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-4854b0fe9d9mr98125815e9.21.1773317621456;
        Thu, 12 Mar 2026 05:13:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:215f:5162:d0b:8f1d? ([2001:8b0:aba:5f3c:215f:5162:d0b:8f1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2187aasm7140657f8f.30.2026.03.12.05.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:13:40 -0700 (PDT)
Message-ID: <50b8d821e3bd8e8ff7b3b2650c219415967e5108.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: Enable parallel-frontend-threads
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Date: Thu, 12 Mar 2026 12:13:40 +0000
In-Reply-To: <CANNYZj_D=9z-ZjjP2D+RqVUAF2Kq0a8cd62dqE5doHzSYdPQnA@mail.gmail.com>
References: <20260312040703.1487119-1-sundeep.kokkonda@windriver.com>
	 <CANNYZj_D=9z-ZjjP2D+RqVUAF2Kq0a8cd62dqE5doHzSYdPQnA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 12:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232947

On Thu, 2026-03-12 at 10:02 +0100, Alexander Kanavin via lists.openembedded=
.org wrote:
> On Thu, 12 Mar 2026 at 05:07, Sundeep KOKKONDA via
> lists.openembedded.org
> <sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> wrote:
> > Test Results:
> > A few tests ran by, with and without enabling this option.
> > - Avg. default build time (w/o this option) - 56m 50.104s
> > - Avg. build time with this option - 49m 17.224s
> > - Performance Difference - 7m 32.880s faster builds (=E2=89=88 13.3%)
> >=20
> > Tests were performed by setting thread count as 8 & 16 but no much diff=
erence is seen.
> > So, the parallel-frontend-threads =3D 8 is set.
>=20
> It would really help to provide specifics. What tests did you run, and
> how were the numbers obtained? How can these tests be reproduced? What
> CPU was used and how many cores it had?
>=20
> > +=C2=A0=C2=A0=C2=A0 config.set("rust", "parallel-frontend-threads", "8"=
)
>=20
> I'd suggest we don't hardcode a number, but rather set to oe.utils.cpu_co=
unt()
> (grep oe-core for examples).

oe.utils.parallel_make() might make more sense here?

Cheers,

Richard

