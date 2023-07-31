Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC89C001DE
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 17:48:43 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.1971.1690825715142407067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 10:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=loniRQaR;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4fe3c7f16bbso1264144e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 10:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690825713; x=1691430513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WBNzsaCgZ8cCifZl6zZ93PW/Fw4XirHLMIfz1Pr10ME=;
        b=loniRQaRzXdFqquVK9o6Ee+pGf8ubsY6k9Y+dMX0LpOIC9KyOeaRynwPf6gc9jaXqo
         LETmknyGj0gCYeReHNpkOm5qaBCmH8Lbtsb0aF3lJFVPuKli/vNMkrvteGnfk6Cjg4/b
         hYaH/9D3RmNyQaLLL3SGLVSj0z9o2hRjklpIC08K2zT00Y9mag3zPh33KyG5G3FXX54c
         22QaX6VeFUjjIiUtRBtwmkyDHpuf5dE9r/45kqXm9G/tJzg/erdjouyGDE/8wnA5z5fY
         B3YYQKnYQLJ4QFrwr9j/4cGUrvcKHF3XtFL842bsvZwL/1/nbFykaGlZGD7oFuiTQCud
         wkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690825713; x=1691430513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBNzsaCgZ8cCifZl6zZ93PW/Fw4XirHLMIfz1Pr10ME=;
        b=gNZQXATq0PzzmZIoJBEm181kW0pPBRSr6YSjTB+mTnYu6VcsmG/cYOfKESvqRT0uFO
         BpVS1apfGmpR+pWnVZ+JFg0dI43hMcnfy+meD8bdqCXbhS5Y4qPLYx97AM6UD7OfkiTr
         MHeiMX02+alpwDWAkn169elz7qrjadhgAt9Fmf3didInuZMxOFjBaaj7qlcPvXEFWGCP
         F41qc1wjtxW2sDjnNVI7LDfg+E/4NQOsvxc5Nw/fsWB+2+zsBmNl9oQiZZF6gGJbwshp
         f4/d2iIemTc38pWdSOXLdDijEsQwxORRttRY56jCDKN2uj8BESd/SC7BJxpCOQ0URPWM
         u5pw==
X-Gm-Message-State: ABy/qLasqKkJ4x6JdN/kVhlGy0IJ8W0ZJh/5bkzDWiiBJU83IaAxE5XY
	ck+qE9OHI/E0YQSksdAgtICr/pdHXV1V3FSQTAk=
X-Google-Smtp-Source: APBJJlGTkV+d0BPCr1TA5W4RTYco2mCWHSqdZqU740qmrmdL3P7sEPTomLFofkbE7LJof06CZPXjD9XlwhBLDzbTg+4=
X-Received: by 2002:a05:6512:32a9:b0:4f9:5781:8628 with SMTP id
 q9-20020a05651232a900b004f957818628mr336221lfe.24.1690825712931; Mon, 31 Jul
 2023 10:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690795930.git.frederic.martinsons@gmail.com>
In-Reply-To: <cover.1690795930.git.frederic.martinsons@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Jul 2023 19:48:21 +0200
Message-ID: <CANNYZj9-PaCUOp1jcuzzpNsU6Pde+LTGBSUHZGphNZPaLYPbFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] Use frozen flag for cargo build
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 17:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185156

I think you need to better describe the benefits. What are the
improvements? Can we just stay with --offline?

There's lots of intricate code added around cargo.lock handling, with
special casing to revert to previous behavior via new variable, but
I'm struggling to understand: to what end?

Alex





On Mon, 31 Jul 2023 at 11:44, Frederic Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> From: Frederic Martinsons <frederic.martinsons@gmail.com>
>
> This patch series force the usage of --frozen instead of --offline during cargo build.
> This has the advantage to be sure that Cargo.lock file will not be modified.
> Moreover, raise a clear error when Cargo.lock is not present.
> For this to work, we must modify ourself the Cargo.lock before building
> in case there are git repo that have been patched.
>
> The last commit is to handle the specific case of rust-hello-world recipe.
> If this recipe is no more necessary, we can drop this last patch.
>
> The following changes since commit 9b5b850d6a6982bb8ff14dcfbb6769b293638293:
>
>   libarchive: ignore CVE-2023-30571 (2023-07-30 12:00:13 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/fmartinsons/openembedded-core 15104-check-cargo-lock
>
> Frederic Martinsons (3):
>   cargo.bbclass: Use --frozen flag for cargo operations
>   cargo_common.bbclass: Handle Cargo.lock modifications for git
>     dependencies
>   cargo.bbclass: Offer a way to use --offline instead of --frozen
>
>  meta/classes-recipe/cargo.bbclass             |  9 +++-
>  meta/classes-recipe/cargo_common.bbclass      | 43 +++++++++++++++++++
>  .../rust-example/rust-hello-world_git.bb      |  2 +
>  3 files changed, 53 insertions(+), 1 deletion(-)
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185128): https://lists.openembedded.org/g/openembedded-core/message/185128
> Mute This Topic: https://lists.openembedded.org/mt/100458213/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

