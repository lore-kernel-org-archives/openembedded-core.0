Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B820C48BC4
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 09:33:21 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.37865.1707903193863887165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 01:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NSTK2tei;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51186925925so4200185e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 01:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707903192; x=1708507992; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v5AgU+A05RSfjowO1Z95kwepTMcImACTTrAH0zvEmmo=;
        b=NSTK2teiQrHzLlhUcOww5pGJkJascIoXLKAJU94ZVYRbPdD8JU/hFRURRoIT8VKh9g
         XflGjRWB5ymE/nl6qIhd3y2tZU03STtbVZRYAbPXSgrEY4NXgSIOx1CHReJhDzpF1sfC
         7o4A9od694/V55BCPjwVnZAPS8CcyyN5WeRE/ID2Z80ts9rG2R7Dlv2iSbwV/pAPb/JG
         eTBvkP3lZpe0uaqNPVcIFoZlWPwDyCZV6361Gq6cVbsF1m4sPZPWrDk+ZKALgCt8n64E
         rbmTQgEW+L3mTR375VQl+B/aPrn99roeDtwnrEzwyWPCYP8OiYxP4mp+M7qu2xD2v9K1
         tG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707903192; x=1708507992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5AgU+A05RSfjowO1Z95kwepTMcImACTTrAH0zvEmmo=;
        b=VEZlRUe8JaBOhd+FWfpZRhWzyG02Rh5dLbcQSXnZG/Q3+xA3obRp9QFFh1+p6RQMku
         eiulQiYVL3DIbKB6AQqUFKWY1Zj8742pg/60PO7Ys4vxdyfyUZqtIqTNiiC31VLVhuMq
         Mj2qABIgyR9UoAHtN9CU+7T9IqflqTNpH/iSuqIIRqMbqxVmEHVHU3d57AkoJuJWEl4+
         7hjnZZ8aTXeFfGtvv2mNEYe7bC+rbwf8NYpqcnUTrMcjMv4WX7/g8XJpW97ww0MssKEC
         IRgTarlENE6YTdOJhyxHyoa5KF5c/WzRR5zhqpaJVRt0F+VxIrHeB/2djt8xMODtq3NI
         w8Tw==
X-Gm-Message-State: AOJu0Yzl/dHKr8rmoW/kinLBPp4YyKy9Eno3dqO7G+Z52ebEdOCK4fh2
	A5GLTG5GIbBH9ycDRlD/5XAN2IHkY4eXZB2yFPEEntRBeREmzZfrxHgjivQH483ZH4o3Ukc4HjM
	R/LVZAFebZhUeh9OQqcFTd06Fhq8=
X-Google-Smtp-Source: AGHT+IHkOgt0nt7SIcntIXdj1XAbrIlg31zi595dMY7EREFurSL0uPgvP8eYIPraW3bCaPzu4Uo47e8LMxjISy4QHOA=
X-Received: by 2002:a19:6451:0:b0:511:31b4:ac16 with SMTP id
 b17-20020a196451000000b0051131b4ac16mr1440670lfj.47.1707903191826; Wed, 14
 Feb 2024 01:33:11 -0800 (PST)
MIME-Version: 1.0
References: <20240213221846.109260-1-adrian.freihofer@siemens.com>
 <20240213221846.109260-3-adrian.freihofer@siemens.com> <CANNYZj-mMv2miTA8fMBU9fJydCupT2eg8Y+thFVjfzfQW40TZQ@mail.gmail.com>
 <7d610cea521ca639e50f3a7a3f49be91587c3368.camel@gmail.com>
In-Reply-To: <7d610cea521ca639e50f3a7a3f49be91587c3368.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Feb 2024 10:33:00 +0100
Message-ID: <CANNYZj96A-1q5N-jm70=kCmjHMvhh5rc+79wd=+QyJtoEWXtkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/4] oe-init-build-env: add OEINIT variable
To: adrian.freihofer@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 09:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195457

On Wed, 14 Feb 2024 at 10:01, <adrian.freihofer@gmail.com> wrote:
> > > One use case is a layer structure like this:
> > >
> > > my-top-dir                <-- OEINIT
> > >   build                   <-- BUILDDIR (=BBPATH)
> > >   .vscode
> > >     settings.json
> > >   oe-init-build-env
> > >   my-layer
> > >   meta-oe
> > >   poky                    <-- OEROOT
> > >     oe-buildenv-internal
> > >     oe-setup-builddir
> >
> > I don't understand. When and how this situation would occur? Why
> > would
> > it be set this way?
>
> Probably always when working for a project which uses more than only
> poky itself. It's just one example for a directory structure where the
> build folder is not inside of the poky directory.

build folder not inside poky is fine. What I don't understand as how
and why oe-init-build-env appears outside of poky/scripts (or
openembedded-core/scripts) to begin with. What would place it there?
Would it be different to the canonical verison in poky/scripts? Why
not use the canonical version? That bit of explanation is missing in
your patchset.

> The purpose of the OEINIT variable is to support templates which need
> to know where the folder with the oe-init-build-env script is. This
> folder is considered as the current working directory of the user's
> editor, IDE, terminal or what ever is used to work on the layers.
>
> Do you have a better proposal how I could generate a config file which
> is located in the directory where the user's editor is running?

In the above case you could place it in BUILDDIR/../ ? Also, why would
oe-init-build-env have to take care of generating it? If something is
calling that script to set things up, that something might as well
write out the vscode-specific items?

> I'm not sure if this patch here is more marginal than adding a conf-
> description.txt. The conf-description.txt could almost be considered a
> copy of the conf-notes.txt. I am not against the conf-description.txt.
> But to call my patch marginal in comparison seems a bit extreme to me.

description is a one-liner explanation, notes is a multi-paragraph
usage text. There's already a prior agreement that both are needed,
but there's no such agreement for OEINIT.

Alex

