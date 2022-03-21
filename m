Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27913C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 13:43:46 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.30751.1647870224528415471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 06:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=AXsMTkjD;
 spf=pass (domain: burtonini.com, ip: 209.85.128.49,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f49.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso8412086wmz.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 06:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8j6KPIDVcyyna3AsojgwI0YnJeVpTsUtXYOdz3sgRzk=;
        b=AXsMTkjD7SwAwdDK8vDlpKnt49YJlswPNXVKCATJ0SxCO/xFSxdde9ThAuAfvziYwg
         QZ/CgygtmeeyAZhNtubS56ezlV2FPtSuqh3S1j2l36E6/qCbHG+HK5bS5uElBfGLadsJ
         Yr0TmehOSTzDt0dG8Alh2U41a9aw6yHXpfdilC09OAhILp4YFXjykCtO9mVeRyhuhRtu
         AYICoJFjGzCsMJfaXQ87mvcmRCw6cQZe8iX39aYiBiv5+waSsc0nECkVfP3yKgFW1dtT
         36h2MtTBGiZw9SuDF9YMLw+TpboB9OIT/AtYTp2CeoqNv8NZwmjSUvptTQMmz9H4nkqw
         u6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8j6KPIDVcyyna3AsojgwI0YnJeVpTsUtXYOdz3sgRzk=;
        b=JJ4j1/vFXVo+H7JEx6QQIQcGogu7vBphaDwlCi9GAsjfxbN4C5/BZotZ5GO7qK+Fek
         e2Rv8O2bYBiXmQRsVBBsI98LTqwQgPuJqmp4UR/k/IQwtDAJp6Pyx2/pqUoNmSavzVNR
         RFf6th9UaUqXFeuK3Ie35RkvWQ4JX8qaGdBDQPe7iAe0/WS+qFuIjVVMMycHPlEn4Oik
         WTdYdew0pdwDkYBYJ0QGe4Ng2xm3AyVn0YeYHF9l1YPWuh+zOWTCJjp+YNbOegMCCY4n
         +9JHn3OcAYMp3uL3+OvwgE4egRsd/FlKQR8YE3NoxW26ltiQFTjSJuOo/TJe5T17ukbI
         2hIQ==
X-Gm-Message-State: AOAM532BK6IM4nvb02LTEkF1QphgDeSgH901fZlbiowTQ7Gm/bWttzVb
	jbViGqg5GvzSE74M4oBZ0FJf5bVh+r2aqyRcFA71/A==
X-Google-Smtp-Source: 
 ABdhPJzGNvxwK77pc/TKqnkreeDGEkCEEj9EMuUFiHKTmRWJ9S0btYJUPxAjrOTYrwFzdgbrUOtYRWvHF2gkuBIYu3E=
X-Received: by 2002:a7b:c841:0:b0:389:864c:e715 with SMTP id
 c1-20020a7bc841000000b00389864ce715mr19573244wml.72.1647870222772; Mon, 21
 Mar 2022 06:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220223125432.2733396-1-ross.burton@arm.com>
 <AM9PR09MB4642A596E4D70E846363B638A8049@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTsttmQuKcXYcgyfV1wQyptEsZThpYQ3Oa8h6WZsPW9xjw@mail.gmail.com>
 <AM9PR09MB4642C795688931840887DC06A8049@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTs3QP5zDqpPvGHx1TpyhyTg43k5eguiaK81VH9deR5h5g@mail.gmail.com>
 <AM9PR09MB464236CC1D57B2C351A8C0D2A8049@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB464236CC1D57B2C351A8C0D2A8049@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 21 Mar 2022 13:43:31 +0000
Message-ID: 
 <CAAnfSTvYcCkDUUKRWKAtfDJG3U+jPEeKwirdi=r7uOTEiRF8EA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] cve-check: get_cve_info should open the
 database read-only
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 13:43:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163507

On Thu, 3 Mar 2022 at 11:43, Konrad Weihmann <kweihmann@outlook.com> wrote:
> After scrolling through the log that I can get from a github pipeline
> (sorry no runner log available) - I noticed
>
> 2022-03-03T05:39:23.2334189Z WARNING: cve-update-db-native-1.0-r0
> do_fetch: Failed to fetch CVE data ([Errno 99] Cannot assign requested
> address)
> 2022-03-03T05:39:23.2569941Z NOTE: recipe cve-update-db-native-1.0-r0:
> task do_fetch: Succeeded

That's... special.

> and then do_cve_check run on that recipe
>
> 2022-03-03T05:39:56.6239005Z NOTE: Running task 4428 of 5120
> (/opt/build/sources/poky/meta/recipes-core/meta/cve-update-db-native.bb:do_cve_check)
>
> before failing with 2022-03-03T05:39:56.8063851Z Exception:
> sqlite3.OperationalError: attempt to write a readonly database
>
> this doesn't look right to me - maybe there's something special about my
> settings - I will try to recreate that locally

Have you managed to reproduce this failure since?

Ross

