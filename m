Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A87BCA550D
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 08:43:23 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.7107.1694594598277559149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 01:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=f0T8EOv6;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50078eba7afso11370558e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694594596; x=1695199396; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L74j1KZV6+YQRJWbSex/LISGQiRmsFluiYXPjDiAPig=;
        b=f0T8EOv6Jy76FGgxm6BU0AXeFsRRV0I+4zdbz54vjDLg+LX56J/Oj2QPpAILrDFIwZ
         TLI5+apPK5wYoFxUc7hpAGVOKZTEAHwH9MzjPFzGmGrQJCVafBiOUpnIpXAAUVyRvR6A
         AKvTRFxSaZiyIDMd/JvdBkkpdGcI7qNQb4LcevZX0gaJ3UQOZ1LJM8/oUji0tDJAoVY7
         p7/23I8JnUj8YGpxKuf8Ja4XBxyo362ZgutmhroqI+kuwhIQaLHxqxLycE7IRM99sXyb
         nNNZf+dYJsaBq6iqAmrgDVfnYYBVFZ00OCPmydOHB2Mm3vMEdCm2J7Gzd2uIi8gOFb7t
         bqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694594596; x=1695199396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L74j1KZV6+YQRJWbSex/LISGQiRmsFluiYXPjDiAPig=;
        b=YyZxpXtVfOcpnav3PlnYIqnPQZgn9+sMU9gec4r6lKgKde/wc4zlGKPBTqWCjuFExx
         BiAtzAVro0PgJVQFskmEQstafB2e/+AlHhHNoMta7pZDOW7C9ikhCFNTsMnxkjFIe+aW
         m64ncIx4x1ycXlyTCVsXogUHNyfBGF0Fbw9MHq/nmNDzfHC2Ew/bSvqA4xCW76n7vpMI
         pLKGpYzrcVNrEolhFIsEQQrG33U38du9t+n4mmbdL048Pf0OTBTtnDqEwEnWZA1Fu6TY
         dd9dwLfERRftU96SHl/Hlm5Cw1JL8iaQT69V8d7Low+fxN4+kgs3o116PK8VUF58+okI
         XB2g==
X-Gm-Message-State: AOJu0YzaY3MyPX3DLmnBpF6iZQY9+Sgj1YygfTJs5INb8WSbWKooY3LP
	TIxy48ywUmaVAEPNPx+vnhfreHl7V94kftY3B/Q=
X-Google-Smtp-Source: AGHT+IEVGzRzQyjPgEgtUFGfA0+ozXBW711bf8i0mLyL4AMB36X5i2JQuA1N6W49QPtV5x6EtAgLFg==
X-Received: by 2002:a05:6512:452:b0:500:bb99:69a7 with SMTP id y18-20020a056512045200b00500bb9969a7mr1422645lfk.14.1694594596400;
        Wed, 13 Sep 2023 01:43:16 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id 3-20020ac24843000000b004fe09e6d1e7sm2058765lfy.110.2023.09.13.01.43.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 01:43:15 -0700 (PDT)
Date: Wed, 13 Sep 2023 11:43:13 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] bitbake: fetch2: git: revert path checks
Message-ID: <ZQF2IUv9IuRwTMae@nuoska>
References: <178468ACB210A979.23873@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178468ACB210A979.23873@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 08:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187555

Hi,

Sorry, wrong list.

Cheers,

-Mikko

