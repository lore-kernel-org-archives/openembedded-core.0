Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBF8C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 02:03:12 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.7159.1713924185752237068
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 19:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VRn4sSKn;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a5544fd07easo722225966b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 19:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713924184; x=1714528984; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5cVr/VnP5Tfo98iEfWGBOLd2Zkf2L0KGET0QpjjxeI=;
        b=VRn4sSKnR0VONoNwZYy8G2ZrI/pwJqeJ0v7L87DCWrehxynJSpk3k9NuDfItZnaPD3
         BRbxktQPyhw4ym34M9a09jUvNs7OfW+QJ8uSuuZaCzohWuPEJGI4h8IQKkN10XSm8DTT
         D8woHPrIpmNSFCiIkFbE8U/lBDvAhARt+v0AbgUiONeSmuyr8Ue2/B8dIKe56G5DJILR
         D/+9AOdrecefy2sxdRtzyKwaU/9/CDfmM4V2BbX420fedwJKpIM3ss2x/EtaYft1Rt0e
         XbSSwO2Y8mWiHCvTfp1e3plwscvocVlmzL74fTLKOnrsS9yeg9xGDrgqrNO+Rq7TfPIE
         jyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713924184; x=1714528984;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5cVr/VnP5Tfo98iEfWGBOLd2Zkf2L0KGET0QpjjxeI=;
        b=QgM+dUFrkjAkEjjhfVJ2S+tp/41kwgTNLYHSIoBAdL4TFfU9DWez7Q690CREsj4mZQ
         1uyrSJvMAyuayOCF773nAHGu4ZJs/g2/PpcayO5xprf0reephzOLcMP6jW70qDDj4Gxw
         hQgSVmu96IEOViLli3u9p1Nsh2mQ9hr80fjG2mUwSehQvPjfnDYklmzxZugQ9TMu95gl
         enUX4aD+XjvG3S+dwmO3P4jl1NxXpCzoTrHbKylu+SCG8wfIREQk5IZ5JxXl+H+UkBBG
         nKm84InoCCQznJCBsBfte6yYbdjhyFEllF+oI1JMCZVzc9qbZiAni4TVR01I68MweCso
         oj9Q==
X-Gm-Message-State: AOJu0Yw+K2/vNPRTc6tLNrQtRKrPAS91y0VqYcsmdnBtitlGwah9vQBF
	neHr29iVVJpEy/I100oVOVdblJzi16O/mlGIabKNp9U0xgyb3BWntunfTObHehfySPWRtbbPNXB
	lA0xpgLnNIA0kRXtlARHri4XgMdWez6AX
X-Google-Smtp-Source: AGHT+IH2cxF19jazqt4yPQCfhMPcE7GLubyQmTniIZ0gRLXzJi1Dv/Fd5I4aHMg2nouUdWf2IWlPVUCgDy27FL4E4VU=
X-Received: by 2002:a17:906:40d7:b0:a58:7505:1968 with SMTP id
 a23-20020a17090640d700b00a5875051968mr511215ejk.43.1713924183585; Tue, 23 Apr
 2024 19:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <17C6E6A289A008EF.28114@lists.openembedded.org>
In-Reply-To: <17C6E6A289A008EF.28114@lists.openembedded.org>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 24 Apr 2024 05:02:52 +0300
Message-ID: <CALT56yMqnU_vndjxBiEttPQJd=3RForUGPeqKM7us9eGwLjJsg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ffmpeg: backport patches to use new Vulkan AV1
 codec API
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 02:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198636

On Wed, 17 Apr 2024 at 02:31, Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
wrote:
>
> Backport two patches from ffmpeg git to fix compilation with the newest
> Vulkan API.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Gracious ping. Otherwise ffmpeg is broken on vulkan-enabled distros.

See https://storage.tuxsuite.com/public/linaro/nicolas/oebuilds/2fGSSDyVGWy5G5B5QwGHGAOYSlR/build.log

-- 
With best wishes
Dmitry

