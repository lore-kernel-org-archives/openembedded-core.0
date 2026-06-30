Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EEFDC43327
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 13:51:23 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21525.1782827475058135476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 06:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fMxUVB2q;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: twoerner@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39acf7c6d59so37978231fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 06:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782827473; cv=none;
        d=google.com; s=arc-20260327;
        b=Ww2uoFPAa0y03g93pIpzkRt3bEvg6bm7Tll3gxmkrxz7zSPztLfALR5L+/nFT8BGNd
         llgFyH3eoQiiItv8ougoolmmHRGPPueWfM7GlYnV2jHTHlLZ5phSao5zJREHTtGDkgop
         7AmOzsWnZV41Wy22QU4gaTQdjvt2rQG6jGvJblPmE4y6ZBTZnRa+KnWlGCoQQ91Tn9vy
         mQ2FhJnVIr7ds787IjupTUBOrIx0Ji0R6OhG9KLNpk0dLTabs2YPxEMuujWPT1VvlkFP
         a0rp4GYl4ruSPZWtyObwLVmJ4ViK95JOSGgyEacnAnRDzsICP2tHKu1LKlqt7RaFWjpT
         CJ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vf47Wfd1ykrOSVLyryGpokkxwwIvUMioncZe1zGobi8=;
        fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;
        b=HwLckWLSNfUNa149L8r/BUwM2gq9qhDzTudquihRZrpR79LJNyRCnZ0zNsFQoio5U7
         kBXAECgyRLiFhXrHyiJz8rjguTe9i8cHkCVP2XEeCsgBxj8FbxvUo9U+Dx5l32oEGxzw
         DLqtNe9tg6RU6UVXd/FSHxd7jGW/Te4cFERLx/LyodZ4uwMRRPcSp3W5sIT6TztXp5fM
         WV7g/3upbL0cNWWf64GbKniq/eH92gbwdv/5A4aMzxBaXlaqQYcge4AblCGNcc+qhRMA
         9DpTcCBAhXwaT4EvLUcbhbBeVBNHUKvm0hTrIqMjR90nrxVsMJcZ4oliZCuzNsllraTd
         j1HQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782827473; x=1783432273; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vf47Wfd1ykrOSVLyryGpokkxwwIvUMioncZe1zGobi8=;
        b=fMxUVB2q1jeEFsTkloSpbADwNXkk5HSsv+U0I2qRhr1xt9NlTxr0V0hk3aTNS2mJst
         cDPrQbUm4bYwAVJ8xk2PB1pkxCxPlue29kNscCv2rPkm0yplFNVkGdOdQfVWNCSMMfA7
         s+YFKuCvnLXqVgSOdWEXPtQVzw89gbUi5KGiMniWO5F7/yZ0TcDVZ9eaIoloZhPnvdtd
         aAsKwsTz/UP1qdtva3HEHT8kCqwXoWCGOCsIP2Z+ly97SUzJqvyQn4lLQbe9H22vXeyI
         B03Q94WgTUryloV8Jbo75ZDs1maVJJcs0ispJS1RInua6yiTWOj4OXbMhNxOAjs+7DD/
         +SMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827473; x=1783432273;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vf47Wfd1ykrOSVLyryGpokkxwwIvUMioncZe1zGobi8=;
        b=fBNdmtNFXrl45h39FbhQwXAmlrq/ZOk2v5cWMosqh2POemp8oQDp+LcO6R3grUDj48
         PN2HNpBs3Qhx/Pzq4fE2dWYSM/Y4Hle5gHb4Y0zL19slIQ9JwnWKXXNYmE1tNXgQxB8o
         DJ/RPo5sbG0T590AnK2/hTcqXHAxa7ys6mXhXuyGv+0GUPZWv9sqHXNJhVw6zsDv7uV5
         WDHnLCOKSrDYLLkkTmZQzwI/IefBRYEsRxRj0VMrb1eQAMCgERQhn3GfvtEWQN4d9ChH
         SfzjrU4ABTuXZGU0E6/rm8VU843eEhXcOSIFLZSCMLZ/4kRc8fbC/aofoCQquCcYuD1z
         964A==
X-Gm-Message-State: AOJu0YwkqYZU+QZj/Z8kdiH71D0DzuZXtVJZc2p8JhL7ExwV4A/MWThf
	IZ8k+GaO6uel9N7jiU9vVjpBd3dPeD843fKI+bxOZ9HCWWhXqi+Ul2MorXfhP1wtNBFDr0ggWzQ
	Qf3Sv4I06GSgmoIUbHkqOv5vBh843kiMwlQ==
X-Gm-Gg: AfdE7ckKgCVjJZR0/5XPlgrfhi/fJyJlH1mQBknewFYZaCU12nrBgDh9Ifb2jIwC4OV
	HLjzmszKtDs0be0quG4mWlruQnGMdwUX4aZ8sIMdZiSdo1ka/OHItNlGAYQNEa4Jhy2LrYx9AOH
	EE9FNzjTC0eXO0a1hPrnOnb/E7w5NS7UhXmxTe1o4HOMGX5tbCT68bQcWPSf5Xg1qE/6eOeX5Ym
	FYE+pDdL0pIol6CsPqN9cs5ZDi6uxTIiaaBs0WAHL1DjW1ld2EZnojofMr/1aL3+VGyUYZhg4P5
	Oe8EdreR
X-Received: by 2002:a05:651c:234d:10b0:393:d706:7bc with SMTP id
 38308e7fff4ca-39b28bbfa18mr2222921fa.0.1782827472598; Tue, 30 Jun 2026
 06:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260627180658.558372-1-twoerner@gmail.com>
In-Reply-To: <20260627180658.558372-1-twoerner@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 30 Jun 2026 09:50:59 -0400
X-Gm-Features: AVVi8CfVn0gcHmwqU1gAndMaj8QY65BRu_NKff2BqCXllgqGeWfz-MAgRFhoTIE
Message-ID: <CAHUNapRFfgnAtx8=k0AduSh=O7m8HFAsdNHKyFuaqp2C3My91A@mail.gmail.com>
Subject: Re: [PATCH] wic: upgrade 0.3.0 -> 0.3.1
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 13:51:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239898

NAK (if it's not too late)
I didn't update the version in the wic project itself.

On Sat, Jun 27, 2026 at 2:07=E2=80=AFPM Trevor Woerner <twoerner@gmail.com>=
 wrote:
>
> Pick up nine commits since the v0.3.0 tagged release.
>
> git log --oneline 5974ade11032f218841d9f449ef0efeee3f9a2ca..5137f70fb4318=
9d98e5738b7734f69f214516b97
> 5137f70fb431 wic: Update after plugin name changes once again
> bb768b12b733 bootimg_pcbios: fix typo in comment
> 85067dd89492 README.md: literal cleanups
> 9c75ddc60d06 README.md: add Trevor (the maintainer)'s mail as Cc recipien=
ts
> 0cbe5b9d2934 README.md: add example instruction for sending patches
> 1f9e8c77c049 add basic b4 config file
> 0a8ddac66dc1 wic/plugins: gate root=3D with rootdev check for efi, pcbios=
 and partition
> f20cda73b495 wic: Fix updating fstab for nvme devices
> bc0a8d88f6cd src: rename top-level bb imports to avoid oe-core/bitbake co=
llision
>
> AI-Generated: codex/claude-sonnet 4.6 (high)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/recipes-support/wic/{wic_0.3.0.bb =3D> wic_0.3.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/wic/{wic_0.3.0.bb =3D> wic_0.3.1.bb} (90%)
>
> diff --git a/meta/recipes-support/wic/wic_0.3.0.bb b/meta/recipes-support=
/wic/wic_0.3.1.bb
> similarity index 90%
> rename from meta/recipes-support/wic/wic_0.3.0.bb
> rename to meta/recipes-support/wic/wic_0.3.1.bb
> index 7dbf84b039a6..bfd34374a14c 100644
> --- a/meta/recipes-support/wic/wic_0.3.0.bb
> +++ b/meta/recipes-support/wic/wic_0.3.1.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4ee23c52855c222cba72583d301d2=
338"
>
>  SRC_URI =3D "git://git.yoctoproject.org/wic.git;branch=3Dmaster;protocol=
=3Dhttps;tag=3Dv${PV}"
> -SRCREV =3D "5974ade11032f218841d9f449ef0efeee3f9a2ca"
> +SRCREV =3D "5137f70fb43189d98e5738b7734f69f214516b97"
>
>  CVE_PRODUCT =3D "yoctoproject:wic"
>
> --
> 2.50.0.173.g8b6f19ccfc3a
>

