Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8242C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 10:52:52 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.8720.1644490371883995729
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 02:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=JdsKvOjz;
 spf=pass (domain: burtonini.com, ip: 209.85.221.54,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f54.google.com with SMTP id w11so8801319wra.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 02:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RHhmW2aZLHxyQ2dzDmSU0ZV9djyqxWz4uc1EjftifAI=;
        b=JdsKvOjz2q+A9HOQyWKxYPBnigGJGslUOoTUl7ibqiti8nzJviTzaqvDkPNTFYsCvj
         dL5hZjnoRDQuA7wzqOrj+vf2OgS9COIk1WNQfQWrfz03I76w+tfeHPQo7ylgPI8Ib4K1
         Ntzho1bdfgC/m9YT312RPwZ0IPqMQOABEqf3Rf+v8ncKDurvfA5cWZ3Xyd80+JCJZx/x
         JAze9TzU9pn03UgPPksmoSQmMNfQBKFnI18pz9UR8AYHbpbbf64jFHXPb+pQKobcAnFM
         6ui4PzlnSEMtP5+0PDkUwHeu+fj2pREvY0A12dQPGlONN368Mpsp2m67pKIo3Y+wdIYm
         Syow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RHhmW2aZLHxyQ2dzDmSU0ZV9djyqxWz4uc1EjftifAI=;
        b=YaGl12Mw50hpjW6coXy1rb3PwUPz4EOFqI22YThFGi899Wp+10FZA52+5Ved+cuygL
         3OOeKZSX23CQ/KeLwHH7DeglFd3h9SmNVcx2zGm+nuiZbCy5eJUGNvmbKl3JumFlOOFV
         iMt1LyQhD2kQMu5xsZYFDKYczM2hbe6URUnpbsAnZ0nrfu+HrrOpLB2HQf560wDoSsET
         YWSOxcelXpyIJDMaljUjSx0TQzT4BzaEdkocE2apEcRs+k8q7GJisxkzRb6dxOlTrRXU
         6dgEWAr+pKRPJvJk5/e7k1LViIGCjsTLeQD6uCoqaNJgzeEmt7eM1tkrDL3Mef3vNab3
         DXkQ==
X-Gm-Message-State: AOAM531A++60gSREBtXFSUpN4x8IqN9V3eXKwtcnHP5HhJzjHRbwnkm8
	jZUJAuMiJeuaIVhDpIKqQRgJdhtn6yFTKQ3o+oIIiw==
X-Google-Smtp-Source: 
 ABdhPJz1Wn72ZqnB3u/Wwi6dh99lW1cOSDPuF2V8OrTbgv4vH5iEgvg9sNhV26bmJMqsncEMuY1sL27GEUERH/kN8CQ=
X-Received: by 2002:a05:6000:1d96:: with SMTP id
 bk22mr5707171wrb.231.1644490370182;
 Thu, 10 Feb 2022 02:52:50 -0800 (PST)
MIME-Version: 1.0
References: <20220209173036.3823144-1-ross.burton@arm.com>
 <20220209173036.3823144-2-ross.burton@arm.com>
 <CADkTA4NG8wAoMQtpwbvf2hia23JnGsbboERY4H61GxMpyms5JQ@mail.gmail.com>
 <43fe0dbf3548f549d1c0161d2a55f633a9c27122.camel@linuxfoundation.org>
 <CADkTA4Ms8yb5Jn3K8N2BZktLYHtfDwp0ym_OVke16G4ER_739w@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Ms8yb5Jn3K8N2BZktLYHtfDwp0ym_OVke16G4ER_739w@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 10 Feb 2022 10:52:39 +0000
Message-ID: 
 <CAAnfSTvsN7DSuiGvSfLF2OgJXNW7QEZK+LZdNuvTcrYk3eUMvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] kernel-module-split: modules should
 recommend the kernel image
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 10:52:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161605

On Wed, 9 Feb 2022 at 20:10, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> I've always just used this (from kernel.bbclass):
>
> # Allow machines to override this dependency if kernel image files are
> # not wanted in images as standard
> RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image
> (= ${EXTENDPKGV})"
>
> Maybe that's the one you are remembering ?

Obviously this won't work in the situations where you want a normal
image with a kernel but also a initramfs with a kernel module in it,
as that behaviour isn't machine specific but image specific.

If this was a recommends then it could be removed via PACKAGE_EXCLUDE,
but we'd need to be sure that nothing from the kernel ended up getting
pulled in via a single module.

Ross

