Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECB3EF3718
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:23:27 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20272.1773076999517609865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cQsuFaYf;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-899ee87355dso111436866d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 10:23:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773076998; cv=none;
        d=google.com; s=arc-20240605;
        b=KUoWJeKiZz0+C1EojmuWVINL2lkhMfpfozcITVpnquFU2mxePNFuH4gCPOWubjILB9
         w4PfePlcl2yv05BnnkBJimNDIPhjBNy7P7q8eu+lgQmQcnDgC3rcB7rL12m2ccEDI7tg
         xlzQzxMwr1mWIE+x+tOrAiR2I98mJyNsRdMMXQ8PXxFKG0Uq410T0fo+/3P2B4YWrfGT
         3JexBBaebBneqoxrsmHR7BlCyzq6NXMSbNibaSnK6Q8mGlgwGda5d2X5U2/DZLo6Hjs+
         XWAz/WEcxeJ6xhEGjd8W8oBUiI5DqplkaO1tR/sQqhiM7iCxTt2y0sIF4XAQLCE+lnMj
         0W+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=A+uName5jN/GGPQzEwyBhjac5VE4nyHiXJ+RfECzW64=;
        fh=0x5/VncGgBAaXvL7XNwKdEhekFOBpOS5ytMl6OuSifA=;
        b=lK/l2T/hmjoRMR8sDlp/gtaflGzH/M+TTEyvKMMy40TZ1QjgWqd0KEjD7z3RYnXlog
         ZohCop8LHm9uBeYkPsItapTKMiLb3e2scA2RRd5daeoqek+mGPK1PgZmCjpNcz7V//1w
         fDSz1ENdh7n7jYxsz3fuT7l28ODMefP2ABVJDzWD5BzirpbikWAmwDoHNtQ2WwHeroxk
         PGuaNhWXpT13r5XpAL315cnztAWEc5QsFoEhA2eJJWWj7XRKDi9NWmFgbDImgHkEFVJG
         i/62orosOZzJxKgIbBMtdTNIaI8Wj02MO5ZDsu4d3TLBQ/kSGjixQlIjnBYFT9dkd+bT
         86Hw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773076998; x=1773681798; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A+uName5jN/GGPQzEwyBhjac5VE4nyHiXJ+RfECzW64=;
        b=cQsuFaYfO6t7ql4TOmzj68Auhs8I9VnzT5zJAerMx20owYQAk85aiHleakS0KBiGHf
         Gby2CQGfGJ8OY3kPMD54mQZyeAD79BaiUAuSYGz0ikmUjpD/iexAyfcyveGAd29UMPg4
         Sn6IcKPgjyxusgfkaruv0beM/GbFEHdvzB3wIfoM4R2NpsLytWxWP0Ljzw5S8YDhqPUn
         sUDX1f8WxfvINdZpiPZpoGvXjDkGIWJ6qBIROxx1sSxuk3xB9fUOQzxbaW0UWlZXc9qK
         c7cRpX+WBZrKaSo/8+wh5nCm6Nv8vvfLzO4lM5OKtsGrpJqNt1jxjtGeNuN1fyiTQ2WU
         xl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773076998; x=1773681798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+uName5jN/GGPQzEwyBhjac5VE4nyHiXJ+RfECzW64=;
        b=H0a78Pdau5TeuX0pOCJR2bvyBSwbRiO3/ypFe2inHN8onJjrsK6C7HKhKF9RirQjXy
         BWAPdsZKBGPJuMy5EIOed53N/SlrPND3qSD62SkFIxVqsIxwbRpoxeI3XTOgbKBe7k3P
         J9/+4K4guvJazAmjCCuLslgQzyTPngNLddAoM+mGNbs97jypie38EHnEkTck6BqfOyA2
         wN2cLAa7Xo/fRMN+dzOgQg1GjLlrEggdMEuErQNv1ydFIlToKd1N4SpkgPQey7xPNJYe
         9Sx8IJrLQvc/BZIw2n7tgspzs1ggs3WlH1/YTsK9josc4i6hIq9mmIv1NzD7Jg9MpMpm
         L03w==
X-Gm-Message-State: AOJu0YyhcrTF1O5YQLJpaCJvNIlzM75Fcq+WAyeGir68SMInj6nXbtv0
	bxS8W1aT+8nf0FOc4LosVnxEPHK74QAAiE9IFnWZ5n9LliCywROd5zaoaHpwJDf1bLGMaf0hJSW
	jn6Jgncdc/J4txl6Kq6TtQYK5GSVbLDA=
X-Gm-Gg: ATEYQzwDQLTvh98IVK1dcpr+3U9BPC0MT0uqzDU/g4foADDwvv8LPnuI7HN/fNb2e0+
	iRsTqppKAJPprXDmrAgM8eazarRGk1oOLENz3jjjOx7lGaUcDSk2UUDghnzPazkI7B2PDr2SJ0z
	3dLY8flleL23zXwx3qdeHfsl6izJLX6nRxvRiQ3AaHDy0sSj5A2RSuEGEDu/FYkIwGT4BwRKrra
	617DQVgeIM5MG9x6N+k50vugsTuHi+ZqYXBaVAGGfxAOrLkr9Z4RvpNuvFRNwB4m1JJNq1bDpsj
	QF0igCxQ5+f55jDjlS9gM9ccfVlM1AkC1ZGVVlZh/XmooGgB0Cvw
X-Received: by 2002:a05:6214:518a:b0:899:f0af:4f51 with SMTP id
 6a1803df08f44-89a30a34904mr148626486d6.20.1773076998435; Mon, 09 Mar 2026
 10:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260225033725.708-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260225033725.708-1-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Mar 2026 18:23:07 +0100
X-Gm-Features: AaiRm51ITLYh8WWVTeTs8NwGpSjPMmWfQeKVWv6XoFP0NhqvQMJZZ2yrrnlICE0
Message-ID: <CANNYZj_JP3pWfO8=MPWBD8WiLEgr8SAcjAdM-ij7Ysu-3bzWeg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] orc: Enable hotdoc to produce doc
To: liuyd.fnst@fujitsu.com
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232734

On Wed, 25 Feb 2026 at 04:37, Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=fujitsu.com@lists.openembedded.org>
wrote:
> +PACKAGECONFIG[hotdoc] = ",,hotdoc-native"

There's actually a build option called 'hotdoc', to control whether
docs are built or not. So it should be used to ensure build
determinism and reproducibility, as otherwise this is a floating
feature that gets enabled (or not) depending on whether hotdoc-native
is in sysroot.

Alex

