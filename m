Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639A6C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 13:31:46 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.32710.1701178297466864584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 05:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XntU+Kxc;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c9b88cf626so4169011fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 05:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701178296; x=1701783096; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z8Q+tw9hMByhgwAfqKX3Myaix874eZzGjH8g0AIxmfc=;
        b=XntU+KxcsAVKUarQvkyLGS+oFqSdHigNuTprKl5PZPAE/SfoWeoYMPPgI3/xc/BIsr
         sGKmjA+EsbUTGoRa+a9zTke/v08dhzxO1B5VfTd0YIDILB2yFvoFspz4EV5b4ac/gx5S
         b1CPyFRhQyn4PuXN2g//fWTN+1nYSgdxIIi7hE3NNZW0iw7uQ7lQg3+Dz+z6GpkoP4dd
         AiFqiYJYLwJkk2ntv1aiUuMkJwrKZZpCQgxa8uW7dQYDueOtpIDSNIcI78tWtBYZAeOZ
         Tdn2qo7oCcnGuqXzg9Of599Q6W4ELL1pAvo9SFZf323aijwxx+nSuMt612vIynpLpToj
         EYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701178296; x=1701783096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8Q+tw9hMByhgwAfqKX3Myaix874eZzGjH8g0AIxmfc=;
        b=enlR3rz7azFp7eMSG9up5MgtCk7nMWXKfpOTtx09L5pXTZxoat/di/AhR8SS8Nv62D
         14/oulqKxJBaqrNlMnI5GWiidRh54HHtr0llbdWXo/tAaKXiBmPpZS34ExUfalNa1Yrk
         T1JxDU1kVfjR5Y4AelL+Zhj1FHMCh8cyvw+De30YVI+qTvhUTHQTMQghFj2VsXYCMyX3
         s8U+oC/eFGHt+Vz8m+6HlYalwtZBmwP3QQrjtTVR+MnNQzTMlctQa6wl7nfBrbBx5weF
         szeYeF7pyah4LnNCEsoC9i29BoaSbv3DDtXpZK6lZgVCw7LkfoAdXD8QbcIT24f+w1Zx
         xxfA==
X-Gm-Message-State: AOJu0Ywmr419zqMIuYJNznnkbXh6ShkgL8x8IyFLnrsvC3AAAwLBncpE
	JoZ8piO8VerrIcX1q1VtWYFxwtcUw8VMWApY7KA=
X-Google-Smtp-Source: AGHT+IG9i7WiSCHSSGTbPTfJgI8cVRC/6zx0I/NMZyx/pY4ECTJLd0q4HYvAlrIqSYmB8bdc/XcxgJ6nSYbykJB41sc=
X-Received: by 2002:a05:651c:1407:b0:2c9:999d:8a5a with SMTP id
 u7-20020a05651c140700b002c9999d8a5amr5500987lje.14.1701178295364; Tue, 28 Nov
 2023 05:31:35 -0800 (PST)
MIME-Version: 1.0
References: <20231128131954.337015-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20231128131954.337015-1-alexander.sverdlin@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Nov 2023 14:31:23 +0100
Message-ID: <CANNYZj92XtmcpJpyo1eo04X1dpqPmU6cCKVhpP7aJnMK6RWPTQ@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: use install-nodedup make target
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: openembedded-core@lists.openembedded.org, 
	Peter Marko <peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 13:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191368

On Tue, 28 Nov 2023 at 14:20, A. Sverdlin
<alexander.sverdlin@siemens.com> wrote:
> Versions starting from 20230919 require rdfind; at some point new make
> target was introduced with commit 4124f8f928d5 ("Make rdfind optional").
> The commit is not yet included even in 20231111, thus make even the
> new make target optional.
>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> This patch will not help with 20231030 update, neither 20231111 will work
> without rdfind. install-nodedup is not yet released as of now.
>  meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb | 3 +++
>  do_install() {
> +        # Versions 20231030 and 20231111 require rdfind, newer tags will have new "install-nodedup"
> +        # make target
> +        oe_runmake_call 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' install-nodedup || \
>          oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' install
>          cp GPL-2 LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/

20231030 builds fine without rdfind, and doesn't have install-nodedup
target in its Makefile because that was only introduced yesterday:

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/Makefile?id=4124f8f928d51a1437e2fd2636b20d540edc2836

So what is the purpose of this patch? I understand that we would need
to use install-nodedup in lockstep with updating to newer
linux-firmware versions, but until then it's not needed. No?

In general, || in shell scripts should be avoided because it ignores
the reason for the failure (ignoring some fails may be ok, ignoring
all fails is not ok, as it will cause silent regressions).

Alex

