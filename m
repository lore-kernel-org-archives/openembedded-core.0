Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931F8C001B0
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 12:11:34 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.24180.1690114287318372691
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 05:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HfUEaBsv;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b6f97c7115so47900161fa.2
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 05:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690114285; x=1690719085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Gg1krQe6os6uDy3Rdp5Ps9s4K5agT2IxySNdAJHRS4=;
        b=HfUEaBsvgeOrROMnNy8yDHH9MnHsXZyRVwuqIrvwtoEN0H1wS+YSeEI7XiwfM8+1fJ
         Qebtgh3gkU3Bshun0FbEmg0WJ6jkHNgbC72Bchu+MykqIcPaSWGivjTSh3Bj/50PJpOa
         G3En2luBD4hLyr/ic/qxxYUIokJB44ZCBrovrO4+U/T/avz2j/yQVGPIsg2ztiKEXMEu
         7i4ofJEGt+irg3U3uLs1vDXj71NCQszjTM1NM8IX3lSEt7ZMQuOJcYJ02VDcKg/LH90V
         XjYIGZXKl960J17JGEcw5nOKwQyZyZKsnKLWElw9AwbVIsqXTfiNXVxP0zi+Zrm9SR4u
         KKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690114285; x=1690719085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Gg1krQe6os6uDy3Rdp5Ps9s4K5agT2IxySNdAJHRS4=;
        b=f1iY3hUySMOhqjxLYXzAmJ1Ea3fo1z35a207o+hvVtGVIMDRnX+xuZ3LDaLBTKGWTT
         6Sqk3KfK1rMKM8Eb7YEWS7cFof5f3UIAPAeN4fhAPqXCwzhWewZba2byq11VwqiLTfx7
         QeKack4WkEwZjl+NQs1u4UwQNn6wzc8k+eTPgn5nzEix1f60mbWa2F7eUsnE448FKN5n
         xcC0K9RwbsxCQvzESCdqhdurMYpkT4CYp0F9CM2+6IVkpMQ+UkjsxwhXg/BxZ9RlJ20z
         Ny/NS9av1DKV0XT7iEu0ZojjyTMan9Qb+s4D4HmPETjrlV/5kCEG7oBDwtvUESyWPN2T
         CebA==
X-Gm-Message-State: ABy/qLatHaaThOqaHhHMTPnftMX9a6orGSCsShIt19aBjH6SU7+tg6dK
	T5NmFKJn2/g8kpwkK3g7ykiwIwT4Rb+Wri3YKLkcZgwx
X-Google-Smtp-Source: APBJJlHzqrWJ/4tNVf5WIHl7hNxlBnK38QOS+fJQwqbpAB4GutBzQLcLJUgsAUvLH3WysOfSKDvdTUo7/jeO8PEBwlo=
X-Received: by 2002:ac2:43c3:0:b0:4fa:21d5:8ed8 with SMTP id
 u3-20020ac243c3000000b004fa21d58ed8mr3456342lfl.4.1690114285360; Sun, 23 Jul
 2023 05:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230721142543.246415-1-jstephan@baylibre.com>
In-Reply-To: <20230721142543.246415-1-jstephan@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 23 Jul 2023 14:11:14 +0200
Message-ID: <CANNYZj8tCEDM51XrCgfUfMu0ExJqJEwQ7=vU+4e7vrRqdpsKCg@mail.gmail.com>
Subject: Re: [OE-core] [RFC v2 0/2] Add bblock helper script
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 12:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184750

Thanks for working on this. Should we think about how this could be tested?

Alex

On Fri, 21 Jul 2023 at 16:25, Julien Stephan <jstephan@baylibre.com> wrote:
>
> Hi all,
>
> This is the v2 of bblock script.
>
> Improvement from V1:
> * Signatures are now package architecture specific meaning that if you
>   switch MACHINE, the lock sig will not be taken into account
> * I added the -r option to unlock recipes
> * I added a -d option to display the current bblock.conf
> * Added an include directive for conf/bblock.conf inside bitbake.conf
> * Added -t option to specify the tasks to lock/unlock
>
> Limitations:
> * I may be still missing some checks on user input
> * I need to find a way to get the list of tasks ( by default still lock
>   only the do_compile for now, unless -t is specified)
> * Do not check if a particular recipe/task is already locked when trying
>   to add lock. So entries may appear multiple times
> * We still need the signature of the tasks to be already computed before
>   locking. Need to find a way to generate it if missing
>
> I did some tests using qemux86-64 and qemuarm but I may be missing some
> corner cases.
>
> I force pushed my branch on poky-contrib [1]
>
> Any feedback are welcome!
>
> Cheers
> Julien
>
> V1:
> I am currently working on bug #13425 and I would like to post my wip
> script as an RFC to get feedback on it, before going further in the
> development.
>
> The script `script/bblock` can be used with the following command:
>
> bblock [list of recipes to lock]
>
> Here is a summary of what is currently implemented:
> * can lock several recipes at once
> * on first execution bblock will append `require bblock.inc` in
>   `build/conf/auto.conf` (creates `auto.conf` if it doesn't exist)
> * on first execution creates the file `build/conf/bblock.inc` with a
>   dedicated header and:
>          - adds SIGGEN_LOCKEDSIGS_TYPES +=3D "t-bblock"
>          - adds SIGGEN_LOCKEDSIGS_TASKSIG_CHECK =3D "warn" to display war=
ning but
>            do not stop the build
> * loops over all recipes to lock and adds entry with latest "do_compile"
>   signature in `conf/bblock.inc`, such as: SIGGEN_LOCKEDSIGS_t-bblock +=
=3D "bc:do_compile:e233cd793137a92dd575a417a2877e324ce526c4dc4a7db652abb951=
2f406f1f"
>
> Limitations:
> * only gets do_compile signature for now as a POC
> * `bblock reset [list of recipes]` not yet implemented
> * no check if a recipe is already locked
>
> Steps to test the script:
> bitbake bc --> generate a signature for bc's tasks
> bblock bc
> # modify do_compile in bc recipe to force signature change
> bitbake bc --> throws the following warning: `WARNING: The bc:do_compile =
sig is computed to be 680bd6c291bf88e379e0c405a773cf5f81851e1a52570398cefd0=
196000ac1ef, but the sig is locked to e233cd793137a92dd575a417a2877e324ce52=
6c4dc4a7db652abb9512f406f1f in SIGGEN_LOCKEDSIGS_t-bblock`
>
> I also have a point I would like to discuss: I only get signature for
> do_compile for the POC but wondering what should I do here:
> * have a set of predefined task to lock, in that case how to choose the
>   tasks?
> * compute the list of all available tasks for a given recipe and get
>   signature for all? Is there a way to get such list without using
>   `infoil.build_targets(pn, "listtasks", handle_events=3DTrue)` as this
>   will start bitbake, takes some time and requires some processing of
>   the output
> * add an option for the user to specify the task he wants to lock? (this
>   may be useful to add anyway)
>
> My branch is available here [1]
>
> Am I going into the right direction?
>
> Cheers
> Julien
>
> [1]: https://git.yoctoproject.org/poky-contrib/commit/?h=3Djstephan/bbloc=
k
> Julien Stephan (2):
>   bitbake.conf: include bblock.conf
>   scripts/bblock: add a script to lock/unlock recipes
>
>  meta/conf/bitbake.conf |   1 +
>  scripts/bblock         | 184 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 185 insertions(+)
>  create mode 100755 scripts/bblock
>
> --
> 2.41.0
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184697): https://lists.openembedded.org/g/openembedde=
d-core/message/184697
> Mute This Topic: https://lists.openembedded.org/mt/100277504/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

