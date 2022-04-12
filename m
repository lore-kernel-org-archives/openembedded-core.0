Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D856C41535
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:38 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web10.12638.1649779658296931166
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 09:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eAfLSFux;
 spf=pass (domain: linaro.org, ip: 209.85.217.44,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f44.google.com with SMTP id i186so16656749vsc.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 09:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tFjvdMvrCOSLdzBIvedBlgGsFr4oYr8YrYiTH1wWSzY=;
        b=eAfLSFuxMNZASRkMsOGwEN9CoZyY+Y5LVCM6Jp6EjQ16+zux/SRGbh7jqP527cbVeE
         JWSiPyyHhESWtTGIC+Z5Mpm6rmL5Ktw0yQkXExsRHKtAilm0oShs6bShM6RCvtzEo6NP
         Uk6v1Sne1sAp1aJp7/a6qaJmA98HbXi5T44oRyyr2cF06AvYGhb4X37AGtK3IFoqe0Ix
         AdBp+ADuCSMM6m+rd5fnST999vGu3T1LgIaqRhOcHkmUfBuNH5sNJc6WE28Tr7f8ncvo
         ZZuQar3YjLoB2lwfav9mT/qLHW6w5+9YWGsJAhEdqs3vh0VLLH6Enw+X82h1uLbVcwP7
         LdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tFjvdMvrCOSLdzBIvedBlgGsFr4oYr8YrYiTH1wWSzY=;
        b=46DE10IVWXt3cFSvazMU6yO+wifOm46HWg382NcAEmjEgzVr8MtyeZ1qQL+eImFe+H
         yrK+YZURSf/o8cVXINS2N86GdwW+5VfJ7z4JOsgjgvFT6+6OIDPXiWRzyJHA2RWYG6Qa
         Zqvglskw3NpyU2vkpz3kzsKnhA618kt3146ehG71RUMD7N9mmnQulNi8+Jffxbshj22q
         Ba2HOjwGeSfbGBI4bcKKq4Gwci/n8shxL5WbpuOin0eOm1VvEgVky+ovvCTlhuNcqTdj
         PaxiJCurvYITK0BLq59cg41vGLmZBk+cuzLyUYHq6Xlpu49AiqNVnHYGKsUE48mLXYSi
         82NA==
X-Gm-Message-State: AOAM532ZQ3UgI4jKJ12/QjXZu6wmJq1nLvdlb8f8/u+d8ziM2hINjK6F
	ZK9XC3Xlzr07zss4ev4uTqWUMs71suIn5GXCbzBM4w==
X-Google-Smtp-Source: 
 ABdhPJz54VHDBdxci/7PXYTg8rgzPW+ciArF/41vAJLc35zdNE3zZdnx4pN8BsYxGJ3ptM05f4d8VkXTDClHKk8tY8Y=
X-Received: by 2002:a05:6102:6d3:b0:325:cfa3:44b with SMTP id
 m19-20020a05610206d300b00325cfa3044bmr11980762vsg.23.1649779657332; Tue, 12
 Apr 2022 09:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220329130741.2430737-1-ross.burton@arm.com>
 <CAOSpxdap6UjLpy9M--b_EMYV+m3oYOQJT002Hqw5qcpCwgTVyw@mail.gmail.com>
 <CAAnfSTuHjbiN2NKVwZOut+MjxLhuFMwn+xAWkFHaqAXmM_8Ypg@mail.gmail.com>
 <CAOSpxdZGOwUs86K6bEX3WTgVu-+fFjonKxiGEe+u1OL=ivqx+w@mail.gmail.com>
 <CAOSpxdb+O=iDpDNr7S62wut=GErTXg8cvpYsj0nn6DM9G1CL-A@mail.gmail.com>
 <CANp-EDaVN-4Z_iYXJq7OcJ1QEtpAsHTGOQkCHeW+gJ6u2b=0xQ@mail.gmail.com>
 <CAOSpxdZdi+xiJcFeyOgrLTATOaaD0hf9k-+yQmsH2+GJm8xcQw@mail.gmail.com>
 <CANp-EDaN76FxTBEjWFe5WD3W+tHbqbfJuA=kcuW8eeyF_O8vHQ@mail.gmail.com>
 <CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
 <CAOSpxdbuJOH8R9a9XWGcFNL6nvSaMB=au1sQ4AgiYr+b00Op6Q@mail.gmail.com>
 <CANp-EDZ-b6JYx8h1LRkg7YwCX9frZw=s_XiJ1_Ys-nBuyvhvxA@mail.gmail.com>
 <CAOSpxdZb2q7iZF+KCT2H3ajisK2pgQo_8cxbvxYQRgpnQqEKAg@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdZb2q7iZF+KCT2H3ajisK2pgQo_8cxbvxYQRgpnQqEKAg@mail.gmail.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Tue, 12 Apr 2022 12:07:25 -0400
Message-ID: 
 <CANp-EDZAM+4gQQ+2LJMRj00qwNGpMaPihtVOjZSk8HbbGzLUUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Steve Sakoman <steve@sakoman.com>
Cc: Ross Burton <ross@burtonini.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164278

On Mon, Apr 11, 2022 at 10:12 PM Steve Sakoman <steve@sakoman.com> wrote:

> What distro is your build machine? On the autobuilder it is using a non debian distro for the debian build.
>
> My build machine is Ubuntu, so that is a major difference!

My build was also done on Ubuntu.

I have just completed a build on Fedora 35, and this time, I am seeing
the same failure as the autobuilder. I'll try debugging the problem
this afternoon.

Ralph

