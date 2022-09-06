Return-Path: <john.ogness@linutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00ECECAAA1
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 10:20:14 +0000 (UTC)
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by mx.groups.io with SMTP id smtpd.web10.2275.1662459609665118101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 03:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linutronix.de header.s=2020 header.b=mMKplRww;
 spf=pass (domain: linutronix.de, ip: 193.142.43.55,
 mailfrom: john.ogness@linutronix.de)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1662459607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1m+9zaNlVbd5mX0n+IthMAK5RA3JvWbbnJMSj0zNCRU=;
	b=mMKplRwwmejLe1tV8dPmgGhuqfx2pLx+ZzE3byFTd7O6JiHkDV4kaw2xViU+xQBtK8XAsE
	1Rqh8ShqsHVrFYzzOuWNcdYHk8jBuIVUzlX6bRQmwfXELWzJY1xXD3vgiQ6vbiYSOiuPtA
	YM60AulwlTZdHOkJNwBQEkC8bpREuH7AebsqeGIZ8nD9SU8FdIx+5C+BebcOwgMY/rmxod
	RmwvzKB2Hak7HaOPOh5UDlo73x8dWnIdu1RVhPOneKm5d+1b/fNaGJlLoIK1FAJXedqIVd
	4j9s9uJEVKtDeTiHEicWihBRs3eiwOAVismFqwOj2dAd6WQpDFBPggFFo1PZvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1662459607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1m+9zaNlVbd5mX0n+IthMAK5RA3JvWbbnJMSj0zNCRU=;
	b=BVaf75aGj9dcZrJ+3eLjGXxaOsEdIUsvOs2mHQ6gITQgzYBJJI35pSRAhx0IgZg8exvrdV
	R6YFNtIdcI8P8xAQ==
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: Re: [PATCH 1/2] oe-setup-build: add a tool for discovering config
 templates and setting up builds
In-Reply-To: <20220905182141.1091053-1-alex@linutronix.de>
References: <20220905182141.1091053-1-alex@linutronix.de>
Date: Tue, 06 Sep 2022 12:26:06 +0206
Message-ID: <87leqwztwp.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 10:20:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170341

Hi Alex,

Thanks for your work on this! I have a few comments about it.

On 2022-09-05, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> This is the last (I believe) piece of the puzzle in setting up builds from nothing
> without having to write custom scripts or use external tools.

People can already setup the build-env without writing custom scripts or
using external tools. AFAICT, instead of users doing:

$ TEMPLATECONF=/some/template/dir . /path/to/oe-init-build-env /my/build/dir

you want them to do:

$ /path/to/oe-setup-build -c /some/template/dir -b /my/build/dir

As a yocto user, I am fine with how things have been. But I understand
that for new users, settings env-vars and sourcing files is unusual
(using the sdk relies on nearly the same procedure).

So if your motivation is to change from setting TEMPLATECONF and
sourcing oe-init-build-env to using an intuitive tool, then that should
be clearly stated in the commit message. It is not correct to say that
it cannot be setup without this tool because we've been doing it for
many years now. :-)

> After layers have been fetched and placed into their respective locations, one would
> surely want to proceed to the actual build, and here's how:
>
> 1. Without arguments, the tool simply walks the ../.. of its location (which is the parent dir
> of poky/oe-core), and prints what templates has found. If the following is not enough information,
> adding '-v' will also print conf-notes.txt for each of the templates:

For me this is not an intuitive interface. Below is a list of changes
that I would suggest:

1. The tool should be called "oe-setup-build-env". This matches the
source file "oe-init-build-env" and makes it clear that only a build
environment is setup and nothing will be "built".

2. The "-c" argument is required (also in your code), so not specifying
it should be an error. Upon printing the error message, the tool could
provide the help. Something like:

$ oe-setup-build-env
error: no template path specified with `-c'

usage: oe-setup-build-env -c template_path [-h] [--topdir TOPDIR] [-v] [-b build_path] [--no-shell]

A script that discovers available build configuration templates and sets up a build environment based on one of them

optional arguments:
  -h, --help        show this help message and exit
  --topdir TOPDIR   Where to look for available build configuration templates (default is ../..).
  -v                Print a description for each available build configuration template.
  -c template_path  Use build configuration template in template_path to set up a build (run this script without arguments or with -v to see what is available)
  -b build_path     Set up a build in build_path (run this script without arguments or with -v to see where it would be by default)
  --no-shell        Create a build but do not start a shell session with it.

(Or maybe template_path could be a positional argument instead of
specified with -c? Not sure.)

3. In the help output I think it is important to always talk about
build environments instead of builds. For example:

    Use build configuration template in template_path to set up a build environment

    Set up a build environment in build_path

    Create a build environment but do not start a shell session within it

4. Listing available templates is a nice feature, but this alternate
mode of operation should have its own argument. Something like

  -l                List available build configuration templates.

5. Your comments hint that this tool might be a second step for users of
the new "oe-setup-layers" tool. That tool uses a configuration file that
has an explicit list of layers that are used. But this tool recursively
searches for templates in _any_ layer under topdir. If this tool is
indeed meant as a second step to "oe-setup-layers" then perhaps it
should also support using the configuration file so that it knows which
layers it is allowed to list (or maybe even use).

  --jsondata        File containing the layer data in json format

With the json data available, the tool could also report if the layers
are dirty or are using a different commit, before setting up the build
environment.

John Ogness

