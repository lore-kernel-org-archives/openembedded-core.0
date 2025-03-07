Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D91C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 14:05:40 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.11683.1741356338759473497
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 06:05:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gzTGNdQJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8fc176825so11352986d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 06:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741356338; x=1741961138; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5iuUThZbOOEZtrRUKEVFrt3RYNSUSCxWhP+bAR3NAE0=;
        b=gzTGNdQJS/xCk47ksKiH7ZdSzc9HCDO7d/4OE3ML9oosKEaJmIHwvm5ubdGqu4Da7W
         foTRwzcDkdsjNlcmrnKl1TYhPI+aHY5gX9Myixu/tazpziW6OPlgUAZ8UoO1XzZKr2zx
         nrfpUh9WCODgRaDii9M633d21hj1WNK21RaF6TewbwLfh7APqf8J/KF8XuBpdTUJa/8V
         CKt9ULaeWd0GCaVJHb20M+ytQZ+YgbUBavr8q8eHm2KXwTJWu+xanZ4VxnqAIPzc7aQk
         vqAb+CHnSdmi+xVoOmIM87vZTleE2L+69TiA6hw+NGlTpSLk8z5krLxlYjpA0jo1CbV5
         DKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741356338; x=1741961138;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5iuUThZbOOEZtrRUKEVFrt3RYNSUSCxWhP+bAR3NAE0=;
        b=w9TlLbOCFlgNfSqdD2RhaVZLf4uDerl12mKkLjUgm2/xYayNBm1M74TVpvfWQIG0+C
         g85nOAbpmhRP08bh2f1/W4etxHijxZUZVSMsIIrFhKIWr+FPBCPW2M5H4pnCG6aF3LSo
         DyNBrFgQQNkHCsewuq1Mc8TNa6ECbJTA7BDnuBLjbohemefZ0KAmtQZ8DbUuteMRO2BU
         52yiaaAWJQQcSSrTdE+KSGCLgQfzjBYGd+oejQXhlE9Nl4dS1MTYVXEG0eO5GyvsYGaL
         LiEutnwa65ylck9RjFDRE4zgKy2o7qsnTBMJVgo6WgecBsMvKDDZcpHc/8EP98casEzS
         VUXg==
X-Gm-Message-State: AOJu0YxMIypL2m1F8aTUaDPJhcsg6HlZ5K3SPmawYLotogvJtK+Vl0vZ
	WRfAin/zJCQCWEmTrIy1g8XEp7x8PZA06MRCzrZUNGNKvQ9UtyOl9O0becGgCdtsTKKaWYQoZPE
	Eiik1kGGV9vv2DG306vNy7vJ86ho=
X-Gm-Gg: ASbGnctA0OSl4S85dqhLhg95SIPbv0vziocV68RZVQiVGX4YQF/32++7cfhCUwBELO0
	hPR2u4gb0W3aQibWCcBb4R3EX7cnYcyJbVVTYmk7vfUyvwuTt04OUpsdndjhOALlTf9IxTZ4c4/
	EUyFhvx1HEl93ShEVAKdr4x51v3x5BjP4cYztLwptgZBnJj34+V4Nku+zhmLO0
X-Google-Smtp-Source: AGHT+IEnRGsOFfCPZjry6jNrP11biW957VGcviVHM9WgpUdSaTYr72y/oS8My1L2+aOFV60DqCPMQbWMwbYXIeiEKRE=
X-Received: by 2002:a05:6214:c83:b0:6e6:6b5b:e559 with SMTP id
 6a1803df08f44-6e900678553mr49766886d6.34.1741356337495; Fri, 07 Mar 2025
 06:05:37 -0800 (PST)
MIME-Version: 1.0
References: <20250307132900.456962-1-f_l_k@t-online.de>
In-Reply-To: <20250307132900.456962-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 7 Mar 2025 15:05:26 +0100
X-Gm-Features: AQ5f1Jq8LKV0i5nlp5oBPKjfz6Tt5pRwIJxP5RsJuKAgmbloDfrRkX9GSO9YAmk
Message-ID: <CANNYZj_Y9kM=uq0pKWduZt4LQ9zVwLXnOzu+HAhWJBApAfwduA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] glib-2.0: update 2.82.4 -> 2.84.0
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 14:05:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212443

On Fri, 7 Mar 2025 at 14:28, Markus Volk via lists.openembedded.org
<f_l_k=t-online.de@lists.openembedded.org> wrote:

> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -58,6 +58,7 @@ FILES:${PN} = "${libdir}/lib*${SOLIBS} \
>                 ${libdir}/gio \
>                 ${libexecdir}/*gio-querymodules \
>                 ${libexecdir}/*gio-launch-desktop \
> +               ${libexecdir}/installed-tests \
>                 ${datadir}/glib-2.0/dtds \
>                 ${datadir}/glib-2.0/schemas \
>                 ${libdir}/girepository-*/*.typelib \

This needs to be explained, as it doesn't seem correct, and
contradicts ptest-gnome which (correctly) installs these to the ptest
package.

Alex

