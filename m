Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341A4C433F5
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 23:50:39 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.29411.1634514638168723385
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 16:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RuUFZVLt;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id f21so10022286plb.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 16:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tDmQmgWBzLPTPosZ5sP9+UindZw3G9kKJoRhwCpOguA=;
        b=RuUFZVLtZKIyGJbFOGdZ7Lp4epN1VUm4Tr7muY/eKNBIh6xW7ASJjAwtS1twVGfJW4
         uGiU4KgAaNRsLft+vf57cb/8imhC0rofy4+OWb33L+Rmnhu45nJv1pwGQqgMIkoKp89+
         De2rgqTfeg8Ml4WkWOGpJ7Jp17qnKUQ0DdpfKV+6oDn0RPDmM+poNp357ciemG55Pp4c
         d5i0KX91s0DRb0CIWYAlZMB4GmQTdagbP2nfXM+QVn55/Fz0QKTgzoBwBbZ2Y+Dyj8mL
         6rkKO59OJBRpNdF7d1uF+IEbmU5cNtdfBD1i10nTZtTaCRWmnJw2Le5ZJdDuX0+lSI0Z
         H3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tDmQmgWBzLPTPosZ5sP9+UindZw3G9kKJoRhwCpOguA=;
        b=aecrPTzlvoOtV0boomtUktbyfOpKd+o6gOlxoevCUvr0522xIDdhoNY+8qdwxkp/QL
         EHAlo6BCvib7x2BuQA+iXe+3wg3HWZE1e8e2H2lIh6F33WIHFfyYIe9ltX70WQKOQpRc
         3Pok2cHJ1rP1o+J0BradIePFp9kC2UqZmSGJlL94iyRo/53mW+nPyFVQK6VZPSVoaxml
         ENykpTTxH5KOQ4DtPLZ7vSFz/59BoUpUrlCzn2P5q11B89y4Nni9LNkcbouHxJyynAOY
         gSTHixj+SaMbBx2mgmhS8Khn1noq1/MLZTcpAWo5WzVQqtFskug/oxIzm7iPVWGOC4UA
         LIaw==
X-Gm-Message-State: AOAM531UlvfnDSnsIPKN/2V+XBsszyGvp8BbUxxWT0m6k4dVk5Iirc7K
	iObvxdgXIbGnHNjtmPMFvff4c1c2hvj20jkdTKY=
X-Google-Smtp-Source: 
 ABdhPJzUG5Zvd40lsXLTrD0ez1zNhWqEoB2E5lYV6o0G6tA309ycsV39fkWjvi1GweRmqfM5XdwKdC9OQlqYMj0vSZA=
X-Received: by 2002:a17:90a:bb82:: with SMTP id
 v2mr43828128pjr.57.1634514637760;
 Sun, 17 Oct 2021 16:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
 <16A68880435BB472.28512@lists.openembedded.org>
 <e22062ab2915a57b1bff1217c911a97c3c647e30.camel@linuxfoundation.org>
 <0700251c-57a1-cc4c-dd94-a253032a02d1@gmail.com>
 <CAMKF1spNqjAHRh=0F2ohMCCoSdwDOTWAFRMz2RCVU9+rBiiO_g@mail.gmail.com>
 <CA+chaQfO61hdhNtHO-hTu_4QZbnwmHUTMAJ6XaHrDCdhww2EVg@mail.gmail.com>
In-Reply-To: 
 <CA+chaQfO61hdhNtHO-hTu_4QZbnwmHUTMAJ6XaHrDCdhww2EVg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 18 Oct 2021 01:50:24 +0200
Message-ID: 
 <CALbNGRR+VLOvuTFaZFFcp1eSR_gKw6z1EMeH1c28QjqV_YUP3w@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 14/14] layer.conf: Extend recipes not to
 install without explict dependencies
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 23:50:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157047

On Fri, Oct 1, 2021 at 4:17 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> FWIW: I've fixed some bigger layers where pkgconfig was causing quite a few build failures,
>
Had an off-oe time due to  heavy work load.
Think this one is the reason for the pkgconfig patch flood. You are
aware that there are packages not failing at build time for missing
pkgconfig but build output is different and bugs will pop up at
runtime.

To avoid responsible maintainers have to go through EVERY recipe (and
combination of PACKAGECONFIGs) and check if builds are still as
expected - Can't believe it!

Andreas

