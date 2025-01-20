Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A370C02185
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 21:32:48 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.1873.1737408766122789896
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 13:32:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Nzdck270;
 spf=pass (domain: konsulko.com, ip: 209.85.222.176, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6e4d38185so485276785a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 13:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737408765; x=1738013565; darn=lists.openembedded.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IzPnZtQDa48WfRWx+XHKS+CzTljna49YfjNhBYidFLE=;
        b=Nzdck270QGn8pETjPNcfmjoVNcFnvCj25DyOJ9EPf1gbq16IsZO8W1gttlOZAHjsZn
         qwMERmMj8+9vshD79mLQAloNp6SRvUTZk5HO+o0nCVSfSQ3hJkCcNPPD1+y34nr45/LC
         EuTrS9HHfIpgy9RdL54oj7v5lTnL2LMVZWjAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737408765; x=1738013565;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IzPnZtQDa48WfRWx+XHKS+CzTljna49YfjNhBYidFLE=;
        b=SlbMlcetezz998EyqnX58axtVRgfxwcnFzljX9OTXkt7rdadg++5q7lZUmKYw80D4d
         tpJHzOnbetp51te/mrXVL4WdIXG+EG3g8Qp88koR2Gktuyw+tJLci3s4RBrO+xSGb1XT
         s9/PKzWtKom8koNH/WK2fGafOWZutEDs10h3qxXyo+PNNtLJ8qY6mfKZ42apOJyI+YWd
         S80dqRYvvziRzFT4UlmrSOJGTH9N16PWtu2CMVwRgEl/HkNZeRQwQPitzJ+tQKVozEGu
         yNVV/bw19nPz3H9J0wBAfNZoPrk4oCJ3+oXrVIihzdstoNC8wYgLI9hHQcPPnPYfbHD7
         vnlg==
X-Forwarded-Encrypted: i=1; AJvYcCXvZbso+j5euipmP+1S8u0wb8cFVnte6LAQfzxgI9LeOwhNrx7rf+7KN4C5yPJ5JzXUq5B2g6uAHT+ELgxKvoWWpA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyYWUUo0ILGpsB3lc8AMPP8loKqzSeQ/yVo+eKDIu8k9CbKLjwj
	QBmO85HctD2KvJAFfFlGpRnzO7YTXjCC0oYbe15VL/fmnn2q1gkRQ044q+qmuGnkl1yvlpgsACh
	J
X-Gm-Gg: ASbGncunDAYVDqgocE6hG1xtJKJjXhqnqVwNw41EMbHk/vnijI/BWGnRMCqte/JJIKM
	eV8aogJjDwGzrGw7zBXN5iau3KPoNohObc6dMfCifo9UjwbEu7GtfI6KwTS7SwiaBH6BYcSpTTF
	5dinxcmrvzENWYJQNgCHMbS3PGvgHV7INHueFw/8C/vw/mFc8/KfCYDeXS4b2kGetYN6O9cDrdg
	Wu8hRrASSsMtgkUMDHrfmQIriwka9lCSiLkcWPU+h/cucZCcdwJmoYPMnZ5Irqjjz+/cUh8kCVP
	ENp6wAX2I4ZZm9z10Xlbmx3ELFGo
X-Google-Smtp-Source: AGHT+IG9lNl1cKbpoqNpgN49pjViVFoUteH88kBg5PBaH/XkxB6JzPcn5Jx7rCuAZgbABeqXUk8+kw==
X-Received: by 2002:a05:620a:43a6:b0:7b6:d939:f958 with SMTP id af79cd13be357-7be63247d43mr2738127585a.25.1737408765082;
        Mon, 20 Jan 2025 13:32:45 -0800 (PST)
Received: from godzilla (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614ef1b2sm482146385a.106.2025.01.20.13.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 13:32:44 -0800 (PST)
Date: Mon, 20 Jan 2025 16:32:43 -0500 (EST)
From: Scott Murray <scott.murray@konsulko.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
cc: yocto-patches@lists.yoctoproject.org, 
    openembedded-core@lists.openembedded.org
Subject: Re: [meta-lts-mixins][scarthgap/rust][PATCH] classes: rename to
 classes-recipes/
In-Reply-To: <lybjw1ffw0.fsf@ensc-pc.intern.sigma-chemnitz.de>
Message-ID: <a5630788-8f4a-faa2-7d6b-8dc87dd1642c@konsulko.com>
References: <20250120165117.737681-1-enrico.scholz@sigma-chemnitz.de> <1f6cdeb4-c868-e32c-4372-123371eb4b12@konsulko.com> <lybjw1ffw0.fsf@ensc-pc.intern.sigma-chemnitz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 21:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210064

On Mon, 20 Jan 2025, Enrico Scholz wrote:

> Scott Murray <scott.murray@konsulko.com> writes:
>
> >> bitbake looks first in 'classes-recipes/' and then in 'classes/'.
> >> Hence, content had no effect and was just ignored.
> >>
> >> Rename folder so that it overrides the OE-core classes.
> >>
> >> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> > [snip]
> >
> > I'm pretty sure this is incorrect.
>
> Logic is in [1]
>
> --> first iterate (using $BBPATH) in 'recipes-%', then in 'recipes'

Hmm, the code I looked at was in lib/bblayers/query.py, and its logic is
different AFAICT.  Can you confirm that "bitbake-layers show-overlayed"
shows it as being overlayed for you as it does for me?  That it does
would seem to indicate a bblayers bug, and there is perhaps some missing
documentation of this behavior (change) (e.g. I don't see any mention of
classes-global vs classes-recipe vs classes and how their prioritization
works wrt layers in the docs).  I'm CC'ing oe-core just in case I'm
really missing something here...

> For now, it does not matter because classes in OE core and meta-lts-mixins
> are very similar.  But 1.81 seems to introduce other data layouts so correct
> classes are probably important.
>
> I stumpled across it while fixing cargo-native build errors [2]

Okay, I'll queue it up once I have some cycles to do some test builds
here.

> Enrico
>
> Footnotes:
> [1]  https://github.com/openembedded/bitbake/blob/0329a7e3ac694737f2d2c1861f65492551360663/lib/bb/parse/parse_py/BBHandler.py#L53-L68
>
> [2]  https://lists.openembedded.org/g/openembedded-core/message/210043
>
>

Scott


