Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F76AE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 13:05:59 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.9806.1733835951818325001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 05:05:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nYYFM231;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d8e773ad77so30143856d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 05:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733835951; x=1734440751; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0oIj1xWKPdby0vrQ40WH8zN7utwfWW1alZZrawjvIUo=;
        b=nYYFM2310Da++FAMTFW00TjXrIwpOrHvLxKTJ/VY2tm4fPieWEurqIzoo9qibSVaYl
         Pd03+PJT9UuhjxBMIm6Rxhg6gHSCcB8S+BiP0aTiDY6MZLiAZEZx6usRDeIicHmJgMRp
         o4EVvuFJE+IkHu8l3/0BGH2IJl4sQnyOBrAVa7vh+RM4Wqu0yMwix2W2EM7ChHC2qz6w
         m+i9z4hSP+b/2DmGKkVlmZxQyaPUgmAJ7IDjdFIzTPTI01BPSLIjvLpSCzlOHXeAdOYs
         CxQTnji0/bAnkzNU5IkqKBv8jfhvASeqkEPQ0vWOSc50e/zE+IYPy8mTKLxANunLKCdO
         xzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733835951; x=1734440751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0oIj1xWKPdby0vrQ40WH8zN7utwfWW1alZZrawjvIUo=;
        b=jtT21oSziD2gk9QPmgFATpaebRdV7H9rekglEQuUPWILHVGDDzIFT8ffQeqhC+YiCD
         DqI8a7U+484os8WE/oDaTG6cmXKzQlf2n0JYWLkNfc/U0NrGnFUq76FsAxd0PxcYtAA1
         Q2Z7ZDhtZjNohygSFnR1VK8/2rWr54ENn4X47pdkKN6MB69ATygKC8CAlJRQtcHxeHg4
         uX82AEwaYqmqeMlLVGzHOGOmHMy+okWr/wS9hao/BQM44oXKlUuWXJzLJkhkud+3noUL
         FrgFK3lEXguqjz3vZKXi0BbqP5zAeQr0W4k0Jb1HCRxxIEDQAtD/oi5HYkMg+w2ngzPN
         PSug==
X-Gm-Message-State: AOJu0YyWLTK8NxbA9OB3EW1gCtpCfjnXosWuXVdpSYEYE7QqeVv+YCmp
	Lv/elQDKfnGmotz6DgGrB6YgiOIgx93MLjU4QcqzDN3+GbMudxyvrNjEMEBSiEA0+2cUoi8LzVJ
	P9yJ018BBjn7KjS6Aa4MuH02eS90P/A==
X-Gm-Gg: ASbGncuzuEoRYMe5P+1T0GgLp8/CtSq7S8kp92oFt5atpxTDNbbIwxggVc+4L7TFUHC
	jIckgufmouVB9hMkufnbf+8XI74U+nrt003Mxmwu3tJW+ZGoHevo+mOWqx9rHi4bYq3m4Kg==
X-Google-Smtp-Source: AGHT+IHk3q/BXC5rdZJY0Rkt47wSY0DRL9DL9P+6kfGn9nRqvaFTwq1JYi+dGu9bgn9cbxhZkYoNpEtcKCv0vCa8568=
X-Received: by 2002:a05:6214:410e:b0:6d8:8256:41d7 with SMTP id
 6a1803df08f44-6d91e415cf9mr63060046d6.33.1733835950601; Tue, 10 Dec 2024
 05:05:50 -0800 (PST)
MIME-Version: 1.0
References: <20241118162643.1423409-1-alex.kanavin@gmail.com>
 <20241118162643.1423409-3-alex.kanavin@gmail.com> <c799588bada27abdf2b412115868c5b84c24a0e2.camel@linuxfoundation.org>
In-Reply-To: <c799588bada27abdf2b412115868c5b84c24a0e2.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Dec 2024 14:05:39 +0100
Message-ID: <CANNYZj_ONOGam=9um4qqqAc_D0gQHrQML3a9eXBEgHLCiRtM1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 3/3] bitbake-config-build: add a plugin for
 config fragments
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 13:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208535

On Mon, 9 Dec 2024 at 18:00, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Firstly, I think the "(disabled)" is the wrong way to show that
> information. It would be more compact and perhaps more usable to show
> the elements sorted into two sections along the lines of:
>
> """
> Enabled fragments:
>
> selftest/test-fragment - This is a configuration fragment intended for testing in oe-selftest context
>
> Unused fragments:
>
> selftest/more-fragments-here/test-another-fragment - This is a second configuration fragment intended for testing in oe-selftest context
> """

This is fine, I can fix it.

> Secondly when listing the fragments, the current approach does lend
> itself to cut and past but also doesn't group neatly. For example you
> could do something like:
>
> selftest/
>   test-fragment - This is a configuration fragment intended for testing in oe-selftest context
>   more-fragments-here/test-another-fragment - This is a second configuration fragment intended for testing in oe-selftest context

If we start going down this path, we might as well write an
interactive curses UI, and keep the command line output 'flat' like it
is now. I'm also not sure what is the best approach, we'd need to take
fragments into practical use and accumulate a sizable amount of them
perhaps. Such things can be easily tweaked from experience.

Alex

