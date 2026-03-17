Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E8DFD8756
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 12:14:18 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74368.1773749653001460778
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 05:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SKdOpOmb;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5094ba0af1aso63095241cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 05:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773749652; cv=none;
        d=google.com; s=arc-20240605;
        b=HTHDE4hw/3uGZfPXxXHBHYY+mV4cautWUglYnWVB7zSAkYX3LXPgmawI13xdF5oX38
         3uno564cLX32zFvzCIRzDjkyE1ryvuLPN5Y94kGLjshk8bt2y5kisOGGAjr4RddTgSNP
         9kg3m53zW5NJ1X26uQVucCI/sB0UfJ1jT7Jml3YiZS2SN4Z+kGbVcSz+21SoWMWYhpRq
         3xoFDioX0eBkdd36mCpfwBN8S3aia7Yyv15asqdpBjz8Q8zG1YWw0TQ3u+C5UcduD5aq
         drPwCFU9sUAu5ng214Qo4yTxRu/4GIXGkv+pku5S81zhc8TRIVRSBVWn4X2W1A9aVqaA
         tB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N4Q4aMVGJM1XdGp3adndgYFG3u9CQK3of6epBzK2j/Y=;
        fh=ZiYcxsYBdEEXDs9HoIhOz/2u/sKFw2l+p6YL98DFjK8=;
        b=PQ2VKN4MXlXXbIad1hM91rRssybofNWXVaz4AJAF/fpgwgHaGM9zAzs1J2pyJi3zzD
         SgD2pt9fJ2xI4Un0q0fyqxpKqP64QlyKiv2x4ME+x004NZ7zRRQTph6KpdGrSg5p5IsB
         wjC5Db++7D6rqogHA/zeydGGsNC8xaLVslt1VPL8fjsEvoLjYsAiTTc4IgoAJ+Elsa3I
         pExsVtlL1ysYE0IFA4N8HbSFP+wYmhNmGtsQACjJby93XZIB7d/Gz6XOVFz1RCYR61nQ
         OVJ4eS6CqLH00zYPKqQdP8qjvIUXYQZkwU1H1HCSgJUxYK8v0bVyie3eHG9TJIQTyaJ3
         kGAg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773749652; x=1774354452; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4Q4aMVGJM1XdGp3adndgYFG3u9CQK3of6epBzK2j/Y=;
        b=SKdOpOmbnsBog3kZ/W2sRx9k819Q9LLjF28gjL5di2jspVfDqWdoS/Gq38xf/XsYuk
         8pK4U4FIrtK7FntvTibGUyBMmqrBE+VdY7/ZVRV7a/Ffe616MkEVBNRk9iP5WAEnRHrW
         UxQ0j/sOptLnOVkPGc6XUotuRXCfvLkqo751PAeYjAy8Zd1gYc+9GO92CNFYjW3JJ9Hh
         a6S/gWHjXLFTVHPrrRP8JtoDK5hoO0ZyJ1hlAcT1h6XJCmbAkMcM/q8szIgLLp+SI5Rj
         OiBs8xkRYUW6SePLAYdS3So7aWJw6z9MzrbjdFWml43GTRIw89HqKH+2q9hL2Q/QrGVx
         Z0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773749652; x=1774354452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N4Q4aMVGJM1XdGp3adndgYFG3u9CQK3of6epBzK2j/Y=;
        b=OcwiG2vgyDVhcGSblL3xza0qKUnXvyYWhpxFu/GMsXBcdM1q4Dm0mQmAfgl3YWrF44
         KZPPN9BNgQVRq5oy2fa6ZUausdQVtCF+p/yTuhiurcDr4fJy2VoeeCnZxmhK9xMhFDuO
         SlDy00cm6wMhM5quIKjUpQUGDiPKdTs6aC7DRAXHxJ+8rofdFUJl1bfCkOWezpaolenb
         AHYME7pPFfAJP8aujveu+c+W1bYDs3D5JXk3P6P8aEwUciEM3WlVBebfiScpSogAz5mk
         Pmr1oa7eSAEPEX1ZeVQK4ywNuiURxHhxGjmFtOHHP8ArtAFxpqz4fniE6Pi2VnuKjwtl
         d7MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqOwQ1l5lq5y/BS7kQ8HkvRlt0OQP1ijdfgr+el9qVO65epczu1szVu4RsZqs+XLZfo971KDu7JEPhkkLiumB8Tg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyec540TH1Be7AAHWOy1MehJRwUO7tQX7wsCoIbbBtsY+KJr6yR
	WhdMlQsT37grEI3ujbrlb2YwR+1oGU2LpTEuhCJ6UW8kk5FLcX2BTWN8BwekzCYzIi6KPZxGEeG
	eNUUMsCitAoKD1VB/hpILrTKoCRkaGjjWKA==
X-Gm-Gg: ATEYQzydQNblqwO0au3HbG/VNsU6ZGkJ3IAnsrEGt0lCjatM3jDSsLVFDcjbv3PYKzx
	wob5ZVNAfgfCFLnNeTegLFrNcos1ur79NItKuEfPX7x7jDi2CznebfsMCzj3lOu96Ysy27bY26+
	b0xQM6plAitOYxJaz4HVXUd9kBrQbs0izMKcUzcDtdV4kk6G1aWUnrU0RdkSKN0sufAiyyslqYN
	yOPRjQFWol6M2qd2/4mKvrTADjleI/Zj5zWpaAa57u+6V7MIXhrb1XzFY8BS5IKchKmO2sQEWAd
	LXMhSZqOIiXnX/uH1tjo1SctcSQLQO2wb/2cRv2zLd4QIf1R+HJm
X-Received: by 2002:ac8:5dc9:0:b0:509:1a36:6aca with SMTP id
 d75a77b69052e-50957da5679mr225643181cf.17.1773749651719; Tue, 17 Mar 2026
 05:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com>
 <20260310174403.2309825-5-Hemanth.KumarMD@windriver.com> <CANNYZj_JtZZ7Ftskf+W46LuradpnFv1CvyYt2G_HPJovyCq09Q@mail.gmail.com>
 <0d193cac-0f0e-4eb3-a462-ba5c459bce73@windriver.com> <CANNYZj-UY4DVgPbs9RtnCo3g9mxNu6Vh7WbhzXjLeN67J3qHaQ@mail.gmail.com>
 <67653695-5d20-4ef6-bd99-9a6ee5e70966@pengutronix.de> <71345a0e-8179-4f77-84a4-291f2adc188a@windriver.com>
In-Reply-To: <71345a0e-8179-4f77-84a4-291f2adc188a@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 17 Mar 2026 13:14:00 +0100
X-Gm-Features: AaiRm51H_7tQEaTHXjJXCRwxVz7f86MNqCXoFORk2Qt2LT0R9U6sYjTzk5SJsQY
Message-ID: <CANNYZj8pWiNp+BauBBfnq8HyTr_q6KnDSkkY6=VsiGS-Oo8NTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 5/6] barebox-tools: fix build failure with
 glibc 2.43
To: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Randy MacLeod <randy.macleod@windriver.com>, 
	openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 12:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233321

On Tue, 17 Mar 2026 at 11:14, Hemanth Kumar M D
<Hemanth.KumarMD@windriver.com> wrote:
> Thanks for forwarding the patch upstream in time.
>
> I=E2=80=99ve just sent the barebox-tools recipe upgrade, so it should bec=
ome patch-free once that lands.

The Pending patch for ltp has also landed in master, so can you please
file a ticket upstream, and update the Upstream-Status to
Inappropriate [workaround; ticket link]

Alex

