Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4340ECAAD8
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 21:54:08 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.1104.1663883643428645375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 14:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N3tuTd/x;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id a2so16864677lfb.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 14:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=+lHzRHUF/CProfbmZmSw+UY65dG9sDb4/15rOD8zW5Q=;
        b=N3tuTd/xEKTMKI1YvLt/4g9PBuPGSR77ZiXj+pCTHteWGSvNGdrJMYa9oJqQX/65p5
         aqtCaVgVzCNJF6vzwZpYq1Ma+KqrSVfwoUSq0U/Spua+wLjMiF8NL6Zd6S42HtPqV+Jb
         X/4BnbPzbqqgSuYJFA1zknaRJipVyfXq7TQqX27kzbxn0dLcRrMESvli3RHLVvOHHCws
         iAUpKOkwGZKRPLn3bPlQd7oBdNLyXUiTAYkH1UeGYC9kzs4DDMExgVDQuiGq8itDnzA1
         Wl6sN+a709lPpN/WUsxWEcxuLz2gr3zyuoglJarwZ80S5oZCekGHjjQWAIqSSf2VFp2K
         zclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=+lHzRHUF/CProfbmZmSw+UY65dG9sDb4/15rOD8zW5Q=;
        b=ZkQFHXOla5mAR4Ngz1I49TqfADcYY2uBjUa8EavswF6Ze/BoVnesd2qjzCNGKjttbN
         TEGuap5F3t6B5+BZ6QueUrok6tAJm0XPPVBda5z9P4wAHXyzs+Oz0eSLwobVLPxasFMd
         mReRHkUmkFZGjui55/qZpgrM2nw9jDTEEbeHchdpaIFpb+KIrQIkNfMgxr1XCwRAv9xo
         kRPL7rL2xyrEtQJHlqQxVsJE38Q9IOGV58DwCLoCurOngXc94MMsr5FJP1JWiH90YrO+
         1TqjebVWGYPb8EKZcxfGSVPkGCwB1NidM5hmzarGepdjes0mSGHxFdiqTM6y4wx/lDFX
         1eQg==
X-Gm-Message-State: ACrzQf2ruDB8Pf4Yz7dycu9LbV85N7KSaB/2MzoTD6crH8SPLqW2agmU
	+aRI8/NB0Imu7z34anL8aoDHuFRLPoF+2XzJtXA=
X-Google-Smtp-Source: 
 AMsMyM5jF/8J+BLpUa/sjJYIQEhORUBf2X0NiGXedAGvzA5MrS/lW8DkMt6E/iCe8BWzPTDZ7uFuJPNsw9BP+nN8Tws=
X-Received: by 2002:a05:6512:3091:b0:49a:d800:2828 with SMTP id
 z17-20020a056512309100b0049ad8002828mr2058047lfd.534.1663883641310; Thu, 22
 Sep 2022 14:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220922124708.2218995-1-pkj@axis.com>
 <20220922124708.2218995-2-pkj@axis.com>
 <28947223c26b05f58c4b6cd13919b025617318a2.camel@linuxfoundation.org>
 <ee0aa31d5fa34a5ba889e3518d8b2a95@axis.com>
 <CANNYZj__Gud2xeWrtK=tZaY_BGQ2d4tVVJLfZt4R0aqzUadK-A@mail.gmail.com>
 <c78bac9a0a53243336d237bc5f6d51758f5a5dfe.camel@linuxfoundation.org>
In-Reply-To: 
 <c78bac9a0a53243336d237bc5f6d51758f5a5dfe.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 Sep 2022 23:53:49 +0200
Message-ID: 
 <CANNYZj-xWbVR8gdighemVnjGLUmYqK=ZxoF2vHPU2J3e+dBicw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode invalid
 paths for templates
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 21:54:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170995

First of all, I would like to understand why writing to .templateconf
cannot be replaced with specifying TEMPLATECONF= in your setup.

Then we can maybe proceed to the similar question asked earlier about
replacing writing to bblayer.conf with using bitbake-layers to adjust
the layer list.
There was also a question about removing the step of creating a custom
template altogether, and just writing a build configuration directly.

Where are the answers to those, Peter?

Alex

On Thu, 22 Sept 2022 at 22:32, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2022-09-22 at 17:52 +0200, Alexander Kanavin wrote:
> > .templateconf is not the way to specify the location of custom
> > templates, and never was.
>
> That much isn't true. It was a way this has been done, it was suggested
> as a way people do it and it was even documented as such. The original
> commit does make the intent clear:
>
> https://git.yoctoproject.org/poky/commit/.templateconf?id=614faa66a442069b8cd81ee74a01ecc5d73870d9
>
> I think the key point is that it has been of limited use as it requires
> a custom repo due to the use of OEROOT. Where you had a custom repo, it
> was fine to use. Poky was one example.
>
> I haven't read back through the discussions but I suspect Peter must
> have some kind of custom repo setup like that to be able to alter files
> in OEROOT.
>
> > It got added to documentation by misunderstanding,
>
> Again, I'm not sure about that. I think at the time, when layers were
> much newer things and technology was more in flux, we did think this
> was a valid customisation. At the time we were suggesting people might
> want to use tools like combo-layer to mess with repos.
>
> What the documentation doesn't make clear is that this trick only works
> for repo alterations as far as I can see.
>
> Since we don't recommend such repo alterations now and combo-layer is
> pretty dead, the code is of limited use and I do think it probably
> should be removed. I therefore don't like adding complexity to
> something which really shouldn't be there at all. I appreciate this
> does looks like it creates a challenge for Peter's situation though.
>
> I have put off touching this particular area of code since I know there
> will be a ton of problems exactly like this. The success or failure of
> such changes does depend on how the migration is handled. A large part
> of this is communication and to some extend negotiation too. The fact
> I'm having to start trying to understand all the details is the
> situation I didn't really want to be in.
>
> I suspect to get anywhere I now need to go and read all the previous
> threads to then try and unravel this :/.
>
> Peter: is there a pointer you can give to the setup you're using?
>
> Cheers,
>
> Richard
>
>
>
>
>

