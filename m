Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A33EC0218A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 11:37:49 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.41290.1738409863706589333
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 03:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=J/jpfNCe;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso3582232e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 03:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738409862; x=1739014662; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4QUu6T3DDcVAaFRgIyL7eGz8FWZtWcfrWvyL328eFso=;
        b=J/jpfNCeXM63W022h37X2hwSOk15bFNh+pBqlRsskdTb55q5hh1MhJfrDUZfvW9uEy
         TyCxTpJ98CTGKGTlqiuB0jAYSGTCVfAplPG1UTBFOu/IXWjBHgJLBRV/3IOsAEPqRwJ3
         DsBbK/Pb8IViBgHl3XFRKoaSI9WutUnqKzApfAYRv2he9NSD9fTVKQxLyrb91z4bMGs1
         QRrKQE4o+ngd1a+FQa0nnj8KClEolYHpRMLtGFIAbE/7en1sUWVAQpnWKzO57o5DFpXj
         cY/NBw5DSslxXzX0dUJ2gGIhQO7bdixOHzijhzbMoSylCKZOBnIYvAEfRZpPh+XDFKo6
         P15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409862; x=1739014662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QUu6T3DDcVAaFRgIyL7eGz8FWZtWcfrWvyL328eFso=;
        b=YzqPY0tllqcBBe4VtlbTpx7H83gPnNKWmlCWu9+mjs8qF9YDPism0pRVrCp+jiDcnj
         Ju6MaqjJLdeXOQMDeWwCNsRfIcpWmGcKgfmadvbCwbkORYFlUc4+JSQV+Frv86tx48/R
         eywfdrUdYx5QfGm85soN89yVIoQ7Wi4wYA/qHClJz8CHLXUy04bQ/oGWf94WqZkWMbcf
         TpgES2FIqbvkv/dJ+fWVak6ECsHsPqTWAVcksOEs9e8OjvcXvzK7E18+F3nJ0HOjrjhu
         XonWGb2jT1rIE7hOZQqJmiNxQH8Zw5uaJURxu6jMbm8cnJFWBNEPNjXZ8gQ7VjzwOLl9
         EWCw==
X-Forwarded-Encrypted: i=1; AJvYcCXMK0vKLd8GKhvWhgZm/aaAHOpeGfVM59Gb6SM2vfTr7Peit2ihmlWGVfkjjdh9wlmHuQv2FiCKzBe4O0dcO5ibuw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzKj7I9a2Tbf/fY36j+zh400oIOWlmnxCjj9DGm6mA7faKTtcUs
	E79zzLFI1dmsMI/3KFJqhsJOjWC6n6udVsYvyF8TU/XbIIDOGhEun8D02mc4tBs=
X-Gm-Gg: ASbGncuq8EGOMhGS9r464t1qNRU244/3XtraHZ2L2b9vfjNRhLnx++be66mvB5p+IhA
	Wl+72LHiI+L1+GO6AjTs97IvA23BEXTwkzWcTGr5GRKF/7WyulTiqR9CYqFwnq0SRMK0plKKZme
	VkIIbrThYbNoVQfyecm2/bB5yJ8ca5w+SR4HO93Au9lEKzv7uTYCTxWrRPDp43ugZA6gGj8BnZp
	+kZEVqezs5sOmN/3/Z3i962bBydglN2QcyM6Ml5/e+8rmSMHIP38PRro2zZI67F/lqtILiCYjEP
	hZKgYFO/0Nyp/r1PphvPrjmi0Fn5g4BdyyeSu+Qa2JEcDK6SayJvbf5ham7zBAW9fn8jGQw=
X-Google-Smtp-Source: AGHT+IHdeWkzlLIgxqy/EOU3XeB0ZxECVUSP4Nmo39hEHyOi3Ca+F9uf32EbJsLyKSMiMdAQyH6DjA==
X-Received: by 2002:a05:6512:388f:b0:542:978b:e3b with SMTP id 2adb3069b0e04-543ea3ac80cmr3185238e87.4.1738409861797;
        Sat, 01 Feb 2025 03:37:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebe781sm724746e87.217.2025.02.01.03.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:37:40 -0800 (PST)
Date: Sat, 1 Feb 2025 13:37:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: dbaryshkov@gmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] mesa: upgrade 24.0.7 -> 24.3.4
Message-ID: <q7yoiccmj2xx32xel7ufh46xzfwnadzhjvsmmxcbsyylqeae6k@mhi4yyd24n66>
References: <20250131123519.461671-1-dmitry.baryshkov@linaro.org>
 <CANNYZj_9dkovbXGmvEx4RC1aUKsNOGiqOq7WcM7eP_59QwH9eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_9dkovbXGmvEx4RC1aUKsNOGiqOq7WcM7eP_59QwH9eg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 11:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210505

On Fri, Jan 31, 2025 at 01:59:14PM +0100, Alexander Kanavin wrote:
> On Fri, 31 Jan 2025 at 13:35, Dmitry Baryshkov via
> lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
> wrote:
> >
> > Upgrade the Mesa package, dropping applied and refreshing outstanding
> > patches. The dri3 config option is now gone, dependencies are merged
> > into X11 deps. The swrast gallium driver has been split into softpipe
> > and llvmpipe drivers.
> 
> How was this tested? For me it fails immediately with the same error
> as the previous update attempts:

Yes, I forgot about the Intel world, I was testing on ARM & ARM64.

> 
> | Run-time dependency libclc found: NO (tried pkgconfig)
> 
> Basically, mesa updates are blocked until clang lands in core. If you
> want new mesa, please do help out.

Is there any work in progress? The latest attempt I see was made in
November.

-- 
With best wishes
Dmitry

