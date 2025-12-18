Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB09ED6ACDC
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:57:53 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38336.1766051865201182456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:57:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BZEtFlWx;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88a379ca088so5030376d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 01:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766051864; x=1766656664; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Bhv/gOZFzsD5tJEV3rWmuoAPJXJ0PTirCXaOj8pFLQ=;
        b=BZEtFlWxqh13ftpEROlXEm88elcyWRMwswrtxOcRFR2Rt0IT7TYPeQ1/vW2a3Y7jQQ
         UmYq38aiToN13/MztB82fyoqi133imWfuZfrPYffLsSDudNaSgVZkpfRO70r3lOJBFka
         R3SH4/uLWDIohpOsaIb/sR4B+Axvjj7IRT8BpKN47hjsjdhOShowaaUxz1CjjkiepAv6
         E4WWdbHz7bSumm0LqlCmY9QsBwrjK7mX28tftP6HziX2idxyaasv8VchVixwqT3ZhImY
         KPRbm9AnoIVRu5/8qu23DX/W5lmeuy0/TEru3utYQXkJsMttQlcEDJ+u/owsy0kD+XU0
         XRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766051864; x=1766656664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Bhv/gOZFzsD5tJEV3rWmuoAPJXJ0PTirCXaOj8pFLQ=;
        b=irjrbzB+hry32+IieSdXb68hijFvL2Ybr/uEU4gBMWtB6kj94aHiApGQrukcbK+Id2
         kqLKlo8kXJ5RIUAD/0v9jV+4ZWaQ34NVrQJRCY3Pp9kXS8xsPV2V7GXk55oFnfGNzZOv
         IjyLiZc00adk3qKNZjRXlfpz2pvB2m8C0egfzL/gVycut1Ltc9+xPa5XfCmW1QgYdfuy
         OflUWtpAS58ROke5ZLzYD/C7n/6MOulxL22bex35NiPkoApUVoyog3YasglBfWgowhE1
         AcDu+vHhn1d1HNuNIB+FwHDkDGQG0fsLSG4+uYXeSVSMTkbjt+Vq5qRU0Xn7+rg8Sq7c
         TJXA==
X-Gm-Message-State: AOJu0Yz14MEQ1mt81AZUJNTOc0Wxr0s0KYOa6PYcxOsAFXK9QcfYJ1Gu
	ih2iDiQJYxVgUBe47qfR5G2EdniEBCBywaATxprxBtsTNc9aZwDM3wVEy6OpPUOCcgMAaxR3AtP
	Um6GFAANMRBEChhRbiCr1rcGJx+YZBvs=
X-Gm-Gg: AY/fxX6GNCOQC2rT7LnrUmBtePrjaS/lChJTpyDW7PMRIQa2oM6Bc3eXrhF7RfPD3mw
	sNrsJvf0hvVvJermzbtZfCfFM6lvv83xNbobsKROqiBDuyDw6F+0a9n6TLSaJHFL2lJghjez4bb
	+UdIcIvn510Ut2MDpi+nrdPuFuEh/yKyR6zgaOHZBX81O+y9c9wcKyPAppr6K7xqq/Tsm6SeIy4
	mRAJzPaFA/EW8gvPpIlkS4Trbff0UjEABLZQCrfe4LZ1FRKCsLypOIpnvk4aZvb/3zyE922/hDN
	562KruMLMNho9fjokrSHSEm5i/JWwA==
X-Google-Smtp-Source: AGHT+IG4+fkSANM2Dy6NR8a2NIWmgruXLWYTRdiU30DtzEOqgnh0yUVXdXPJN7Bh6ZsLNxZ1Xxxpcv4vx+T5/0Xdujk=
X-Received: by 2002:a05:6214:12b:b0:888:8557:69e6 with SMTP id
 6a1803df08f44-88885576a81mr266783586d6.47.1766051864032; Thu, 18 Dec 2025
 01:57:44 -0800 (PST)
MIME-Version: 1.0
References: <20251218030448.1505377-1-miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <20251218030448.1505377-1-miaoqing.pan@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Dec 2025 10:57:32 +0100
X-Gm-Features: AQt7F2pPpjG8zoeiGqQoR-4R6SpaZCTb_C1f-m-rRNz7dY4MxNonOVzfeevSnT4
Message-ID: <CANNYZj_0PTV2QqT6T7n5VzynpzC8Fgez=DZ5SB1ux0=hSv99sg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] wpa_supplicant: enable OWE and 802.11be
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org, 
	dmitry.baryshkov@oss.qualcomm.com, jouni.malinen@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228106

Thanks, this lgtm.

Alex

On Thu, 18 Dec 2025 at 04:05, Miaoqing Pan
<miaoqing.pan@oss.qualcomm.com> wrote:
>
> This series includes:
>
> 1. Enable 802.11be (Wi-Fi 7) support.
> 2. Enable OWE (Opportunistic Wireless Encryption) support.
>
> --
> v2: Updated commit messages.
> v3: Remove outdated comments in defconfig.
> v4: Drop restoring the packaged defconfig; Upstream configuration instead.
> --
>
> Miaoqing Pan (2):
>   wpa-supplicant: enable OWE support
>   wpa-supplicant: enable 802.11be support
>
>  ...-Opportunistic-Wireless-Encryption-O.patch | 39 +++++++++++++++++++
>  ...nt-IEEE-802.11be-as-a-published-amen.patch | 34 ++++++++++++++++
>  ...onfig-Uncomment-CONFIG_IEEE80211BE-y.patch | 32 +++++++++++++++
>  .../wpa-supplicant/wpa-supplicant_2.11.bb     |  6 ++-
>  4 files changed, 110 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-defconfig-Update-Opportunistic-Wireless-Encryption-O.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-defconfig-Document-IEEE-802.11be-as-a-published-amen.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-defconfig-Uncomment-CONFIG_IEEE80211BE-y.patch
>
>
> base-commit: f63622bbec1cfaca6d0b3e05e11466e4c10fa86e
> --
> 2.34.1
>

