Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2DBC4167D
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 09:03:06 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.26701.1698915777245312927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 02:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k4QWlhcl;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-507c5249d55so791961e87.3;
        Thu, 02 Nov 2023 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698915775; x=1699520575; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0FxCP1RcwR52aEBDltZtVhK7DBS46moUSLbrIqxVYOA=;
        b=k4QWlhclmUZ4yRTin6F77f4TsJEE11dKLtQPOoWQpqKyhBzuNT0/u0oYNrqoof4Wkc
         fETH1niFLBnjOBTJdJumS2lDRWSxlKnqaDfravTZcRCMfQb15qTRrPEVDr/xdbQE7yck
         UiQEiTvJwUSEK5HvNKuOrkJFOlbNzXggsLEzDaPbutkWgTFpLP1UkLDY8UkQrcxkMSTf
         wVCPdS8G1NgpibOcWB0MUHFiB6WdS0wsghbpmCzjBbxa8a2RP6HT6LidAmWdaCCPXKgq
         NQhT7wXE6HDeqVQ9yw3PE/qEi4MyZ6JmGQvL/ZAl600rIpZSYxPVlrKIuSUNCUgZDI7A
         CcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698915775; x=1699520575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0FxCP1RcwR52aEBDltZtVhK7DBS46moUSLbrIqxVYOA=;
        b=PqccivYuxpYJZQywpaSudIzJWbwx7gfy7qg2uzf8zj87KPb5eGLEjba32f3M+yCS+G
         oMxHaeAVw2prO25ZjD6dHE3XCqoWxMfvJAEGT52HZWrZm2tX9csiKo6uQxUX/gi0Byyu
         TdyT5Fr7uxJqKGkMGnV3h9TmOUu6NWoop0XDTA3Hjsf5mJbsCZRP+GXDPn5Qpasdi4+d
         mwNLznf4ZURgWy4SKorcWeBamzIOaZGmqRNthsGHMWNI9dAW7w5QXo6i2SLvbebvYHFW
         Zw2zfqnFEyCAffxO+/katGA4a0TTLkx2KS6kssf/ztnmBaMZYwC8o0jyfiKQmEfWC1u6
         esxA==
X-Gm-Message-State: AOJu0YxppdbQA0Q6PU7bsTL4Ds/OD/gGudfJPatZ2WVdzGX88iokxnF1
	7eATLVqCZKPvKE3OfNqNk9rBqemAmHMuNnI+j00=
X-Google-Smtp-Source: AGHT+IGnfyCfy5DTU2SnYnqKbNDPVfxhU/M7T6aj/szkQ7x0f4ecwKWCrLEMfDf6lMQ+Mmdm61mHnKICTxeKbc8nk+Y=
X-Received: by 2002:a05:6512:1156:b0:503:7be:c85d with SMTP id
 m22-20020a056512115600b0050307bec85dmr16997079lfg.35.1698915774812; Thu, 02
 Nov 2023 02:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
 <CANNYZj-JhGnGFRxaF0+Q_5Sqq76kAg1pSBBMka_xefuhMv6-vQ@mail.gmail.com>
 <ea84079102bca429a6ae521d218118952a79f111.camel@linuxfoundation.org>
 <feee5d39bc3e280c76b749f39761936464c4cdff.camel@gmail.com>
 <CANNYZj_4e5XbTgcv_ZdqJArCA+=bTj+kmWYVveHDVXyC3TK+rA@mail.gmail.com> <d53017757cc59380fea417cf36cdeea25b9770d8.camel@gmail.com>
In-Reply-To: <d53017757cc59380fea417cf36cdeea25b9770d8.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 Nov 2023 10:02:42 +0100
Message-ID: <CANNYZj-ouKzyR62ZHqvF5ftVPH2GBiThuuWAJ=RKqW-JfZrLYw@mail.gmail.com>
Subject: Re: [yocto] Core workflow: sstate for all, bblock/bbunlock, tools for
 why is sstate not being reused?
To: adrian.freihofer@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Julien STEPHAN <jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190070

On Thu, 2 Nov 2023 at 09:32, <adrian.freihofer@gmail.com> wrote:

> Sorry for repeating some parts which we already had in other emails.
> But I tried to summarize the lengthy discussion a bit in one place.

So here's what I'd like to try:

- write a new populate_build_replica task that writes a few things
under ${WORKDIR}/replica
-- setup-layers json and script
(another option is to copy the layer trees themselves like esdk does,
which is left for maybe later. Completely offline replication is not
an initial goal, and it's good to get to a minimally viable
implementation asap.)
-- meta-build-config layer with the local.conf/bblayer.conf template.
-- sstate cache needed to fulfil the bitbake target that the task is
for (this would reuse code from esdk that does the same as much as
possible)

All of this is then packaged into a self-extracting shell archive that:
- unpacks itself
- fetches layers using the json/script from the unpacked tree
- sets up a build directory using the template from meta-build-config
in the unpacked tree
- tweaks site.conf to point to the prepackaged sstate

And voila! (in theory) This should be the same build as the one that
was produced elsewhere.

Alex

