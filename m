Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78BF8C47088
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 14:47:42 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.77274.1669992458694033785
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 06:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=WuvH2qS2;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id n21so12045772ejb.9
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 06:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GsDqAAQfZ8mjskh/5gJ356cnpbbBrx4SbujA1k3RZfI=;
        b=WuvH2qS2ZIFEdAgrlUTF1VW64nY+HUGHwZ2tLi+fnD3mHGgFKWXzw4LHKENkxC94fM
         0j8O6aa8NW0pmVI9gkyqMDBeB5xFTk9iZSN7UxKxXuId7gkFhBbs3Tl5jUlIjaDOeR9t
         D0bVj+zYwurV0gwdhHgKmE2X6v8r0tudnK+4nQlTENF5WqCd+MCP2vhobKzkBsgEYDeo
         pCUm59rCdbkk+4AH9twtapqE12VeY14rGqgRN485m3duygbn5NChwgUVnULORxbLz6Gc
         VOlA1klc7baballVJNTSfTMIBd75Av/lIlo9gTbjBl0VDQcoRSbNyJavbYyyTbwuavgM
         TPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GsDqAAQfZ8mjskh/5gJ356cnpbbBrx4SbujA1k3RZfI=;
        b=JvzBhfa2+2Squ+kAAS+iWDMfewrEq4w9dKpq/9kwuiW5quzY4u3mn7sORhnlEceoYG
         +P1wQJS+uSxGxbgfybYPOZtMNhVQyeqUagr9jLaP8ljZN91+2/I4ZeH1yr08g+PoXMjG
         0YmssvIhgMCWTFOSCVjkyNHzG1jtbP6OQG64f/GC93/DlCDPQNg7Z3w9LiIIZu7zu+CP
         FuL2BNlO8sChhgdahWs0p7AjnfMrt8T2PzPZfNJjBVrgADxaXgZAY4119tYXxJDvsDyU
         c2ia1h8wZ55fkhOjqCFe7CdbCSDR/tqYOE5RYmnIoqUrPZFbwfi4Q76AX8WnqTDLJ2BV
         yrpg==
X-Gm-Message-State: ANoB5pnZhxcvnfply72juB+5MBN252IhAk7lgsOAIN2tfQAExeBTvMBI
	Z+DCvlojMSQvIoGspcTA3Cwff4uqtKs71eUejR25bg==
X-Google-Smtp-Source: AA0mqf5NKj7geHJtZ2QgsFBl8MFG6bSOKMVKCMADZKeuY5CfQmRthk8Y60tvP5GSNI3zc0SjlDZFLE36gQ8Fijah05M=
X-Received: by 2002:a17:906:a991:b0:7ba:85a7:2ec3 with SMTP id
 jr17-20020a170906a99100b007ba85a72ec3mr37871983ejb.36.1669992456887; Fri, 02
 Dec 2022 06:47:36 -0800 (PST)
MIME-Version: 1.0
References: <20221103114823.349490-1-hprajapati@mvista.com> <6562.1669955704179296939@lists.openembedded.org>
In-Reply-To: <6562.1669955704179296939@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 2 Dec 2022 04:47:25 -1000
Message-ID: <CAOSpxdYSFGzM=BKZSWR_D-oobnPR5n8JjKDre+PE9jHjkq--sA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] golang: CVE-2022-41715
 regexp/syntax: limit memory used by parsing regexps
To: Hitendra Prajapati <hpprajapati@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 14:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174236

On Thu, Dec 1, 2022 at 6:35 PM Hitendra Prajapati
<hpprajapati@mvista.com> wrote:
>
> Hi team,
>
> Why this issue is unattended ?? Any issue in merged ??
>
> Please look at this issue, Which fixed for Go package .

I sent you a private email when I noticed you were changing the author
on CVE patches, but it seems you didn't get it.

Ideally you should send fix patches for those commits that were
accepted before I noticed this.

Steve

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174221): https://lists.openembedded.org/g/openembedded-core/message/174221
> Mute This Topic: https://lists.openembedded.org/mt/94754439/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

