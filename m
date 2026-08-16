Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F9CC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 10:59:15 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8060.1786877954584601722
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 03:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=o2diYTq/;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Z9Ls9tHs;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id B43871D0009D;
	Sun, 16 Aug 2026 06:59:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sun, 16 Aug 2026 06:59:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786877953;
	 x=1786964353; bh=P+2tx04+zLn+eAuMZMkXRKGJWpZBByo7Lk8UjWozrWU=; b=
	o2diYTq/9ImShrEUi5sTieSVqcwg4H8QzvamYdkXvtqOZZtRv5IJMc7pZa9rIjBl
	2QoLzhY/dXcXogmvRWxZqZ/wVFN1bh8zSVsSxMoEVeiZ8ZmtQ+7YSWNSg40W/iXZ
	7SuVOI+bHIRHixkzpgwkJCm1nlkGvaxr63m8N4+Cw0wLtN1nCYRRLJhy1MCXde3T
	D8TjRuIxHLQe5jZoNY3zG6Mq4i2tjkvbdXRaJviqMKsNLRjoBXK7YvNqHRvrDMdk
	jVetzwioYTFHFWiJMscHgH/zLpeKnXdQXq5Q+7eDUjUxY0o4oq9n4h34bmQdCRlj
	qChbPQkDpNA0F6+bvueTPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786877953; x=
	1786964353; bh=P+2tx04+zLn+eAuMZMkXRKGJWpZBByo7Lk8UjWozrWU=; b=Z
	9Ls9tHsJE7cpLRCr7pYf6DrUFLpmd8TfCtxsgWljT84C4MO0dpHK4ZMuuwqBySqn
	0eubWjx35EOnK9eCRfF7hF2Qfc8cEtx61sD6hy1fCoYzr6uMYV1aCrdXqVW4YFqZ
	I2niZNcq1gXn2Yoo8junckeEUKrb9nDDKofs/IfDILSq8ol3IccVuqDjfxwtA1la
	ENQ5jXmR00CVj8qSPEBt6yPxdjvXegVdC3hCDMZfoVHf3ir8mu4XXFiP3RUSqX6a
	I79+ZOse6Pb0PFyCnknpx6zphLvzLv8D6WlRpaEfTNQo4dThkjv0xOvCeLnWt0SG
	lCsBqBxWTUCqEQikSY+xA==
X-ME-Sender: <xms:AZiBauC6NADcuPlCGNxB_46TkFZjWGQY-P4AHZ8qtYEI1LX-9nMRMA>
    <xme:AZiBava3BRhHEZ-JNEZzVZtE4Q1tRSALyxkGST-wltQmShyEKhL_4jrBX3k9MwvuS
    V_trtJt3IQcp-YtCseCbu2uRnGJBjx_n2BXUNvMWnr9hJ5cvrPoeqs>
X-ME-Received: <xmr:AZiBap7qkOuDEx3ytaI6YH2-hbDk2cISBAEkLxqxsFItjdSxFg7sV8zg8ilTXyX04tIMgLTmYW73acNvAjKfXec5xV8HA-qLFZz0JoxnFXbJ>
X-ME-Proxy-Cause: dmFkZTGbOEqIZYhHeLz+bpReTkChjYptpXJ3ywbSTY4vUAkbsY52boTtDbQyiReBPXsHqM
    T0/oN/a8YKtsXKFgreWkkS9rtBJF2fRkN1BZ6LkBblYUGybC0Ky8BYquyRGwfzSCAIXt7L
    e6QD52HnY+dVow2ZglF1yRwcVl7BSde/JZ1JqcxGYo6pRyPL8z1Z/0W97PisDnvKzaWKfd
    SVXSzYtbX03KgnYp5O9UFzIDIA1eqkCzE/3k92Sz+ygRTKmrwMkMxjuwyOwQ6O/UGMU4HV
    GNBLl6eFCvyDx9YovoEDLRkvy1pTQhe0O7iZ3erSsAj5kSjH2qDdOAapC+H2wpZmvbCQRV
    3n4qAKyr627GNA4CyTRFspIPxLqrEboxRAesjoqjcKqANzLdOsDfyAQ8hEeU8UtRC9L7kD
    SrGgmT5RxNpGCPt80rsTEyrqp4Z7UPHspb/NB2z9pFbmnLU03u+6pU91rZDow/pVZK9jbi
    1E1tkVq5I54LziKv3f6GI0iKgO2gX3qt05t04HNwv3erkB7tOJZdgm/I9OMaK8QVdwuymc
    /h86bC7j0AVefvU6AR5rwLzZztYXWWejqtjziOcBm2oabzCcsUuJP6oKHo/HBQMAUst2+f
    ITyPNpLyWxLeCEZX1XTcPtIO3YZFbFRyh7DMfDddRw/4PSVxn1SHf3PEz3/Q
X-ME-Proxy: <xmx:AZiBaoYDx1Il5Pml22aadKnc0CB1iwy9EI04h-R1z0B0ajpazJIjCA>
    <xmx:AZiBagihhLQOV3ZFPgGGtNJPiyNc99YMFAyeaWMlFs43LMkyAicLKQ>
    <xmx:AZiBah8agmxvBUcC6SlTeFiGGYiXzMNcSCa6Mg4vSFJm2N0-OLvCzA>
    <xmx:AZiBajpBqmPce09I8PcJQX3kGyarFEmcZaw8f_Rp8-WUpeRnJywo4A>
    <xmx:AZiBav-Ir8Drm_g9aCTqyjs1q6aq5--7pVqCSgOj1ZAYvEmJkq3a_js1>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 06:59:12 -0400 (EDT)
Message-ID: <43b1bcd191c3153ebfa58ad6e85c0eb1764a10b7.camel@pbarker.dev>
Subject: Re: [PATCH v4 2/5] devtool: Register nested git repos before the
 initial commit
From: Paul Barker <paul@pbarker.dev>
To: Jamin Lin <jamin_lin@aspeedtech.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	 <alex.kanavin@gmail.com>, "mathieu.dubois-briand@bootlin.com"
	 <mathieu.dubois-briand@bootlin.com>
Cc: Troy Lee <troy_lee@aspeedtech.com>
Date: Sun, 16 Aug 2026 11:59:11 +0100
In-Reply-To: <20260731092634.1127862-3-jamin_lin@aspeedtech.com>
References: <20260731092634.1127862-1-jamin_lin@aspeedtech.com>
	 <20260731092634.1127862-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 10:59:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243513

On Fri, 2026-07-31 at 09:26 +0000, Jamin Lin wrote:
> setup_git_repo() is meant to convert a git repo that a recipe unpacks
> inside S (e.g. via multiple git SRC_URI entries with different
> destsuffix values) into a regular git submodule, so devtool can later
> tag branches on it and extract patches from it via finish/update.
>=20
> That detection never actually triggered, because of the order the
> function ran things in when it had to create the workspace repo itself:
>=20
>   1. 'git init'
>   2. 'git add -A .' + initial commit  <- commits the nested repo as a
>                                          bare, unregistered gitlink
>   3. checkout devbranch, tag basetag
>   4. scan 'git status --porcelain' for still-untracked directories
>      ("?? <dir>/") and convert any that are git repos into submodules
>=20
> By the time step 4 ran, the nested repo had already been swept up by
> step 2's 'git add -A .': git treats a directory containing its own .git
> as an embedded repo and stages it as a gitlink pointing at its current
> HEAD, without registering it as a submodule. Once that gitlink is
> committed, 'git status --porcelain' reports it as e.g. " M <dir>"
> (already tracked) rather than "?? <dir>/" (untracked), so step 4's
> "line.endswith('/')" check could never match it and the conversion to a
> real submodule silently never happened.
>=20
> There is also a second entry path with the same root cause: when the
> recipe's top-level source is itself fetched via git://, repodir is
> already a git repo, so the 'if not .git' block above (init + initial
> commit) is skipped entirely - and so was the detection that lived inside
> it. In that case the nested repo instead gets committed as a bare
> gitlink later, by patch_task_postfunc's 'git add' after do_patch.
>=20
> Fix this by extracting the detection into a helper and calling it before
> anything can commit the nested repo as a bare gitlink, in both cases:
>   - freshly-created workspace repo: right after 'git init', before
>     'git add -A .' and the initial commit;
>   - repodir already a git repo: at function entry, before the later
>     'git add' in patch_task_postfunc.
> At those points the nested repo is still untracked and reported with a
> trailing "/", so it is correctly picked up and registered via
> 'git submodule add'.
>=20
> Nested repos are discovered top-down (so a repo that manages its own
> submodules via .gitmodules can be skipped rather than descended into),
> but registered bottom-up (deepest first): a parent's commit recording
> its child's HEAD must happen after that child is fully finalized,
> otherwise registering a still-deeper repo afterwards moves the child's
> HEAD forward again and leaves the parent pointing at a stale revision.
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

This commit is doing three things:
- Refactoring existing code into register_nested_git_submodules()
- Modifying the refactored code
- Moving the call site earlier

It's very hard to review this commit and be confident that it is
correct. This should be split into a two or three logical steps with
simpler commit messages.

The wall-of-text commit message and comment suggests to me this may be
generated with AI. Have you read the contributor guide [1]?

[1]: https://docs.yoctoproject.org/contributor-guide/submit-changes.html#ac=
ceptance-of-ai-generated-code

Best regards,

--=20
Paul Barker


