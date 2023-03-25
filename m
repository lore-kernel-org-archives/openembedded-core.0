Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA74EC6FD1C
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 18:39:13 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.28144.1679769550013471343
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 11:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pM0gWxOY;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id h9so4983425ljq.2
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 11:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679769548;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H7LnSOlqnfyamDqaJ3meENyOIu9JtbHgr/psJ2chIOI=;
        b=pM0gWxOYnrW5XSyw6KUaW5P6bNYu0U7VpjbAZ7CTH6yb8gU/2fThT2i8ElYQRJuk+Z
         wz6fWO/U57Ho2DA0hn9dJG1YbbzYGU24kKS/q6bXC5C7P9YBpZ9IbTuYRXJJT6L2quXH
         IkTwDvCHLFccmhUYAsrgs8OqlNihPeqB/tOd22nJE+3yTiDKlBa5Yd9SGQu727SYe3s5
         eN0yTBBShfnMUiDnnniSLFcmzLdsa39qw9TdPYq29H38dNNu82wuAFm4oippn01gEJDE
         z+tklPOKkijrC8ZRzIPqGSOyZhhVT4LYlA+/w+ao2TVtNZKIvZfR5IAmuK7tQNuEAlwf
         L+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679769548;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7LnSOlqnfyamDqaJ3meENyOIu9JtbHgr/psJ2chIOI=;
        b=U6MGJka56fc0Bh/gynFsc3LipY1/UegECErAWkehYPYAOj/ZqllLUg3V+6SCKWWigd
         71N1gvCxQNd+1Pv0rXlaHCzqJF0w5wzWPUy68IytAwgv/ZPX2w/BdDQsmJNjZF4MhGqR
         9JuG6seJ+g8jEftsR4aULwpNOo5sqo0OJQJVjpa5mlbBN/x63KW7vRULI5My1C4mhNjE
         Kcm/y53Tt31OhIc+ErYtutjn4sUpdG/4/QH70me7/IVUfy2UHEnUYSyRXAOLHoKCNYV6
         0Gb0enPF9al0VSJ2Rc5BWJm84Zuu8KAzz2fedqAzyuYy0FSvsAwB0UHBSG0Ds4cgUOQv
         sWrQ==
X-Gm-Message-State: AAQBX9dSRWscxUOttYVY2CzMpvV4gLWAXg61zHoDpac/OrOJOuhX77HM
	WM46ka10jAAOnoIpQx3cF0k+Nr6dlfIx+STecJM=
X-Google-Smtp-Source: AKy350bWcIuvXBjONYZhhDhz/eBMNQMNd9R+yfo0v7gzhCHZnVvFxdpKXnb2UxX5dlMROKIGr5DdfUBlkjZcepJeLm4=
X-Received: by 2002:a2e:3203:0:b0:298:b337:c11f with SMTP id
 y3-20020a2e3203000000b00298b337c11fmr1992667ljy.7.1679769547901; Sat, 25 Mar
 2023 11:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230317060202.385862-1-f_l_k@t-online.de> <dd5e0f7df463ddc2733dc126beaa3bf29eb8d49b.camel@linuxfoundation.org>
 <9FONRR.ZLSABXKTP67E@t-online.de> <a1807744c2e652e0d05c1c313039e697b2b07d1e.camel@linuxfoundation.org>
 <B0EORR.JWJ884MGYK8G2@t-online.de> <CANNYZj-ZHjZ9nihVrLeNgf_eeT-+k2uAGuZQEku8YAF_a2vd3Q@mail.gmail.com>
 <CHRXRR.A1NILQGNBS7P1@t-online.de> <CANNYZj8CgeTaT6Xn60dUZw9W+vDQWrBZ7y0bFfyPCu++-NwWUg@mail.gmail.com>
 <1TC1SR.M6OX77V0K20W3@t-online.de> <CANNYZj8eyCvwacnVoQui+ghL=cN=D8yDaBWAV1eBtvcz9qPOGA@mail.gmail.com>
 <UHS1SR.41XVDUNLPY6P2@t-online.de>
In-Reply-To: <UHS1SR.41XVDUNLPY6P2@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 25 Mar 2023 19:38:56 +0100
Message-ID: <CANNYZj9AJpny7V47e64KQsmCOitU1vAkzO=C_3+cwOETwtAM=A@mail.gmail.com>
Subject: Re: [oe-core][PATCH] Remove usage of /var/volatile/tmp
To: Markus Volk <f_l_k@t-online.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 18:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179101

On Sat, 25 Mar 2023 at 00:13, Markus Volk <f_l_k@t-online.de> wrote:
> busybox:
> File "/home/flk/poky/meta/lib/oeqa/runtime/cases/ssh.py", line 17, in test_ssh
>     self.assertEqual(status, 0, msg='SSH Test failed: %s' % output)
> AssertionError: 255 != 0 : SSH Test failed: ssh: connect to host xxx.xxx.xxx.xxx port 22: Connection refused
> RESULTS - ssh.SSHTest.test_ssh: FAILED (8.09s)
> SUMMARY:
> core-image-sato-sdk () - Ran 71 tests in 43.593s
> core-image-sato-sdk - FAIL - Required tests failed (successes=2, skipped=68, failures=1, errors=0)
>
> There is an issue with mdev-busybox but i guess it is not related?

Thanks for testing this. mdev-busybox is actually tested only with
poky-tiny distro and core-image-minimal image (where it is used by
default), so if it doesn't regress there, it's fine.

Alex

