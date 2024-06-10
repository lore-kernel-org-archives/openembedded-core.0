Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89D8C27C65
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 10:58:30 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.16626.1718017105931156482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 03:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FuiMCPl0;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52c84a21b8cso1028195e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 03:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718017104; x=1718621904; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4cAjxrownUZAzAh13w0f5n51GRDgrcUa1GOteQubUQY=;
        b=FuiMCPl0HyCEAZbbkfgUT5l3cXq63IOj17SqMwddEOzVRAJYQZN90EZpzaFCClr0QC
         9iv1xzZNfvwt8YGvBLRk76jT2XErVn1XJiW052ZCFfQXJ29IxXxMP94RdGRfF06ZXug1
         otg4leWHpVJZPtOZCArrOqGhj3alQQxnn8qOYVsR+ijOKRr0qcX58sblAaO/QQUSwetr
         KcTwdqhe4ypUF1rYcAVCcs2M4g2wKS+6S7g+SHSV4ARlUeLt5/AOYDlk9+MasKR/QLdL
         wgbb3fvXDtcF98la7Wh7eMMWwoccaGw/JP4UTuDHgACLuc9S6fRZ1l2hFflmKD6S66Gu
         CqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718017104; x=1718621904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cAjxrownUZAzAh13w0f5n51GRDgrcUa1GOteQubUQY=;
        b=m6VigMC4BzER7jXYc3UN7fRgVVvc9NLRZRWAxjNCD2AcJUlinJwzBB57w2uWBSYBnw
         LBmRK73WJHZH6TE+afREwLpSa5uff6241/6yawFgyPfHkykzXDj+Gv28c4jia2OHIct1
         KAdyhRnfAu1svXB9ssvqj+kaFOBpKJ4AlyxHYf/z/feEaw0qAR62Z6cELI5MQg1g4SMo
         WdxwgIPzME17m9aUZRIbyAW7crf8/79y/ieTipMsFCJoAdQ3bXTou5+LP82t9M7uz2FZ
         fOzuaIYPbWu/hOvtWq6dYliZFl8+kc8HAIJyoWOElOqDZsTgRkYaTvZNV4Qn17whimOo
         YRDg==
X-Gm-Message-State: AOJu0YwwdwPmAjIg4OPZxwIG2uVaJNyXO9qz66pHTTfQsPHOym2pdHY7
	F00M3ya7vOCCKWe7O/U6D/5wG+Gf8dFiHj+RHN1fl5gG3wpwCZ1sZljsv639hTJODX7cPdL2ifM
	OAMSwksszvXhXFOiJNU3PQQrJKYA=
X-Google-Smtp-Source: AGHT+IHS+7fdMmb/6xswkKnYqpZvy+EimG2fxP00kwdS6YJzxLHzDyvTyzuVG6f3q5l6ZU1wTkZHOWJIXbTs3/hq4rc=
X-Received: by 2002:a19:e008:0:b0:52c:804e:8c0 with SMTP id
 2adb3069b0e04-52c804e0957mr1364086e87.0.1718017103692; Mon, 10 Jun 2024
 03:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240509160843.3283186-1-alex.kanavin@gmail.com> <39d85fcd4e6a1b4bd439fdd7654b64ff69d4e646.camel@linuxfoundation.org>
In-Reply-To: <39d85fcd4e6a1b4bd439fdd7654b64ff69d4e646.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Jun 2024 12:58:11 +0200
Message-ID: <CANNYZj9Y=TjdofvxL32rWqPVZ9xLyryA9ic=FFeq+XveJcx7mg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake-config-build: add a plugin for config fragments
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 10:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200469

On Mon, 10 Jun 2024 at 12:08, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> b) The code adding/removing require lines from local.conf seems a
> little fragile. I did wonder if we wanted a higher level bitbake API to
> this, for example a BB_CONF_FRAGMENTS variable which basically tagges a
> set of config files onto the end of the base configuration parsing?
> This wouldn't be hard to implement in bitbake and would then make the
> tooling easier and less fragile.

I don't quite follow. If BB_CONF_FRAGMENTS value is a space separated
list of fragments, then how would the tooling

- add to it?
- remove from it?

It would still need to look for an assignment to that variable in a
'standard location' (e.g. conf/local.conf), and then rewrite the file
with the new assignment. That doesn't seem any easier to me than just
using 'require path/to/fragment'.

On the other hand, there could be qa checks for presence of a certain
fragment(s) in that variable. E.g. a layer could stop a build if it
detects that something is not there.

Another option is to copy/symlink the fragments into
build/conf/fragments/ and have bitbake pick them up with a glob.

> c) Do we want to have the config fragment name as a
> "<layername>/<fragementname>" pair and have the fragments live directly
> in conf/fragments in a layer?

The idea is to allow deep slash-separated hierarchies here to be used
as categories, and map their names directly to file paths (stripping
the conf/fragments/ prefix and .inc suffix in the tooling UI). Think
of something like
meta-yocto-bsp/conf/fragments/machines/arm/beaglebone.inc that would
be presented as 'machines/arm/beaglebone' in the UI. Conversely, what
layer it's in is not relevant in the tooling UI. If someone wants to
enable systemd, they wouldn't care which layer would give them that.

This would come particularly handy in interactive UIs (e.g. something
curses-driven and mimicking buildroot).

> d) How do you control ordering between the fragments? Do we need
> dependencies? How does layer ordering or dependencies affect anything?
> Can fragments conflict?

I deliberately kept all of this out of scope to avoid going crazy with
thought experiments and resulting over-engineering. I feel we need to
start using the fragments in practice, particularly eat our own dog
food on the autobuilder with them, and then problems and answers to
them will arise from that practice.

> e) You've used comments at the start of the files as
> summary/description. Should we use some kind of more variable like
> syntax which allows for other information in the future?

I'm open to proposals, but this was by far the easiest and most
straightforward and obvious to anyone reading the fragment. Python has
no support for 'metadata in comments' that we can reuse. If there's
need for other metadata about fragments we can invent special syntax
for it, but summary/description pair can stay as #-comments.

Alex

