Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DD7C43334
	for <webhook@archiver.kernel.org>; Sat,  2 Jul 2022 11:13:46 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.48723.1656760419694570386
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jul 2022 04:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b7HXfOxo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id f190so2686041wma.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jul 2022 04:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=fnsXUCAy5w6gQZJVOD/JZ5e6sEoy77tnp+BUFoGR5nc=;
        b=b7HXfOxodynkdPcCdJaVNk/qh/DxlgasCaD+GdzV2ZWYn5oKlgZhD3fuH+KQ0dDpoY
         dnGSlB7qziprdgFrFodUrzdcA1vTuOGwLAsi915iXrKmrVu2YVYqSpym45DQWHFuzibI
         blWziA3xh/04+G3POG0bCwQL6MC92DR+KTORc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=fnsXUCAy5w6gQZJVOD/JZ5e6sEoy77tnp+BUFoGR5nc=;
        b=I8geMfF4+PsPEYUgd9leiw2EJjlVhTdak2sQ4SOVSaTxD1wiJ7YDoC6eK6CwL9W0eH
         SPiJoey34TigHRa5/DUcz/sTeKYMiYZwYKYUPY0IEJ9Ej7t/nkkpAIdHPrOMDafwEA59
         i55NSmu6RY7njpdnEh6LWhWPiqXZxPKdbjdU+CbgovM0UBHKMsgwz5eQxBYMmk3UL91J
         X1iS2n2I1eLuvB8fSFVzpb5rTPNFNYHJJoBCh988kfJLz8upP69laMmPeISi1KYrtfuO
         DluXb2hCgu3lHfYFlDI7qGiNlYmhsiuQhM0BqY+FvL3SGTzEvVex1/6RR1UT+3rCbcA0
         tk+g==
X-Gm-Message-State: AJIora90HyoiLkmLzT0d46XxrjDMcZxb61NbPF8KKOZOahqNO4Sr3oQc
	owBAOaJa+D//wwfFJL/4YjtJdg==
X-Google-Smtp-Source: 
 AGRyM1ulrzM1nwiCSUedQebrfy8j08xKgphpCDVesNcItpGOUBzgXIDiR/qOPp7ivToaCgwF0pbnfA==
X-Received: by 2002:a1c:3b07:0:b0:3a0:333d:ae22 with SMTP id
 i7-20020a1c3b07000000b003a0333dae22mr20853133wma.1.1656760417960;
        Sat, 02 Jul 2022 04:13:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3569:71aa:bd43:a6d5?
 ([2001:8b0:aba:5f3c:3569:71aa:bd43:a6d5])
        by smtp.gmail.com with ESMTPSA id
 m123-20020a1ca381000000b003942a244f47sm10157095wme.32.2022.07.02.04.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 04:13:35 -0700 (PDT)
Message-ID: 
 <329d53233a9966693bc19f821f7f3996a187eced.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Sat, 02 Jul 2022 12:13:33 +0100
In-Reply-To: <20220701192449.1358325-1-alex@linutronix.de>
References: <20220701192449.1358325-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Jul 2022 11:13:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167548

I admit I've been putting off this topic for a long time. I actually
wrote up something about it about 5 years ago. I sent it to four people
to get some opinions. The six opinions I got back made me despair. i
have had a while to think about it though.

The challenge is that everyone has a workflow they like today and they
will tend to dislike anything that looks different. For that reason I
think we need a high level tool which can work with the different
approaches. Once we have that, I suspect we'll see some grow stronger
and some will wither off, which is probably as it should be through
natural evolution. The approach Alex has taken here does head in that
direction but I'm not sure it goes quite far enough to get the fraction
of users we need on board.

I'm not going to comment directly on Alex's proposal at this point, I'd
like to put some ideas out there and see what people think of them. I
think you'll see that I'm in agreement with the idea/direction but I
have a slightly bigger idea of how to do it, which will both be harder
to implement but also have a better chance of getting more people on
board.

So, let me go into a proposal of what I think the tool we need looks
like. I propose we create a new tool, lets call it "oe-setup". It is a
standalone project in it's own git repo and it's first command would be
"init" with a command line looking roughly like:

oe-setup init <project-name>
oe-setup init <project-name> <target-dir>
oe-setup init <project-name> <config-name> <target-dir>
oe-setup init <project-name> <config-url> <target-dir>
oe-setup init <config-url> <target-dir>

The idea being that the repository has some "pre-canned" idea of
certain project names, e.g. poky, yoe and whatever else we decide to
support "out the box" (criteria tbd). Those project names have a
default pre-canned config, or set of configs (e.g. taking branch/series
names) so I'd want to see these all work:

oe-setup init poky .
oe-setup init poky dunfell .
oe-setup init poky ./my-local-config.json .
oe-setup init poky http://someserver/my-remote-config.json .

We'd also allow something not in the default like of project names to
be used directly with a url, or maybe added with an "add-project"
command. This could work against a user local config file, a bit like
git does with global config and adding remotes to a repo.

You'll note I haven't made any mention of the tooling these use. The
reason is that we don't actually care. I'd propose we teach the tool
about a few common standards (kas, submodules, repo) in the form of
plugins and then hand off to those tools to do the setup. I'd also
propose we develop a "native" form where they perhaps aren't needed.
the nice thing is we can have several "native" forms if needed so if
one approach isn't working or we need to change it, we can.

We may also want to consider an optional "sub-config" parameter which
gets passed along to the underlying tool.

One of my conclusions after thinking about this for a long time is we
have a bootstrap problem. If everyone used git and git worked
everywhere, things would be easier. They don't and it doesn't. My
evidence? The bitbake fetcher. Much of the ugliness the bitbake fetcher
deals with applies to layers as well. Some people need proxy support,
some need mirror tarballs, some need floating revisions, some need
complete lock down and so on.

We could simplify the problem and just say those users "can manage". If
we do that, we're giving up at the first hurdle on the idea what we can
have a (mostly) universal tool. I'm not sure I'm quite ready to do
that.

Like most more seasoned developers, I dislike code duplication. We do
have the fetcher code, which knows something about these issues and it
even has a test suite with decent coverage. Most users already know how
to configure it too.

Whilst I don't like it particularly, I'd propose we include a chunk of
bitbake inside oe-setup (maybe just lib/bb?). How needs discussion. I
nearly wrote combo-layer here but people might think I'm serious :).
More seriously, git subtree might be a potential option. We could then
have bitbake master, or a chunk of it, available to the tool. This
would then allow us to potentially get out of a variety of different
firewall/mirror situations, if the appropriate backends were right.
This gives us the option for fix bugs in the fetcher and update oe-
setup and still use specific versions of bitbake for the different
releases as needed.

I'd propose oe-setup be a different kind of project to bitbake,
hopefully something we could make available via pip for example, again
to try and help the bootstrap issue for people behind firewalls etc.
although I would want it usable standalone too. It would be designed to
be a separate standalone tool installed somewhere once by a user rather
than associated with a particular build/metadata set like bitbake is.

Beyond init, the question is probably updating. There are probably two
options, one is an update command to oe-setup and the other is
deferring to the underlying tool and it should be possible to use
either depending on the underlying tool and the circumstances.

As for configuration of the build, I've wondered if we add a new level
of config file, basically dedicating a config file "slot" to the setup
tooling where config from the setup tool would land (i.e. like
auto.conf but dedicated to this). I need to think about this piece a
bit more.

The other side of this would be the generation of the config(s). I'm
less worried about this piece, it would be done by the people who can
deal with more complexity and I'm sure we could figure it out. I used
"json" in the config urls above but I'm aware that yaml is going to be
a discussion there too. From the oe-setup perspective, it may support
multiple options since once it knows the tool to pass it off to, it
doesn't really need to know more.

I'm sure there is more I could write on this topic but I'll stop there
and see what people think.

Cheers,

Richard

