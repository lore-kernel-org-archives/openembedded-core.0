Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536ABC61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 07:52:55 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.131080.1700812373206649508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 23:52:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D2fYR8b1;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c8790474d5so20392961fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 23:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700812371; x=1701417171; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GNDXCJnamnZbEwb41KHp9xj7hteCzJotpc443VPGohk=;
        b=D2fYR8b19QR8LtK3wgEMRRX8JBbL/veIgDiMv8Bci5IX983yxSjbquemdpMdzBqaE+
         5yVNED2WbZ6fU7lwwC1sjnPQuX7sASOKemGArqtScDpRkfcDiT/5rHHRg8vYuavHloFf
         1uHSFIllo9dOkvPptft0dRmPCITsZzmhC0nJF8V/4q7rTXBDgk1CurpJntGDiaSzRrgc
         iAnQi1wQgPKIFwUaaPatgkDcseEiKNmaPJFKTSdAXAzJrGvIyT4b0t4rSMk3iYP+uWZI
         gjsHjM9tZQGNY13ZOTgADEddnkkHzHV0rHjJXKBaD/EYkP1cgdgQi8ls4xEsXczmfGN7
         6v3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700812371; x=1701417171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNDXCJnamnZbEwb41KHp9xj7hteCzJotpc443VPGohk=;
        b=ppCLCeFdsq8OQ8Ofg8kdH8J+lf5mrI7XAaV1lxZTDGBpEM2VS1v6ukMuP4P2TvquQT
         hVobozkaJ7v9x/ozRZmMLb5Qou/Xh3BJ6TP/z9c5PP+5RlWycK1fmqC6ekz9Viep7VFK
         IfBHewtj9sz1PB7yNepjo81YP5SM2L2i22VXmGLWAK8M+63FtXrkIdx0FNn96sZQXgTe
         oOhoTn5ZbI8UlK+qiY1XH1dIp6crcggHXcU4AI/My53BQVn9R1F40Ly6LNyfcPR4o7bJ
         HfJeLQ2s7PS5sfIxJjsh9103qBZCtuS0NibwlN7p498L4M0NYhyTWpknUddue0iE/vtz
         PZUA==
X-Gm-Message-State: AOJu0YwrNjZg/t6ERqkcz0may9suieRWsXG6KgkGUzEmEq3rmUJ6v3EQ
	0PeyUAz4iFVjqasqKgL0uqZyEqgavm14HcjyivY=
X-Google-Smtp-Source: AGHT+IH26HLMLEr8B+3UAVupyKjALCA4a1YSrS5pCs6Ct6AvyPw9Pm4vaDNuSTZmQgYs4a0YzAyz2zO8dgXBwlHujeo=
X-Received: by 2002:a2e:2d09:0:b0:2c5:a50b:2f08 with SMTP id
 t9-20020a2e2d09000000b002c5a50b2f08mr1130250ljt.36.1700812370833; Thu, 23 Nov
 2023 23:52:50 -0800 (PST)
MIME-Version: 1.0
References: <20231123004605.82598-1-marex@denx.de> <CANNYZj8s99epW6DxAmNzW=70P_0ksoAntN3bVbUu6ehR=tkcpg@mail.gmail.com>
 <f5a8fb84-42cc-432b-8704-9b058be25835@denx.de>
In-Reply-To: <f5a8fb84-42cc-432b-8704-9b058be25835@denx.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Nov 2023 08:52:39 +0100
Message-ID: <CANNYZj_XG4nxLOqOq=aeYOZBNuDMoOdYF8G2LWVUDbe+gYNEQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "lzop: remove recipe from oe-core"
To: Marek Vasut <marex@denx.de>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 07:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191177

On Thu, 23 Nov 2023 at 22:07, Marek Vasut <marex@denx.de> wrote:

> The lzop is called in oe-core and I was under the impression that
> oe-core shouldn't depend on anything except bitbake . So either this
> stuff should be moved to meta-oe too (which would be unfortunate growth
> of dependencies) or the lzop should be reinstated . I would obviously be
> in favor of the later.

There are plenty of recipes in oe-core that have optional features
(enabled via PACKAGECONFIG) that depend on recipes that are not in
core. If you enable them, bitbake will say that the needed recipe is
missing and then you need to figure out which layer to add (typically
something in meta-openembedded tree). This is not that different:
optional feature, disabled by default, and the error will be the same:
missing lzop recipe.

Alex

