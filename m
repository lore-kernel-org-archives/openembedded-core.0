Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA1FFED3DB
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 15:01:09 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24892.1777042860856992153
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 08:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TkxwuqFW;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-441209fb77eso3048227f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 08:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777042859; x=1777647659; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3uXn6pQWpLDL92f1CQnmTPQHOFByX4wLf8h/uK7FW4=;
        b=TkxwuqFW1E9xpvz/vr+8QaBH9ZmlTh0Qvep56ZlznsCjIgZF4fWAsYZchNeq7DfQAR
         GmQdCgsgzxdDj+VH86P/v49NCeh6rqtQvT1SW05XffAoHar2NqY+Dk0a7CQKU4mIZSu0
         g+MpyWl+5DAOcmYR5XT8Ivp9tqXY4KbZADX9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777042859; x=1777647659;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3uXn6pQWpLDL92f1CQnmTPQHOFByX4wLf8h/uK7FW4=;
        b=rGJLdac261kTS+NwZkpKyeIDVjoqgzg3K4RQMhjUHX1Cd8qX4d1HSmQylixrTQxZ8p
         ViFM7ljJ0AnCHyDvGqlzljeD3KejcnOHVzRZm7fWUSiqOLFpiUmnaP02UEKpidmLk/28
         gEvf2G/3CrAC99rUoD087xhbAwLaVkGlzdq1ugxNs2y2IQ2SysGfiAjNEMfhrhlIHhNp
         Hd7JFW+GYK4zOdgR/m4/HBM5YAtibmARdBlyQQ/7TIKVU0ATeJ4iBe033Tw3BtXfseC6
         wJZkm7nhIk4hYLqS4HEshdbE3qRiBlSgf8qPyRZQijvRKvIaIwo+hJoa9BakRnRN5a0S
         VwHw==
X-Gm-Message-State: AOJu0YxwRHOWLObjaEoFqHEkex+Yr1/JGbl8StcSQuEUdcb0wOgh/bDF
	Ar3PUAbhh/rBFDBgWFTBRYt6OjdOzYLHUjcjghmxx1TnGMo02I2EPBwF8zynWqw57uQ=
X-Gm-Gg: AeBDievGhfSuEIbbI8gHyNTdqGRojI291vgJfWV3LAxG+Bg0v7+k+1YT5X5ccmOicQr
	frfb7/xz8EMsIUy/D11Q1Zf3p0tOmLsEhlttOZRi04BbwfyfjzCJNyDPqj5K3RSzestd1mft0dt
	6eLep+ehmnSxDxsnK0XaONdcD9sZxu7zKJwxCx6bGBo2BNU3R6STbY9jhUbBiZb0u95cincZKNv
	lLBGTddueqNIs4vuzh/fl/f+1tKolcZgYRXuGDCF/Gi4FlzL3rfh2+o8vPEd5Iyf+LD+WMl75No
	o6yQ9o/8fOvLwzdRxqQL6VoTEI+dS2OEx+gCew0D5F9xr5mdRNczYJf5ZHhgcCIsAJimVYIJNHR
	jkLS39LfuaqlEC9kUj+PoLI9pgJPAg7LJxuJyePLTFa9+C1zgFtab6nqIeVgWmO1rpZREukRBtL
	mMcgEmHyvwE9pPm1yMl2jPEB99/S07MDQSdQ0/dR84wtjMy4yoIDn2weBQJqw/lMW2nZ7bdhj9j
	VdvLZkgKtoSw6y8RQ72kv4EGw==
X-Received: by 2002:a05:6000:410f:b0:43f:e978:148f with SMTP id ffacd0b85a97d-43fe97814abmr27685419f8f.25.1777042859131;
        Fri, 24 Apr 2026 08:00:59 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e46471sm58756896f8f.28.2026.04.24.08.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 08:00:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 17:00:58 +0200
Message-Id: <DI1H4B60PQ1T.3UZSA73AGQNRF@smile.fr>
Subject: Re: [whinlatter][PATCH 0/18] linux-yocto: stable updates to 6.12
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: <bruce.ashfield@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 15:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235866

On Thu Apr 23, 2026 at 5:44 PM CEST, bruce.ashfield wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Hi all,
>
> I know that whinlatter is about to go EOL, but here are the stable
> updates I've been tracking for the kernel.

Sorry Bruce but I've stopped taking patch a while before you sent those.
They won't be merged on branch. The same goes for the kirkstone series.

> I'll continue to update 6.12 even after whinlatter is no longer
> being udpated.

You mean you will keep posting these upgrades on list for users that want
them?

Regards,

>
> Bruce
>
> openembedded-core (18):
>   linux-yocto/6.12: update to v6.12.72
>   linux-yocto/6.12: update CVE exclusions
>   linux-yocto/6.12: update to v6.12.73
>   linux-yocto/6.12: update CVE exclusions
>   linux-yocto/6.12: update to v6.12.74
>   linux-yocto/6.12: update CVE exclusions
>   linux-yocto/6.12: update to v6.12.76
>   linux-yocto/6.12: update CVE exclusions
>   linux-yocto/6.12: update to v6.12.77
>   linux-yocto/6.12: update CVE exclusions
>   linux-yocto/6.12: update to v6.12.79
>   linux-yocto/6.12: update CVE exclusions
>   linux-yocto/6.12: update to v6.12.80
>   linux-yocto/6.12: update CVE exclusions
>   linux-yocto/6.12: update to v6.12.81
>   linux-yocto/6.12: update CVE exclusions
>   linux-yocto/6.12: update to v6.12.83
>   linux-yocto/6.12: update CVE exclusions
>
>  openembedded-core:
>  meta/recipes-kernel/linux/cve-exclusion_6.12.inc   | 1148 ++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------
>  meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   |    6 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb |    6 +-
>  meta/recipes-kernel/linux/linux-yocto_6.12.bb      |   28 +++---
>  4 files changed, 1127 insertions(+), 61 deletions(-)


--=20
Yoann Congal
Smile ECS


