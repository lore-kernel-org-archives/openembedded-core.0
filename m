Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA52C7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 06:20:00 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.5603.1682057998154937555
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 23:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=o3Rst1Wx;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6a5fe1ebc42so726300a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 23:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682057997; x=1684649997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3d5FOINAXFtg5uUkBDrwMaiNpG7LTeTMFkpX/f47zeY=;
        b=o3Rst1WxrK64Q7Kf23Ls+5VITWtF3fWmZ3DOteF+MXTJe+DgZe4zcPqZjU3xRvF9Og
         9v4kNfs8STkitiSoacyBJtkuAqEJxy/gf/+M0XYA9DMxOm84XVa1qwoPXHDqBOeHfUh5
         bb3geNEk7kBlLLVcldVJFfCg0EHBlxlJXk8tfO8I+k59o+Np45S+yxRZIGLTxZSuE/5R
         iFXfaolCHyaJWwqS0PKyUddA2dTZXxfZJc1SjB7ZmZkqH+p3Bt2bfRVnNqhri+biiOG9
         0FCvk8dz9B5tmvfdb0u44MGilQlxBkxPqIu9M2eIKKovGpiCHx1dwP6CC/sqgMrqVuH9
         VrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682057997; x=1684649997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3d5FOINAXFtg5uUkBDrwMaiNpG7LTeTMFkpX/f47zeY=;
        b=fqNU3nflxCJhlg645qhAqPrtI+Ds3v4ly14AZbARi+kguZOkx1HMdenqQw59mz5xgv
         MpbXtY4QqdcFbyTvAQTj+alBD3l5LzFVjGTDtrS94+pcmbv40c99zeBB2reCa3tw1WWv
         zSXJ3gwiontnlpxhq1Qw84oqJWU6bEFz3QXiWbZ1hXP1wlBR44rXeB0bS4ZHXRKRuDxZ
         1LQ0JQoefyQ4UY2woXv6IU48hZMmNUvrW4aYhMLEoF7zqAYhn8SndikYnGcn5WttUrhr
         vdqiOdOcNjVIKB1nSJ4xnF4xI9lD9tY9ZemAH2XPTWM43Nm7rJY2qWsRhLLJbKG0eV37
         JmPw==
X-Gm-Message-State: AAQBX9c9zDoIWKENvKA1VzW0eTH4MD0TptbY+r1H2EsxnbH/+SXGWmu7
	65LjbSveqx4PE/NYw6oj5E/fzQBMkBhV+oALYa0BhDMm
X-Google-Smtp-Source: AKy350YjWLscbwVhFIA5zOqVl+R3X1rOtnSWflmIdVsplRtCwW+VTKaywVsG0DkJTd1l0f6vS0+koiJtyZhXOfCyLMo=
X-Received: by 2002:a05:6870:a70e:b0:177:9a66:2a88 with SMTP id
 g14-20020a056870a70e00b001779a662a88mr2986637oam.45.1682057997051; Thu, 20
 Apr 2023 23:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <1682057176-19939-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1682057176-19939-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Apr 2023 23:19:31 -0700
Message-ID: <CAMKF1sqsUoTbnvidb4uZ+UZqrLqb1LA=ck3gGwjwCRCfd1JYHQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] gdb: use update-alternatives for sframe-spec.info
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 06:20:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180275

On Thu, Apr 20, 2023 at 11:06=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> binutils also uses the doc 'sframe-spec.info'.
>
> binutils has a priority of 100.

I think binutils is right package to provide this info file. Please
delete it in do_install of gdb. We do not need two copies.

>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-devtools/gdb/gdb-common.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devt=
ools/gdb/gdb-common.inc
> index 925b0c2f80..338d1650d2 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -53,6 +53,12 @@ do_configure () {
>
>  # we don't want gdb to provide bfd/iberty/opcodes, which instead will ov=
erride the
>  # right bits installed by binutils.  Same for bfd.info -- also from binu=
tils.
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY =3D "50"
> +ALTERNATIVE:${PN}-doc =3D "sframe-spec"
> +ALTERNATIVE_LINK_NAME[sframe-spec] =3D "${infodir}/sframe-spec.info"
> +
>  do_install:append() {
>         rm -rf ${D}${libdir}
>         rm -rf ${D}${includedir}
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180272): https://lists.openembedded.org/g/openembedde=
d-core/message/180272
> Mute This Topic: https://lists.openembedded.org/mt/98405289/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

