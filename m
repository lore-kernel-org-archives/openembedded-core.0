Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.55617.1595856630643929058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 06:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eNR7Wue4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id b6so14899675wrs.11
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 06:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=kQsO/hifDZ7DZhkABBXRGer+JGqO7FUPW8B6YWaRTqU=;
        b=eNR7Wue4y6tkbzso79LPLUHzQRgSMdjDFfrsI7Q4OD7fleO/b++n+hS5oDKpeqSWPc
         krPtUmgD38B1dDNEDTjRvmPsbBpUStRFOlPCCjFMB9DlbHs88Ajhy9Ejg7ZJquQRh+K+
         iO4Z3iuWhoCPoHIv3zRHPjoYwNtxBtdzX95j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kQsO/hifDZ7DZhkABBXRGer+JGqO7FUPW8B6YWaRTqU=;
        b=fq60Am/z8ohkDEJzHx55P1dB43BmSnUMoPPSlIOKaYLpvl7+VLap1GPSVGvKI+QR48
         M1D773Se0lL1Gr8BdajAsbkvXRUPW+DAOm+BxpNiDKASM9LadtOCFXdwm1C7Ql9DDhnv
         4xxSyyPqj4vZ4pck8Dzfi/U9i+irjq3V87QohBwpKsQaj8x6osPQQCCGcOhhXZEFwzj0
         nQKfdo6FU8/v0phXYxYBtfmojJmOovNxNTmMtFuIS1iGH6+xAbF2AAR5CBmRP1sLvoEl
         Vf+rF3vEPFccCkVs8/04wK4B7J7koreiXNWkVjFBpYCxBKjnqlHmHvrj/oIuyGc1Ddo2
         LneQ==
X-Gm-Message-State: AOAM533MskUrxK8NwapSRmDbnNp+5+I5SUFkSiKlSwpVEnQnrctKzI5X
	7fzTdL5vOoDfYRhcN6ouX0xIZg==
X-Google-Smtp-Source: ABdhPJwOzKyRmq90N76IvuK3Jct0LhciR2txW9foeAsXxzHcUoiYdoGoECShd0ABrFOwROR2RG5g1Q==
X-Received: by 2002:adf:ed88:: with SMTP id c8mr19114908wro.233.1595856629097;
        Mon, 27 Jul 2020 06:30:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c1c0:577:97eb:ef04])
        by smtp.gmail.com with ESMTPSA id q3sm17407895wmq.22.2020.07.27.06.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 06:30:26 -0700 (PDT)
Message-ID: <13bf2c62e3d81e5b76d7a4c44644af337fb3b758.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v6] Add package managers as a plugin
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>, 
	openembedded-core@lists.openembedded.org
Cc: tools-cfpbuild-internal@axis.com
Date: Mon, 27 Jul 2020 14:30:25 +0100
In-Reply-To: <20200724144241.9977-1-fredrigu@axis.com>
References: <20200724144241.9977-1-fredrigu@axis.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-24 at 16:42 +0200, Fredrik Gustafsson wrote:
> OE-core today has three different package managers, the well-known formats deb
> and rpm is supported as well as ipkg that is good for embedded devices.
> 
> When building and having a good cache hit, a significant amount of time is
> spent in the phase of generating a rootfs, which is really about the
> performance of the package manager. To save build time and also get a
> package manager that is suitanle for use on targets where flash memory is a
> concern, support for apk is suggested.
> 
> However, it might or might not be what's wanted for OE-core since it increases
> the test matrix. Therefore I will refactor the package management code to
> allow a layer to add a new package manager without editing the meta layer.
> 
> This refactor will be divided into multiple patch series to be easier to review,
> this series will only move code but keep existing functionality.
> 
> Changes since v5:
> * Moved code in package_manager/rpm/package_manager.py to package_manager/rpm/__init__.py
> * Fixed places that used package_managers instead of package_manager
> * Added missing imports in a function.

My first try at building this series failed to even parse on the
autobuilder. The second attempt has failed due to further bugs in these
changes. This is using a significant amount of my time and the
auobuilder's time to debug the series and makes me wonder how much
testing its had.

The changes do at least look like the right direction to change this
code in though. I've a bunch of fixes in master-next to try and make
the series work.

You mentioned being away for several weeks. If I merge this, where do
we stand if any other issues arise? Not sure I like the idea of waiting
several weeks to merge this either :(.

Cheers,

Richard



