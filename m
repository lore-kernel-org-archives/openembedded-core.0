Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F35CC9832F
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 19:58:51 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25934.1790452729605841089
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2026 12:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=feoQqHIW;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso13308515e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 12:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790452728; x=1791057528; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdBX62u2yLZe08LIF+DA9yjJdDYIP+18cXLzJMsXlc4=;
        b=feoQqHIWp/lj+AZBrAohwSXiGSoAMPsBkWqBRZDGPJYGyddU8t7ghspmj7AgJ0HzQw
         2y+biAK//1DCBjtucRgiYvz9BZ+zu8WV37T5ab7El9FGJHyZXFHdImNdYA9cGa9pSyma
         y1WTWb/CDE+soMNlDEldtUwYgTR68hUR9HzEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790452728; x=1791057528;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EdBX62u2yLZe08LIF+DA9yjJdDYIP+18cXLzJMsXlc4=;
        b=q3bqQqJVZBPnw0vDxuI2E6TzmS+6sj5qYXAKyalzfteeHp1Xy4hRbEjiUDp9CpfqzJ
         MOYXOYsLpTj5ipEdsAXLjxPwhYKtgALlgJAwnklobi7lSlKefd9uP3n9E87kfWec5I3Q
         x7e45Ly5BMdvDoSTLSDVenrnDMhgeRxDeXk1huXMylA5BSs/VbAjaD5vX1RzSsaP/++u
         fMRG+xr+e98a50o3/2Bj5k433oVuB38NM0aT48uO1NYWsRFbquUm/BBTIfXSutzRJ1JX
         NJPKVeZFcNMOjFJO+TsRH0wmCExxj32GjJSLxtyM3En/9irFvhJKdkpsdPKdkBOBpUlU
         T/uw==
X-Forwarded-Encrypted: i=1; AKwUvBwnhI3LsFODlHlZrrUgE+sEY4lxmkr0l7gbhy2lv22BPR9RCpnCSyka9p0SZ1a7Zi8vRYNePWyb2h0OR866UUrG/w==@lists.openembedded.org
X-Gm-Message-State: AFuF++m+AIalXkBL+wW9axLXXUxL+YypQxpgrXW6NRknPG8ro5uRCZlr
	tTFic+0RAzOauDPopXz7b7fGIcxCT9Tj57akbLIXKwpatUtg2uZ1o6m+75WbIIeE6pY=
X-Gm-Gg: AYBFou1v3lh5MpQdaSMkr28tsYIQOF8h38hfVGrVmSY66upMnhv5krvwiuYITZ6+m4W
	BWR/vyQm19/vCSB86b4OijdjsdsAf7mWgSKwI69e57yxpr7fWymFB8lyQdgbbjZG07Ijo3yPwV3
	MaLLiTEUqCs1/bYFlTJaGTsDXkmGs744Nx+E5CYqhudej5Q6MFotrurAdJhEK7ztxoUK2Pd5nQz
	hvy6u2HnatBBSWIHjseIrQkKW2EAYDQ02ns5h0VwbG3MSf1bZr+KAhoFdqE4K7JCIqxL+WFQFbf
	k31glcKEHt2LVUQ2ficnrDfvAmKSZzAKQsI+gk0R/A4R0AKY17CyMtKmgt8N8psGhxD+jbDPz4o
	++umTcBewM4qotJCx5NFlig0iHAHW8wTwKZtMs5nPvgJecbUPC8mYn0OCqa7YgPS4bFLJUrLU5d
	C7XfSvuSHykdnqcB2AviJcenDNF097ep6ZhoEJP/MQajg7SDmWf4TAzZ0561ejGuqTeciL44mDK
	8TvooXV/gky3t2pkhgqKbcJVdrOAfhWl8ymoPdd2fOW01hEibwKN6QMweYukw==
X-Received: by 2002:a05:600c:4583:b0:49f:d087:6526 with SMTP id 5b1f17b1804b1-49fe670d05bmr176985205e9.34.1790452727821;
        Sat, 26 Sep 2026 12:58:47 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcc4sm16800390f8f.1.2026.09.26.12.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 12:58:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Sep 2026 21:58:46 +0200
Message-Id: <DLPIIRL8T1SK.Z1VPO5EWVJQ1@smile.fr>
To: <bhavesh.maheshwari@einfochips.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [wrynose][oe-core][PATCH 1/5] ffmpeg: Fix for CVE-2026-66036
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260922070209.2770399-1-bhavesh.maheshwari@einfochips.com>
In-Reply-To: <20260922070209.2770399-1-bhavesh.maheshwari@einfochips.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 19:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246642

On Tue Sep 22, 2026 at 9:01 AM CEST, Bhavesh R Maheshwari via lists.openemb=
edded.org wrote:
> From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
>
> Pick the patch from [1] and [2], mentioned in PR#23783 [3] which is
> referenced in the NVD report [4]
>
> [1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/f0f634b6585fdc7bbb43ab3a=
e461499bfca9ad2e
> [2] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/5d7112c60e6f0f0742ce47d4=
48e6da0718a70f4c
> [3] https://code.ffmpeg.org/FFmpeg/FFmpeg/pulls/23783
> [4] https://nvd.nist.gov/vuln/detail/cve-2026-66036
>
> Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
> ---
>  .../ffmpeg/ffmpeg/CVE-2026-66036_p1.patch     | 120 ++++++++++++++++++
>  .../ffmpeg/ffmpeg/CVE-2026-66036_p2.patch     |  71 +++++++++++
>  .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |   2 +
>  3 files changed, 193 insertions(+)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_=
p1.patch
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_=
p2.patch
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p1.patc=
h b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p1.patch
> new file mode 100644
> index 0000000000..bce0265114
> --- /dev/null
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-66036_p1.patch
> @@ -0,0 +1,120 @@
> +From 7ac88955c4678fc10cc44a786ff9bf724bb12deb Mon Sep 17 00:00:00 2001
> +From: Michael Niedermayer <michael@niedermayer.cc>
> +Date: Sun, 12 Jul 2026 13:05:07 +0200
> +Subject: [PATCH 1/2] avfilter/vf_hqdn3d: reject unsupported frame parame=
ter
> + changes
> +
> +Fixes: out of array access
> +Fixes: 9aj_hqdn3d_dynamic_res.mjpg / 9aj_generate_hqdn3d_dynamic_res_mjp=
g.py
> +Fixes: wWDsy2oDvMuR
> +Found-by: Adrian Junge (vurlo) <adjun37@gmail.com>
> +
> +CVE: CVE-2026-66036
> +Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/=
f0f634b6585fdc7bbb43ab3ae461499bfca9ad2e]
> +
> +Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
> +---
> + libavfilter/vf_hqdn3d.c | 34 +++++++++++++++++++++++++---------
> + libavfilter/vf_hqdn3d.h |  2 ++
> + 2 files changed, 27 insertions(+), 9 deletions(-)
> +
> +diff --git a/libavfilter/vf_hqdn3d.h b/libavfilter/vf_hqdn3d.h
> +index 3279bbcc77..3467f27145 100644
> +--- a/libavfilter/vf_hqdn3d.h
> ++++ b/libavfilter/vf_hqdn3d.h
> +@@ -36,6 +36,8 @@ typedef struct HQDN3DContext {
> +     double strength[4];
> +     int hsub, vsub;
> +     int depth;
> ++    int width, height;
> ++    enum AVPixelFormat format;
> +     void (*denoise_row[17])(uint8_t *src, uint8_t *dst, uint16_t *line_=
ant, uint16_t *frame_ant, ptrdiff_t w, int16_t *spatial, int16_t *temporal)=
;
> + } HQDN3DContext;

Hello,

This change touches exposed/documented API: https://www.ffmpeg.org/doxygen/=
8.0/structHQDN3DContext.html
Are you sure this does not break existing code?

Thanks!
--=20
Yoann Congal
Smile ECS


