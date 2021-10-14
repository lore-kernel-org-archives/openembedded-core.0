Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5B2C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 17:36:15 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.338.1634232973217407896
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 10:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MuQrr0+U;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.50,
 mailfrom: steve@sakoman.com)
Received: by mail-wr1-f50.google.com with SMTP id e12so21728937wra.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mbXRnsiwckNmYCTA7Nv+F8oBgB4vjq6dNHoiV/JKFrA=;
        b=MuQrr0+UlFQKpHxI+O7LISA+1auA/0RoglYwnbA89yL6/HPk5YUtsi7htm4SyKWdpv
         6zjaiYtkpb4YdXZnQbCY6YAkH5nesGxyrbftQayc6PA4JZEDBgrIaqQpuWLGIXCIaRdi
         wAhT2gam6IW9ZFIwNzeAur4nkjLmqoDLd4Zyflt2vWkmGxLjqTbZ0iFJA7co/ZIofPSV
         ZFf0LYXNzvIZKz1KOUqCdwj1RN4vaROUWxL+BiZD1x/GUNM2rVoY2swjvi4YVpqb/Aj4
         +p5e6S0V8XxIbefTINtBHlJqet1BqnWBaf4uc1Sqg4sTrrXETFkNIKMbh6aRPSqaXU+Q
         uJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mbXRnsiwckNmYCTA7Nv+F8oBgB4vjq6dNHoiV/JKFrA=;
        b=smnUBJ1DOGnh9Of141AEHn+ZXpd6vAFxkIns1hnwyJSGhUllAY6D9uKK1IQ7q/MMel
         EqkQp2BnTCKS81JAfyC6V4YvpK05t4q1bjVCnNdKS8D4EaefVb9gNz7RJQCq+++uATVQ
         KUdTaEXeBqbrkZHFt0YV4TwVjsauHzW9aR0XmOUFMYyHu0U65T3690KtNN29p04r6pUn
         rvOjo1zrBQfuGjTgEXN0TlC411hpHa+vDIoaxoLIH2wpsLPfkM/sm8wZxh2jAPCo5Ir8
         ryKFnAzOzGpyB8YOrKL4OBMICh+oWAEmEpfs4RR3Bm+tcm+GlBio1zwFO00pB/4DZ5yd
         xRYg==
X-Gm-Message-State: AOAM532ArQVj8j6twHyqfaE2gjfnFNYoVAER/GbxmpUQVoTGrxlyDk8F
	SjEXNROofT5kJ2pPPdlMBFpaHIL+0a7e0EWUgtvsTw==
X-Google-Smtp-Source: 
 ABdhPJyIXiNKbMry9R/T9MKBJ3RP1Sh4G25oo0GzFtLdQnbvtMLEGN5FTI5xZn7Gj/KGt7Pi+GQjkJo6hSqhDKDrxhU=
X-Received: by 2002:adf:bbd1:: with SMTP id z17mr8205996wrg.61.1634232971604;
 Thu, 14 Oct 2021 10:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <0c5732d80a8f5810e9a26c3b1e634422cf750fbf.camel@siemens.com>
In-Reply-To: <0c5732d80a8f5810e9a26c3b1e634422cf750fbf.camel@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 14 Oct 2021 07:36:00 -1000
Message-ID: 
 <CAOSpxdaGuK2RqNGz2VJg04AhnDhVRAMYvOLS497d-OTYUoXc-Q@mail.gmail.com>
Subject: Re: libpsl: Add config knobs for runtime/builtin conversion choices
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 17:36:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156969

On Wed, Oct 13, 2021 at 9:14 AM Valek, Andrej <andrej.valek@siemens.com> wrote:

> Would it be possible to include this commit
> https://lists.openembedded.org/g/openembedded-core/message/150627 into
> dunfell branch?

At first glance this seems to change the default behavior. Perhaps a
version of the patch that adds the knobs but keeps the same behavior?

I may be mistaken since I'm not really familiar with this package, so
would love input from those who are!

Steve

