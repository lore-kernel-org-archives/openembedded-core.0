Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA7BCAC587
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 07:13:51 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.6584.1757402026991493370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 00:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hBgPWBx0;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-72374d6a6caso57665786d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 00:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757402026; x=1758006826; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=euqMcQ28V7FTf8ojmAHMNyNhm4dk8qc6RQA3PfFIep4=;
        b=hBgPWBx0hDE4pvi854g1dAEKYM6azB1JVlXFL8NDaiv5Aeebv3p3Slb7fcs7BstsoH
         09TnSDKPechvYLQQqu1moREAxiLpfqrE4FTfpMoofc9hpY0xff7IbNRkyg3QAysOflqv
         l6oq7jHaAGe1h4yPEhIPiZO8cMl1rXptLjcNgTn9myn2qmLGY6L5mOdXOXPH96guQ4sM
         4dx4ATRMUjsPFdznmCgJGraA754AGkZOHzbkYB4yavwkGVY9slLt2P1pKgq4l75vISDK
         Agufot3+DDbsGJL9Ksf3WsN2QBC4t9vnuEb4s6djqvXMH0QZhLngiNDjRRSXrn6cY2Lu
         an2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757402026; x=1758006826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euqMcQ28V7FTf8ojmAHMNyNhm4dk8qc6RQA3PfFIep4=;
        b=Q4HGMlgAakQAXceHUP8ODo8wRFQVYHNOA1T0IO/VtulyB0tSUmwAai4nZ5umnCP/vS
         SZc/E7QHSrQEDia330XW0vfFNQ42BsKdZ51G82VOVhln69Uro7usXfO13NURMLR9I3pc
         MZkLgNbvW1GcTtsmu1PlsUoenKkhNt3dffOOVor7CXhlAgq3BwD6ckZjs+IjrvI54+zv
         +uX7OfWMbfN6gv7HvmUvtGvXdBGalWuiczSNGLdM3CM0MdEGoPeDEi5jLQwbW/yUkepm
         Bn2jTWiTaqmO1KSqeW30hF2LQ4V0rtW9TuCHcfQI1jmoxDpelWpYyrExm+AmGxXTPmJ1
         99qg==
X-Gm-Message-State: AOJu0YwIBU8HXpkv3oOmeMK43fKTtg+QYSsKQ98Z4TqZoyLMIt3THx0y
	PskQuWZ+qZ9JE5m+aTiE50wbwRqQkydaSitM7fFaQrLVobUeFZMi+wCK97jhNtIHZLv1WE4a8mI
	+EVZtc+Gud5dhnnSvbFertajNSoWeYJg=
X-Gm-Gg: ASbGncunJ6AJun+cwO6gvIQiEaa542MBSHfI5pV+RwwEFTQWWcrgJE5TtqzoA0bxAlI
	LyZ9sBB9bJKj4rMy7NrxPPcZS5XKeb/cwpG/d3heXvnWEJ2kUEuaYxmFluScBguzBoquqH30MAF
	udDcUhuF0mx+mNY0H47THyvpxzghOH1h3DIfEg6rwW7O1LxnFpfeS83vcdllPxulHC6jrVsLv1W
	Ew/dANyMrvJrMsU3DkWDHphsRKuOiZD3TzLc/6x/cjBg4hwEgWA4sYIMXPZsxc6ph8PjJY9fVSq
	lYqZj13tyU64D/ZQWkkm9narCQvyn/onI8bhdEE+
X-Google-Smtp-Source: AGHT+IEkHv2pCdQQ9crNGyvysJDd9C458mv/xpFEMC8H9KijDuSMRTTwkOfgrWrQjwK27KmPI/dQVlH1mEYpZ4tnwM4=
X-Received: by 2002:a05:6214:f2d:b0:70d:b2cb:d015 with SMTP id
 6a1803df08f44-739453b4d70mr125742816d6.67.1757402025786; Tue, 09 Sep 2025
 00:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250908135933.889249-2-dwagenknecht@emlix.com>
In-Reply-To: <20250908135933.889249-2-dwagenknecht@emlix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Sep 2025 09:13:33 +0200
X-Gm-Features: AS18NWAlv4_6RotcR4nc6EUamfD2_j88GKU-OijC3qf9JMCfVBnx2zNJzFG3aLg
Message-ID: <CANNYZj_GhJpNrtJjotmv9hvqTbfzS5CtGnOJzx4tBKyTqG6UTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildtools-tarball: handle missing host
 pkg-config gracefully
To: dwagenknecht@emlix.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 07:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223089

On Mon, 8 Sept 2025 at 15:59, Daniel Wagenknecht via
lists.openembedded.org <dwagenknecht=emlix.com@lists.openembedded.org>
wrote:
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -73,7 +73,7 @@ create_sdk_files:append () {
>         touch $script
>         echo 'export PATH="${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${sbindir_nativesdk}:${SDKPATHNATIVE}${base_bindir_nativesdk}:${SDKPATHNATIVE}${base_sbindir_nativesdk}:$PATH"' >> $script
>         echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
> -       echo 'HOST_PKG_PATH=$(command -p pkg-config --variable=pc_path pkg-config 2>/dev/null)' >>$script
> +       echo 'HOST_PKG_PATH=$(command -p pkg-config --variable=pc_path pkg-config 2>/dev/null || true)' >>$script

It is not clear from this change and the commit message if
HOST_PKG_PATH is actually expected to contain useful values somewhere
else. It needs additional research, particularly to reassure reviewers
that an empty value would not cause problems.

Alex

