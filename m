Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30382C001DF
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 15:23:31 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.74610.1690730606527893969
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 08:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nVQbgUJb;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: luca.boccassi@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-76c9334baedso93872985a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 08:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690730605; x=1691335405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2CAgyy++yxmh/DEipJUmK+yjG8bvFWzWqkGepMjU7sA=;
        b=nVQbgUJbq/kn0KxIvuO1+wLvfDVOJveiTTaS7XakecFoUjLsWmUQ6rLllhqI6mARYe
         M2wE2RVkHA0hH29BHZwwzmf+p2mlAgwAq6j+2Hqy5fhqd+DRyLRVJJB3pNTd/uuLlTp0
         KiTRu6SrjvcOLiHPNkGdkPCey2y/ebQCHHKISVqdJOhkhE2LTVWTL4i+x8TwyKcWnl/q
         Q8lmlLiyhNndvjq1/lKUuEliGfONr2ltKrYYOeCKbps3Llph86PQ8i2Ua7pp0j7Y62/X
         Jh75cTBU1B5XvyzPEckw8Ar3A/dOj5zpQ/43cdZKNVF+0iw/BLw/cLFRiSJDx++73tJc
         gh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690730605; x=1691335405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CAgyy++yxmh/DEipJUmK+yjG8bvFWzWqkGepMjU7sA=;
        b=bPhG7MMVJdpNZIoHy/9EtFu+s0t0tQix97OHJBtIywvxLl/OQWlF9W7Bm84cc29ZZz
         nzO3YvYcRPdqL9NTU+tQcEKVp8x1mwGBk0jVYmVmyQR/vaoeSFSrIgwnzIAcmQtyijbx
         lj8v909xzcxo6Pw7vrRR+KMOgla3HWa+t4dFZ9Zo9MsuDtS3UUViNGZgRCI29oRR+w60
         L3+ZjqczSbCsQArINZVHDfVCmUSTcsPf1W/cgKNYpgv7rS4eyaJN0FQGu8ionygPMHRy
         ucRZXNxWLp15BnHBhGlCgPMI7jjcfMBRXmsvmXXRPeuI+ZP2vqHP69eW2hL74nUMmoEd
         UOyQ==
X-Gm-Message-State: ABy/qLYBu7LrQxh1zDiNK0o/KXTMakspByQ/eooXcfFriitd1LnMJBD3
	34Pz0fXmkpkgI9G6X1qiFNRToFvq7562aX10ZFY=
X-Google-Smtp-Source: APBJJlFe8/3oTprtCMHberBykJN/U3SP5mAk5Ap0QjoQ1vR0nGue7hN348DR9RNiMLKhBQxZYjLOshxB3RYnJ8pA3no=
X-Received: by 2002:a05:620a:cf4:b0:76c:ae57:a1a3 with SMTP id
 c20-20020a05620a0cf400b0076cae57a1a3mr685795qkj.66.1690730605609; Sun, 30 Jul
 2023 08:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230730080658a80a3cdf@mail.local> <CAMw=ZnT8J66vOCJbVwez=29+=HUG0R1Wy29E9-Vv1oz6O3Dejg@mail.gmail.com>
 <CANNYZj9nFRDRAwGtQkT9638TB9TkW_VcW5ZdWf4oiFtwuSGpTw@mail.gmail.com>
In-Reply-To: <CANNYZj9nFRDRAwGtQkT9638TB9TkW_VcW5ZdWf4oiFtwuSGpTw@mail.gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Sun, 30 Jul 2023 16:23:14 +0100
Message-ID: <CAMw=ZnS26ZoRx_QvWQy+QgBv9ybyM+Xb-0_V7wZCVPZBotfjOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: update to v254
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 15:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185075

On Sun, 30 Jul 2023 at 13:43, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Sun, 30 Jul 2023 at 14:37, Luca Bocassi <luca.boccassi@gmail.com> wrote:
> > > Jul 30 00:29:43 qemuarm64 systemd-logind[240]: New seat seat0.
> > > Jul 30 00:29:43 qemuarm64 systemd-logind[240]: Watching system buttons on /dev/input/event1 (QEMU QEMU USB Keyboard)
> > > Jul 30 00:29:47 qemuarm64 login[263]: pam_unix(login:auth): user [root] has blank password; authenticated without it
> > > Jul 30 00:29:47 qemuarm64 login[263]: pam_unix(login:session): session opened for user root(uid=0) by LOGIN(uid=0)
> > > Jul 30 00:29:51 qemuarm64 systemd-logind[240]: New session c1 of user root.
> > > Jul 30 00:29:51 qemuarm64 (systemd): PAM unable to dlopen(/usr/lib/security/pam_umask.so): /usr/lib/security/pam_umask.so: cannot open shared object file: No such file or directory
> >
> > That's an optional module, it just means it's not installed. Not sure
> > which recipe provides it in yocto. It can be ignored, or the module
> > can be installed, or a custom pam config that removes it can be used.
>
> The right way to fix this would be to add a RRECOMMENDS on the package
> containing the module to the package containing the binary that
> attempts to load it. The module comes from libpam recipe.

Ok, added in v3.

