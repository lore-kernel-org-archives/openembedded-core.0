Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB56FC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 16:20:59 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web09.28474.1647274857782443334
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KM9EFLWD;
 spf=pass (domain: gmail.com, ip: 209.85.217.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id h30so17680110vsq.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NpvBU9B3GKaRFl81wfKPsaZyNlXhX3IsQQjk+gz5rb8=;
        b=KM9EFLWDEYw0pC+6uPjLU6I8q/Vedv0Omqy12iQLdns40LciRJp2DfeykJVUGZu/5j
         VaR2sHzIOrA4c/KX1mA3sz3sJPolOwTziMmbsijX7sPiPKOuQb77N4ruzqTb3LSjgnqG
         ylvTyQUFGW5MMB+D0/wEITl57yInq2bzT3bcY16pl+9Pc+M5Nf8VLdjnFFx6UAN0aLmT
         dG+I3gc2QhSKCkvRYQ7lkRYlQX9x9wkPa8u89qiUZmSk/Y9lTAUPXEAUzwHEApZ90p38
         MqwERtKIEsHNT1b5ZnOamxP2UyW9xWIsIXmgH6C5AXsHQutGNXAd2784FDuo5MaVf/FJ
         dnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NpvBU9B3GKaRFl81wfKPsaZyNlXhX3IsQQjk+gz5rb8=;
        b=jQ3FrK/u1c3uWB+kgVY5mZKglfra2pgpyev6UpbA4RzE2PrQYti25o5+XwJIOLSz8W
         qEEYcitS/En7XhwdvrDtTqTgiSoLMMdtXvxTpW1H0FzoFvDRRrZ2L1pBKl5jhgGO1vHL
         SPWajG+Lgc8F6oK2AtfD0rJogsG5o6gyORJ0gAA0Y/UWDpu6/VrcQUaaPWVYGUyAXV66
         dLGrEYN7rQLDVW5Mol4ag/75v4ZmpB3DC6fLhrdfJHUPR6RGh8YZcGW+m09o6VESAz24
         SGKx3ko0fiD38rC968hMVpJNnm1xgD0vB5hZkW82kfi+piXB7DnCZeGgqXpc9k+D4P5S
         hZFw==
X-Gm-Message-State: AOAM533+OfklZITexXeQdNGI1nzUeSsmreYdOdjvLiacMvr7tykwGJfu
	gNajYh/TlOtqMo0MNxKqa5or6+qwKDEmit6XEXY=
X-Google-Smtp-Source: 
 ABdhPJxbTpyxalDHXn9ekGnicSo3sKpU7ijCWotRcX92BHWnKawd03YU16auoaVHUhl5QB1QU290ZfNDA/iqKha1mp8=
X-Received: by 2002:a05:6102:cce:b0:322:c483:76b2 with SMTP id
 g14-20020a0561020cce00b00322c48376b2mr5607670vst.45.1647274856900; Mon, 14
 Mar 2022 09:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <1fcdfa7197764e3ebeeb5ace0b99a550@axis.com>
 <CAAnfSTuXkAQyGW_KoQYMJQHM=hFte_wU6rKuAcof2bddUHAB6Q@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTuXkAQyGW_KoQYMJQHM=hFte_wU6rKuAcof2bddUHAB6Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Mar 2022 17:20:45 +0100
Message-ID: 
 <CANNYZj_yRqqMuGN1sP4_GrRUFCj-Ak17e-0ob_y97USrSLKt1w@mail.gmail.com>
Subject: Re: [OE-core] Building python3 without readline fails for Kirkstone
To: Ross Burton <ross@burtonini.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"OE Core (openembedded-core@lists.openembedded.org)"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 16:20:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163157

On Mon, 14 Mar 2022 at 17:02, Ross Burton <ross@burtonini.com> wrote:
> The sanity check code has support for modules which have been disabled
> (see MODDISABLED_NAMES in
> meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch)
> but that variable doesn't appear to be connected to the PACKAGECONFIG
> settings.
>
> Adding AlexK to the CC list as he wrote this in the first place.

python is configured with autotools, so perhaps comparing the logs
with and without readline would be a good first step, specifically the
bifurcation point where ncurses is disabled.

Alex

