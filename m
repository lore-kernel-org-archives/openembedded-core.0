Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD22BC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 15:00:25 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.7412.1667401223453322825
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 08:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Mzeg9RYS;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id a13so26912531edj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 08:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x6+vvzSphqkz5AWdTV0Cy0ljTCsPjouk0QjR2qCUQ40=;
        b=Mzeg9RYSdvXq7WWz/hn+FPw7hAWBWyp3KAfQ7AVsEVZAg1NVmP8cyyjh6H1kMihoKl
         +zKMRIrVL6OgKbvLSDqnO58wft66bFTZugznsYnjWyOHGGvKCWcng7ax0a3SuF9+Ygaf
         BP8eciN8/KR9OMlJ59xuczvK5bXAbCUIVNMMgBp13V9/OYWOOD+efq8N3yE3lKPgIfEx
         4OFg8FtOYvylOv2CGCQ0jnSf+1g6FtSbpOY+e9/PkKPBPoNLyudQIp5Y63Grg/BWbVRY
         48IzErDJOp15AJ5sPdv6jIsVZqQT72hDnF6+A29i6MzjUdR1R1tJu/ysFUgtNNwQlTLf
         LUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x6+vvzSphqkz5AWdTV0Cy0ljTCsPjouk0QjR2qCUQ40=;
        b=FTmMrhv3MduI45gA5ci4HQOFLAkmOOkCRrOrYVIuGTzZE/yjqokegj1dcxWIgQ1Kgm
         2u5+PwiomC84SCvkODnNVsls9fAYUffL/Sic4eZvrWk1CLIp9DPifxl2eFV52hg44+V0
         UhRNjjYwDjtJGrX/JfhRIMkxx3I/pfmjPAwCF746J1FQ6VFXicmZ66ZBlUXDi+jVIKSf
         8TzcQaGZZzC0D9E3xghccltiZrMDGGDAszRD2Im/2/R291JQfz0q/VMjX2PoKus9uSC5
         eBmLR+xeJenPM2eycL3qamdOEGZxkLiI/tkBymnIRuAi7EXwuJk2n2YK0WcNsbx/Bw6o
         8Qhw==
X-Gm-Message-State: ACrzQf34Gtjj7NCxrgrzsWfgnMhCyr5v3nYqe50SUmGbJGcfEAcuhHEG
	i5ToscvLI3l5Qr5OUn/4rY/sBI8mfcX6bh7TslTVIQ==
X-Google-Smtp-Source: AMsMyM7Zsjzqk+TSeK3SlBXokYl7RsEh6vSGi5vT4I1AYb+kpG6MMUW05CWMDvDPUTPd/b1Ma3DLpyVma0emjxnmrq0=
X-Received: by 2002:a50:eb05:0:b0:457:c6f5:5f65 with SMTP id
 y5-20020a50eb05000000b00457c6f55f65mr24579766edp.311.1667401221590; Wed, 02
 Nov 2022 08:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <4af9fc74-3b02-57ca-7aa1-d02a90f0f621@windriver.com>
In-Reply-To: <4af9fc74-3b02-57ca-7aa1-d02a90f0f621@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 2 Nov 2022 05:00:10 -1000
Message-ID: <CAOSpxdYo-5pvq632UZoxSyD5+sHQJcZYfwA0L3w1FauFm_fXHA@mail.gmail.com>
Subject: Re: Dunfell toolchain update analysis
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: "Moodalappa, Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 15:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172591

On Wed, Nov 2, 2022 at 2:24 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> Thanks for the info I requested Sundeep.
>
>
> Steve or anyone using dunfell,
>
> Do you have any concerns with the updates shown below?

The glibc and binutils updates seem fine.  The gcc update(s) concern
me a little bit, but we can test and see if any issues arise.

Steve

> Hello Randy,
>
> I checked the Dunfell branch for gcc, glibc & binutils updates.
>
> gcc-9.3 is currently used in Dunfell and gcc-9.5 was released by gcc.
> glibc-2.31 is used by Dunfell and latest commits in this branch are listed in attached file 'glibc.log'
> binutils-2.34 is used by Dunfell and latest commits in this branch are listed in attached file 'binutils-gdb.log'
>
> Can I update all these 3 modules as mentioned above?
>
>
> Thanks,
> Sundeep K.

