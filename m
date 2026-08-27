Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13425C61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 09:23:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32092.1787822626400037203
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 02:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FBYUdTqp;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4957eefd361so12666445e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 02:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787822625; x=1788427425; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WdXKWj6IOoILLB9/4fElg/Ntkq9Qq1bWVOXHRgbhiF0=;
        b=FBYUdTqpA63ba1a3b32gDhCfvl7+VMfFzob4q15hf3L6MpFQh4jiD3+W/rNrY3LyW+
         E+Vp9Ter5Jo2J9ss5b3mSVSplychNnswq22lG2rsOQDs2urpvrP4JwHgdUCho4BhlI0F
         dmDongSNnxt7yk1EZ0tx/w6Zv3+QpfS+t+0Dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787822625; x=1788427425;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WdXKWj6IOoILLB9/4fElg/Ntkq9Qq1bWVOXHRgbhiF0=;
        b=TrdBlYRLri9XlmCGnW/mzb/xWeVHF1r9mN7rYtr0EZcDxQ7j04SruPcITtsRadyXQz
         LX1cNubNpCFwx2/QvgjgKCCXULqS3nTUpO7Wx7KM2sebMMITFRToywstvFN6Ezzyp+53
         MCwA5pAugCKJVHwhsjnWplOzybBjK/SreehA+GNagZq7xpVx9YsM0oeybtpdeS8IlpL/
         KPLUQj0MQM1NUpyxS46ggRkgmmF81VtMoivhfmiSgJjyf5rLrXYkT9WrdXa/L9LR+DW1
         MvtvxQ7ych5i/Qmhk6USCTvzEiJb9L2f2jq4Es1N2aFDCdyQ2QBafmsLvTIwY1QNpr6p
         90jg==
X-Forwarded-Encrypted: i=1; AHgh+RoO8vzhTasEWb3kmR4/tK7GayGB6SsbrG3u5r5JAfehfv94qipy/u9fhKD+Y/a9kXWcueCOm8Ay0KTIdYs/YS3gBA==@lists.openembedded.org
X-Gm-Message-State: AFuF++kDqFOQOoJX0GWFNqTohAx2XhB+OdrlyEw5rRRBkz17s4r8Vlxj
	pqGUjUYwsDtJBrqSER/PZoPzIfcIYL1gpaxsn+bOocl2yF2eW3qQPRBrH42bLk0Hjpg=
X-Gm-Gg: AR+sD13VlbFX4H1BRbECEEW5eKpuh2oaVpifm5HD5fkNWjqR9wduANHdugxXwtSo/R7
	SEyv251fbpFxjxxLZmVxY8MH1vfgVwaQK3TTjDAbsQtJQDc3QvoifvBt7n6uc400ZJSHyGsXR8+
	LWC3nViXmSIb1Yq+S96W3SePe3tAfO7vb6MOdkxbxoJA6HCmSUpkoZ58+wdYYr0OkbVD9NllMTw
	tdSECU/QiagcX4IZwTO50gBEYm3XP8gDCvm08eOV353oOvTu4xTQXVkInFTUoFHgU+mVyLu0ucm
	SB8AKvC9fL+6J0/SRgYGJw+GSsrpcVVxADYCiiCPHdNGxvSGY4zyDlctRGyEcPPIddiqXUZPmG0
	poCqybVCm1RJpavvQ/vkxtqUP4ibCCbFS3fwbyr+yrSkIkhXMiTsg4ZVm1mzPZ3VEAgDd5kyJIe
	Ms0To0vljM9VnsiXvyZJ9eMzzhlLiH5siwCkLi0aiPVYXAjW9xjFTn8BTPMtLwOj13RJ1BuXM9+
	VMXajGC/3tyLQIEqUVseG5c2hxpdbtTsmbt5I3pTr3KIdYkyy1z
X-Received: by 2002:a05:600c:34c3:b0:499:afe2:e4d0 with SMTP id 5b1f17b1804b1-499dc70d263mr152667585e9.8.1787822624617;
        Thu, 27 Aug 2026 02:23:44 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49236515sm55639975e9.1.2026.08.27.02.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 02:23:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 11:23:43 +0200
Message-Id: <DKZM86VB7FTW.37NETKKH4808Q@smile.fr>
To: <peter.kjellerstedt@axis.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 5/5] documentation.conf: Remove the
 documentation of GROUPMEMS_PARAM
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260825180805.2990506-1-pkj@axis.com>
 <20260825180805.2990506-5-pkj@axis.com>
In-Reply-To: <20260825180805.2990506-5-pkj@axis.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 09:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244471

On Tue Aug 25, 2026 at 8:08 PM CEST, Peter Kjellerstedt via lists.openembed=
ded.org wrote:
> The GROUPMEMS_PARAM variable has been removed.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/conf/documentation.conf | 1 -
>  1 file changed, 1 deletion(-)

Hello,

I think there is one last reference to GROUPMEMS_PARAM:
=E2=9D=AF git grep GROUPMEMS_PARAM origin/master-next
origin/master-next:scripts/contrib/convert-overrides.py:              "pkg_=
prerm", "RREPLACES", "GROUPMEMS_PARAM", "SYSTEMD_AUTO_ENABLE", "SKIP_FILEDE=
PS", "PRIVATE_LIBS", "PACKAGE_ADD_METADATA",

This won't hold the series but maybe consider a followup patch?

Thanks!
--=20
Yoann Congal
Smile ECS


