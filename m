Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B94C001DC
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 12:15:26 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.6075.1690805723715985434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 05:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=W01BZdFZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4fe28f92d8eso2523458e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 05:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690805722; x=1691410522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQ08XGaKKJSTu3m3jatwHCAyatu93sd3rnZOYWEVL3E=;
        b=W01BZdFZesJ6sasLceCsSzk80HMI92x49XNdYdtvYj/pM+L1P8t1kOZ6VEDsWnA493
         QG8mtjdOjjx8x53myTz8TJrYOXgU28ngR3OO0UJ2xKGV+HNM9u6Wy+SSu03qnuc2OAf8
         Q9C2M7TmzyjXpPev6191lt1g8Ra1gFdYdoxlRgY5iE3gxa5XPXQwkQiDzLZ91VgK+/3B
         tGuyHy+cVP+BLJvPIoQt1BmysZ1bbbUOIZW5sd8ZvlKpOk0bUuPRcIyhshkuLug3nh2s
         EEVb3mJsYNiWUE8t+MnIEnRzHdRKeENtJdstscAYA3Op/Pbc6/7LRe6+OD1hgrjwArlx
         WpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805722; x=1691410522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQ08XGaKKJSTu3m3jatwHCAyatu93sd3rnZOYWEVL3E=;
        b=HCmUG2gCODnNrrp+/vgaop5QbcLFbvIKHaY3Za/Pz3HPvMc40l25ioXfK9aqKmzprP
         G4/QA1Yvb0DNABKV7lc/eHkBi4kMLV5QCsTgGW5hUxy2l5sBeaY5ZrGErufYeeXoFJ91
         Q//SAHlDGErC1GJ8UYUp5/nXLGmWCPGaeM2CHQAVfWzIuIanZuO8m2172AwCy6UeYtxS
         3PAOTV4dGkMt4Ggoo+fJE9mNUGcL0eVFTRn/nI8igqItYKFyK8Qb3gRaHeJ70yiu5K6M
         E7kNtB8d4mDOaZ7/Tj9ApZewQRkxearaTw6wHYrR41Amxo9tEaeGcy7hMUN9H5YDm7ee
         B5Hg==
X-Gm-Message-State: ABy/qLahS2odhaXY8SQrTo5Y6+bRxlz/haPiQ9U2MzrHFe2kSq0wAu2V
	peNMSA4N3mdfmv2rtZpcp5QafaWgVazmoBS8YLk=
X-Google-Smtp-Source: APBJJlE7eKd/fGZM5XXIo+y2vDIct5dheA8JG8EPbPwwQLCk7cHBpabG+2gUaCt+VUslZ8EIgfj2VKY/IWoYmCeq7vw=
X-Received: by 2002:a05:6512:3256:b0:4f9:5781:8628 with SMTP id
 c22-20020a056512325600b004f957818628mr4806239lfr.24.1690805721637; Mon, 31
 Jul 2023 05:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230510095726.4090311-1-alex@linutronix.de> <20230510095726.4090311-2-alex@linutronix.de>
 <ea898c7901735eee11dd07ee5ad3ab976cd44b95.camel@rpsys.net>
 <CANNYZj95L_pLLeL_-bUrMLSAVaG0NgSWBSNnpF9KjK5wpXYA-A@mail.gmail.com> <2039c55f7149d1a362e324751626fc2f032cdec2.camel@linuxfoundation.org>
In-Reply-To: <2039c55f7149d1a362e324751626fc2f032cdec2.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Jul 2023 14:15:10 +0200
Message-ID: <CANNYZj9oqW=8zrEsQ5nNPsQo816q3L6gLR=wc82rO1PB18D=Ww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-build: add a tool for discovering
 config templates and setting up builds
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 12:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185140

On Mon, 31 Jul 2023 at 14:04, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> You could think about using the layer name in these contexts as layers
> should be defining them at this point?
>
> Yes, getting the layer name means parsing but we can likely handle that
> at this point as we're in python.

You mean getting BBFILE_COLLECTIONS value out of conf/layer.conf? That
should be fairly easy with standard python, yes.

> > Should we be fine with just conf-notes.txt containing the template
> > description as a freeform plaintext, or is there a use case for more
> > structured template metadata?
>
> Could/should it be a variable in layer.conf?

I'm not quite following - what kind of variable would that be, and
with what kind of value? Each template needs its own set of metadata
(or freeform description in conf-notes.txt as a minimum), so
layer.conf is probably not the place?

Alex

