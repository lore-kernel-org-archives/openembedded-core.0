Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F4BC63706
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:01 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web08.30774.1649691696125289405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 08:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=W5R5ER8s;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id z14so2379117qto.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 08:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6znAFMoT8fmexMS0q5jDkSzRmDYwtCEKVRAK4UsU8j8=;
        b=W5R5ER8sFVYQAWqVA/GWKnU/8QOkqS4jOEsg/8g9O6FgNubf17/tK2/o7bTSOtmcBt
         ACtVsjbNMBZV70xU34chG4Xu9Jlh7Qmghen+TaAF0Euad7DKr0h6hTf9oA36H/LUZiln
         /KazJEegiLLeY1qEW/A1CPuL2PHqLHFZvOF7VKERQ/Wl5zrhSkWJ9G+j/1cx8bdGMGm4
         bspA+9+vvQMLjDcQWiTJ2Osn64Y+ViGKjESfL4kv9eJf+DePAcORcJrSX/L7cZEDlYBr
         10pbvqt2goCD4KhXsgFq+bdZFOXw5Zl0DYypQWshxScX6zyS/yRJPdntEsHeJ+2agHSP
         xMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6znAFMoT8fmexMS0q5jDkSzRmDYwtCEKVRAK4UsU8j8=;
        b=Pj0CzznorlWCQhftHJwmRhOMPho5i8eeejQcFe3sfvtoIP3hsWbfz7+Yc1PW9aPxx9
         KKU0ugUq+Niv591KOaP1UqLBwF+iwAmXkXPsdK5MavjPA30iBa5SA/XG04zEiaaA7x0d
         los1D6CMRneXP61NNERjJ8UzGBqNHXxnx7uan78NfSBb9bHmdK4RqgiGms/u2LJCIRLY
         dYwcQOsJy9wNaleGevgMLFyjEz03mBcfoBTjuxBiEh8YrBXHlF/x2zEnzdH1WPF3gOE7
         W9yQUlKx2IM3XbeWnWsvKCQWrOMm2/snN9Nl5Fqwe1r6rGi1LI5GZldtyenIUxvYu2aj
         fikA==
X-Gm-Message-State: AOAM533U/mf33nY6b3/lFLxwrG8pytUb4JqLRuvQWad1oJ9CVosuteFE
	/heOXtjYe0Uu6apeID1/mBqnl2pSlE1ieQh2L8rWXA==
X-Google-Smtp-Source: 
 ABdhPJz95I+Yx/Ddi6InhKh3Dsl7Kk3yY7JghYo2ZLbqblbzutC/9UFM4OKhDcDFULp8x9fsH0ruIP/1DTLkkFejGG0=
X-Received: by 2002:ac8:5fcb:0:b0:2e1:ebd9:3e29 with SMTP id
 k11-20020ac85fcb000000b002e1ebd93e29mr26942095qta.147.1649691695097; Mon, 11
 Apr 2022 08:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220408192521.1608764-1-jdmason@kudzu.us>
 <b653122835d4cfdb414bac3d8e36b16a8c6f55de.camel@linuxfoundation.org>
In-Reply-To: 
 <b653122835d4cfdb414bac3d8e36b16a8c6f55de.camel@linuxfoundation.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 11 Apr 2022 11:41:24 -0400
Message-ID: 
 <CAPoiz9zqqaE9wKmTXZUmOu4v7BAqYmMxF_D_+UkmuxCAxob2Lg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/6] poky-tiny clean-ups and qemuarm fixes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164229

On Sat, Apr 9, 2022 at 5:17 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2022-04-08 at 15:25 -0400, Jon Mason wrote:
> > Changes in v2:
> > * Addressed Khem's comments
> > * Rebased to the latest version
> > * Added distro description for poky-tiny, as this makes it more obvious
> >   which distro is being booted when there are multiple
> >
> > The yocto-kernel-cache changes were sent, accepted, and should be
> > uploaded shortly.
>
> Still breaks on the autobuilder unfortunately:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/3923
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5035
>
> :(

Weird, it passed in my CI.  Okay, I'll see if I can repo and fix.
Thanks for the testing.

Thanks,
Jon

>
> Cheers,
>
> Richard
>

