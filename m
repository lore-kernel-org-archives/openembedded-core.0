Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8A1C04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 13:24:59 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web12.7861.1664371497468554228
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 06:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lQxFzF4S;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id k10so20365841lfm.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 06:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=4Ca0np589nzDFnV1uDNU5F0TUxTHQVPLQxMdWconT6I=;
        b=lQxFzF4SGz4sgZkALBV+L4kD6XaapysWw30g7zLAmVDhTeVi5JNTQQ5XrqBjB86Qm0
         p/tW8jS8SLLiLPvRJOzhx+KfuNhJV71FDfQ6dg+ghy8vyve9P0SU+X8/L+lhZAPkYXdi
         siZ6WzU0dyKPL+qNu3Jo+YzO2wZFow4L1O4FTQ1J5GPOR6YT2ULcq7lLLRRbjn9cm2Fa
         yIysZk3cbSc8Wcg0XnAXCnUta2nKFEKTVCzJ6yBvr5ALNg8e0WD8XZhnpr84a+C28bN6
         bboxtUXXuEAzqtrzRX8o/qgP0bc+MJT8uOPFE3q54QPRYAtT6hj4178ecYMDWBlUoP77
         t0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=4Ca0np589nzDFnV1uDNU5F0TUxTHQVPLQxMdWconT6I=;
        b=FyGG2K9YuUhzMr7f+pyRj8Dw90+7shVRl7ciosMAkQgGseo/Fuu2eyoPP1N1ahtFdf
         JGKceut9Wcnu4CE0vdrGx+9WFp5/xbCpIehHS5KPJTVqv5yMzQLMrimk2UcQTp6Agxon
         xGVYTJuyF1kVhK+tBwsLwF7us+iFv77SJmQ4C5B0vgSudIFJ5Fey0pCFPu2W1zIUdvbg
         6zGp6paZslb2Xbo6rUrSVAn56TevNXOK6vwdE6QQEZ4kMZc3BhiFEQN7C+j1dk9g0D/H
         zZwGw5tYSEaMlX9uqB9l9bwmAAA8Of1CBDeKEl33X3h0IobE6Qv1xdJ+puOXcR9KiD+U
         C/JA==
X-Gm-Message-State: ACrzQf1dSnyZcCUfl4vNHwiPu+vrXqg7hOqAxtvHyHFj0tsUCdIokiAX
	nCAWiFwGt+YK8R/1+WBWB+y8DdtdBfks23n/hjs=
X-Google-Smtp-Source: 
 AMsMyM5v2u/eSB0ogUFNdFdqJLWci+8HypDX7wDpt2eDk+SW9+AEPpTOqZt5kUB+D72cU3tUZUrSbhPGO2lzerRLZBk=
X-Received: by 2002:a05:6512:950:b0:497:c41e:3d0c with SMTP id
 u16-20020a056512095000b00497c41e3d0cmr14148924lft.673.1664371495695; Wed, 28
 Sep 2022 06:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220922124708.2218995-1-pkj@axis.com>
 <20220922124708.2218995-2-pkj@axis.com>
 <28947223c26b05f58c4b6cd13919b025617318a2.camel@linuxfoundation.org>
 <ee0aa31d5fa34a5ba889e3518d8b2a95@axis.com>
 <CANNYZj__Gud2xeWrtK=tZaY_BGQ2d4tVVJLfZt4R0aqzUadK-A@mail.gmail.com>
 <c78bac9a0a53243336d237bc5f6d51758f5a5dfe.camel@linuxfoundation.org>
 <6dbf0e264c68433a8aee1a772015c852@axis.com>
 <1718C14CEB633922.9698@lists.openembedded.org>
 <CANNYZj_rRJFsnOcSrkONYfmkZdUe1eCZKYcvnkpPj7jm7eVu+g@mail.gmail.com>
 <faab0d74b95849bdb1d39ac0146dd523@axis.com>
 <CANNYZj_2+-GiZ4Qa67GJ3KFJMqFxLFXW6XKMtL+a9=NrPmi66A@mail.gmail.com>
 <77825785242f4d99b336af0da596e286@axis.com>
 <CANNYZj81uAD1wMJyizCHTiwCnCnw_XMOLqPOzKGu0Og1sejauw@mail.gmail.com>
 <1568abaf9b604bfaae699a53c537d51b@axis.com>
 <CANNYZj_L2+OJE4TYt4A2QVXjsmSOVWKbWD4EPz=AkQj5snxXgA@mail.gmail.com>
 <b1adfa5db65d431a8959e07181bfffa2@axis.com>
 <CANNYZj_m0cD7zb6BZt4MjUimtU7KuEsSn2RWmbTYsL=Msgu2nw@mail.gmail.com>
 <49b80061523b44f0bad86d46dce28915@axis.com>
In-Reply-To: <49b80061523b44f0bad86d46dce28915@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Sep 2022 15:24:42 +0200
Message-ID: 
 <CANNYZj9eeaZbi-Ag-PzOLR0idVsnZUuyQYQi-Zn2_jFwbfOXbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode invalid
 paths for templates
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 13:24:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171150

On Wed, 28 Sept 2022 at 14:45, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Because, while we want the layers fetched to be present in bblayers.conf
> by default, it is still expected that developers during development can
> add and remove layers. And if a developer has, e.g., removed a layer, it
> is not expected that sourcing oe-init-build-env again should restore the
> removed layer.

I wonder if we can somehow make oe-init-build-env indicate (in a way
that is programmatically robust, e.g. perhaps not a marker in stdout)
that it has initialized a new build directory. Ideas?

> Since our wrapper is expected to behave as oe-init-build-env it must
> also calculate the build directory as oe-init-build-env would. And no,
> it is not hard to do, but it means code duplication and that we are
> susceptible to upstream changes. It is not a major problem and it is
> the way I will solve this if I cannot get a change accepted upstream,
> but every such small addition adds to the maintenance burden.

All you need is:
os.path.exists(os.path.abspath(build_dir))
(probably abspath is unneeded either, it's just there to make clear
what the full path is in case it does not exist)
And no, that logic is not going to change upstream - it's far too
basic and pervasive.

Tweaking the list of layers by directly manipulating the config file
content when there are tools that do this for you is, I think, a worse
example of duplication.

Alex

