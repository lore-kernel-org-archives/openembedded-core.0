Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7396BC7EE23
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 02:36:40 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.50135.1686537399696784874
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 19:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ILnYSYNZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1a6945925ddso385137fac.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 19:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686537399; x=1689129399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y666+DBuaHWgVEj0CBMW+YKDBcQPzw3zkBleXSCMyME=;
        b=ILnYSYNZ8tL610d/a8mtWy0QciKrWL4KGwQgZKQ5YIQINdwAmNmBRpJhUxyGIWBtE7
         WzNEJVHnERHpiuOMXdFeFqck1lXRbAnoBeGgPZ5YG6RA1TT1an6odIvw7HWbB7sW9BXd
         hgAi198Yt4Q2MjtMN6LplAFV71PP2X5RTc4o/56KZ5sULk+n8NeKeDgluPovBtpf8DSS
         0ey1cTCmXIo7nweDgurkMcVcfv0AU/xxh/zRsGC015JX33RxH0nRrCN3z0hEPp9n45a8
         14xfYLRDlVF6e9RTxz/e2tQY8+51qD7Itko6Swz8svvb3Pzy0KnX/3VkzjxQ2tgfHRnN
         kY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686537399; x=1689129399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y666+DBuaHWgVEj0CBMW+YKDBcQPzw3zkBleXSCMyME=;
        b=MbI+Cb0Vt4Hezb2l5YGc9CJ4XNBtMv3hfeBdEEjOgbxNrFABROd0u60RZaenPq+lCQ
         f3VppYjhyAw5NUs5SrkM7wCQFHyPT5UVSbRDUY6zRazUrEYXnNJ8f+7amYK7LFQUPzXW
         hs2c0KXxoEkW1uNmPNEDAUWDEctLF2q3f6KyAdqBo5JzQG2Ifm5nw34RE+W/iV9V3N0K
         ivDZlIABTOs9XO0f2ALa9sJ6/hlNVHW0UTJD7yhZv0/Whob/5hq0BP53uubkxkXfKBgx
         O8Lmn1PLg0T1JswcKuWsObtMBnpfLNhebQQE9fnjWzUKrzVoqz+B9H3eklm97GTY3p0a
         JZMg==
X-Gm-Message-State: AC+VfDwvlqHtC+noUQelQSbboWcSHHDpMxRjK4wIb3NzIWzjW3sueX4b
	AbpZLtHcAA7W4PxZeymgaoIdq94woMZ380IHKJI=
X-Google-Smtp-Source: ACHHUZ6NSwFhNl8Fzlz/DW2+Ev1V6ybzsKcaRtxSbUFQj7N/hHYH61XUvFuMoTXEhAqmZ9Cz/xWjYoa2MCZkOV99Uqg=
X-Received: by 2002:a05:6870:7709:b0:19f:8798:3d9d with SMTP id
 dw9-20020a056870770900b0019f87983d9dmr6263678oab.27.1686537398817; Sun, 11
 Jun 2023 19:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soODCwk2xq-+XS7TW3L4S7ORZwpeYuHnhOxO3CL6DNg=g@mail.gmail.com>
 <2689.1686536247719554027@lists.openembedded.org>
In-Reply-To: <2689.1686536247719554027@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jun 2023 19:36:12 -0700
Message-ID: <CAMKF1soEn0OnuaZOTdOfvqNFWKcfFgf_NyxmKP4M5rGj4eghow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] spirv-tools: fix base_libdir when usrmerge in DISTRO_FEATURES
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 02:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182648

On Sun, Jun 11, 2023 at 7:17=E2=80=AFPM Vincent Davis Jr <vince@underview.t=
ech> wrote:
>
> Just tried that builds for me.

cool. Then please send a v2 of your patch series using that patch.

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182647): https://lists.openembedded.org/g/openembedde=
d-core/message/182647
> Mute This Topic: https://lists.openembedded.org/mt/99472427/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

