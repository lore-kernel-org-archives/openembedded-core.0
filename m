Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D42C71153
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 06:58:34 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.5349.1692860311815092597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 23:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=f2WNcCBI;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2bbbda48904so80425221fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 23:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692860310; x=1693465110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tEzKCnjmA8jAzYtSmAJsF6wgvzngGIPmzXgUgm4RpAU=;
        b=f2WNcCBIx1dho2YQXZqTYUSaReOG0TN0p/pjqGDPahpTPL5u4IRK5BZeBbOnzDy73B
         4gIlwzU+RyWpcXhyjqzuFN5kwU5/gJD9Z0Y1PNd8g2eKPB9JYz8l+34dFnXCyYwjHS76
         l3HYQ27eaUmEZyKSswSHnjVXMJGNW3L6KZIpsf/wTY3mNOXjmsllAha2cRaBt69Rfm4K
         enhZC+XQWzuDFKb/OMiv+qbQM9v9i7oQyiNdxH9D74XiwLC3NbOhC7rhBfa5TFuZ0/mk
         DANGe7Q5n5uXqxJEcvNJtwwEoEC7hWjcXljXHZWyyC5/09evsL66T0WARGxaxTnNRMUp
         aKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692860310; x=1693465110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEzKCnjmA8jAzYtSmAJsF6wgvzngGIPmzXgUgm4RpAU=;
        b=Pbez7j7xh8yYDCkd3lzlYy3Ut90E+c34J1MvM7CbdXhlUaSw+DfY9VWWdDKihCFuTu
         iQM6uriV6Ppreaay5Y9/bwVhrnwJI0Xz1DGeJ1PeBUTujJnKjdEZ6OoLlDHJp4AXDp98
         9CvX9018bxON482WNHkUk8fmV4zyU+mzm/Xt1qWEq5oNXhn2MEskbx5TeOpQfwQuA4dJ
         l2Usn1eirCHiavj9Jmu0VNhcZLnAVvr3IxV6Xq5DjhhwgIPwNNVp9MrNDproWk0xjfB1
         FCRX1UATUgc9zoFzIqAK88vOFjxQA9AObp/ShgCZ8S6pwQwl/vPGKbI6Ggaq+8BLFUqW
         rxsg==
X-Gm-Message-State: AOJu0Yzeb+6TcdYPXXhsrqd6bbnUiMHGJUSlb8MpX02fv9u4B6bHfQNt
	sPuutJuXZloJqec5N3vQP1Fkntfx9GWdfGhvp70=
X-Google-Smtp-Source: AGHT+IFS/jTGWIM5d9er5ZmAlt7tFT3xsLqik2+IbtJgUqFKaGy1kggZoKc8yDf9lKh+tEro9qaSPp5ytJYiJyqmChg=
X-Received: by 2002:a2e:8759:0:b0:2bc:baa0:57b8 with SMTP id
 q25-20020a2e8759000000b002bcbaa057b8mr8996245ljj.15.1692860309105; Wed, 23
 Aug 2023 23:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-3-mikko.rapeli@linaro.org> <CANNYZj9+Gs9mkJFKS3qpnjD0XudiqB3Z+2rVsPEgn4ioFyQ6DQ@mail.gmail.com>
 <ZOb7mNBQIfhR0akv@nuoska>
In-Reply-To: <ZOb7mNBQIfhR0akv@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Aug 2023 08:58:17 +0200
Message-ID: <CANNYZj_ESCckZNjEY8i_GpQ9n9-mgaCzcc88erai3F5PFOUiwg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/9] selftest runtime_test.py: add
 testimage.bbclass slirp test
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 06:58:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186640

On Thu, 24 Aug 2023 at 08:41, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> On Wed, Aug 23, 2023 at 08:45:49PM +0200, Alexander Kanavin wrote:
> > I guess the extra space stuff should be going here instead?
>
> Or some other image which is supposed to be compatible with oeqa runtime tests
> and testimage.bbclass. I think it's better to just ignore this patch.

It's a useful test, and core-image-minimal is entirely valid image for
testing (it's used throughout autobuilder and selftest). The point is
simply that if you need to customize that image or any other image for
the purposes of the test, all such customizations should be collected
in the test itself.

Alex

