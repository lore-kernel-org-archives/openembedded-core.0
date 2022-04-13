Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269ACC47085
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web12.1763.1649872954757735194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 11:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lS2Ie7RV;
 spf=pass (domain: linaro.org, ip: 209.85.217.49,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f49.google.com with SMTP id i34so1330232vsv.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 11:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ol4UIcgSUOzkmggoOtK7YJpA8lGTELrxLA8abS5xn5g=;
        b=lS2Ie7RV8VSHxaP/hHbSFRUvemad97oa6zzu72rdkkFP650U3x2BiBYJ2x7wRXn/bx
         AueCD2y+G9k7F+OUbnLoMqzzFexM2qEaLbk5lbmhfG5YSzoUC42OXnoQ1RiRpwyLnirT
         lpjMjATbhlp7mwtHLsSnv6hsxv13UU7VWvYD8Ojgkk/+8Vlb6yfSALYAx4PxrTvfxbjj
         Pxc1ZvKTNuLWYOlcfhmAtjHy7w9+AIf4a+FAkcoF2i3bXrpiBKUEF6PenePZsD693Nly
         NwspbV6A9Y3gT4md1rVdFMwlGJgDnYXaSIQY5NrUyuxuUb/huTSrUeK8y/v3JOSKU0xQ
         yYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ol4UIcgSUOzkmggoOtK7YJpA8lGTELrxLA8abS5xn5g=;
        b=aZlcT82QGyu5UZCLAX5DYBYDV6/A0vdyuNA01GAfxFaZwIxUl+Aq4e39DNbgLwIwaH
         RMmwvxkUzbPW0JiHDF9BsyCwPSMpC8oAQJFVOedTCLD/cmmITttxA57bZgS7vxEekyY2
         DyjRWuz1/P2hEgC/9+TQLusf6w9KBYjzsGKrFudlZNeDxrR89Z3p45Wcw6A2826prQh3
         875SDHSPZ/cASuAXo1TcLsonjAZMC1mDf9aPch3/EYnXJTCHX62PgGQGtYmqWrvIp4G2
         vG8o3LPohuiRXJ7+dZpB08qgVIDopNhTt+cWDFxIKWmn8BYNMA+yCQ/EM3hYxcjpKxpY
         GaVQ==
X-Gm-Message-State: AOAM532sbiWlHQjEZP/Oty9luLlPWoG05nLx984Zk8xQVcJKXkNTW4ZX
	j0PahtqYxQjKfMETCEEcHO2mS8zWClPqEX94pFEfjA==
X-Google-Smtp-Source: 
 ABdhPJzX27A09iioMA3Wnn7uHr2Aze4J7I0c4SISif+3yW5Ybgyoj8TofpYc7IV4NEHzAtvJ4asMtpwcneyx7Sb80iM=
X-Received: by 2002:a67:ce95:0:b0:328:35b3:fe98 with SMTP id
 c21-20020a67ce95000000b0032835b3fe98mr6602587vse.73.1649872952717; Wed, 13
 Apr 2022 11:02:32 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
 <CAOSpxdbuJOH8R9a9XWGcFNL6nvSaMB=au1sQ4AgiYr+b00Op6Q@mail.gmail.com>
 <CANp-EDZ-b6JYx8h1LRkg7YwCX9frZw=s_XiJ1_Ys-nBuyvhvxA@mail.gmail.com>
 <CAOSpxdZb2q7iZF+KCT2H3ajisK2pgQo_8cxbvxYQRgpnQqEKAg@mail.gmail.com>
 <CANp-EDZAM+4gQQ+2LJMRj00qwNGpMaPihtVOjZSk8HbbGzLUUA@mail.gmail.com>
 <CAOSpxdZ17NvKfsWxJkn0qwgNPCSz_WtRT9Ff=C6iiTxc1-bQRg@mail.gmail.com>
 <CANp-EDYtqNSKNMCmZ9tMvQDqv6r-29zSiz99sievky6GEm6q8Q@mail.gmail.com>
 <16E57E79FD292EFA.13992@lists.openembedded.org>
 <CAOSpxdYONLK8BhmNjx9uj9BDb0P=bAiJ-uAKG1edHjBnzvHc9g@mail.gmail.com>
 <Ylb9RoAyRpDHTaqe@mcrowe.com>
In-Reply-To: <Ylb9RoAyRpDHTaqe@mcrowe.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Wed, 13 Apr 2022 14:02:21 -0400
Message-ID: 
 <CANp-EDZbeheyJWo_xwqPa4A24PJJghfZOuqG7sJX2DC1UfAPEA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Mike Crowe <mac@mcrowe.com>
Cc: Steve Sakoman <steve@sakoman.com>, Ross Burton <ross@burtonini.com>,
	"Mittal, Anuj" <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164355

On Wed, Apr 13, 2022 at 12:41 PM Mike Crowe <mac@mcrowe.com> wrote:
>
> I believe that Ralph's reproduction of the test failure without the zlib
> patch was from a complete rebuild without anything coming from the sstate
> cache.

Yes, just confirming the above. I wanted to be certain there was
nothing left-over from a previous build, so I nuked everything except
for downloads and my local.conf.

I am quite certain the problem is with apt-ftparchive command, which
is what generates the md5/sha sums in the Release file. It seems to
behave differently under Fedora versus Ubuntu. Only the SHA256 is
affected. It is worth noting that apt includes its own sha calculation
code, they are not calling out to "sha256sum" or using an existing
library.

Was busy with some other things this AM but am going to dive into
apt-ftparchive source code next (which is C++, ugh...).

Ralph

