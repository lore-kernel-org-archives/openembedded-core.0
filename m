Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5236C7EE23
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 08:06:42 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.3460.1685088401115028595
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 01:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KmgJ3GkC;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f3a611b3ddso2273392e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 01:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685088399; x=1687680399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQS/kBTrSc+vj/y6EttqaLOzrkn+7EBE8jD8AstbPn4=;
        b=KmgJ3GkCEEn0PMGoQrWynkedC0p9Q2Wim5xq+Z+aGvOGnMsoISLFV9Sovu8+AV2H7J
         qMLA/cHZpvtPRGjZWZo5xGddzvs0D5CszHxyrlyFl42i/SRMJEaW8Zjyy8u6BSfNy9ZJ
         vh4350fyFdTXs3mQ0MPLR0f+Gv2YwtjBhM1v0aSjl7si7hCvfUetkw39nA5D+u+RBJtv
         bBo3AUsPvhc8NI/MnBmbrt5xSz9+Eij8ULdwUWm/RKaAJVa81cIuMpDy0C+yIVumP/2o
         VnnKiuTuwJMAtpETazvtFxm2tVqaCE/UG6QV5Uzp3s9Y4+5kujUdUx6ST7PODqn1E2Uf
         KtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685088399; x=1687680399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQS/kBTrSc+vj/y6EttqaLOzrkn+7EBE8jD8AstbPn4=;
        b=hH0dSNP8edsdrtdmJGdezGVpj9137Ibksv7mBL0cW/TIvZbaqvWcgEjhfZSfdNUblF
         C6VtplwFt/j9YgVv3l+IPFtEd8uKbcueU7l7veaiq2THCmdvG6Xj4KjIgpDhgAYhzc81
         +Daj3psMc/kByt6NIyABDp9EFipOXOS02rWCzkuCmirZqtRAAetGvfBzrP5B4YY1Gxut
         m9NqvQGBByhog2V72+fguyucAtLhy2ERRK1w76p5hmA0DUf0mUJ2rSkxZEAo4cUNYvpj
         HYfOpO+MaZ7+y/9zu7dOVeKXIARXIpXlXw1VexKpznPsv2rnaG/AzPbKSPsZ5sDv41ZS
         5TCQ==
X-Gm-Message-State: AC+VfDzSIE10Jdkmr7qf6Jb2uMZaH9H61eTdR62YCC7OUnI29dcyoxHA
	kpQwUcLZZJfEnEnm0PlpYc51OC4qFe95zJLdm0W4cOftzDQ=
X-Google-Smtp-Source: ACHHUZ5OYtfKBNw021nYzR09NNm+IiSgbYqwN6ohKJ8JhuCYq+Nu+vgRnQNmszS0DMCgDBKc8hsuBYIeutK+ev14sCY=
X-Received: by 2002:a05:651c:118b:b0:2a8:bd1d:bfb6 with SMTP id
 w11-20020a05651c118b00b002a8bd1dbfb6mr1529741ljo.13.1685088399105; Fri, 26
 May 2023 01:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_zqGXU_v8SFzNK7uDrUXn-979-GiYcPsS6Sd2EWEWytA@mail.gmail.com>
 <6010.1685051696220462053@lists.openembedded.org> <1762A282AFEEF8F2.16338@lists.openembedded.org>
In-Reply-To: <1762A282AFEEF8F2.16338@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 May 2023 10:06:27 +0200
Message-ID: <CANNYZj9O7LOCsvvGtS4OOjG=KreD200S=GBVTC_OFFcfW9HRQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] classes: Add new packagefeed class.
To: alex.kanavin@gmail.com
Cc: Charlie Johnston <charlie.johnston@ni.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 08:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181764

By the way, image recipes already do something like point 2 (copy only
the needed packages out of global deploy into recipe's $WORKDIR, and
then run an indexer only on that prior to composing the rootfs from
those private feeds), so you could as well reuse that code. See
create_packages_dir() in lib/oe/package_manager/__init__.py

I think that's a better option than option 1.

Alex

On Fri, 26 May 2023 at 09:58, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Thu, 25 May 2023 at 23:54, Charlie Johnston <charlie.johnston@ni.com> =
wrote:
> > I can see a couple of potential options:
> >
> > 1. Come up with a way to ensure that the do_package_index task is only =
run once per bitbake invocation after all other packaging tasks. As far as =
I can tell, there's not a way to enforce this with my current design. It al=
so doesn't address the problem of packages already in the deploy directorie=
s.
> > 2. Add more scaffolding to create a packagefeed class with potentially =
its own deploy directory and which only includes index files for its depend=
encies. That seems like a lot more effort than my change but might address =
the concerns more completely.
> > Any feedback or thoughts on those ideas?
>
> You could try doing something like what buildhistory and similar
> classes do, that is, hook into bb.event.BuildCompleted:
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-metadata.html#events
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181763): https://lists.openembedded.org/g/openembedde=
d-core/message/181763
> Mute This Topic: https://lists.openembedded.org/mt/99118888/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

