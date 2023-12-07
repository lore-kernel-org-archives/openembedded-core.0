Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2194AC10DC3
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 23:26:12 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.113118.1701991562124483664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 15:26:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dZvTxQmo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c0a11a914so15549485e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 15:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701991560; x=1702596360; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ua1rMvM05/HQrpkd0asq2EeOMjuHiyDUBEGoUOSYHgs=;
        b=dZvTxQmoIs6+XvqbDABcspOJenx/df6EG2erwx2A5PjNNO6x0+42vvmCDF2jlGW1jY
         A60jHe2cN71RUNG8X5gglEhieSqByhrjup/JmzREjBppQRWz5tl7VqbDs+kauaGIgOYa
         ohiIvJSktTE/uxk/iN1bB7oAInQ28ZJLkoWno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701991560; x=1702596360;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ua1rMvM05/HQrpkd0asq2EeOMjuHiyDUBEGoUOSYHgs=;
        b=SaXT0dUDBt+0Lmlp8RARjII2Ish0GJBxQtiRMM8tBDQfKHyFF7bozxYJLA1AHOnfmk
         7fcuiOhl/VEnbcbf1OMkkdjhw96gpK/0n2VcmjIq2oEz4O4BV0sle2t3ZcA0f5D5k/bm
         JjkxEuIY/4j5/KkdXLuAJJF7O3rLjbjAnheB3j94Oo78Nvwiwjg7bkX4I0nAWk5L35ZC
         IRj/EbbHrhzzTnF+CKld22JEzsx3gVdM2Xh+z0BRdI3Zrc2sTTqEsBIK8nJixBxzGSuV
         qqG6i4tQ7fBy7hF2kfSMP/UBy14Iw/+LvisxC/mVnjl1YbGr5qp9scGYYZC/BO5ri8Vi
         P8CQ==
X-Gm-Message-State: AOJu0YyXObl8XWmtNZJl8y2HYP7QH76/qe4ly8J1uF7UjGK4mb228Xd7
	unP2+2CP3y0T//5lEzMrcvhft+nHr4lJHNelNss=
X-Google-Smtp-Source: AGHT+IFEJnFtwY/n1ckFPzY+8u3siC1L19r3HxGhr2w1LGB1L7iaTdo0dKcLRS3o64S3y7LQPJ5Qig==
X-Received: by 2002:a05:600c:1884:b0:40c:1ce0:a24 with SMTP id x4-20020a05600c188400b0040c1ce00a24mr1735033wmp.88.1701991560486;
        Thu, 07 Dec 2023 15:26:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b? ([2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b])
        by smtp.gmail.com with ESMTPSA id fm21-20020a05600c0c1500b0040c03c3289bsm990190wmb.37.2023.12.07.15.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 15:26:00 -0800 (PST)
Message-ID: <db4abfaf9dfeead32dd8fbf1f620d9ebe4e128d2.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2] gdb/systemd: enable minidebuginfo support
 conditionally
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
Date: Thu, 07 Dec 2023 23:25:59 +0000
In-Reply-To: <20231205133754.906479-1-ecordonnier@snap.com>
References: <20231205133754.906479-1-ecordonnier@snap.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 23:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191989

On Tue, 2023-12-05 at 14:37 +0100, Etienne Cordonnier via
lists.openembedded.org wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>=20
> Enabling minidebuginfo is not useful if gdb and systemd-coredump
> are unable to parse it.
>=20
> In order to parse it, gdb needs xz support. Systemd needs coredump enable=
d, as
> well as elfutil enabled as well (systemd-coredump loads libdw which is pa=
rt of elfutils using dlopen).
>=20
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/classes-global/package.bbclass           |  2 +-
>  meta/lib/oe/package.py                        |  2 +-
>  meta/lib/oeqa/runtime/cases/systemd.py        | 21 +++++++++++++++++++
>  meta/lib/oeqa/selftest/cases/minidebuginfo.py |  2 +-
>  meta/recipes-core/systemd/systemd_254.4.bb    |  1 +
>  .../elfutils/elfutils_0.189.bb                |  4 +++-
>  meta/recipes-devtools/gdb/gdb-common.inc      |  4 +++-
>  7 files changed, 31 insertions(+), 5 deletions(-)

I merged this as I think it did improve things but adding a test change
to poky to enable it hasn't quite worked as I hoped.

I had to put a constraint around the test to ensure it only runs on
systemd images:

https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3D9c069e00a0867de11a6069b99a07d2c775848c10

and with that applied I then had this failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/7000/ste=
ps/14/logs/stdio

I can queue the first patch but I'm not sure about the failure above.
Any ideas?

Cheers,

Richard

