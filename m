Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74781C43217
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 13:07:50 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.23043.1669295266084679971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 05:07:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XfqoU27U;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id a7so1912610ljq.12
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 05:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HJI6wkw2KJWBV/ByQQNhY2QX5AEcZMxkzEh4uhpMSWo=;
        b=XfqoU27UexRGQUbswF+XdyvOF+d1a5ha5efBnrUKza4wSd55oj/qWm0B8Q5pJJ2A+2
         Rew6rBjc1VXRRq2Q1ulm3Lhlo7Ence6pYc22bb3AhMq+hCfhn/UeABvKdykrv24iLFAG
         XGXJwnt7RinECev6vHHlyB0nn+zaBiAj2fkflmQC7t3yt2E/NWRhZlegojiIE7AmnKdm
         LK4QhB+ER8uTLP+udSotMtC9dMDkkrpakC+NVJ8sMLy0RIG3UVNG+XMLXjLJtnshuVYc
         LyiCmfBsmXFr4J77agVhtW4KRWx1qWxquked7tpuFfUMs8Omf5Aws0umXPXYzfWijEpG
         Q/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJI6wkw2KJWBV/ByQQNhY2QX5AEcZMxkzEh4uhpMSWo=;
        b=v+OA1ozmqzhXXzwO5xKIYoSbZdkq8cAZh5vt0wh8ysDroaBr8I6fk5cwLPtg8f0oyu
         gcG3DmeKTokuRkGronx5cOk/8IOP+akCfdyHyJ5XPwIf6dMUqwNCLR00QVlkMKkn4QAC
         ggZaCwsUWSNTOmJimHxXM7Rdikxawvn3GZ/fubwpmZ9xdLuz1vwE9LHvXSBu0ubk7cyd
         cMeNTzLg7hrtCKdAynMaXqKHfX3ZdupdHIm7H3vtpjf+JNeqyZZfvmTFeJjImqcV8LDL
         hJzmGeIHrrUcqshnkuCj/kJFvTnjUjZRjlXkkiv0Dlor8vahDBmpihYVhHWwiM2iQ8dt
         mxnA==
X-Gm-Message-State: ANoB5pnJ/ba77VGICn4cINFMbmTkpeLOSfwU9OfCZRec0VHUA/uoDGGC
	j6zQbK0RTQoyG1KE0dNvsZQf22miJM1P5lYp4Ko=
X-Google-Smtp-Source: AA0mqf7YbRqr1IuKYdv/zqEOyoTQkn6GRSp5K6MXpEk9ECjAYI5LyEv7oDwMqna9EKxFrsIarpL+svAJODYy5jXGApY=
X-Received: by 2002:a2e:9998:0:b0:279:7405:85d5 with SMTP id
 w24-20020a2e9998000000b00279740585d5mr3465228lji.31.1669295264102; Thu, 24
 Nov 2022 05:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20221120133122.2464634-1-alex@linutronix.de> <20221120133122.2464634-5-alex@linutronix.de>
 <fb9b0440c73d2d287b6dce447e652d7b0986c33e.camel@linuxfoundation.org>
 <CANNYZj-HbuCeOiK2yd_01ruShEg17J6yAKH2F4QTEp6hi9O+Pg@mail.gmail.com> <ab2f02ff2654669a3c0b26bf741514698966b292.camel@linuxfoundation.org>
In-Reply-To: <ab2f02ff2654669a3c0b26bf741514698966b292.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Nov 2022 14:07:32 +0100
Message-ID: <CANNYZj8DcqqBFjBeLNsvhS-KbpzM1=hCeR=XL=FNwQV7=bBEUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/17] unfs: update 0.9.22 -> 0.10.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 13:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173747

On Tue, 22 Nov 2022 at 16:09, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> It would help, yes. If you do that it could be good to understand and
> document which areas we do/don't have test coverage of some kind for as
> we could then look at either adding it or dropping that support if it
> isn't used.

I sent a second version where each patch is separately reviewed for
necessity, and also the runqemu use of unfsd is manually tested and
fixed (there's no test or usage of it on the AB).

The scenario with qemu is that when given a tarball or directory with
a rootfs, the content of that is extracted and given to a nfs server.
Then the kernel is instructed to mount / from that nfs share, instead
of reading it from a file. I'm not sure what use case this fulfils
that can't be done with 'standard' .wic or .ext4 rootfs files.

Alex

