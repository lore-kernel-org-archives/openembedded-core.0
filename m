Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C999C433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 19:54:08 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.2026.1651521244112971844
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 12:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cNhICWki;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id t16so11906713qtr.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 12:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YorVtG3qUjfY6x4VSyMN8GsqsZqb8CBxAWPzhpLFAz0=;
        b=cNhICWkiQyrgabZUADCkq7+48DXr5DtgHTjV9PeS3t1qTv72sL9OmqCDaiVG65pXW/
         cQ9d581gXUgr+X0rErJItpW0q7nJYrYUPysL5o4o+jX/lhXYD66PQ3MCYUE872ZeQ5Hs
         LkuNL/3L3t/7mH9xnOC+IvR8ulk8mDIPnT1b+doxnekN7WPHMKMS8r5g3s8p/TFsv5Al
         xMAtlpB2OMuTZn9WU0rhC0iWx4dAU1Pq+hdryZbkI/RXyQ1GzPX/tIpTslOkDLk6VT9Y
         lwc4svee7rwSBAmfe0TAYN03/7NTzZhBKaK49f2OEEsqtQzs5NAQGtE4wmgYbW8frqM3
         4M5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YorVtG3qUjfY6x4VSyMN8GsqsZqb8CBxAWPzhpLFAz0=;
        b=iKPR/3rYXJl2UeVpo5bS5kx9WfoI/mSkOXv9s08j2FirCwS5K4967/rNrQGJWrX1Tq
         9L+8K34wNqowVHwx9Uw3rOO9mNIRLLF3+rfxCg55gb8hgF/lB4WBDIzUtWFOi+Xg7Nn8
         Z+EkAu6B4WYYCzJQgFVLsyrslYpy/qvna7WH2NtRRb+MFeaAwKSOeaqaMaocb6cylQLY
         VV9UF7oM+B8OySoyixMxq+p6dSwVnKNtqU2DbG3mwsvO62uuok5WRAyffvkWWigEAeNe
         cfZPdskzQTKxgc/sOBPgjHJSijEjEsQkLa5+DyA/Vfy3GTyrCckDBrXxyBywvoPqev3F
         qPvg==
X-Gm-Message-State: AOAM532zGmWpoKfXmABqR24YHN3+0pPPmAKAZbu/+dxeTt6B83/Jfonz
	i6l7iGpSDeaXGptAhrgcMkgM5ZImpaFHqJ/4nq4=
X-Google-Smtp-Source: 
 ABdhPJw7etyQINAv4J9AOrwYmYydVFJzxnxFamKc2NL639+rR9bg18m3UjODBsvn5sa37PkIh/JujUtrHCPAubOg9VQ=
X-Received: by 2002:a05:622a:1a91:b0:2f3:8fd3:7e4a with SMTP id
 s17-20020a05622a1a9100b002f38fd37e4amr11830532qtc.54.1651521243160; Mon, 02
 May 2022 12:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220429063226.22192-1-rybczynska@gmail.com>
 <20220429063226.22192-2-rybczynska@gmail.com>
 <CANp-EDZJRbjkUwF1368YCr2k2EyHr3-ynDNNArxkVB2kqf9sXw@mail.gmail.com>
 <CAApg2=T7xgAuY=NF7c7v2C17EhDfoEe2nEJBrW-M-N1c5n0X8g@mail.gmail.com>
 <CANp-EDYtH77wc3+EPqryanGS9wU9_=NV4BqS2G94tEx6BhO=Qw@mail.gmail.com>
In-Reply-To: 
 <CANp-EDYtH77wc3+EPqryanGS9wU9_=NV4BqS2G94tEx6BhO=Qw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 May 2022 12:53:37 -0700
Message-ID: 
 <CAMKF1spfHUnss3vLLNyACLDfuWZiLSHuO66hmyMgoM=sshW_nw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-update-db-native: allow an option to
 force the CVE database update
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Ross Burton <ross.burton@arm.com>,
 Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 19:54:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165173

On Mon, May 2, 2022 at 12:43 PM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> On Mon, May 2, 2022 at 9:23 AM Marta Rybczynska <rybczynska@gmail.com> wrote:
> >
> > On Fri, Apr 29, 2022 at 5:53 PM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
> >>
> >> # Interval between CVE database updates, in seconds.
> >> # Set to "0" to to force an update of the database.
> >> CVE_DATABASE_UPDATE_INTERVAL ?= "24*60*60"
> >>
> >
> > This is a good idea, thank you Ralph, I like it. I'll be sending a v2
> > shortly.
>
> Thanks for this. I've tested it locally, on the fist run, the CVE
> database was fetched (it took quite a while, for some reason). On
> subsequent runs, no fetch occurs, so this seems to be working.
>
> I then set CVE_DB_UPDATE_INTERVAL = "3600" in my local.conf, and ran
> the build again. As it had been over an hour since the first build,
> the database was downloaded again. The timestamp on nvdcve_1.1.db did
> not change (as noted in one of your commit descriptions).
>
> So, it seems to be working correctly. I will re-test tomorrow (eg.
> after 24 hours) with the interval set back to default.
>
> One minor point of confusion is that the log still shows "NOTE: recipe
> cve-update-db-native-1.0-r0: task do_fetch: Started" even when the
> download is skipped. This is of course understandable when looking at
> the python code, the check is within the do_fetch function. There is
> probably no simple way to avoid this from being displayed. And most
> users won't notice anyway. But it initially confused me about what was
> happening.


yeah you can avoid it unless another logic outside of this function is invoked.
perhaps we can add a diagnostic inside the do_fetch to spill out the
state information
and informing like "no fetch needed" or "database uptodate" or somesuch
>
> Regards,
> Ralph
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165172): https://lists.openembedded.org/g/openembedded-core/message/165172
> Mute This Topic: https://lists.openembedded.org/mt/90771095/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

