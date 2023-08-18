Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09401C678DC
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 11:00:22 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.8443.1692356417751114934
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 04:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IaXBRBa0;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4fe1489ced6so1157176e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 04:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692356416; x=1692961216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OKnqk+VWvP5PXEDo7vjUpn61KukobA0W9voKNnf6kv4=;
        b=IaXBRBa03g+1bIbqzrQAXPKr708GHgAn4jsM+yBS8tgS3nM5Z26ENnADajugsJFpal
         Bk96a7qXvD7RdXa6l/C+5wSQ/GhsAOV5BJC/hoh4D1OxpuOjf+ZBCC0F2CX+Alq2GRYC
         1gDLNAg+IINCvyWrpRblJ37Evf0jr01hT5rc2VHpQVbChL5/YAX11/RXoWcIejOKVJ9D
         DMa9OiNJJUTZpRWfaKvzcL5qBs/USd6+DfGi2+3ryp5ZoZhrRVnXODrO6kmcmtzEmr3B
         f12pN5IardTbpRYnwDOc3vxbyqQWIai6sKbhX566nQ3Z8BbxWYJVfwcvLup4+E5T0vtn
         Fp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692356416; x=1692961216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKnqk+VWvP5PXEDo7vjUpn61KukobA0W9voKNnf6kv4=;
        b=LHohvQxw1ZYQvMQd51jwrngTax6yWF2PF7Z3kUzbiJZi0fgUlVy+jT496+GXtrdPH5
         mVMbKMRDt4zFi6/+l//Ouw9fCdrHoBusKGvT7ua4EtTkKnScE+a9xD8k2TsDLcHkrOkR
         mgvAoHxvnLSChLqLUDKZO2PXNDuUck6n8qgHC/HRI1fXqCB8JZ/MVorg8gSDac07Jycb
         9orb7Uu6rV6NMeoMEEOsfw12GlzvToRjvAysGqCxD6zU9AakTYtMz0nXR7YNTaYosiw+
         jEgZgi5eUiza/aJBb1DDVxgl2tcQGLcqMVTMAD6MmmwhXjMRyIM9ftYa2yNfvle7DCuH
         Z0JA==
X-Gm-Message-State: AOJu0YzOLSnCHK5ummtuJuMzo8W9rY3Ww2Hquhdi9sGoPENno+uPmall
	blonOkj66HNaiUDPe8nNH2IH8hYyGT/0Qq0ZU38=
X-Google-Smtp-Source: AGHT+IFQZLUnWLZpzAp0s4NQCCuJZYpE14ACvL0eccWEZWbfgg7mifCp8nIuK+zTW7lq6jzR35HyEpG3LGfZxbcK7tE=
X-Received: by 2002:a05:6512:31c6:b0:4fb:9105:58b0 with SMTP id
 j6-20020a05651231c600b004fb910558b0mr1778673lfe.20.1692356415673; Fri, 18 Aug
 2023 04:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230818105008.16113-1-dmitry.baryshkov@linaro.org> <3a0c57f2682fa8f1326be4f11ef4bad443cccf99.camel@linuxfoundation.org>
In-Reply-To: <3a0c57f2682fa8f1326be4f11ef4bad443cccf99.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 Aug 2023 13:00:04 +0200
Message-ID: <CANNYZj98KRAWHjoQR9BYib+N=ZS=2La+KxvaCMhO5b0b8QSgZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mdadm: disable strace on rv32 arch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 11:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186359

Upstream however should be made aware of the issue, so there should be
either a link to the patch submission, or a link to an upstream ticket
as well.

Alex

On Fri, 18 Aug 2023 at 12:56, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2023-08-18 at 13:50 +0300, Dmitry Baryshkov wrote:
> > strace program is not yet ported to RiscV 32 arch. Disable corresponding
> > dependency and test to remove dependency on the non-existing package,
> > which otherwise breaks building of core images:
> >
> > ERROR: Nothing RPROVIDES 'strace' (but /oe/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb RDEPENDS on or otherwise requires it)
> > strace was skipped: incompatible with host riscv32-poky-linux (not in COMPATIBLE_HOST)
> > NOTE: Runtime target 'strace' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['strace']
> > NOTE: Runtime target 'mdadm' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['mdadm', 'strace']
> > NOTE: Runtime target 'matchbox-terminal' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['matchbox-terminal', 'gtk+3', 'glib-2.0', 'util-linux', 'mdadm', 'strace']
> > ERROR: Required build target 'core-image-weston' has no buildable providers.
> > Missing or unbuildable dependency chain was: ['core-image-weston', 'matchbox-terminal', 'gtk+3', 'glib-2.0', 'util-linux', 'mdadm', 'strace']
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../mdadm/files/broken-strace-rv32.patch               | 10 ++++++++++
> >  meta/recipes-extended/mdadm/mdadm_4.2.bb               |  4 ++++
> >  2 files changed, 14 insertions(+)
> >  create mode 100644 meta/recipes-extended/mdadm/files/broken-strace-rv32.patch
> >
> > diff --git a/meta/recipes-extended/mdadm/files/broken-strace-rv32.patch b/meta/recipes-extended/mdadm/files/broken-strace-rv32.patch
> > new file mode 100644
> > index 000000000000..a58495008605
> > --- /dev/null
> > +++ b/meta/recipes-extended/mdadm/files/broken-strace-rv32.patch
> > @@ -0,0 +1,10 @@
> > +Index: mdadm-4.2/tests/07revert-inplace.broken
> > +===================================================================
> > +--- /dev/null
> > ++++ mdadm-4.2/tests/07revert-inplace.broken
> > +@@ -0,0 +1,5 @@
> > ++fails on RiscV32
> > ++
> > ++Fails with the following message:
> > ++    strace -o /tmp/str ./mdadm -A /dev/md0 --update=revert-reshape /dev/<...>
> > ++    tests/07revert-inplace: line 40: strace: command not found
> > diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
> > index fa50325f1f71..3085222061f0 100644
> > --- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
> > +++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
> > @@ -126,3 +126,7 @@ RRECOMMENDS:${PN}-ptest += " \
> >  "
> >
> >  FILES:${PN} += "${systemd_unitdir}/*"
> > +
> > +# strace is not yet ported to rv32
> > +SRC_URI:riscv32 += "broken-strace-rv32.patch"
> > +RDEPENDS:${PN}-ptest:remove:riscv32 = "strace"
>
> The patch has no Upstream-Status: entry which makes me wonder how it
> was tested as this should have given warnings.
>
> I also suspect it may be easier to just write a
> do_install:append:riscv32 that creates the file instead of a patch?
>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186358): https://lists.openembedded.org/g/openembedded-core/message/186358
> Mute This Topic: https://lists.openembedded.org/mt/100817941/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

