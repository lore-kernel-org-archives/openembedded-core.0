Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D67BECAAD3
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 08:57:53 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.5480.1662541069589133591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 01:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n5QlBZEh;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id f11so7356622lfa.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 01:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=2fACob7j4VnIXOglJMTZrSo6DQp8o2KvX8kG4JgjzkQ=;
        b=n5QlBZEhUaUz5MVCeeiHjE6faH8YnBn6kNue5gauPZPYsK55omwi2P+gsIeMwslU6e
         fKomewH7I7keMpp+U5/fGUHQxPlUbLpgZbHydWoF5g8gI2Xlc3SqJt7OO/CRnRiP1KP3
         r5mfHHv+ctP66/qU/oDh8jfd7bL0kMvFrndnK2vaG8iDhq+qavvJDK2Nn4ur8OSLjx30
         aK8b1h+LUBDHq+jZqLiiM/spauyeRGavIDb2CoxMNgQAH+P9Hxu0h2fwbbBqq35Hi4eW
         epFAKKhvhRclgHwsSPpr1kaVxdguvi3zl9dPwyXbuQ84WD6hA1yr6QD6hg1U4VmSHLNA
         0UKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=2fACob7j4VnIXOglJMTZrSo6DQp8o2KvX8kG4JgjzkQ=;
        b=O0qUnC5PtztqZrQT/+WN2cYTS277VHXKUP3bFB8+iVYo1lIiH5ZX5aAyOKGMcyQrO9
         qx7WCm8jfuKW4EQeJQO+q7F+bHQDwNCjUg2BQSr3z3Qxz371OYrogjRBWk9QsMIDX8KX
         YRq67krssPKXB5HNqT+Im55o1JQQe6wgq7aOdJazJ1AhzpUKgVf30pfde+XtB3otCPdl
         GMoEDV/faT62zCO5RKn9Qs5eyWNBx/sb69TTfZ7SeskU9uZi3N/ezxn53VidZgVSwpCf
         F2LLsBoaHrrsIGq0016yuCPq+sJoKR8gx+d5TzLYVJ6bO4aBdRiewK+XmDqgogmHWgL5
         hW1Q==
X-Gm-Message-State: ACgBeo0wDICHEffse6sfjamh5hhVbUHAagcouFfmF4qI5Uxuw+iTBjo7
	Bkqgs1TINi/EPEu4O8hCRv5zCwlrM3kyWvzEdzk=
X-Google-Smtp-Source: 
 AA6agR7VcawcxXlSNq2+W5nJntI7Pax/oVsnxSAM7qZMG16o61aCCdw7YeD9o0zGbI5rXYZv7irR+IBd/ElMhWDMtX0=
X-Received: by 2002:ac2:519c:0:b0:494:9f3e:3c5 with SMTP id
 u28-20020ac2519c000000b004949f3e03c5mr742835lfi.665.1662541067508; Wed, 07
 Sep 2022 01:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220905182141.1091053-1-alex@linutronix.de>
 <87leqwztwp.fsf@jogness.linutronix.de>
 <171241B5563541EC.6347@lists.openembedded.org>
 <CANNYZj_sTxPuZtdVk68A8AGqwnT6=RNXmJ6u1LVuc6BQiHRvkw@mail.gmail.com>
 <6632fb17a872496ea3b7a61a42f2ae06@axis.com>
 <17124592CD5AC7E6.32046@lists.openembedded.org>
In-Reply-To: <17124592CD5AC7E6.32046@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Sep 2022 10:57:35 +0200
Message-ID: 
 <CANNYZj-7S4TRv4oG_-OQs7Ut97p30zoD7q3YMSPDpSGRgjjzeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] oe-setup-build: add a tool for discovering
 config templates and setting up builds
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 John Ogness <john.ogness@linutronix.de>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 08:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170376

Alright, v2 is out. Changes are: switch to subcommands, and use 'build
environment' or 'build directory' in place of ambigous 'build'.

Alex

On Tue, 6 Sept 2022 at 14:35, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Tue, 6 Sept 2022 at 14:25, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
>
> > Given that the tool is called oe-setup-build and not oe-discover-build,
> > making the discovery mode the default is actually a bit weird.
> > Subcommands sounds fine to me though. Maybe you should call it
> > oe-build-env instead, since it has multiple modes?
>
> I'd like to keep it within 'oe-setup-..' family though:
> oe-setup-layers, oe-setup-build, and then later oe-setup as a general
> integrated one-stop thing that ties it all together:
>
> oe-setup kirkstone
> oe-setup master +docker +systemd
> oe-setup yoe riscv64
> oe-setup webos
> oe-setup some-custom.json
>
> Like RP suggested.
>
> I think having discovery functionality in something called 'setup' is
> actually fine, as the setup actually happens from the available
> choices, and one would want to know about them first.
>
> I'll certainly switch to subcommands; this will allow adding config
> fragment management as well.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170351): https://lists.openembedded.org/g/openembedded-core/message/170351
> Mute This Topic: https://lists.openembedded.org/mt/93485066/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

