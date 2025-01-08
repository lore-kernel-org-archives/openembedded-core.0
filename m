Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC347E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 13:31:41 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.19421.1736343097118144209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 05:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J2aTlqYx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so6421006f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 05:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736343095; x=1736947895; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NRVf4QeMRnaeBA/vais+dxXapMfvpenFVsS58pjepFA=;
        b=J2aTlqYxL1lkKUdzyxb04GLIBeA4PK3jVBDTif4YZLQvJ0bLCV3LAm7c6Zkk3InFMd
         kaRguCHn9AE1Ypl0X7BzYF+vl6OvP2LRg03+CibW/zqFPVBuLHpNXUCAm3jzjMDpOoZo
         T/i4+YyD+psRLNMMvWw2HUkEdVh64rOtWkyWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736343095; x=1736947895;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRVf4QeMRnaeBA/vais+dxXapMfvpenFVsS58pjepFA=;
        b=iRiX3l475SFJXpAk2k3M5T9FWiA2XkL8A51wOr7rQFJnc1HfcTeAmmognFugTEFK7R
         g7zjg8MAe+pOL/+OvFhPnOkJNxxVtZZb34hvpu+r9t+PMehDrd/mYLt59ud4rVu6t+we
         VxqH9ygKrNVQZgOoN11tFgAIvN1CEGiIEkTD1A7s6ZEhSFw/tJfohhfCUmJYkwNNKHNm
         MsHk6LEBLW61EEq+94/gvDiBr8tgvVrLlCz0tdUbQE1bEx9uNl9Iymy6DPF85icFM2Ul
         GJaO9YtlGU+JYRLkdUynAgxKFrvtrUkMFMMxiVk0mH57OmCOp6h8tErRO5wECzewRx5F
         gGPw==
X-Forwarded-Encrypted: i=1; AJvYcCW6uZlWWECJfR0zT6fdyPUnmXoUX7+zfy0xFCqwq9wNwECN84qv0WWYqeWiqYX2CVLMP6LHlDE4+/Su+MhsEvmWQg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyQR5pw4/GtRNunB6aineTGq9+5+KyUVT3RhUCWFWxL3MklI6YY
	bHN14rZQCdejSCd5Vw72GTf9r+qjvl71LnkyVpt647cvBDt5W1yQHDp38+5gi9E=
X-Gm-Gg: ASbGncuNISm4KXlDUXCxTTtn1l3Oi5aABwkzsz0i5SN1wFhQTCR0f7EyJIzXownHFiH
	31G485FuftuogjmRNAN7Kyiry3gxquSzOdQHIu7GPgQBkXXU1+fh75Q5H7AuYdiYrpv5FkTW+r9
	ovTDN46cRU9jqQyP0bVke3QzGQnnffLtP25vhyGM4BeS7FQYWMMt9HLz3j5pGoBSH/JhdGIVBP3
	3+NnhFuL43bXlHzNndA+Ax+re7QucSPMhKbPaEIcR1X92rTSc76bV1DlRB77tHZof+xB40yywob
	5BdQOQNmioK0jRmMIVD9xIB5M5doAuLAQV3Y1THqvCge7Q==
X-Google-Smtp-Source: AGHT+IE5gkztYUI6n5lRsxQuRqbxqIIDlv03s+o+VvIsdITEJDsuoAbQn1ssL6byzBHRAC0+6intSw==
X-Received: by 2002:a05:6000:4012:b0:385:e968:f189 with SMTP id ffacd0b85a97d-38a873105c7mr2350377f8f.51.1736343094080;
        Wed, 08 Jan 2025 05:31:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:906a:f5af:b180:de5a? ([2001:8b0:aba:5f3c:906a:f5af:b180:de5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e74sm52208004f8f.30.2025.01.08.05.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:31:33 -0800 (PST)
Message-ID: <be31fe95a3fc283fcdab814d3d4ac9c5455215f8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 20/20] python3-jinja2: upgrade 3.1.4 -> 3.1.5
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Wed, 08 Jan 2025 13:31:32 +0000
In-Reply-To: <20250108084226.117178-20-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
	 <20250108084226.117178-20-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 13:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209560

On Wed, 2025-01-08 at 09:42 +0100, Alexander Kanavin via lists.openembedded=
.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
> =C2=A0.../python/python3-jinja2/fix-3.13.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 87 -------------------
> =C2=A0.../python/python3-jinja2/run-ptest=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +-
> =C2=A0...inja2_3.1.4.bb =3D> python3-jinja2_3.1.5.bb} |=C2=A0 7 +-
> =C2=A03 files changed, 4 insertions(+), 93 deletions(-)
> =C2=A0delete mode 100644 meta/recipes-devtools/python/python3-jinja2/fix-=
3.13.patch
> =C2=A0rename meta/recipes-devtools/python/{python3-jinja2_3.1.4.bb =3D> p=
ython3-jinja2_3.1.5.bb} (85%)

This and one of the other python3 recipes in the series will need
rebasing against master as I merged Derek's patch to improve python
ptest handling.

Cheers,

Richard

