Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41649C41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:15:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.8573.1690467349150038168
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=PvTDmkgA;
 spf=pass (domain: baylibre.com, ip: 209.85.128.53, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso6900085e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690467347; x=1691072147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UWD4f4VthE4LFtPncDSLDwmDStuFasdo4q/Si3JNSlI=;
        b=PvTDmkgABEyI5RgQ0No0UQSZ9la9rJd9DU9wjCgHXpL2SE0Zz5GAv4DclfzfK2E8vO
         LjszVpMsMyWPrp4P8nxAGrILkOky4wtl6DZ3NHb2LGNzzUtm2/NYe+JTXgRV75TTQKmn
         crzGFEMS/hse+0amomC6EajU3h/vOZVXtWZ8UhGxWLPIlMQqjaiGxeCNRUa5sCu6a42G
         3zWcNbVy2CWWmWON+Apbqtv7OpiaESG4mHjgj4ai95BeNlLBBgkgSKwIe+EpwnP5vXMu
         8G0H5qpxDzsHbA6lz0GVFJR6P2hwri9vfE/XxMEC06ndd7LljB7mr6EA53iLkcxLWm5t
         A90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690467347; x=1691072147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWD4f4VthE4LFtPncDSLDwmDStuFasdo4q/Si3JNSlI=;
        b=ia1shZlDYg8CvlXr3P5eVFdAUKkiQvFp10kaMKpEDE5DNjHxOodEzpRDFYWwBk0Hej
         b/Mn1a2Zb8PjWzOZ5rRNnGFZ34JJ+u/UnAPQbst0dumisVotJCklRyMNw692gDUEwr5J
         3tn7KJR8wJocOjQp10mceY3GPSEyX5G0Nut06KBXT0iaWnjU0z+xbZd7yHUFi0ic8SIs
         QeO9qnq46dPYbFkb/wgozu0z+OSdKs3Unlb59LXfXbd4sDp5g378vIfAW5uUKwFKTwGT
         cmwsCzFKe+4gwlE7GFrRzD5+wL35yJEOeIzKE2Y30irOHFdLjFWLX22ujPOxEaSPP/zn
         gJ6g==
X-Gm-Message-State: ABy/qLYMrotsONZbPSX61cnTaRJitumE0v5AouZDUlo/9YE8pWGyx8nv
	P0cAfDaPm/DHfHsJm2iYZPTWRg==
X-Google-Smtp-Source: APBJJlEoQJZjs4kJ8Q6EOrFGk4vryNvU+dW5jGdPemzQwprIEWGHwiSLfNrjceV7mNlse8KnlnUxVQ==
X-Received: by 2002:a05:600c:4f45:b0:3fa:8c8b:716 with SMTP id m5-20020a05600c4f4500b003fa8c8b0716mr2066523wmq.1.1690467347539;
        Thu, 27 Jul 2023 07:15:47 -0700 (PDT)
Received: from localhost ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id p24-20020a05600c205800b003fc01189b0dsm1934409wmg.42.2023.07.27.07.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:15:47 -0700 (PDT)
Date: Thu, 27 Jul 2023 16:15:47 +0200
From: Julien Stephan <jstephan@baylibre.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC v2 0/2] Add bblock helper script
Message-ID: <ythwlmw5z74zvdz5csmmccksb4jmcyjckthqn6qhl2m27tisan@w3ng7x7q2gy6>
References: <20230721142543.246415-1-jstephan@baylibre.com>
 <CANNYZj8tCEDM51XrCgfUfMu0ExJqJEwQ7=vU+4e7vrRqdpsKCg@mail.gmail.com>
 <b7qoln53fio3pwdngj2god5iy7lemvh46pys43lfewimdyfgam@d2vfmfbti4q6>
 <CANNYZj_4GRz3j20Mc5wow2fpgHyhoTRsuwnYyHe6yiwnQM-vvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_4GRz3j20Mc5wow2fpgHyhoTRsuwnYyHe6yiwnQM-vvA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184937

On Mon, Jul 24, 2023 at 10:36:28AM +0200, Alexander Kanavin wrote:
> On Mon, 24 Jul 2023 at 10:25, Julien Stephan <jstephan@baylibre.com> wrote:
> > > Thanks for working on this. Should we think about how this could be tested?
> > Do you mean we should consider addind self test for bblock? or you want
> > to discuss about acceptance criteria for bblock?
>
> Hello,
> I mean mostly about what should be tested. How can we verify that the
> script does what it's supposed to, in an automated way, so it won't
> silently break as new changes to bitbake/oe-core are added? What
> should such a test contain?
> The specific form of tests (whether it's selftest, or maybe a part of
> SDK testing, or something else) is secondary.
>
> Alex

Hi Alex,

I just send the v3 with a lot of improvements!

Here is what I do during my dev:
- lock a recipe's task for a given arch (qemux86-64 vs qemuarm)
- modify the given task
- check that for the selected arch, task is locked (but not for other arch)

Maybe we need to be more formal with that?

I would be happy to provide a test script if needed.

Cheers
Julien

