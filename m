Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C2BC83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 11:01:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.12732.1752058905565497459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 04:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BdUHUMB0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cfb79177so30483185e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752058903; x=1752663703; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R1DA+SJ+ZOhetCPfmXK1ZGZtWr7SipK41p65Zhy4AuU=;
        b=BdUHUMB0icLTCRKFhz/BW2oygoqNrhMXPweOpGdhFLOpOyN4LIi8h9Nb4yh7QoTGDZ
         pbE7kL2izn+K6D1dqwqto89g9dgCt77ZLVMx/FOfIVAN1O675kJxwdi9pw7kHhTzxteA
         OKOXTrBupjif+A/UjD92Xijc+UR2m/hheqHJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752058903; x=1752663703;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R1DA+SJ+ZOhetCPfmXK1ZGZtWr7SipK41p65Zhy4AuU=;
        b=Tsr0VdKNsEKJmUCkuBohbyjxrWIEu0Xjago7ds+cJ0h5Hq3K3KfWz3BEtNtiAzGGNJ
         Rq2zuYIYo95oIkl2FO5krjAqdFa3dE3qFA/suf0pLVWd1wt+moeDkwXMmEI/112Cw9Yf
         UvK3/vwMJ1ivLpqT4AicYp6ID2eDDkNmdbA9FdWeqcHBKPSkAEgkBYCUlc0yAOxZyXIH
         nh7FlIkF4RZkKl9TQOxCmmrr0JBlM6X2v1v5PrWboLiXtehS5o1EzUTE5LR0lhY1wKK3
         SfzPotAt5xx7PE1A/PU6YBe3OttoQVAUA8hUO3Vf0CNM5nn662Rd/6KQFlYlXNcMU4Jx
         LLUg==
X-Gm-Message-State: AOJu0Yx8Ud4/cVgXnEDFH8rS5NpWbhvgxOswsXhbmKT3lhiXyFxv5Kho
	1y8evw5Kk3FV4ouUIg9MJEIfk14D+auuBPudBTmT+fTZ2Yw4cqlc+Ic9d7Gg31vCTZFnqEXRGzB
	yr+WM
X-Gm-Gg: ASbGncsKgT1TW2vH4Gcm7ntQsjF9Bac1svw79BoJk2l2qBbMwlZPsLZL2FYL70bjNa/
	FfnWG10ZyuH+vAfojZ03w29rh0nafxgj4fc9V1LmPmrJXZWGJAZYk4N502lM5iqBNzJ2GAOLVy0
	uApUirTuRzziw9pdLdBiwQp8htUk9enyT07iswWZFllyQKAy6lZkopi2r/wOLULSRtFrz8R+2xR
	y0FEQgrTdSM2TXRBRJjG9bK7zCMhESHTOTSJo/6BtHN4aAU+QFkVIXsfBfrc21WZ8T3tz3xM7Tw
	h4O8rwK92N5j6ukudhcng63xktytK5/rKaEOxU0+g+a3xKMXqnOM3ioR7kkMhE7/wutmfCUI2Qf
	237tksjs2y02mDDxBV81AhKBtExyc0FWOCdlX39JwnKSAD1tx
X-Google-Smtp-Source: AGHT+IHxLvvePS3I5VEgqfYm+/yCmtjcH0LEmhQqxPMnhsTOtxEn0A/oCxaZOIdPfZwu8qS/MYeNbw==
X-Received: by 2002:a05:600c:1911:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-454d5325f32mr20394925e9.13.1752058902891;
        Wed, 09 Jul 2025 04:01:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8726:2b2e:9de:f840? ([2001:8b0:aba:5f3c:8726:2b2e:9de:f840])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032e9esm19301725e9.3.2025.07.09.04.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:01:42 -0700 (PDT)
Message-ID: <710d2fadb83228574f9cbb9b907b702ea7229d42.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] toolchain/clang-native: Work around native
 compiles for some gcc configs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Date: Wed, 09 Jul 2025 12:01:41 +0100
In-Reply-To: <18503A99873E3107.27764@lists.openembedded.org>
References: <1850159E80660154.13503@lists.openembedded.org>
		 <1850367B6A0FF7B9.27764@lists.openembedded.org>
	 <18503A99873E3107.27764@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 11:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220087

On Tue, 2025-07-08 at 09:51 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> BUILD_CFLAGS:append:class-native =3D " --gcc-install-dir=3D$(dirname
> $(gcc -print-file-name=3Dlibgcc_s.so))"
> BUILD_CXXFLAGS:append:class-native =3D " --gcc-install-dir=3D$(dirname
> $(gcc -print-file-name=3Dlibstdc++.so))"
>=20
> but that doesn't work either.

For the achieves, we added detection for the broken host config to
sanity.bbclass, then changed our infrastucture to avoid that config
since it is straightforward to do so.

Cheers,

Richard

