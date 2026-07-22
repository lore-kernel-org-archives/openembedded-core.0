Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A18BC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:43:22 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5879.1784742195805547867
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3KTBPT0R;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f71156e1aso2109466f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784742194; x=1785346994; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n6MUSBgz40qohRp9e/jxp9STuuHRVGBN2w3K9at3g60=;
        b=3KTBPT0RoKMGkUZJUxOhbayHopyaLHqlwVzIdZGU6TygVuzWn3QS7WRDV3YhraDkvp
         7nu+AnzZwV+Zo9kAw8FA1lH2lH2COqcBct7uDoJnO8U8LiUq1FlGHYFKMpH9dWh76dwc
         nTfaZJHEpqYm+n6Hug7t3qcpQ/oOq/GunXTPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784742194; x=1785346994;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6MUSBgz40qohRp9e/jxp9STuuHRVGBN2w3K9at3g60=;
        b=Aw5c/2QXVsIbi08YWPeh0WFWfcLDLq/v5Kqq7kkGps+2o9Xeq2w8f0Kw/mmOyKnGcV
         m50kVAfNDHw9SLDTMR28lZTHRXEGsR95U2Gv107hapIO9dBNIC+BV96dTiz9uRjAjAoA
         IEWZPnXTHCDClI/4MxPg2x1johyluusrV8HkbM5946Bt8t8/Vp5G47ohZQIKRZv2hHLg
         MuPqrI1k0bTiaIJREgBBNV9gzK3bxLyzaxWdJLhhWVGwYJ1v59R09EV4GJhooy7X0P+v
         gEUUQkdUDOzqQcz3CYMGyFqDZhhxWD4pDlVGOmzHSmw7cvwuMX54B0srQcXV9xZ53dCY
         zghQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVaFmBYxj1KfWScTSYBQaOTag8L3rL06IEg06Quik5NRvKVr5wX2AZNEf0lpu0xWvZm6WIg/EHEr86Jq1aDISE2Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzFMELvQM4oBXrZNFMb1vmbDWWrwQNkv12Sq8U+BOIFirZP1P7K
	vIcB/aoFxQCIxKSOzNRFPXj5qjTatDCQFsYirhYve/wFoLOdr1rxxe/mUjh4ynJxs1Q=
X-Gm-Gg: AR+sD11MfDeran9QKVSC/SvKrgNpqHyTMvagw6Nbi2mhCO87PMwNq95x/Q2s0gCkiGn
	+C/jaoYBhMR5+mp+izVOlWIvRGI2fmd3JF3pWPjVtTCN/ojLnuib3kXvhjFW+BjsQcUSCv3S5xd
	IKpAYq7dgFKHWQR5x3sDRBJzKWdbj9POlbKw01E6luHActj2Oyw45Fndn0B3K4yt36n34m0V3rk
	kPf+akAHBRtddSqh+gF6XHQe91DKk0aqUh6xUXPMR4U7AJZOwow9/vWbnkrEEUojliKcYQiIUFa
	Mh9r3K/QJtao72ujw4VY6EBdZRyWbu2K7VuOwkEmbLsv4cPJUJ64NOKIBZl1+gG4se22+qBvGdR
	Hm86NOmVImvKEC35EHjVqxJZ9++o/BxfJ9V49+/0+/dPY2IIGcg2sVKxTGA5d+ElSD5o17TvW83
	xTVw7LW0djoK5bdgDffR8CZerO0GYdace0CAGnlp5c5gTjJHqw8l0S01/jZNjEQg==
X-Received: by 2002:a05:6000:4903:b0:47f:6f92:84aa with SMTP id ffacd0b85a97d-47f6f928583mr19926839f8f.53.1784742194047;
        Wed, 22 Jul 2026 10:43:14 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm8585289f8f.20.2026.07.22.10.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 10:43:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 19:43:13 +0200
Message-Id: <DK5AB0SRDKFY.7NIL8TCKZUUN@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469
X-Mailer: aerc 0.20.0
References: <20260722101230.34771-1-hthakar@cisco.com>
In-Reply-To: <20260722101230.34771-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:43:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241739

On Wed Jul 22, 2026 at 12:12 PM CEST, Hetvi Thakar -X (hthakar - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> It also includes the upstream follow-up fixes referenced in [3]
> and [4]. These correct the trailing whitespace check introduced
> by the original fix and add the required <ctype.h> include for
> isspace().
>
> [1] https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7=
a4fb0b6f7826
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-58469
> [3] https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a=
00386c3f3bcf
> [4] https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aac=
298c24fe00a1
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>

Hello,

I received another similar series 2 hours before yours:
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D48993
Can you help review it?

Regards,
--=20
Yoann Congal
Smile ECS


