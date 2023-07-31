Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2958C001DE
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 11:31:56 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.5308.1690803108471260093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 04:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kgrMGNe+;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b9540031acso66560831fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 04:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690803107; x=1691407907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nz9MhaaE1XcbwkdfWpC+BHjLcnk5W2ck0NCswrfTnX0=;
        b=kgrMGNe+Fj1D7D1EXn30gKIeb7baC+pLzn3fr5Vu91NjT8Hd9jn15A1Ct8g0rb216b
         UhpdYZmknER65YzPLRKBeUSLPpE4UrAExpDqcCQJoI7Im/ZdWF4Brp8neCrBFCcIHeic
         wpBIFLXC4hmQ2t7O1g+ZfoZbyq27Nbjcot9H8P/wg74Khm6NwZuI7thgI+y/HxBuOFfS
         6niWVnhZXVCAesefvSQpyo6zlPUmVnRY56gQ41tyi3Xtte+fnW3FMovPgguZAAsbdC7G
         4iI0r5wKuiHC0I+L3JkuXSq31Ph5K0nvWv8DrM3U+6/TJ7bN0eQ+c3ZobTxbqYAwBDTg
         93KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690803107; x=1691407907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nz9MhaaE1XcbwkdfWpC+BHjLcnk5W2ck0NCswrfTnX0=;
        b=jfPKC1JuseE5eKXnrxzVpGgswbg9YvdJ9rp2Ky9GBZ+9IJamGK6+o7JEnMFHiZpxtE
         /jWSy8/t0ku5aRMHB0HaLmLj+NE2zruZZTXww8Ya7+wVZ3GzGOaH+ugEOiUlySWKya8+
         pF8TfGwC63jgKMskq75GHXU+TN5ssmaJLkaFDPgCw+d6xSw26g852OeOmYPcYg16sKxH
         mqQJfSxXdfsbriBXOznsoMvF1Olyu/PHbWA/hA9QWDXroFsBQHK0HV0jnWLMT+DQBJms
         JZC0eaFfIKgKl0q2iZL9MK2t0Kysxu1LiScyyMYJm+3qxVfQICtNUkBvecI0IYAFI86Y
         vvNA==
X-Gm-Message-State: ABy/qLauqLkUB0cx5vZ359hmnNRGpGjd/M7uwOBwrB7qkDAc5mIbuCeq
	TvEXFybcy8mWCfZjMTPgm1vizEhxiF5qWIt0/BY=
X-Google-Smtp-Source: APBJJlHlFySYG/R794L/EmFt80DB0BmysWwLut3mLtcG2b2PmdZbxYiw5H8jbX1aldQpn6/8yqwm+flKABXemEZA9m0=
X-Received: by 2002:a2e:2e17:0:b0:2b9:6d6e:df5c with SMTP id
 u23-20020a2e2e17000000b002b96d6edf5cmr6190214lju.5.1690803106406; Mon, 31 Jul
 2023 04:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230510095726.4090311-1-alex@linutronix.de> <20230510095726.4090311-2-alex@linutronix.de>
 <ea898c7901735eee11dd07ee5ad3ab976cd44b95.camel@rpsys.net>
In-Reply-To: <ea898c7901735eee11dd07ee5ad3ab976cd44b95.camel@rpsys.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Jul 2023 13:31:35 +0200
Message-ID: <CANNYZj95L_pLLeL_-bUrMLSAVaG0NgSWBSNnpF9KjK5wpXYA-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-build: add a tool for discovering
 config templates and setting up builds
To: Richard Purdie <rpurdie@rpsys.net>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 11:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185137

On Mon, 31 Jul 2023 at 12:56, Richard Purdie <rpurdie@rpsys.net> wrote:

> I've just been looking at this again and I'm still not convinced this
> is right. In particular, the above output worries me a lot, partly as I
> barely understand it and I suspect if I struggle, I won't be the only
> one.
>
> With this kind of core tool, the "interface" to the user needs to be
> really clear and the problem here is that it isn't.
>
> Being more specific, from the above it is listing some commands I could
> run, but the user is being left to work out what the difference is for
> themselves. If I print a list like:
>
> a) poky default
> b) gizmo config
> c) gadget config
>
> then ask the user to select one, it is clear as the user is drawn to
> the key information. In the above text output, you have to know where
> to look in the commands to guess the pieces.
>
> The "/srv/work/alex" string is confusing the output and in many ways
> even filtering that out would help reduce the "superfluous" text but
> the issue does run deeper than that.
>
> As another example, perhaps I shouldn't need the -v to get at least
> some summary of what each one does?

Thanks, I'm glad this wasn't forgotten (or quietly shelved :). I kinda
announced in my EOSS talk that there should be a nicer way for
newcomers to set up builds than oe-init-build-env and that we're
working on it.

For no reason at all I was trying to avoid adding an interactive mode
:), but prompting users to make a selection will make things a lot
smoother. And each configuration should have a stable and sweet
shortcut name (at least, within a specific layer checkout), so that
awkward full paths are completely avoided. Maybe
{template-directory-name}-{layer-name}. I.e. 'default-meta-poky' or
'gizmo-meta-alex'.

Also, content of conf-notes.txt in oe-core/poky should be moved to the
first-time banner in scripts/oe-setup-builddir, and the files should
only point out that "This template sets up a default build
configuration used by Poky reference distribution" or similar.
Otherwise the tool will print what these files have now, which is not
helpful.

Should we be fine with just conf-notes.txt containing the template
description as a freeform plaintext, or is there a use case for more
structured template metadata?

Alex

