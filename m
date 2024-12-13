Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE44AE7717F
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 12:32:52 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.14068.1734093170481818350
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 04:32:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vmVEnqsV;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3022c61557cso16256471fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 04:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734093168; x=1734697968; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XcPAbnSZ2/f2Eh0mEQ8/Iw6dviRicDE4np4wFDBABAg=;
        b=vmVEnqsViX+PpHKO5zxAgw7/8uOpwNfP1AC0Mbt4EpUKI+tzNTiqr7PbhEXbY5A/r2
         11UIffoCKMx5KVXCAsl53Ey9ANPi56MBHq4r2Uw6RdbD+HAcWoBY/xcegHM4QTK2agU2
         ADv6ZTEnw8KH9ejnuxxk6DeTskBtSxqWKBupXLJDpJYT+pPLnfwCryBE8te/Pf1sl2Ya
         peiaY7HqYm4WhGgI31hpRhHYQHROVL1HGc1mOcjYQ48NGMxZ8eI1TfA99gK/ViiMRV/T
         y1P4VUPDBbMSEJGHIT1GW3eY5e1P9btbr3H3fQJZLgP2mQ+skYEKBZ4PSRArH5G7nSPf
         6kLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734093168; x=1734697968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcPAbnSZ2/f2Eh0mEQ8/Iw6dviRicDE4np4wFDBABAg=;
        b=cLJg/6G8FAOrDpX+NBLfqsg+hHX+I2L37ZDnlubs0D2ASX2XCKsD43IVjqt+7TA3kl
         JUDg8RWk8UcY4VgeFC7A9B4jql8Kqsr1FXVx0nGgt+sZtWk4Oo3qUHn3eeh50l2IZfZ8
         Su92Y/UVnAiv+rZ9BjJANVUmI/oNP5ppm8+rlpeZJqCo7XkFH9LSHJxeReBjCPpwVdI8
         DPCxqIPzy7aytR3VyiQZFR3DgjfccYB0eea+w07u8e/yvnf6RwHBakxi61kkl5Zkpe7B
         5c1KFTeHsLwLR711atm6wFUysgTWh3D2cyEA4RNgAtm8pzyUizeCwfhGle+on6ja8NNy
         j9SA==
X-Gm-Message-State: AOJu0Yxy92hJ7Famg/A1IXLk6Xmp+GgNwiegBBMLBagy9ipqNWngRHZ5
	Fhi04q3gOM1+3C6nUQrvJ8LIfCXgjX+A1ZB7U+OjvW+boF4FgE7gFax7mqPR/PM=
X-Gm-Gg: ASbGnctH9yRMycLD006/ArJhDdlUWBDyyUyEJPjbkYRn4qKFi1lef+VNwLWFu4+K4U5
	Igkhj8NlTCYw0ZPzz/jSlgEt9G/BQGlMekv6eMkZyN9CJ0Es1Ai6ww7XClPHFsyZaNHuJJU/v1m
	3vVhkfOD8AdlkefNPxD6nUaxnUw/XTnT7b9mnAU0cFaqWS1OA0KrnLr31PvePQwtNrHZ95jQr7U
	tQjRqCcBhjkvPPVIzdJZZbKQld07S/MphJNf7vQPfAwzRYeTYxHn7MsO0tjVBo69bRzBjurc8w/
	qJPRqJ+VyA==
X-Google-Smtp-Source: AGHT+IExiwpcBy2t+jOZbAKiqtMG4NstcYzPcIUDlHd+p6sjkmZnrJlYbAcf3JcwIwH1YVcJISalCg==
X-Received: by 2002:a05:6512:2399:b0:540:1fb5:3f9f with SMTP id 2adb3069b0e04-54099b696e1mr807596e87.47.1734093168354;
        Fri, 13 Dec 2024 04:32:48 -0800 (PST)
Received: from nuoska (2001-14ba-4f4-2a00--193.rev.dnainternet.fi. [2001:14ba:4f4:2a00::193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e34a49561sm2262179e87.83.2024.12.13.04.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 04:32:47 -0800 (PST)
Date: Fri, 13 Dec 2024 14:32:45 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] systemd: set CVE_PRODUCT
Message-ID: <Z1wpbbPyXCSCiHPo@nuoska>
References: <20241213120250.704778-1-mikko.rapeli@linaro.org>
 <AS1PR10MB56970F211E89C972FEE4E2DEFD382@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS1PR10MB56970F211E89C972FEE4E2DEFD382@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 12:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208682

Hi,

On Fri, Dec 13, 2024 at 12:14:54PM +0000, Marko, Peter wrote:
> For historical reasons, we should not limit the check to systemd_project vendor.
> 
> sqlite> select vendor, product, count(*) from products where product = 'systemd' group by vendor, product;
> linux|systemd|1
> systemd_project|systemd|106
> sqlite> select * from products where vendor = 'linux' and product = 'systemd';
> CVE-2012-1174|linux|systemd|43|=||

Ok, will limit to just "systemd" product name in v2.

Cheers,

-Mikko

