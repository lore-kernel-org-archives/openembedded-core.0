Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD45C25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 09:09:46 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.78812.1717405783790099945
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 02:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fF58nzgk;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaac465915so8783231fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 02:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717405782; x=1718010582; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yEbqLcfZylBlDtgaovMvRAXeF2oMCepmQtdHkpmXe+A=;
        b=fF58nzgkTrYK5ZtcF51qbZbCrEIl9uxPcPXni89CdrBdlPZuAVfTBeXMK/ayJKl+/l
         l/X5tFzwlqmgn7F9iZZFmjxKJYSwj0JgKX+iROIuCo6NgyNWUG2PKyNdSnuPGIcrlwGu
         H/SQgDq1oms3StmMW1ig4Gt9ecE1kVyjavH9iQeVswMoWF1UnbMVgF3jW8H2zcsR8UN3
         5YmA3Iz+BZErBsEV6aSMS804OL+43IErXxmoQFUjDH9TaVHiuJdD23UBxmgL+NXZvxFM
         XM/pYEE35vX9f98WB2Ei7KAoS8i/aGWvm+Ljjt8MqXJmbYEkO/qImsDe5HGFZU4VMdKL
         D2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717405782; x=1718010582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEbqLcfZylBlDtgaovMvRAXeF2oMCepmQtdHkpmXe+A=;
        b=UOxgeKIu8ZMF95YhFjVSgy/qPPCB9mO3s2ptyb+SwZNbix/zi91C1NnMOlJeF3BKVc
         LL/RkJnxX0IU+SD2F4fokNmpGu88uyfW7rLnZ3maVwD2xiZXyGJOfjw6gL9chCMkZgLt
         HHsHey1vcKkWvI+rsNNbXxrApgCPyMbv7II2/bKp25FJz+9UeOeSCBOYuVQvOjZjx8pg
         NuisVUhyZNFvvbSzNQsKVEaIpvRpbgqYFUJaULZFTNbWZub40GavTj1moaCUQWJkfrG1
         3eN80raYxIt3hxov/zlbmgqm9/HlCUUyYkohEnNv16icCnGLPB5dcVZrx/nGahqkLpaK
         WdsQ==
X-Gm-Message-State: AOJu0YwCY3X/xTmQW9/9cAZBgcJYK7C9AH9F67AVYrliOVZTM4VNUSXE
	nhzNt8ZpnFe7f8S/0g9KtWCJSZx6ssOpsUKOD5RQPss+Klphub29f8/J4z+0BQqixwjh5l7aVKi
	iCg1uKqx9RE4/qShjqty9pwYXXzo=
X-Google-Smtp-Source: AGHT+IEk7aIId3c3hX5cc2pNJtFuyZgfAx4/vRwZBjrUOsy/qzH5hFwkiiF0hDUMsT2RFFsP6Qe7IJ7QRpEU2/q9qhI=
X-Received: by 2002:a2e:8658:0:b0:2e9:4b33:dcff with SMTP id
 38308e7fff4ca-2ea951629a7mr62408381fa.29.1717405781577; Mon, 03 Jun 2024
 02:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1717361301.git.tim.orling@konsulko.com>
In-Reply-To: <cover.1717361301.git.tim.orling@konsulko.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Jun 2024 11:09:33 +0200
Message-ID: <CANNYZj-VbOsKOrbanT36Tfb3CsnVDtE8uRmbUssmuoFb162VeA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/3] Implement RECIPE_UPDATE_EXTRA_TASKS
To: tim.orling@konsulko.com
Cc: openembedded-core@lists.openembedded.org, bluelightning@bluelightning.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 09:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200239

Thanks, I like the idea. There are a number of other recipes that for
various reasons need 'special handling' in version updates that
devtool doesn't know how to perform, and this could be used to define
that handling where it belongs, which is in the recipe itself.

E.g. updating cmake could also rename cmake-native_*.bb to match.

Alex

On Sun, 2 Jun 2024 at 23:01, Tim Orling via lists.openembedded.org
<tim.orling=konsulko.com@lists.openembedded.org> wrote:
>
> From: Tim Orling <tim.orling@konsulko.com>
>
> Whenever a recipe which inherits cargo-update-recipe-crates is upgraded with
> devtool (such as with the Auto Upgrade Helper) we frequently see failures.
> If the upstream Cargo.toml or Cargo.lock has been changed, the corresponding
> <recipe_name>-crates.inc needs to be updated. This is done by running the
> "bitbake -c update_crates <recipe_name>" task, but this has until now been
> a manual operation.
>
> Add a new variable RECIPE_UPDATE_EXTRA_TASKS which is a string delimited
> list of tasks to be run during the upgrade() method of
> meta/lib/devtool/upgrade.py.
>
> To solve the problem described above, the solution is for all recipes which
> inherit cargo-update-recipe-crates to add the "do_update_crates" task to
> the RECIPE_UPDATE_EXTRA_TASKS variable. Add this to the bbclass.
>
> Add test case based on the guessing-game source we currently use for the
> maturin runtime test cases, based on https://www.maturin.rs/tutorial.
> This oe-selftest case checks for both the change in the recipe file and
> the recipe -crates.inc file.
>
> This will rely on a new "guessing-game" git repository to be added to
> git.yoctoproject.org/guessing-game (currently hosted on GitHub for the
> purposes of this RFC).
>
> Currently, update_crates is the only task known to the author to fall into
> this RECIPE_UPDATE_EXTRA_TASKS use case. If anyone can think of other use
> cases that can also be added (and tested!), please let me know.
>
> Two obvious use cases that would be nice to add with changes in oe-core are:
> (1) some kind of "go-mod://" update class to use a similar <recipe>-go-mods.inc
> (2) some kind of rework of the "npm://" fetcher to use <recipe>-npm-mods.inc
> But both of those are out of scope for this proposal.
>
> The _run_recipe_update_extra_tasks() method added to lib/devtool/upgrade.py
> is functional, but could probably use some more guards and checks. Ideas for
> improvements are welcome, hence the RFC.
>
> An attempt at documenting the new variable has been added to ref-manual,
> but if anyone has some ideas for better clarification, input is welcome.
>
> The following changes since commit af6d28d2b0abdfcfa70edcc95abd99a3c1a64ac8:
>
>   sanity: Check if tar is gnutar (2024-05-31 16:58:36 +0100)
>
> are available in the Git repository at:
>
>   https://git.yoctoproject.org/poky-contrib timo/RECIPE_UPDATE_EXTRA_TASKS
>   https://git.yoctoproject.org/poky-contrib/log/?h=timo/RECIPE_UPDATE_EXTRA_TASKS
>
> Tim Orling (5):
>   devtool upgrade: enable RECIPE_UPDATE_EXTRA_TASKS
>   cargo-update-recipe-crates: add RECIPE_UPDATE_EXTRA_TASKS
>   ref-manual: add RECIPE_UPDATE_EXTRA_TASKS variable
>   meta-selftest: add python3-guessing-game
>   oe-selftest: add RECIPE_UPDATE_EXTRA_TASKS test
>
>  documentation/ref-manual/variables.rst        |  7 ++
>  .../python/python3-guessing-game-crates.inc   | 82 +++++++++++++++++
>  .../python3-guessing-game-crates.inc.upgraded | 88 +++++++++++++++++++
>  .../python/python3-guessing-game_git.bb       | 19 ++++
>  .../python3-guessing-game_git.bb.upgraded     | 19 ++++
>  .../cargo-update-recipe-crates.bbclass        |  2 +
>  meta/lib/oeqa/selftest/cases/devtool.py       | 46 ++++++++++
>  scripts/lib/devtool/upgrade.py                | 12 +++
>  8 files changed, 275 insertions(+)
>  create mode 100644 meta-selftest/recipes-devtools/python/python3-guessing-game-crates.inc
>  create mode 100644 meta-selftest/recipes-devtools/python/python3-guessing-game-crates.inc.upgraded
>  create mode 100644 meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb
>  create mode 100644 meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded
>
> --
> 2.45.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200216): https://lists.openembedded.org/g/openembedded-core/message/200216
> Mute This Topic: https://lists.openembedded.org/mt/106450866/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

