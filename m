Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E8CC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 10:27:31 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.39579.1669890440796838584
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 02:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RiG0bp4T;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id g12so1805063lfh.3;
        Thu, 01 Dec 2022 02:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QDIyX56CDoaIMQadlr7+igX4zOC/MWmWV1j1CbTPJ9U=;
        b=RiG0bp4TwF+PmqY0xDqy2Ntj+MUWtbiexLud4ws9Ad4kfnJl0dpjuY+ifkVP1FZTqG
         rIdKd9GCtD8exU47GBlfgwYeqOYB90sdQxDGs1grNibYREKQEXEdzZIP6PRHE1mz3EQt
         6+Gp5AvUrEjtungAwFaaCKo9PLIbE7TKAm5b6fxUET4G51DQjdOkkNmZ8gVzBXaBTw3e
         9L9Z31u/lRTA7jXIovW5u/2qCvvBEdZElT1XsAgFPapCjCW6aVjXgKOf4vWQ/UIWZCAB
         IK6O4ZsZ62Km4gVfzs/rvZbUVBfaR6Si28axrn0uMEyHNrixREnzm55Pmmp8hzgd3Q+y
         7Gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDIyX56CDoaIMQadlr7+igX4zOC/MWmWV1j1CbTPJ9U=;
        b=ZN4fCkZfFqJhd7GAvDGaYIXomFcL1WvVn6KAOnm0qRfRYnZlKX/Bi0RSB+xJ7vHxn3
         QqqfVst2GHiJqNhsO8Bu90UH7UCjK2iztxX65xiGTdDVbaflDbclWNTggJYPEzlnZ13h
         GZD0gxtvtd5vfVXpCr+2VCwX8q5x8ZRQz5cz8KIqiUSskHa78gl5qHcz7u20Po2cbYJ9
         vzkqIf38d4VZArY4bo0cr9/g1cAB6j5REVLx8g5deEqNHtrr+1ide8yZFIqDmmZ7S0hU
         5siBTA0t+MdpCJrZOze5KvuM60wDiizhQ86n0TJvbEMLjchUiUvuUxlLTI9zJQe63Ame
         ZUHw==
X-Gm-Message-State: ANoB5plCwCWumiFM9Ph66qoi3sQdHhM9eUK+NMlumkbAKJL4PTrDxGi4
	Y0wsJG6DSkDS3c1P0PSZMAxueDWmQZkEgDT5UOs=
X-Google-Smtp-Source: AA0mqf7qYfx2rT0gh+gchL8Ci9T26JNDl1/NYedCjD7h/FH9y3q95KOM3RM/eINoIl7IZnDMDKdidUFPNz9uuXvREX0=
X-Received: by 2002:a05:6512:25ab:b0:4b4:d443:6550 with SMTP id
 bf43-20020a05651225ab00b004b4d4436550mr18225726lfb.393.1669890438963; Thu, 01
 Dec 2022 02:27:18 -0800 (PST)
MIME-Version: 1.0
References: <0b6801d90409$885d6860$99183920$@gmail.com> <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
 <bda7b996024942763ae9d03ea0b958c3a38b04c8.camel@linuxfoundation.org>
In-Reply-To: <bda7b996024942763ae9d03ea0b958c3a38b04c8.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 1 Dec 2022 11:27:07 +0100
Message-ID: <CANNYZj8dhdVTJVDeq6gxt7y4OUz1yJtrCKQ3TDTKhe9-BqFZWQ@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Y2038 proposal
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 10:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174048

On Wed, 30 Nov 2022 at 14:15, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> * We need to have a 32 bit ptest run on the autobuilder (qemux86 should
> work, not sure we can make qemuarm fast). Whether this is manually
> triggered, not sure. We could have a smaller set of ptests to run for
> it?

I just ran qemux86 full ptest locally. It took 4h:10m (same as
qemuarm64 ptest on an arm worker). The fails were:

{'python3': ['test_deterministic_sets'],
 'valgrind': ['gdbserver_tests/hgtls',
              'gdbserver_tests/mcblocklistsearch',
              'gdbserver_tests/mcbreak',
              'gdbserver_tests/mcclean_after_fork',
              'gdbserver_tests/mchelp',
              'gdbserver_tests/mcinfcallRU',
              'gdbserver_tests/mcinfcallWSRU',
              'gdbserver_tests/mcinvokeRU',
              'gdbserver_tests/mcinvokeWS',
              'gdbserver_tests/mcleak',
              'gdbserver_tests/mcmain_pic',
              'gdbserver_tests/mcsignopass',
              'gdbserver_tests/mcsigpass',
              'gdbserver_tests/mcvabits',
              'gdbserver_tests/mcwatchpoints',
              'gdbserver_tests/mssnapshot',
              'gdbserver_tests/nlcontrolc',
              'gdbserver_tests/nlgone_abrt',
              'gdbserver_tests/nlgone_exit',
              'gdbserver_tests/nlgone_return',
              'gdbserver_tests/nlpasssigalrm',
              'gdbserver_tests/nlsigvgdb',
              'gdbserver_tests/nlvgdbsigqueue',
              'memcheck/tests/linux/memfd_create',
              'memcheck/tests/linux/timerfd-syscall',
              'memcheck/tests/origin5-bz2',
              'massif/tests/mmapunmap']}

So I think we could as well fix these, and add full qemux86 ptest to
a-full? It is not heavy on the builder machine (mostly just runs a
single qemu thread), it's just long.

Alex

