Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D371C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 09:24:31 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.45632.1740043462703161545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 01:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jmcHTtUI;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e660740061so6291056d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 01:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740043462; x=1740648262; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3TUGPpXSh9FRiC5CDr34wZYTjS24YtUohyQTLjIPDQ=;
        b=jmcHTtUIwFWDt0/C4XbntKLTx5Ipgh0u1u68XYWF5PtgTnmW51IU9Fp2gIN7Erdsx+
         DYxNpOD5p8dYYO25KyCjpAbcfgoOlVRXZfO/DNwZ6I+zZWBHeQRIBX/GOKY5zmNQ6xaB
         bcFyTavs4Ujm8aJzipaQbpGRO5hoj1fr1rMqUDrd9tiPFSuL+MF3WEcg/qB1VWbuz7wF
         dP3GhAdKFrRQXO5m5KsbDXAR5e9kJTnchQC0AV9jt5rzR2HOLhKQvQ5lR5byQUbxkk+6
         Tp4r5GdkpnrEK78ZK0I7hDJ5mQYr45i2Zs/OY/lcE1c20YzS1xrCApneQzlkMOVYJuLG
         z4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043462; x=1740648262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3TUGPpXSh9FRiC5CDr34wZYTjS24YtUohyQTLjIPDQ=;
        b=ixhWWXz/g8rddFhXBC52AvjstXkvPJexqX8XEPkO0d40/Z+iEd/Lb5t2SVMDg+4/y/
         ozDAYLMhj/fs8ONwuw+M4KN+6lNDOFkFn4Xpk9aOpUElEiFqLX+S/dExEMeQoVifkbMk
         L+YUwbm/ObQk/UEZcKR+bsYMg2/hRto5Ry9WjUOmaLfC8f9kqHgQ54ZIZTUPoSr3Wyyd
         8L8SiyW1vX27iV8Ccda5MDLPzfexoJQp5YYM+OwaWoyLiqU2riCNfOxgrhCS6j+LoVRC
         uPV6SaLj/ttPH5E2x57CY8Wgu97zwoRxZTlmxEtG0oyqmaZ+u27LJ9TZN9jXer5OxqYd
         ER2Q==
X-Gm-Message-State: AOJu0YwEWimVaqq7H277YpXiHjnOgTH9Ms9oGjhdea5iG6R4UBMOK9Wm
	dw0X670pvspQ5x75dKhbP6YSc2dB252yjdDf2FwCGwdXOIVeb/1AnfKg8JIk3WOurhPdffWN6wY
	/iRrPdSPaaVzIbSUeJ/hofSA4fUn0xQ==
X-Gm-Gg: ASbGncsLLSudBhRlcDYRI5CHiEt1cUWpsqdv87Mm7L5zcrHa5unz5gvGKkFkt7FrOHP
	qCQTTxz+DLcYVA5viPG9giGyovWLmEq/x2I8VW5dyD436A/Qhi4hlyY4U1w3VZ23aVY99pQvS69
	ZeUDmvAnf61f+E6PY9s80E5fPmHYsrY1A=
X-Google-Smtp-Source: AGHT+IE8mgXGFCzTAX1JJIcgZN5MvJfm2Xjn1A+p7fTdAL4FRU7sKuokk+pLHWz5tVBrzPa46O4g6QngGgm1ylve4Cc=
X-Received: by 2002:ad4:5bcf:0:b0:6e6:630c:71e9 with SMTP id
 6a1803df08f44-6e6974f51d7mr103477946d6.3.1740043461642; Thu, 20 Feb 2025
 01:24:21 -0800 (PST)
MIME-Version: 1.0
References: <GV0P278MB0516B168ACC6F3595C48BFE88BC52@GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM>
 <CANNYZj-CjpPU5=4Gcc2S1-CLwn2MJ8qHn1Pdu5zP_Rza=rjBbg@mail.gmail.com>
 <GV0P278MB0516B25A5B62DFB34E4F53D78BC52@GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM>
 <CANNYZj8CN3kEtxsMkm+DgMYmBgD-o94HYbk1QNWfQyVRmaDFyg@mail.gmail.com> <GV0P278MB05161B8DDF7850DFAE8CDBEC8BC42@GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM>
In-Reply-To: <GV0P278MB05161B8DDF7850DFAE8CDBEC8BC42@GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Feb 2025 10:24:10 +0100
X-Gm-Features: AWEUYZlUTRAO8fDxyw7xOP0KEXT8YmuI5FXUHavReBM8sNBU14-RySuwW6-5wyo
Message-ID: <CANNYZj_d_S2CoWN6rLxnfwO2+yptE0PRf_Ue-0kt3zJBgqJrog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: Remove DEBUG_PREFIX_MAP from sysconfigdata
To: =?UTF-8?B?U2FuanXDoW4gR2FyY8OtYSwgSm9yZ2U=?= <Jorge.SanjuanGarcia@duagon.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 09:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211748

On Thu, 20 Feb 2025 at 08:00, Sanju=C3=A1n Garc=C3=ADa, Jorge
<Jorge.SanjuanGarcia@duagon.com> wrote:

> There are still some 'prefix-map' stuff that is not properly being replac=
ed because the do_install() task is
> doing this sed expression `-e "s,${B},/build/path/unavailable/,g"`. We co=
uld probably move that to
> `py_package_preprocess()` and remove DEBUG_PREFIX_MAP entries altogether.=
 I can put a v2 doing
> that if you agree with that.

I don't have a strong opinion here. The point is to more clearly
document in the commit message what is being fixed, e.g. by showing
how the final output looks before and after the patch.

Alex

