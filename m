Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F61CD690F
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 09:15:56 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.86729.1696929350299394962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 02:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UiY5vKSR;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c3c661f1a8so45997141fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 02:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696929348; x=1697534148; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uL2ftmh3HfksnK9w8Ml9FctKTzeqjkKvuVK/zd7Mpv4=;
        b=UiY5vKSRhzc69NN32oKbhslSvPhqvfsJU2204ho6LfzTxmNH+AXGVfqqoY7j6a0Fh3
         vbC8PqVfDi/jdQKUR1x756k/JWzlNsBH/KnVuRgv4kHlwO9pFXodzWflwvKkG6EqtFi3
         rKoffwS+MrXyYQ/mQKFg71di1TYFz/fclX2OVuIMFW2nwBIza7Gy5u/gilmj6YkVOQls
         Tv3582Xv/rQp6U7lsGOI1by4XH82JfaIGvRW4HQqkV39W3bKLu1qftrkvVAKPKNcDSd6
         UO9kX/ybYMqcYFvoSgrQeFQlJvIVOErKdMZiPgHNTMEdycCNAfIBCqTGJS0RatgOAWbT
         kf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696929348; x=1697534148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uL2ftmh3HfksnK9w8Ml9FctKTzeqjkKvuVK/zd7Mpv4=;
        b=G8NQu3oREL6w31+LPDB9urjefFGRSYDaU4CvpiDMg32Iqr4n2X59R0izgkzEQ0jmFX
         fGQ+XSVYmp5pmuTaK+J+Y3o1NXjEe5N1k+qZtNlnB1DfK1FHcpRlnLatH3q3TNZTRXn/
         WHBW9FNOlDDrgjDRQQAx+V17XU4fnWtoopal65Wwsst7/0q4LHBtifbZf9tSiz5FR3Iy
         n6fP1phJkMk4Sk41wBxE9sN31LCmbvenL3idGlV6x7/P3ZcwgRNrDXwQLiiw7l5t7oYG
         wdsawFP7Y5DAAzUlnndY4fvd+jk99IorW7fIMo2n7PAmxmJi+cCehyPEfYVpkH83PDyL
         IZdA==
X-Gm-Message-State: AOJu0Yz/FB/2Bo7H/RieFC/Rf84Ly4UwpOVJ6qpZoiII//EdBMttESat
	D726Sh1cs18r5iIEeN222e2K+g9cibRlk/POIUo=
X-Google-Smtp-Source: AGHT+IGZDc8F0Hpw2klhvJaJGDCfc4CKw7H5wh/PwlPUbV2bdwKS0DpA/wucQ7w/ihU/dSs5AQtoZw==
X-Received: by 2002:a2e:a1c3:0:b0:2b9:3684:165 with SMTP id c3-20020a2ea1c3000000b002b936840165mr12736578ljm.8.1696929348501;
        Tue, 10 Oct 2023 02:15:48 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id i20-20020a05651c121400b002c02bccfb5esm2329642lja.77.2023.10.10.02.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:15:47 -0700 (PDT)
Date: Tue, 10 Oct 2023 12:15:46 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oeqa/qemurunner: Add extra logging when
 console doesn't appear
Message-ID: <ZSUWQloJ7goef__F@nuoska>
References: <20231010085327.3677768-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010085327.3677768-1-richard.purdie@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 09:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188875

Reviewed-by: Mikko Rapeli <mikko.rapeli@linaro.org>

