Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13FEC9832F
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 20:37:27 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26019.1790455040252928281
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2026 13:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UEhAUZnK;
 spf=pass (domain: smile.fr, ip: 74.125.225.99, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48881a62e09so907245f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 13:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790455038; x=1791059838; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bP9B5xxe+n8a4yzZRzWrdHPWJ36sDr+ECZnc/0Kz4qM=;
        b=UEhAUZnKeAX1wiS9ERYx6qS9CfCzWp1Y0Dsc9o9AaMCBCotkU9s5zaWoH9jPJKAYmB
         7ghfbGMMNhZOzHwW5IB7Cfu6JCnfnG/6cO9rY8Xf0hlHP2OPnrNeQM947HZOVe0Geiek
         QohsOPZxzOM2hpmMBNJdEF0dYm7OD8Jt7n6iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790455038; x=1791059838;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bP9B5xxe+n8a4yzZRzWrdHPWJ36sDr+ECZnc/0Kz4qM=;
        b=YjX7JQS+i4KYe4K7569Xtk2f3PpCfknth7owGT4HVoaEdMLWBXskaqP7e5RTbab7+j
         +Ebp5srKSx2XO4GyPY5S/ixiCcADpwlAKvbSEcUPbGBnTx99KLpPFoYMjdTpJAf7eTR2
         DEBFJwThZp7qldqrRuWJbywObHyFwfvm+A9pAu9qCy1sSsxMOV9ScrsuScdoaDxYPTjF
         0oH8N1aCu9DkRpdJECiqfvG5Ly+cHzxtqsTXpHmFZmASMtr/6EEzQhzQ0gPRLA6JZ7Yg
         i1uZz9oq98xPcNs1Pe6wUOaAXPJ2MIaSeQmpyvX0KiTUJHYr3jiSTm6RKVdketurDLD1
         Bh8A==
X-Forwarded-Encrypted: i=1; AKwUvBzMiihzxutLeJCw+Ld9RIX0SMqBsF2vdR9+z9vV69oLzPFCjKy4zQAdCVYB1x0mpxCjyTPr5LOJtCYe1pWef82N1g==@lists.openembedded.org
X-Gm-Message-State: AFq9FYI4y6AX0M0jQ+7nV7BYG1Acu5vp4iMPV+yz7/lWe22xb6Sy4Mr2
	lAaRdPAeODo+bl6jcivjaYjBIIj3pxFuIya8CAGN3CRjYJdYpHDmqOQlOycyyzFKj80=
X-Gm-Gg: AYBFou0bpWOMd+oMAPul91JvHdWijItggn17S7tVdTJidskmw9DK02uU3eq3iCrYL5g
	mSUnbvRms77WmNUA/wtg5iNl3Wj11MzrhrrSQ5M0EJ5ZfIOUVbVwNKSE2YxJFRfEdgB6tsfJdaE
	QWWNNX6ncb8gh8m+W6oBIbfvOpqxE2i04rkoxVEcyBLZ3cLS+pBaY30iNng0oOSEQeYHGyz9Rp1
	l2EpQbHNMSU7ff4IGFsJ2VCefllCZ3Ql+ZkvClI/lNZmnCklJdo8b1W1ml1ZRTZWZ2Im9qtw4HZ
	SjIfRlpXzD857kb9qKgngBmOPk/vYjKziIumgB0xyLRMZ6Tbbz4toP3suSGddky80K6cWqmfPc+
	I/xUR9g+8FgKDBXX13wSV0RCgN9oRzH0ZKrbijbaFN9QM05KviL+YpZurIOp93Bie+y/xfuIdfA
	BPbp+xp3wLir/wPDAcpUVJKNoZJuH9z1iYbN2z7fc9l6f3DCkJU8DDtfnVMmNV4D50r0CxqUn+N
	0nEtxhWM1uxhTGHkcO3sNjoMiLk1Pe86dsrDBT9kSYj03kbvCqCaqicRSCn1A==
X-Received: by 2002:a5d:5d0e:0:b0:487:370:45d3 with SMTP id ffacd0b85a97d-4887175a73dmr18062897f8f.43.1790455038336;
        Sat, 26 Sep 2026 13:37:18 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b9aesm14880641f8f.5.2026.09.26.13.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 13:37:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Sep 2026 22:37:17 +0200
Message-Id: <DLPJC96BOERE.3M87L9353GN17@smile.fr>
Subject: Re: [wrynose][oe-core][PATCH 5/5] ffmpeg: Fix for CVE-2026-66041
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <bhavesh.maheshwari@einfochips.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260922070209.2770399-1-bhavesh.maheshwari@einfochips.com>
 <20260922070209.2770399-5-bhavesh.maheshwari@einfochips.com>
In-Reply-To: <20260922070209.2770399-5-bhavesh.maheshwari@einfochips.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 20:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246643

On Tue Sep 22, 2026 at 9:01 AM CEST, Bhavesh R Maheshwari via lists.openemb=
edded.org wrote:
> From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
>
> Pick the patch from [1], also referenced in the NVD report [2].
>
> [1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/4da9812e25894fb51d62a887=
5cfa8eb39b5e20f5
> [2] https://nvd.nist.gov/vuln/detail/cve-2026-66041
>
> Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
> ---
>  .../ffmpeg/ffmpeg/CVE-2026-66041.patch        | 60 +++++++++++++++++++
>  .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.=
patch
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch b=
/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch
> new file mode 100644
> index 0000000000..7a8c4e0c8b
> --- /dev/null
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66041.patch
> @@ -0,0 +1,60 @@
> +From 9db6b5816516b85e981e177863b2eb361dbec3c8 Mon Sep 17 00:00:00 2001
> +From: Michael Niedermayer <michael@niedermayer.cc>
> +Date: Sun, 28 Jun 2026 15:33:38 +0200
> +Subject: [PATCH] avfilter/vf_quirc: resize the quirc buffers when the in=
put
> + size changes
> +
> +Fixes: out of array access
> +Fixes: JbvzNObhorBp
> +Fixes: 030e140145 (lavfi: add quirc filter)
> +Found-by: Adrian Junge (vurlo)
> +Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
> +
> +CVE: CVE-2026-66041
> +Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/=
4da9812e25894fb51d62a8875cfa8eb39b5e20f5]
> +
> +Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
> +---
> + libavfilter/vf_quirc.c | 12 ++++++++++++
> + 1 file changed, 12 insertions(+)
> +
> +diff --git a/libavfilter/vf_quirc.c b/libavfilter/vf_quirc.c
> +index 59dc84caa8..d2ba48e7bc 100644
> +--- a/libavfilter/vf_quirc.c
> ++++ b/libavfilter/vf_quirc.c
> +@@ -36,6 +36,7 @@ typedef struct QuircContext {
> +     const AVClass *class;
> +=20
> +     struct quirc *quirc;
> ++    int width, height;
> + } QuircContext;

Same question as 1/5: https://www.ffmpeg.org/doxygen/8.0/structQuircContext=
.html
Are you sure this does not break existing code?

FYI, for the series as a whole: Since 2-4/5 are indenpendant of 1,5/5,
I'll keep 2-4/5 in my branch for tests/reviews but hold 1,5/5 while we
clarify the API change.

Thanks!
--=20
Yoann Congal
Smile ECS


