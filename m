Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4E0C38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 09:42:39 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.98697.1674812552913852284
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 01:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E0yHnV/J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id h16so4386184wrz.12
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 01:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CiN66TG4BDz32aI9glLA4FVLbJvmMTBvVW6iShyuShQ=;
        b=E0yHnV/JFs5LR4WfF17xnM5mLwrvq2CkJO0XzKxsuemHAR5vbHGsWYFZJHdMIrgWCJ
         rk7tw9SqsdJjzeZ8I3f3uUak4I1RTufGHmc7LpN+TjL6nRORow6ZqoG9RVRG3BhmRSM6
         g6+0DI3A1QGfEdUHea/aNEeJdw3KPuiTGyy+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CiN66TG4BDz32aI9glLA4FVLbJvmMTBvVW6iShyuShQ=;
        b=tswj3biRUBEbBOCukgxD/daPxIzq4QEQTzplxac5PzO0hzonItzuRpIMFHYFjKHEr/
         UikQAwaw1HxROH/xSf1usGSw7HJmpIZHMguDnlTslJvWE0Ylb1zSUbXnN+zYG1Dovuhz
         Mjy0ok/qncXfq5yiXIvtivaJcroamEZTg4KfWySs9jan4uKGDn3C4uTOmCL/xifhiKWT
         yXBRrYoJxVGi72bqoE29U9NZYdjzmP7ruh7lGnN0009zgAgTKvXDPRffMt0Tx+MV9Gtq
         RlGFpd93Bik4/R/ura3AAicWfSq5tVCRlOj3ujUl1OlB0tmKwxwRf3ugrm3Tytxw5Li6
         UO4Q==
X-Gm-Message-State: AFqh2kp2vzuNkqGQPb1Xm2aM5JCMoHm0mqDY5sMtXlhG8puuHzPJ2Zx5
	d0hzUcSayrRt5ujXNmkMTRxgxg==
X-Google-Smtp-Source: AMrXdXs18SMNPbuO3WCRks02IvJ+XFGvUDmzc2Ea1yB1TVJ9mhrjz/QE6cNdoX9E9tZpvwO0GL1uHQ==
X-Received: by 2002:adf:aa8f:0:b0:2bf:5dc0:56c8 with SMTP id h15-20020adfaa8f000000b002bf5dc056c8mr24259128wrc.51.1674812551258;
        Fri, 27 Jan 2023 01:42:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3876:ca46:43a6:4b49? ([2001:8b0:aba:5f3c:3876:ca46:43a6:4b49])
        by smtp.gmail.com with ESMTPSA id j5-20020adff005000000b002bddd75a83fsm3568656wro.8.2023.01.27.01.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 01:42:30 -0800 (PST)
Message-ID: <608adafa71475f4916567618e60733e38ca20d86.camel@linuxfoundation.org>
Subject: Re: [PATCH] kernel/linux-kernel-base: Fix kernel build artefact
 determinism issues
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2023 09:42:30 +0000
In-Reply-To: <CADkTA4O84Jx_SywYmV12PYGftcuH19eoF3MOw51KJpOn9AaJTw@mail.gmail.com>
References: <20230126221009.2550277-1-richard.purdie@linuxfoundation.org>
	 <CADkTA4O84Jx_SywYmV12PYGftcuH19eoF3MOw51KJpOn9AaJTw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 09:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176435

On Thu, 2023-01-26 at 17:14 -0500, Bruce Ashfield wrote:
> On Thu, Jan 26, 2023 at 5:10 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > With the 6.1 kernel we've seen reproducibility/determinism issues where=
 the kernel
> > seems to rebuild headers referencing the hostname or local user. kernel=
-devsrc
> > building after the kernel seemed to trigger it in some cases.
> >=20
> > Moving the definitions to the bbclass used by all the kernel recipe cod=
e including
> > kernel-devsrc seems to be the best way to ensure this doesn't happen.
> >=20
>=20
> This is the right thing to do.
>=20
> I haven't been able to root cause how the 6.1 kernel file generation was
> being triggered by devsrc, and how it raced with the main kernel to chang=
e
> the build-artifacts .. but it most definitely did do it.
>=20
> At the very least, this rules out a lot of paths to the generation  of th=
e
> header files, and if it happens again, it will be easier to track down.

Sadly this didn't work and wasn't enough. The reason the test builds
worked is that both the A and B builds being compared ran on the same
host. On the release build one came from sstate, one built locally and
game over again, the hostnames were different.

First, I needed to reproduce this locally. I could do that with:

bitbake virtual/kernel perf kernel-devsrc -c clean
bitbake virtual/kernel -c compile -f
bitbake kernel-devsrc

cat tmp/work-shared/qemux86-64/kernel-build-artifacts/include/generated/com=
pile.h

and noting that it contains my hostname, not "oe-host".

With a reproducer, I was then able to work out this patch *does* fix it:

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b=
/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 9afd6714f0d..38282e58f10 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://www.yoctoproject.org/"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-2.=
0-only;md5=3D801f80980d171dd6425610833a22dbe6"
=20
-inherit kernel-arch
+inherit kernel-arch linux-kernel-base
 inherit pkgconfig
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"


Cheers,

Richard

