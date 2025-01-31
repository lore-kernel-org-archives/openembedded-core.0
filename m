Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C674C02192
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 12:59:31 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.18638.1738328366466631790
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 04:59:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dKQKhduh;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4678cd314b6so18026461cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 04:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738328365; x=1738933165; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wGy9MZwqnfPEe2ipb8RkfAvaJOFoNB/O44iTzPCMYmI=;
        b=dKQKhduhAwHVj7o3rk8aT3bIDqmAifyo0FnvRCBC/P0AoQDpHqzTimZnWxtKIQpQqy
         Jbi9+1z1hgcBmcFVvj2X690jlaS9rp/rCGarOyGpUr7zPKw+ZjnFJiDb9tmABsbV6Qfu
         NOjMAVmGM4mJ/AX96mHzWEnZPyZTzm72qn3Bv+5n+s2rv1ZSk2Mes6sVYOmJr8eIlLLB
         00UpEO0rCHIrEbZkuotpZuATJDKANP2GHdY+dDh1/FM0/pf+t5SCwsS7vxzGTykPKwAd
         xVj06iJkNtZo0/JO9xUybC+8T0Z3GP4UW7ywxleKy7xYzO5LgRDyYDlIsbAJ6d+OTul1
         tsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738328365; x=1738933165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGy9MZwqnfPEe2ipb8RkfAvaJOFoNB/O44iTzPCMYmI=;
        b=JNUib59P3P+sobTukQ7DSYwcxJrlghwXFG7Rpc1hDVnjFhRPSeXT9ccZ8oHF3hmBQ6
         CDBBgxvpQWUtCN4WMXYo+KPlpXCtWdEQR/cmCehp10aMBwzU8KwBaIrRxE5HMADUjTvB
         /BF97eRyXqA1H1mYdD0UghkfbUzGbBF4/zBR28tUGtxocow0ZOLNboVpDCEW7IjejM1i
         IZWHeS+6XkDJh3kC79Bg9u5y0nWiil9xR1S0saFOx8t+PCK6wN+i9sxXXqgGzs1s7Ulo
         nnq3D1GYfuzmIg2wFOkHgqGo/CY3z0OHKylbk6YlupH/HKsO1rs9I5n1XxgXTN9/9h0f
         iqVg==
X-Gm-Message-State: AOJu0Yzo3z0ZyxV66s1s6cPJoystxnoFi4nyzXjrpoTvjZ+TM2237b4f
	tCHGFcQJFw+mX5ZkI4tNCnFrf7RyEVod/NFi/rS8lWJ487OxlvVshkFoXxTE/w/0yOZaWvq3x6B
	NerfJOTbBz08DpW5eSvi/Y1ZQxwQ=
X-Gm-Gg: ASbGncut435zi6/eVe4KMsj5FfBQ3CIC6d7V0lM+/RUX1+t7JkQx9W7+aV/5TKloWoJ
	9uSX/9YUAmQywG0zTnNg3q0Yc/mS++BOYinK2Zx251cKf9BqdH+T9wI9Setwj+VqQJ/diisCeIF
	me3QVqzM+Wn6BQSP+4bQkGkdR508sE8sA=
X-Google-Smtp-Source: AGHT+IHvdguBVjmEP6jm4AWo3M8pqE66rJsUn2+hF0pVzeuIGEZuJP5csJwuoU8t+eg4r6GpwGlUuLSjEW85nVH+DeU=
X-Received: by 2002:a05:6214:f2e:b0:6dd:dd0:764 with SMTP id
 6a1803df08f44-6e243bb8f39mr156634076d6.17.1738328365148; Fri, 31 Jan 2025
 04:59:25 -0800 (PST)
MIME-Version: 1.0
References: <20250131123519.461671-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20250131123519.461671-1-dmitry.baryshkov@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Jan 2025 13:59:14 +0100
X-Gm-Features: AWEUYZm7bS6vHk6vNtHBcVGWBiRTJx4Vh0L7k3Mth9iOBfxYTe8rOVqe4uvvXi8
Message-ID: <CANNYZj_9dkovbXGmvEx4RC1aUKsNOGiqOq7WcM7eP_59QwH9eg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: upgrade 24.0.7 -> 24.3.4
To: dbaryshkov@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 12:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210480

On Fri, 31 Jan 2025 at 13:35, Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
wrote:
>
> Upgrade the Mesa package, dropping applied and refreshing outstanding
> patches. The dri3 config option is now gone, dependencies are merged
> into X11 deps. The swrast gallium driver has been split into softpipe
> and llvmpipe drivers.

How was this tested? For me it fails immediately with the same error
as the previous update attempts:

| Run-time dependency libclc found: NO (tried pkgconfig)

Basically, mesa updates are blocked until clang lands in core. If you
want new mesa, please do help out.

Alex

