Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAE5C88E72
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 14:18:46 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21379.1789395517044161236
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 07:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PYQLL5cM;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49e6bad7b79so18996865e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 07:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789395515; x=1790000315; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=155BHvj4uJwckP7OX4YSdtHT0lxJFVGYoBhkNJ9O+7g=;
        b=PYQLL5cMjEyV6ycxbRRXNEV39uCyIBCEi//YHkLXdW2guBXeroYi1T5zDmJx97/Kzi
         j0INChgg5WsI6/ToDl3KuZQu8lrpzfMJoQFwUyE7x6L5y6NCVwSbaJMuEwmZIHBIQWm/
         XsV/fQrffukUqUiDUJ2E+QZGfle1Hi2VWohmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395515; x=1790000315;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=155BHvj4uJwckP7OX4YSdtHT0lxJFVGYoBhkNJ9O+7g=;
        b=ZkBhMevmST69gbMYiE9U9X+flM7QNrC4hhRJnT/BJcpE4GTdb3VbLOqtzxU6/UJAfX
         +VsFJk3oRxosXY+SjA6bsK63eqiWd2bcqtBiSKGTKLrzQJfdNjA4P4I9FG7Z/R79rn86
         3PR/DCSocMH9yP+dLHbexc6ricgKvTWAeud7rFS7Og4py72+0zOF0dFO8z4LG4p7FW1v
         RK6NpHKVT1t+o2xJNKWEVc4AIGW2dblmkneH8R0nGvk38pr9zSYgxYcLDm7gIK0eY0KK
         BM1Q/V7XhrqlMw+rHBcHvw8TVy5lQrzvJKJp8d3s+iRMAoHK+mVQNCxja1OAUcAqzufR
         13HQ==
X-Gm-Message-State: AFuF++lIs+ttk9blGQRqrqtaXIyXXjKXUx8hj+SUhZ6L+Xr2ZjZcL9Ww
	ufAR5sH/At9bvrEHFAFzOiSdc9CqVOQBfvRp7JCNH51m0cFTjTzT8wYrnRc1rIl6at8=
X-Gm-Gg: AYBFou3PUThyXuNjMJgg0Ul1Oon4ZWBJrd0MEA/t9T8uwcpUWyUHlDabKfxMWoWW1Wg
	Ddom5GdLDfhXPdHR6CEqFUDHHCtfvpOHBwD0yxcK5oExK+n92Ry2tFuceeNPF1XJ3zrG1pZZnd6
	4yHMWv1jian/m1y4QHmSG+c9f4JoEnIfKGE5yy8o9lO9qfmGe22OpJHMGVKKz1a0wqOszMulIeb
	pAM5EiXfJByRKHcLU5lNCex7sFrPVxN4Jz8Igjnbti0S1yU+ElM0x6+cDGvfsgSLwnWy47EHeP8
	QsrIZR/oqRDGdjJ6vxGPBWB2AV5tfFjF/RL5Mzhdvre74fOeMoXPcNgMq1R9TGRlnqIU/vSR9cP
	n7FSkLVQXaukKtIglnjqoMU2VHOI2FIUuCx3u0h8M0GlScgFqIvFniPJK+R7pqSFhPF9yOL90Ah
	JfzEvmGFyKCsDC0qp//CbEnwLaDydOrWHaRaDalhhDxRNI3t/vgCZURlgoWD92uSbu8MplHSQmy
	4sHxDhGnOxC7VLLLHkEGy5E44f32XNQteBfzNVK1NyIO+qClfkcxBMZe0GJyQU=
X-Received: by 2002:a05:600c:3511:b0:49d:1df8:156d with SMTP id 5b1f17b1804b1-49e7a66c9f9mr32504755e9.18.1789395515049;
        Mon, 14 Sep 2026 07:18:35 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49db038401fsm488017765e9.13.2026.09.14.07.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 07:18:34 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 16:18:34 +0200
Message-Id: <DLF3RQZ76CZK.C0FPH5HA196G@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "Alexander Kanavin"
 <alex.kanavin@gmail.com>, "Paul Barker" <paul@pbarker.dev>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Subject: Re: [OE-core] [wrynose][PATCH 1/3] libslirp: fix upstream version
 check
X-Mailer: aerc 0.20.0
References: <20260823155741.2091982-1-peter.marko@siemens.com>
 <DL5Z475KF36A.2GWHJC82115IA@smile.fr>
 <CANNYZj8F6OBVu=cnCnEbAnCGVNBrex9uaTvkqtzwCFg=nKaByg@mail.gmail.com>
 <AS8PR10MB507373EE139A44A2BC291050FDBD2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB507373EE139A44A2BC291050FDBD2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 14:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245787

On Sat Sep 12, 2026 at 6:12 PM CEST, Peter Marko wrote:
>
>
>> -----Original Message-----
>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>> Sent: Friday, September 4, 2026 2:39 PM
>> To: yoann.congal@smile.fr
>> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [wrynose][PATCH 1/3] libslirp: fix upstream versi=
on check
>>=20
>> On Thu, 3 Sept 2026 at 22:45, Yoann Congal via lists.openembedded.org
>> <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
>> > Thanks for the series. But, with regrets, I don't think it is acceptab=
le
>> > under the policy:
>> > * 1&3/3 are not bug fixes (UPSTREAM_CHECK_GITTAGREGEX is not used righ=
t
>> >   now on stables)
>
> I don't really insist on this commit being backported.
> However, it would be very beneficial for future cherry-picks.
> Since this line is next to both SRC_URI and SRCREV, any cherry-pick resul=
ts in hard conflict.
>
> I'd like to keep the series as is, but I can also send it without this co=
mmit if requested.
> Please let me know Yoann.

Hello,

I've discussed this with Paul and we are goind to take this series
through review: Every changes are low-risks and have value, so, in this
case I was overly cautious.

Expect this in the next wrynose series (this week).

Regards,

>
> Peter
>
>>=20
>> Being able to check upstream versions is a valid use case for stable
>> branches too, even if the functionality is not currently used by Yocto
>> project itself. Users can check what the latest (or latest stable,
>> if/when that support is backported) version is, and make their own
>> decision about updating it downstream.
>>=20
>> It's a *very* low risk change as well, as it is used only in the
>> version check and nowhere in actual builds.
>>=20
>> Alex


--=20
Yoann Congal
Smile ECS


