Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FDAC433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 19:31:38 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.4062.1632771097020965977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 12:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nt0PQ9RF;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id y26so42781618lfa.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 12:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hAw5IjPYh5GQV97z6qB+WKO+sdmdrt4/LqWJZrogED8=;
        b=nt0PQ9RFurSKBxUR9ajPfZIR1FWQJEMg/q7vncHzKNox3a5uXfYeZSelpI+eDXB10+
         qzng30+pfqrKiASnZXD8k52LqDZgQelhVJJSp66SJ1gj+S2EUay9ZYJ2FrzSXw+21QNH
         j6+1lH6jK5BKJy5L2QUzji4YF/zyL+rQdG23GCUT1co+GoBABNfyazQeejpVLtiWIsn0
         AqJfpwd9/hRDfWVhNC8MViX32f2D7KICfEEEr+Xr76IHZaMweTK42B2P/KMGMsaXf4vg
         XsD5pePOFXUFdfMKpY7+yeJxGht1IebEqUnwRjWzs09/mzBdXjE/oMDvVyXnjwQa1Wcc
         Pfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hAw5IjPYh5GQV97z6qB+WKO+sdmdrt4/LqWJZrogED8=;
        b=pNf8MSbpO2Oob+wPZz5kEXSnXy9ot9+CVKrm8iYhJhkWGBYQVxjnXrPO/Rdm8yoXMj
         znHqXcUq3Qpum0pIOocVXIxkauQK0PnE64Uus/aJg2O6rIRHtCD7mdJnbf5VxYuTkQcO
         7+PEQHdLf4IpINA70J0Gvk4mieP8mMf87zzvp+mIrii7ICYo4u4Exz2QCEPG627Zsa2f
         Ko6KAEn6ePGZKy0uFFLC13l4xN3QOmP5h6hp+tu95t6b7TT7Id6/kgffpvefQUrn1bj9
         iABa+MExlwskSzLlNVPErAXUiCEfwowqf1r/6qD5B91gH+hQgmbxk9G8Ir3uh+6oHvYS
         OAgA==
X-Gm-Message-State: AOAM5335UxCrT4b++yws8dMCECKpViFT3ZEyy/VyBAXfu2it5qMHSPFl
	3PE4PBFr3ZE++XDyWKdvkuq4kxO2nAEn075T/+E=
X-Google-Smtp-Source: 
 ABdhPJxjDo/DJDjPQGFh3QvGqeKd849qKTrx5j7D5/csjFlYUhl8DGgu6AwB5fphBVBI/PogqwJ5S+9cVywCrvBjusE=
X-Received: by 2002:a2e:5411:: with SMTP id i17mr1577054ljb.97.1632771095030;
 Mon, 27 Sep 2021 12:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <d8be7242-c7e5-7893-a3ed-649d894230f4@crashcourse.ca>
In-Reply-To: <d8be7242-c7e5-7893-a3ed-649d894230f4@crashcourse.ca>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 27 Sep 2021 12:31:18 -0700
Message-ID: 
 <CAJ86T=WBSRGamDSsDeBrsgSH=SZiehi7_rxT=FSRRjytoLx+hA@mail.gmail.com>
Subject: Re: [OE-core] simplest use of SSTATE_MIRRORS?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 19:31:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156398

On Mon, Sep 27, 2021 at 9:13 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   colleague asked me how SSTATE_MIRRORS worked, so i had to check,
> followed the section here:
>
> http://docs.yoctoproject.org/overview-manual/concepts.html#shared-state-cache
>
> and in one of own builds, i moved the entire sstate-cache directory
> to ~/SSTATE as is, then added the following to my site.conf:
>
> SSTATE_MIRRORS = " \
>         file://.\* file:///home/rpjday/SSTATE/PATH \
> "

The example in local.conf.sample uses file://.* rather than file://.\*

>   then i removed all of /tmp in my current build, and re-ran my
> bitbake command, but it seems to be doing all the standard fetching
> and unpacking and so on. what clearly trivial step have i overlooked?
>
> rday
>
> p.s. i checked with "bitbake -e" that that variable seems to have the
> correct value. what silliness have i done?
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156390): https://lists.openembedded.org/g/openembedded-core/message/156390
> Mute This Topic: https://lists.openembedded.org/mt/85904527/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

