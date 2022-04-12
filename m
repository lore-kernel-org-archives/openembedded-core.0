Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F8BC35278
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 23:50:14 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.2214.1649800186900603515
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 14:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IBYoJjCE;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id p15so225096ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 14:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VHi24DDJK1bLBN+p7ikJDyceqW9i9ykPzPefwPjPQzw=;
        b=IBYoJjCEl1Hz+iKMk2MtyLheH2idRVCvFvSDGiTOUKNTnA61ulPjPjTtgKNQkUGg6Q
         18Kq/ApV2gbpKzMR+xI6Unmd8WAcFsZsde51IaY+EOvk+nhSBOf4kAKhz911uKPwDYg2
         taUyjW+lghXnU4Cx2ERN4w+9bqsO6xyyjVC07jF72r1QF69vklHM+neVttphqXTjdWFT
         1w3y87qQLGagfyTI9AVPPRxNUtkMsH4J+XYmFDgU5JTIzMaZ5hQzS+lv03q/HvSyu0X9
         1Uz2QCnZQOVCswnED18ErEEsT4K23jSBvapiVnpoIyJw+DMOSOHlyHkweQ+ny7mSYnlc
         rdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VHi24DDJK1bLBN+p7ikJDyceqW9i9ykPzPefwPjPQzw=;
        b=4HgF2mfclB0xt3aKOzqR3oQqz4lC5hwv75DzbX+GeOdIwApuwLxrRoxfKoAFNmeMhj
         XMh22zW0R4/So1qnKSp4baLUkUmwHrspeLPgF0WgNqURhcwMIqYdvBFST+rBV4Q94xTF
         D2Pcyv2eYLeCeIaRLhQrxCvmUDxLlwPQxsY/m+AHpWnRKLD8SZQdE/bEcTpuxPWsUVq7
         NieI0i5PVOtYRpjL5zc8HdzBHV3cvqmWWV6S1uT1C5yDxFc3rrmnet1lgALR3Yp91afF
         lC+tYLHjuU/jieLimKVnAFZCFfhTy69DLfWNSnrxZn1CFicscEu8/NkAb9bWsQhr5aU5
         Jjog==
X-Gm-Message-State: AOAM530ggJF01PZ61uK9zjvnCJ+//H1ZHlKGxHsCrbZzmmOCPy+lVkmI
	dOPTn9LSTKk9QUWDUZQtQwucMuaVX9/U46wf+FtGZA==
X-Google-Smtp-Source: 
 ABdhPJykbUlRXmri2tbTs1a5QkYovTuw7axcKn06iiQ5P/TxrDf4EVA1eWul4Om+SfK/+K9buqAI42Dn6I/a8X8GL3s=
X-Received: by 2002:a17:907:7202:b0:6df:83a9:67d2 with SMTP id
 dr2-20020a170907720200b006df83a967d2mr35576578ejc.327.1649800184897; Tue, 12
 Apr 2022 14:49:44 -0700 (PDT)
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
 <CANp-EDZAM+4gQQ+2LJMRj00qwNGpMaPihtVOjZSk8HbbGzLUUA@mail.gmail.com>
In-Reply-To: 
 <CANp-EDZAM+4gQQ+2LJMRj00qwNGpMaPihtVOjZSk8HbbGzLUUA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 12 Apr 2022 11:49:33 -1000
Message-ID: 
 <CAOSpxdZ17NvKfsWxJkn0qwgNPCSz_WtRT9Ff=C6iiTxc1-bQRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Ross Burton <ross@burtonini.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 23:50:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164293

On Tue, Apr 12, 2022 at 6:07 AM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> On Mon, Apr 11, 2022 at 10:12 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> > What distro is your build machine? On the autobuilder it is using a non debian distro for the debian build.
> >
> > My build machine is Ubuntu, so that is a major difference!
>
> My build was also done on Ubuntu.
>
> I have just completed a build on Fedora 35, and this time, I am seeing
> the same failure as the autobuilder. I'll try debugging the problem
> this afternoon.

I added a debug option to the failing command and did another autobuilder run.

You can see the output here:

https://errors.yoctoproject.org/Errors/Details/654608/

And the patch that adds it is the HEAD here:

https://git.yoctoproject.org/poky-contrib/log/?h=stable/dunfell-nut

So at least now we have a bit more info on the failure.

I'm off to a dentist appointment now, but maybe you can take a look
while I am gone :-)

Steve

