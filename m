Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE08C433F5
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 10:47:33 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.38731.1639565252119113904
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 02:47:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=Wg07628n;
 spf=pass (domain: burtonini.com, ip: 209.85.128.54,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f54.google.com with SMTP id o29so16288568wms.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 02:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fm6M0ht66sxo5+YEWK+tRlOen02ZQAv1EC1gjyYSFhI=;
        b=Wg07628nix2bk3LfCGms7t+fYrNNVZQgawHCdZa7rBmCopV1s1ImiwjOWa3GKu28PO
         VuMyVG4YJVdr2NcSZsvE4DcMTJKtw7lIhqs4cD5ux27qmYSsskxlsoShXSR4bjTyf03X
         NniM/khUT2EZnRg71fdroFZx04LAcen9k1NW+4uRD/6gen+sUWbLXsgRWdUV3cs8Azxc
         Cq3PWiWMHhvvXexMn5Fix3ZVq69nDKWbmY3k2QBJDFVmA4wrk5FUFYj2H70EUMFMO19e
         6vO8T36b/c4hMImBaWeF/HXFv8W9YX42DPeLCNNxVScyROMsVlcAP76QDUq+c+4fAdNt
         iALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fm6M0ht66sxo5+YEWK+tRlOen02ZQAv1EC1gjyYSFhI=;
        b=JJ38pLjS6Knq3Zcy8wuJ7F1k6G/2wl/KqIdwVclPtFRTIuLyKfleuaB2YIPFZ9uytx
         akfa7hhVPONc278WJQhiSWU7gbOY4Mtj2eB0k92omu++N0ngFqpJla7doeJBtM/DlZiX
         A5yRu6hU2jmXzzaK4NYreB3MuVRYjbQ6Mi0HW6+AU24s8OmLhTE+NFmyxXhO616dsyp1
         5WMRG6w7dqt50ipCHqiuS+xqBAZPm7TpQda+DLtbKU0ud/LJ1jkHskg6whSVZjSVCLq3
         waRFMNuWUt0FC3rp53JdEZglP3B5jWXDrIuCNfiMu5EN4muK5ZWBN7q68SRgRQAKt6zc
         YoCQ==
X-Gm-Message-State: AOAM532+jq8NNy0dJwgC9S4BZJgGTiCWoR+YmQbEmU+ZYDjLB5MAJpFT
	u7pymu1xeXh8N+tbjNq/gc1s3UBSbBvZmSJXAvIa6w==
X-Google-Smtp-Source: 
 ABdhPJwbbzR+jmHSCZn0luM4OyuEARrcPMMiySOjLcKsQ9BIp/7N5kC7A3WLvuNaOsEj1xXTslBhhq55TEs69jXuidM=
X-Received: by 2002:a1c:447:: with SMTP id 68mr4026433wme.69.1639565250189;
 Wed, 15 Dec 2021 02:47:30 -0800 (PST)
MIME-Version: 1.0
References: <20211215071632.11038-1-yongxin.liu@windriver.com>
 <AM9PR09MB464238FBE970773FAD77D126A8769@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <PH0PR11MB5175F1EADC2CD9EE3A711A41E5769@PH0PR11MB5175.namprd11.prod.outlook.com>
 <CANNYZj8pXg=36BCknUvA4xemPYawzkHwbuUBWi_giqhHY-Cf9A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8pXg=36BCknUvA4xemPYawzkHwbuUBWi_giqhHY-Cf9A@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 15 Dec 2021 10:47:18 +0000
Message-ID: 
 <CAAnfSTtELKG3oF04CQV9nDvgpy+T8qY_PoaD6L=QXCXez-HmhA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] meta/recipes-bsp: Add recipe for Slim Bootloader
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Yongxin Liu <yongxin.liu@windriver.com>,
 Konrad Weihmann <kweihmann@outlook.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Dec 2021 10:47:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159720

On Wed, 15 Dec 2021 at 08:15, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> Also, as this item is x86-specific, shouldn't it go to meta-intel to begin with?

My immediate thought was that meta-intel would be a better place for
yet another boot loader, especially one that only targets modern
chips.

Ross

