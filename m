Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6923C6FD1C
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 07:36:11 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.62494.1678606563264758986
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Mar 2023 23:36:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OJbzRj9F;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id bi9so11914850lfb.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 23:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678606561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2B1zKOuAM5hbs/JFy9szBarzunDOtKz9H9o7ON+dsJs=;
        b=OJbzRj9FjtGRdsKJtcdzfz5uuLfWuY2Uee8vybTe+3jnoMkahmwzyHsscwm/CH/Plv
         zX8SFnD42jxrEBLH2zrWQ1sv694T/E93NrYpIrIYyZIlgeC6TfPIdeQS9BTvFwu2+PVr
         sc+3v3jgt9igtphgNTAVlDLZFzUj65eKyGmv5pQtXv45C6wBabmp3h08/qCATF3L5GZ0
         A/fyLQPENXufrgTY7LtKVpEqagB7+xyj9wMk70vCY1PXYAX5lpy6+aT3SfMJUZUPZvDQ
         th+0rqZEGGlna8qHpS1adnNpjQgGOB24ybjUXV//OthsAaB2NpZVU6BaegpaOBUSHUzz
         MMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678606561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2B1zKOuAM5hbs/JFy9szBarzunDOtKz9H9o7ON+dsJs=;
        b=wf2xqq3F7Jams9dcYGnvZjQtcD5PRvA8hc+nbxUYs6a0WwMhrrD7HrwRQv0yuNhWBE
         FfCzxLRlCH+xuEZnexu3qQOjHVwuzwXQnbV3FfJ1bU73GkvSV5e56KWTJIUkuaUlrlfN
         TDGS05CMyOmZ320W3/VzPzsjp3VVOOmqk7aIWx4aSCmXx7HCOLM/6ph68pdDFcfqAX+F
         J2+2kbuq6Qg1JjYIQYMPlG1a/8hgS6n6PYecJRXWtTG+6X54tTQU2kd+8txxLC3x3obF
         ZcC8YFB0ARjxBM9LNpGLoc1QEDAd2dG/D+k/OzPF5tKqopO7WpoHf+khNm8/r4AZ9Alt
         KhTQ==
X-Gm-Message-State: AO0yUKXf1X7dTu8MmS8w3rnlIaKtGdN/HFq+RdLkr4rWme/SwnISSxwg
	AuGdqjzm0Vt2VaFh9Q/6oUVvg5UEU6JdDynn5b8=
X-Google-Smtp-Source: AK7set91iVAnY//TRM0fMLmREu5mSR5uFwLmHlNk7XOIzUNTAu2Ng6lkCLCVfKEp7e452nrZ4ZHyGX6dpOBzC8BjllE=
X-Received: by 2002:a19:750f:0:b0:4d5:ca43:704a with SMTP id
 y15-20020a19750f000000b004d5ca43704amr9354010lfe.13.1678606561151; Sat, 11
 Mar 2023 23:36:01 -0800 (PST)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
In-Reply-To: <20230312065517.61051-1-frederic.martinsons@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 12 Mar 2023 08:35:50 +0100
Message-ID: <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 07:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178378

Not sure if I understand this fully, but network access in do_compile
is not allowed. You need to place all crates into SRC_URI.

Alex

On Sun, 12 Mar 2023 at 07:55, Frederic Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> From: Frederic Martinsons <frederic.martinsons@gmail.com>
>
> When a project has a dependencies from a git repository and ssh
> access, this kind of thing in Cargo.toml for example:
>
> [dependencies]
> my-crate = { git = "ssh://git@smyserver:7999/myrepo.git, branch="main" }
>
> do_compile step failed with authentication error:
>
> |     Updating git repository `ssh://git@myserver:7999/myrepo.git`
> | error: failed to get `my-crate` as a dependency of package `bscli v0.0.1 (/home/fmartinsons/bscli)`
> |
> | Caused by:
> |   failed to load source for dependency `my-crate`
> |
> | Caused by:
> |   Unable to update ssh://git@myserver:7999/myrepo.git?branch=main
> |
> | Caused by:
> |   failed to fetch into: /home/fmartinsons/TAPOS_build/build-tapos/tmp/work/corei7-64-tapos-linux/bscli/v1.0.0+gitAUTOINC+5b5ba2aa3e-r0/cargo_home/git/db/cra-d8e163876777fda6
> |
> | Caused by:
> |   failed to authenticate when downloading repository
> |
> |   * attempted ssh-agent authentication, but no usernames succeeded: `git`
> |
> |   if the git CLI succeeds then `net.git-fetch-with-cli` may help here
> |   https://doc.rust-lang.org/cargo/reference/config.html#netgit-fetch-with-cli
> |
> | Caused by:
> |   error authenticating: no auth sock variable; class=Ssh (23)
>
> No problem if I run "cargo build" manually.
>
> As the compiler suggested, it is corrected by adding git-fetch-with-cli in
> cargo config file.
>
> Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> ---
>  meta/classes-recipe/cargo_common.bbclass | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
> index f503a001dd..c16aa4934b 100644
> --- a/meta/classes-recipe/cargo_common.bbclass
> +++ b/meta/classes-recipe/cargo_common.bbclass
> @@ -114,6 +114,12 @@ cargo_common_do_configure () {
>         progress.when = 'always'
>         progress.width = 80
>         EOF
> +
> +       cat <<- EOF >> ${CARGO_HOME}/config
> +
> +       [net]
> +       git-fetch-with-cli = true
> +       EOF
>  }
>
>  oe_cargo_fix_env () {
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178375): https://lists.openembedded.org/g/openembedded-core/message/178375
> Mute This Topic: https://lists.openembedded.org/mt/97555635/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

