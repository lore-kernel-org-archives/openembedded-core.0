Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCABEC4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 12:23:50 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21343.1784636626201463245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 05:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sXJHcmdY;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-474560436c3so6020648f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 05:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784636624; x=1785241424; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+e01J1VXo510BevJ/claaP0nF8lCuku+WwzudcWaKBY=;
        b=sXJHcmdYotRW4Roix0NY2poTAjsM7lg8GdSNt0A7wPWGEkXvAM6Po484E/PyjT2Gww
         1C/hB8kLyQjPH095QxFBupV9ihCSfyBRJvMr/ko/c1l+YZOxLYiLXg1+nVk9W9vH0fpN
         vV99sU4lmRd9hMvfEomM9IsSF2bJMtJDRyeeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784636624; x=1785241424;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+e01J1VXo510BevJ/claaP0nF8lCuku+WwzudcWaKBY=;
        b=rYDEnmeHZFsMdEKCM/ciTit0/UeGS9pXyZn9lZy4IJMPp2b7q7Rh7x456aWDBWVJyi
         Vm7TsZzbbCVXquDqpPnm9zL2OCwx0eeWyQRY2jg9DvpAiSmhpxMKMs53jimtGjPHs+Hh
         goPImRpW2uiWizRtlrFA7lEEfEey/fbE6qSJB3f7IPbAf22YarVK56vGy1szw2w1stnj
         /IKfU+XjFODCndlUlm8OciPGuW7Y0WRglpRPdReNi9mFan43H+ebTn3ZrgwrEV5ATOGL
         ZUzVWLjMGOTg//Q3OMa/4rWA0KNFxHocrrKs1Hkvzv9DEnS7/jD07Dulu/tboK20vzoC
         X/ag==
X-Forwarded-Encrypted: i=1; AHgh+RrpA9Ozr6QF2oC3Mv4qpwjwuj5/e6qEJfGuMg0eOahtbkZ+n/fDPiIIPRXlGpmCcb8YYikexi7VGdAEuaeGTwfLFg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzxPy06TVPpgMx1VbLzepdNFB1upU8AuzpdoCpFHvgSvvs2b35X
	VCvI5BJ326mI1m5HsAnlu8e9UCCv0Fx5VbNcOwc44/YzcIlHFrts8AJY3Nmh8nlBD30=
X-Gm-Gg: AR+sD12xu25M9R3JonyVHcFEfK4UNNkmv58b2fykliS/1dN1PujjgAaBRcyngcxzTSF
	Hbm0W9cpSfWTMrurZF4kZo92fHm5krTAUEfZUSDFApyLvDse17StIy9AEfuAhU4nQCGpgTNUjkC
	8F4qB7vbMvKojdvXnd2KostE1qLj0iXA6AAyuzU8W/DmgNCtnzEkaPygK9JxRugEbeYKcXchhFa
	YG8KWS3C1X3sov3k7ooNlxhuzF+XKVqfJiaE2aePlYme/uZ4iMwXkkoGka5B5zUEp7e/zhAKY9r
	ZTxqY8sL647qmFMMhcLIGQcbE/lGBPfBG8pxc9aaiJqKjIhDZljZVw00Xw5v1W+bpaLq01w3ONW
	Uy9WbheJm7MolQkeV0e2fIbyROrLftW6Id6+EcdRiBCt8UxWtUYajgYQY+ukwT+IV9h+0PBG6s7
	AW6cQKNMc6fOWn8aR2UfzE1WjODd37ky3+yr0kSv7iAz0xOsmLDxWgCOHbqwN6xg==
X-Received: by 2002:a05:6000:41dd:b0:478:4de8:9b91 with SMTP id ffacd0b85a97d-47f623226c6mr20245568f8f.41.1784636624311;
        Tue, 21 Jul 2026 05:23:44 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e499c2sm36183682f8f.4.2026.07.21.05.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 05:23:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jul 2026 14:23:43 +0200
Message-Id: <DK48VUP98QYM.1SDCXFLXHLJUI@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH] gnutls: fix for CVE-2026-42011
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260720065644.24395-1-hprajapati@mvista.com>
In-Reply-To: <20260720065644.24395-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 12:23:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241517

On Mon Jul 20, 2026 at 8:56 AM CEST, Hitendra Prajapati via lists.openembed=
ded.org wrote:
> Pick patch from [1] & [2] also mentioned at Debian report in [3]
>
> [1] https://gitlab.com/gnutls/gnutls/-/commit/1dead2faec6320aaba321eb56f2=
0d442df192b83
> [2] https://gitlab.com/gnutls/gnutls/-/commit/24713b8c63137ce0665b495d22c=
cce4f5ce05c84
> [3] https://security-tracker.debian.org/tracker/CVE-2026-42011
> [4] https://gitlab.com/gnutls/gnutls/-/work_items/1824
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../gnutls/gnutls/CVE-2026-42011.patch        | 167 ++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
>  2 files changed, 168 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42011.pat=
ch
>
> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42011.patch b/me=
ta/recipes-support/gnutls/gnutls/CVE-2026-42011.patch
> new file mode 100644
> index 0000000000..0c56b2805a
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42011.patch
> @@ -0,0 +1,167 @@
> +From 1dead2faec6320aaba321eb56f20d442df192b83 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Tue, 14 Apr 2026 17:41:30 +0200
> +Subject: [PATCH] x509/name_constraints: fix intersecting empty constrain=
ts
> +
> +Permitted name constraints were wrongfully ignored
> +when prior CAs only had excluded name constraints,
> +resulting in a name constraint bypass.
> +
> +With this change, they are taken into account and propagate.
> +
> +Reported-by: Haruto Kimura (Stella)
> +Fixes: #1824
> +Fixes: CVE-2026-42011
> +Fixes: GNUTLS-SA-2026-04-29-6
> +CVSS: 4.8 Medium CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:L/A:N
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +
> +CVE: CVE-2026-42011
> +Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/1de=
ad2faec6320aaba321eb56f20d442df192b83 & https://gitlab.com/gnutls/gnutls/-/=
commit/24713b8c63137ce0665b495d22ccce4f5ce05c84]

Please don't squash commits.

Can you send a v2 of this patch with each commit into a separate patch?

Thanks!
--=20
Yoann Congal
Smile ECS


