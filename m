Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288A5C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 13:04:18 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14406.1789563854927444112
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 06:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ndLB1Jdu;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so4431345e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 06:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789563853; x=1790168653; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fSiCPMjJILPDM4zD6aiXbww0L3vL8B0ESmwyhv9GVk=;
        b=ndLB1JduyQHUGCsh+L27RI2z+IWN/e9/bPFhWXqGzgO7RxLus6TfWDuIF5NLmDeNLs
         C0Wm3qKk3c8Y7p05Q8kaYusurIwNy/5ZAIEGAVQqzN9drjKq86sXZhcFICcSKhhmSXBR
         7xx8IYJ5eZ/jYkq54vef6XHtomhdeELPLDkSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789563853; x=1790168653;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5fSiCPMjJILPDM4zD6aiXbww0L3vL8B0ESmwyhv9GVk=;
        b=KSZJgbmPwZvvOmNuje9T4Scg1l322P/jc+OcavIPTR+G1Dnj0yiOT8ZQ6BxKl3iMfR
         sNHDnZrUpIBxCHssgWLhuAA6+NAhpKBMPFeFYnwEY9qRPIovdOZkextlBfuQqbCrVUKe
         NIOSEw+Cu4a5mJtPTrFXWSvQD3UgnIZE7VRpbm33LIvANwg3vA9ZJclXPxb5YLgdFO4W
         OZe0XK8YWE8CzOmLLNjGEhXPpYM4KMGyx3kjcsI6I/+wzA16yS6FO8KGQww2X1BDZrYO
         WD7KjqMnsNH28q3o2NJmgugSCZ6GLZcn3A2KowhGmjRh9vFpK3NLBeDHXT5XxLWKLgt7
         2Tjw==
X-Forwarded-Encrypted: i=1; AKwUvByGacIEiO7DQNvUsQbDazMt/0P5YYDgY6/rEtMPrJsFcvy0lzyJCT/bdLeyYp4lH6gUJ1HYcv4Vp17S5GBJQ/VfZQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++nRKd3fOrVMo5le+Se/W2PzUVqtaeOgsRqyYcH2tYfDLCb5a3NR
	Ri+vBNoVmD4pmDbjVRYoHDF7a+gsLCWheP8i5uwpoQA61TRiB+lksEfug7r/vs7EDs0=
X-Gm-Gg: AYBFou0iCYgRFQDWsWci4Zvro0f38BF012DBJN+8PzOe/8IOIHwparMeQ8BXIWPQSBv
	uzDBFsNG/1Pm1i8CHhE0HxIsLCquT24Ic/HbLIGCf03k8it+f0jj/Y9CNU88+GzFtwlR8k/PVmc
	iX59HhbSmEKJOM++kaJUXMZyRC2PIKwuKIrYzjBonLU22wTXukGjMZlWqDEdV/IjcXxxz/sEbjh
	sdg+YP5eNDSCjyDPyx8lbFX3leoA3JCWzawnQcUhJRVkCUaA9sgrhyzlkEXrSDWA3aQvtrgdbBV
	JHZZi8IAhm0v2ibXMuqehfqItY9R8A/XZx+d3TPYGOOyrEpnB+3WBQip4Am0B6Gy9mn+kkAhFZG
	LxfWwhQnW9+/D73LJ/CMLxpcYydfhL7Ui/OGe7DgBFavr4Lm6OiDla1EexSg43oZN+qrt9mKPbB
	IUmujS60oQYrOwPyVbNa8IABOTFgu6dDvk0iO3zaYJiv99yftXOVVutoPbXxEuUGa6xmgP40DMY
	y69P4H0+HqpvEn6qUq6OBna2mwtEkGJNqZK5/OYwfF8IgyOQxkJlWqtwHU=
X-Received: by 2002:a05:6000:41e3:b0:487:62d:37dc with SMTP id ffacd0b85a97d-4870cf36d6amr3458391f8f.32.1789563853004;
        Wed, 16 Sep 2026 06:04:13 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm8132872f8f.1.2026.09.16.06.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 06:04:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 15:04:12 +0200
Message-Id: <DLGRFWDPS373.3B9ZUABYX9HHK@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] vim: Fix for CVE-2026-73071
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <bhavesh.maheshwari@einfochips.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260902085553.2299768-1-bhavesh.maheshwari@einfochips.com>
In-Reply-To: <20260902085553.2299768-1-bhavesh.maheshwari@einfochips.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 13:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245972

On Wed Sep 2, 2026 at 10:55 AM CEST, Bhavesh R Maheshwari via lists.openemb=
edded.org wrote:
> From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
>
> Pick the patch from [1], also referenced in the NVD report [2].
>
> [1] https://github.com/vim/vim/commit/f8126294a526aa80c5123eb3079e325daee=
9ec75
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-73071
>
> Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
> ---
>  .../vim/files/CVE-2026-73071.patch            | 128 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   1 +
>  2 files changed, 129 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-73071.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-73071.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-73071.patch
> new file mode 100644
> index 0000000000..6012bfd396
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-73071.patch
> @@ -0,0 +1,128 @@
> +From f09adcf1b1a876e8a9b00a7b3ea15865ff194aad Mon Sep 17 00:00:00 2001
> +From: Yasuhiro Matsumoto <mattn.jp@gmail.com>
> +Date: Thu, 16 Jul 2026 18:39:24 +0900
> +Subject: [PATCH] patch 9.2.0844: [security]: use-after-free on json deco=
de
> + error
> +
> +Problem:  [security]: use-after-free on json decode error
> +          (@tdjackey)
> +Solution: Report the position from the current reader
> +          (Matsumoto Yasuhiro)
> +
> +json_decode_item() caches "p" into js_buf, but json_decode_string() can
> +refill via channel_fill(), which frees the old js_buf. When the string
> +parse then fails (e.g. an invalid \u escape), the shared error path pass=
ed
> +the now-dangling "p" to semsg(), a heap use-after-free read reachable
> +pre-auth through the socketserver.
> +
> +Github Security Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-69ch-22ch-r887
> +
> +Signed-off-by: Yasuhiro Matsumoto <mattn.jp@gmail.com>
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/f8126294a52=
6aa80c5123eb3079e325daee9ec75]
> +CVE: CVE-2026-73071
> +
> +Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
> +---
> + src/json.c                        |  4 ++-
> + src/testdir/test_clientserver.vim | 53 +++++++++++++++++++++++++++++++
> + src/version.c                     |  2 ++
> + 3 files changed, 58 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/version.c b/src/version.c
> +index 92cd53129..43e4bb45b 100644
> +--- a/src/version.c
> ++++ b/src/version.c
> +@@ -734,6 +734,8 @@ static char *(features[]) =3D
> +=20
> + static int included_patches[] =3D
> + {   /* Add new patch number below this line */
> ++/**/
> ++    844,

Hello,

Looks like this patch does not apply cleanly:
    NOTE: recipe vim-tiny-9.2.0340-r0: task do_patch: Started
    ERROR: vim-9.2.0340-r0 do_patch: QA Issue: Fuzz detected:

    Applying patch CVE-2026-73071.patch
    patching file src/json.c
    patching file src/testdir/test_clientserver.vim
    patching file src/version.c
    Hunk #1 succeeded at 734 with fuzz 2.

Can you rebase/refresh and resend?

In this case, do think you can drop the version.c update? Is this
included_patches list used meaningfully? If not, let's drop it, this is
bound to create conflicts...

Thanks!
--=20
Yoann Congal
Smile ECS


