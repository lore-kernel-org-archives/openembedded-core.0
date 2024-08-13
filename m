Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF9FC52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 16:31:24 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.76887.1723566674727949530
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 09:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lyQ+JTqW;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52fc4388a64so7891747e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 09:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723566673; x=1724171473; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pObQGBp2KeP675hXhJo7gpS9yYS2jg0GdP1uc0fHvnY=;
        b=lyQ+JTqWzKfhL7YsuhkzvEPrxf4KMxw8AjgTVbTSOcr52CzwSrlmBEj1skMaw001pa
         0RcBELHWMth9Zrx791HZ/5MrAk0qoHsJdH38xWdtzmUirPZww88SodVitTyuoH2DKslW
         ND9i76z4jgn1kDA561WSVDypq3uVH2jPJxBQK0S968Ho0wqZIYaQo448rS0m05ulBW5W
         bPyBhK9LQWss91cbFlIfzLo8S1gX+FnhfnQPAnXjaw5PkswPGkkoFJwyLjCQGIMcpjDf
         y+yZZDec1totuzOC6rl8Js+0r7BIeKknevFKD7r+QKuynb5lIhg1s5teINFRbA8HrOJK
         /U9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723566673; x=1724171473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pObQGBp2KeP675hXhJo7gpS9yYS2jg0GdP1uc0fHvnY=;
        b=McGM4GRl9d+CRMT+sCqOKB5EmVDcbE5zZNuyqqkgVGBflvVs63Jz2zY7EoMF/rsPMd
         p///rpDZ0GfOzm8oO1WB0TCQHwZfB5G/kqD7RCNteAPvrrbzKO4xGxxjZea/lXd1qB1n
         8n1cIBWCJdIsJJ8elNoRxiVbtaUdfm4iDFYykDyOtK6tD7O2wrs020tuLATUV/Da9her
         UwHG9Pj/IlB/lFUuS+pt3EAFrdNRS3V6TWNpUUnqwH3+awB0trGxjWEidpF/wgo+sFYq
         il7Ux5OhaccdOEHRQTruNhzZIbc7cuEMR6lOcYLk/+9t3jgDRXmdgqBt435gHAnvibXj
         19bQ==
X-Gm-Message-State: AOJu0YzaoaYrdFfreBSzNP/F7O8h9ILghbRaLGr0ywi4/vYyOtja8m/G
	dwL15iIAna7jjGvEWNNHxY1p1xZU9ck8oKtBZ8uVEHH0PrZ1+HFaWwvZtYaF7vqeLjSH1pStJdd
	QMvNG7UozuONmp9WC5ZgmvtNpOPk=
X-Google-Smtp-Source: AGHT+IFdPjhFgGPBdjLYLIXqw9HoED+y+tQxFkA9dE+xGvybku+EdbMIfANbUaoixk7QCdTQ3+EHbdeX9xbCj0iU2+Q=
X-Received: by 2002:a05:6512:4011:b0:530:dab8:7dd8 with SMTP id
 2adb3069b0e04-5321364973cmr2798233e87.9.1723566672316; Tue, 13 Aug 2024
 09:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240813153039.3395682-1-tgamblin@baylibre.com>
 <CANNYZj9XU05XrGeKhg=yTmyWuvm5GoT8NYVQG6chv6dbsg62Kg@mail.gmail.com> <35f62b85-e227-4be4-86da-0dbced10cf47@baylibre.com>
In-Reply-To: <35f62b85-e227-4be4-86da-0dbced10cf47@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Aug 2024 18:30:59 +0200
Message-ID: <CANNYZj8nSfpDRmQEdtTmAkoWwNtZi30KHonC1+sdgFJY31Ym3g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: skip readline limited history tests
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 16:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203287

Thanks. All of this information should be in the patch, can you add
and resend please?

Alex

On Tue, 13 Aug 2024 at 18:27, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
>
> On 2024-08-13 11:47 a.m., Alexander Kanavin wrote:
> > On Tue, 13 Aug 2024 at 17:30, Trevor Gamblin via
> > lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
> > wrote:
> >> Python 3.12.5 is failing a newer ptest for reading/writing limited
> >> history. Skip it for now until a proper fix (if any) is determined.
> >> +This test was added recently and is failing on the ptest image. Disable
> >> +it until the proper fix is determined.
> > We should not be disabling tests without any investigation at all into
> > why they fail, just so some other functionality (e.g. version updates)
> > can merge into master. I have to say no to this. Please look into it.
> >
> > If it was added recently, what was the commit that added it? Can you
> > add a link to that commit?
>
> It was added in
> https://github.com/python/cpython/commit/263c7e611bb24715e513d457a3477a61fff15162
>
> The GitHub issue is here: https://github.com/python/cpython/issues/121160
>
> >
> > If it fails, what happens exactly? Where is the failure coming from?
> > Does the test expect something on the target image that isn't being
> > provided?
> >
> > etc.
>
> The failure looks like:
>
> FAIL: test_write_read_limited_history (test.test_readline.TestReadline.test_write_read_limited_history)
>
> ======================================================================
> ERROR: test_write_read_limited_history (test.test_readline.TestHistoryManipulation.test_write_read_limited_history)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>    File "/usr/lib/python3.12/test/test_readline.py", line 153, in test_write_read_limited_history
>      readline.read_history_file(TESTFN)
> OSError: [Errno 22] Invalid argument
>
> ======================================================================
> ERROR: test_write_read_limited_history (test.test_readline.TestReadline.test_write_read_limited_history)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>    File "/usr/lib/python3.12/test/test_readline.py", line 362, in test_write_read_limited_history
>      readline.read_history_file(TESTFN)
> OSError: [Errno 22] Invalid argument
>
> ----------------------------------------------------------------------
> Ran 11 tests in 0.266s
>
> FAILED (errors=2, skipped=3)
> test test_readline failed
>
> It's not clear to me what the fix is, seems like maybe an issue with the
> readline available in python3 ptest images. I've looked at TESTFN and
> the HISTORY_FILE environment variable that the test is supposedly using.
> The aforementioned bug report suggests that OSErrors like that show up
> when using the GNU readline-based readline module if a workaround isn't
> also incorporated. It also mentions a new readline backend will be
> available in 3.13 that might help, but that won't be available for a year.
>
> >
> > Alex

