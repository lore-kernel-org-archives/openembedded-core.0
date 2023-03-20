Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57067C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 17:36:24 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.1069.1679333778623306490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 10:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oha5OAZR;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id e21so379324ljn.7
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 10:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679333777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M44KhP+KS+Kn6b8gn0BmbhXEBK8elxDMj7nl7y/UyuU=;
        b=oha5OAZRk1gGWzN4mAFWyMol573LNEaFlfhL+cc+jbPbNDj6E1brLikJGi9w2iGCMi
         2eE2s9C0B/wYRzOyiWr81udRmdbKysnImzgWGhiwP4Q4c4x/wmAJWQdqln+/C0Lf9B6z
         T1k6wb6mVxc6pACBT+5QwdJAbwCiRqyvkr4ypEJYl6vhPAoBSikqQG/cmFc7a4x5+RGV
         fqlWTrJCd5Hbnsg+cECoFwW+piWPQiAMAdheIci2jgydhSM5DOjhtvmfR/k8KtVIQ7Wv
         5sm72J8WAsrdp+HNBkug9hFyB6VjoNH2kSaev6hR8Tswzbuha12P3LNj9lhJQb8x+ZwX
         cjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679333777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M44KhP+KS+Kn6b8gn0BmbhXEBK8elxDMj7nl7y/UyuU=;
        b=Wx1Xd+L/tL6LGnCHZgIrHGgnuNJpiOxUFtC2/vspCMoX1qc4C5UUQOjnQWfLqoS21C
         PGiQEynohFexxBaPkfEpgRq506K/RRTK0hOwWmtcpllHe34bBSBH5S1RzO2L0TLm3aYC
         ksrvKQ5dW6uiMA8PiXGrClPvfZo1Y46j9vVAVYACXyTYMGbZlMgKexfdVO7i9Ull583h
         TKJ4xMlkr3y9FQMUClqbRKQhN7k36vuaF1Zjx+LpUPog0Qp5aekZxhTd6YTMF8g6yTZJ
         IpdD1SgviMl1DpargTavdpVO0Q3/aoB7bmrUlnSOVwF+0Zih/QLFJ1TsulG44TS5GQiJ
         i2Zw==
X-Gm-Message-State: AO0yUKW3DTWQeFWBvnVPhD8aWmxjaJ5e3tyJ3yK4yVoF24X0F5Xs44aP
	beXp8KJ7RVp/+ZuenTPKPfCupB49twRdkRVp/8s=
X-Google-Smtp-Source: AK7set/xX55adfhT8UAEbF6uZibMG+DL+BCa+anzsWminfu9g/6bQvKXizXP7JF6ohNv7AY1JBtpkRj0wU3JOkXPVmU=
X-Received: by 2002:a05:651c:97:b0:295:acea:5875 with SMTP id
 23-20020a05651c009700b00295acea5875mr130414ljq.2.1679333776643; Mon, 20 Mar
 2023 10:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230316094102.2628727-1-alex@linutronix.de> <20230316094102.2628727-4-alex@linutronix.de>
 <347C5B58-FBCF-4A0C-85F7-E8B185506E13@arm.com>
In-Reply-To: <347C5B58-FBCF-4A0C-85F7-E8B185506E13@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Mar 2023 18:36:05 +0100
Message-ID: <CANNYZj9BzPnr9UebwEs2nnbj-0H-WP_xGO7S1YRmCTu0fn0Kag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/6] llvm: allow building libllvm in native
 builds, subject to PACKAGECONFIG
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 17:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178838

On Mon, 20 Mar 2023 at 17:20, Ross Burton <Ross.Burton@arm.com> wrote:
> Currently the llvm drivers in Mesa are the only known user of libllvm in =
oe-core, but I don=E2=80=99t like making that a hard assertion in the recip=
e and the subsequent native/target specific changes to the recipe.
>
> What=E2=80=99s the build impact on llvm-native of enabling/disabling libl=
lvm and why shouldn=E2=80=99t we just do it always?

I think that's answered elsewhere in the series. It's still 4 times
quicker than rust-native. Maybe we should just embrace this brave new
world of toolchains with heavy build times.

Alex

