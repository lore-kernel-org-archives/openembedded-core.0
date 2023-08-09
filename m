Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85B1EB64DD
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 09:25:05 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.84318.1691573100883714252
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 02:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jZbcJdZS;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4fe457ec6e7so10922582e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691573099; x=1692177899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A+DdreJLUICAbujXKI8cqli4ZYVuEq8MVdFFaQ07KQw=;
        b=jZbcJdZScy0gqiZN8mxk+tepgYtVLtEejZSsStotTgNGDY6DM4b384EWo1COibkAbc
         Idb53CTNXiBcDlOwRdzDHts51OJ25Y3BgTcAr4pmCPduzjB/eYnncNa4g5+CddyGobXU
         zYpiWHi4Rhab+/tG4Y7dijrBfBiVu70vMhQ2V6iCJaYFAxL3Rmd1+ZrtbSNry5ifq4w6
         yxnxQrBHEHM9LaZEJEe8HVYO/tH7arsI1Jm4A0ywWcXOB/cHNZr9oR5FcjdUvwYfpHGu
         5H1bko3TxPs4rVhMBylXEHcrugwLwq57QSGCTSGr8txi5BN80sKl25WVzhbtzUdTtBQ2
         Ay0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691573099; x=1692177899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+DdreJLUICAbujXKI8cqli4ZYVuEq8MVdFFaQ07KQw=;
        b=T/2L3zG1FdVyhDwmcQHMbYuBDhESF74Agox1y6gvErW75ELPv9C8XmjS5aE4SmBB1U
         Xcn25GEfY12yeAdn/VVLhJGsNuAynKiH3SDENgqXigs0aEFiTFJaF8JdenJw5SnoDmyv
         /LS1ZhjZcZCO3Ql3UfMt+/qzKlDTMVXUSC9UJ7x5xWrkZDRtZiqoBTICJoFI1teu7jyd
         IOnHevEAZ4U/g0D4+6pXEFDcvLb30m71qYhfoB5Absk2sPMUVKqLjImmFbsUqfOcJbDs
         eywriDBvOesrj0VT0mYQ686yyKZeGPut52KbxLkHbl9sVbumIRL7XBwlocttVCz7j2gL
         8jLQ==
X-Gm-Message-State: AOJu0YxWxfitviv5cUC9HoYJ2w1LbWYVv+bjzKlDY0Ro3WZ3q/i+YmEs
	BL278ERE2yxc+wgYBLE6KG6Zsg==
X-Google-Smtp-Source: AGHT+IHfOxStNpLCEc+VLbWW9xsHVcL4aT9Vb5XzoR7ygmfoY3X0eTu2lfjSs9lP4W2NlOWo9cwASQ==
X-Received: by 2002:ac2:5bcd:0:b0:4fb:89b3:3373 with SMTP id u13-20020ac25bcd000000b004fb89b33373mr1471037lfn.43.1691573098582;
        Wed, 09 Aug 2023 02:24:58 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id er16-20020a05651248d000b004fdfeee003csm2211931lfb.228.2023.08.09.02.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 02:24:58 -0700 (PDT)
Date: Wed, 9 Aug 2023 12:24:56 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 1/2] systemd-boot: enable verbose compilation
Message-ID: <ZNNbaLGDnrQRbHiz@nuoska>
References: <20230808160828.3045524-1-jose.quaresma@foundries.io>
 <CAMKF1sr4azY=E9XUz4946qWByrMFHbVM-jCACFtgF93_ry4DpQ@mail.gmail.com>
 <CANPvuRny9BbNDpGtz6y2omz2fzsezKHij_pff_bMNRZsW_iyTg@mail.gmail.com>
 <CAMKF1so0DFL3CZqtPKzi1QBV2cQ=6FD=J=TsaFS8ME8KXyPsYg@mail.gmail.com>
 <CANNYZj-DtpOfOye1kOvwCcxzLuAJ6gc3FyE__VMStLiNirrViA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-DtpOfOye1kOvwCcxzLuAJ6gc3FyE__VMStLiNirrViA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 09:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185693

Hi,

On Wed, Aug 09, 2023 at 08:47:05AM +0200, Alexander Kanavin wrote:
> On Wed, 9 Aug 2023 at 01:06, Khem Raj <raj.khem@gmail.com> wrote:
> >>> I think this is only useful during debugging. So perhaps a comment to
> >>> enable it is better than enabling it always.
> >>
> >>
> >> The meson bbclass also compile with verbose so in my opinion it is better to do the same
> >> and make it consistent with the main systemd recipe
> >>
> >> meson_do_compile() {
> >>     meson compile -v ${PARALLEL_MAKE}
> >> }
> >
> >
> > Ideally we only want the verbosity when something goes wrong and meson ninja etc are good at that with their defaults perhaps that -v should be turned off by default as well
> 
> Absolutely not. As someone who spends a lot of time fixing build and
> runtime failures across all of oe-core I beg to differ. I want
> verbosity all the time, everywhere. I also do not want to spend a
> second figuring out how to switch it on (it's different everywhere
> too), or to run another build just to get the verbose logs out of it.

I prefer verbose-by-default too. It is really annoying to investigate
build race conditions in various CI environments without enough details in
logs. Had to trigger a lot test builds because of this in the past.
Same goes for testing. I know logging infra can be abused and on the limit too,
but I don't think bitbake task log sizes increase that much compared to
other stuff remaining in build tmp directories after builds.

Cheers,

-Mikko

