Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E1ACCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 16:23:19 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.19542.1761927789141515731
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 09:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fLyyUbgb;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8803e8f440eso5471326d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 09:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761927788; x=1762532588; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3vkr6HVIf4MyX8xiDID8PFJCWlWHkPC9CUtTr2mIB9E=;
        b=fLyyUbgbFRvBU1Qkx2qtst6o4slOYIZlRoIJnGwpOiKtJtHJpBRdHgRDQvC+WWhKuF
         oC/5UjJnbcnToTNbIi2JeGMqSQeXgEgPpIlbZWlGtX6Lc6wUCv/ttidRtbCLR5zehU/G
         y4CgMABq442hDsg0UevBIfxeFM5oy4CenihyT+Ce/9WBHcc+aQvUEnUfqp7VdIkuJQAA
         StRei5cq3VmZrTqE4NTuHcZ5w8mQTj5G+I/kDNGykqYP5iR5Zd0v55wnAvzLPMUjdWWy
         81s4iJR8x37SUcq7LmGQMSEssCx70bCaOB2owYGx2WoUXMXBfZxdznUMrvuqGxJoo+Ww
         dYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761927788; x=1762532588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vkr6HVIf4MyX8xiDID8PFJCWlWHkPC9CUtTr2mIB9E=;
        b=OFsyYpNjPRk71gRysyoX5NDrj18ULIuK0Ubovm3t/ViAQ0DvOm0blNSV6Q04EiE6e8
         ytlH4s5Sxi+ok/ZCQuYoFRgiWOgu5oH5G46XrCRumSJQj7l5SuvV19FB9vg9huhFX27W
         aL0oEKKnb2gDiVA3um4lh56bYmFB47J3X+NEilhBnelfbURIqnF2BmKDQTsQoIMHU3O9
         dSuUfM4BLii82Qtxg5IEnqimk3ovnmU28SG1zs8jU5hiwxipNBMkRML7V6gkNOPLTQe1
         Fkhq0gjLlH6CgcWkGz3Jo5RCqLsZi2j3PA0kYIFSq6rA5Sf5j8IoC3ciVWSYyZqnm1lR
         Ev8w==
X-Gm-Message-State: AOJu0YwoNi8Ce+QXsst+YuZcU1S3K7xJ6z0EsctCbgNae1CQ+KQBIsZ7
	AS2ZYpeH0bm0bqThlG1dcSzqBhi9zjatWBV/trwt5ep5JJTeAsm2rmD0M8Ak3qcq+8eiLwpTJXn
	f6bPvrILrwtj38ENS8DcTHRjpjMbrr4jmug==
X-Gm-Gg: ASbGnct+ScCxyuE8njl7Qcy5mGAwYDHySoXbZhFhyV+FtLkvm+Ym4E3TYWTmofczdag
	h8/nIkG/SISnxB72EQRacdFnyrIfPWYGpRrNsl6ViHspPF2cBJFXHRUHOYLJ694EGOxXvClfsNM
	VHUooeHPOvAFTimhmTr7w5fLkwK2Ru0W5SRpXfwoDUwVFTIXoy7dysG8i80iFRN1x7/Ja4aao6L
	sOwJKFjLPEvOnLRDNLC3k+o+2PYypfKqLN5hA9Q+mfTyJe65w2fK9bzKbaa7uShP+gP8T3MXGdb
	MYOUb9F8YMqqAKt6FO9zQ7K/MvQ9I+KTlOEh/SsXpu3yjhru9c0Ujos2IiCN+EPF07MQ
X-Google-Smtp-Source: AGHT+IET5eV3fnIshQfko1STqF0HgGwooT7YRNx1hgWJSrwYJoRp3QM/Nn09hAqKrmysrV3pTqxAplDT7nncdzleQvY=
X-Received: by 2002:a05:6214:21e2:b0:87d:e32:81c4 with SMTP id
 6a1803df08f44-8802f4db5a4mr53510936d6.48.1761927788107; Fri, 31 Oct 2025
 09:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251031030519.2602967-1-Qi.Chen@windriver.com>
 <CANNYZj_1CpU0svcA4mRWA6=mvY+GLgqruO50jACnUO439FO6aA@mail.gmail.com> <10e196ea-a7fe-4a86-93b6-bedf2e819ee1@windriver.com>
In-Reply-To: <10e196ea-a7fe-4a86-93b6-bedf2e819ee1@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Oct 2025 17:22:56 +0100
X-Gm-Features: AWmQ_blIG7KtQwWZImJTuAvWfqzTXZNpUJJPZldOIjpmXrPBeeArRXI246LV-PU
Message-ID: <CANNYZj8LecJZQ+egTA9+=NLBF96L61VUFMY3zFTfwYJq9cDyTg@mail.gmail.com>
Subject: Re: [OE-core][PATCH V5 1/3] base-passwd: add clock group
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 16:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225548

On Fri, 31 Oct 2025 at 07:09, ChenQi <Qi.Chen@windriver.com> wrote:
> IMHO, there are two reasons.
>
> 1) It will result in other recipes using this group have a dependency on
> systemd recipe. This might not be a problem for clock group now, because
> it was newly introduced. But such dependency is really unneeded. It's
> possible that they use sysvinit and they can still use this group.
>
> 2) It's better we handle such groups (sgx, wheel, kvm, clock) in a
> consistent manner. We either change them all, or we keep the status quo.
> I mean, if we use sysusers mechanism or change useradd.bbclass to have
> similar behavior with sysusers, it's possible that we can remove these
> groups from base-passwd. Because in this way, there will be no
> unnecessary extra inter-recipe dependencies.
>
> In summary, for a group that might be needed by multiple recipes that do
> not necessarily have dependency relationships, we can only put it on
> base-passwd for now. If we re-design and re-implement useradd.bbclass,
> we might be able to avoid this.

Thanks. I don't have a particularly strong opinion, I guess this
answer will be discussed in the patch review call. If others agree
with your reasons, then I won't object.

Alex

