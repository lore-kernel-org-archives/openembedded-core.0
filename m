Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386B6CA0EFC
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 09:32:20 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.13745.1756027933199832374
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 02:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MqPBEAjy;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-70d9f5bdf79so16221966d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 02:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756027932; x=1756632732; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfnHdCC9DV4Iz5u2G5s0IqZMQ2RiWpit7KKMLR4yc64=;
        b=MqPBEAjy2OLtsviVjaIdpYObx+RYCiCk2cPC8HBLaxu/OwK5/MT1UBtNAjh8o0Ib8C
         BNVh7yMEz40l5+Je6Ic8hU2doiEFv0qxEXjv0+rFw/IWLFT7WDRYwuaS5oET6PeJw4/Y
         3HMbIfF700nTfkIOdIKt5Y0KpxPt2I5srE22fT0MDCv9xw6l1D0izSZsNZt5qejVM8X7
         fhw6pNVeXecoUxVfB6DWD53PFk5wqxI3maOBATPCjo7CRIIUtKOW3kDcJmLanrrwVBVm
         a1/H9HomQRnm4ZpgLfATkMuuuG5friHmp+fBwhxP9OHjaW3x8zhBFfZDD7sayrdss83+
         7LYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756027932; x=1756632732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfnHdCC9DV4Iz5u2G5s0IqZMQ2RiWpit7KKMLR4yc64=;
        b=uvLgTKCnMAX3FtLtbAEwElOAJzse3qCnDobJkzLmDDAF55FzAoP6puwgVDQAfuBFqr
         6MnRw2vRrQ6Q1/w2lwym07Z3UhCROnpzrPANLwgRrHdOPjmChvJfYX9daxuAp2RK8XIJ
         w4H6gX9ut+/F6mmjlMYF5DFlU0Vqh9hbBf5T3vkyeYTLfXYEYSB71PjgWX78rPnu1Rz3
         fpATXRSFnLqg8ZMi4ycsymWrjxb5YHf3fMfftUiq0gAesoQhPViSMLWbkJlEC5qtkdEZ
         Y5vuc9DRiBfFMeWInf9h8pYCEg0R2t3fnQ4rr2O4BuZAQmbef+J0ubXHhPf1aPc6s2Wf
         df5Q==
X-Gm-Message-State: AOJu0YyQL22gbq0iS6rlARO7Oj+DMlZkCJ2EBhnMSNqX+JGeJv99wRa/
	Fl4mWNRpiouCpAHqpVTLfJpS3tYtmNdaIxh3sYsOZ2xWP63sx6c8wgLQpo5R/wTRRRD04/RujIh
	+r/eL4T8DeuOPbsBFSzHXSk1jA18+cSs=
X-Gm-Gg: ASbGncsHYNnc5U7QClkHj/vDR5n8l0rCdnoDzg7M+p4Z7Zs96qZcHDH9gDvsYeCPZm7
	yjyUn+iMvmYLi9PWNx5fqAhQ+q9jn2QkZQvLZWlTPZbiSQGQrcOMccgd4aDcmFAjhn0NcXKpCbq
	VxXZVaX0k6S5xe2+F8Pz/rqZE54tK4sTOKCFqQlfhjzcVfhR62JBTmvY/lCgffLGSkI+wbwPZx6
	Nm2SHY=
X-Google-Smtp-Source: AGHT+IH1mfkRpKNONrnMRjmCPw/N0YqoKIcpRqOx4DCPR6KcE/TCjzMyufwGbGakjVCjZaz0v+55HPu0MeGwURm9tCE=
X-Received: by 2002:a05:6214:5191:b0:709:b911:5f9a with SMTP id
 6a1803df08f44-70d970fc23amr92351736d6.15.1756027932181; Sun, 24 Aug 2025
 02:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250821131006.831214-1-r.gruenert@pironex.com>
In-Reply-To: <20250821131006.831214-1-r.gruenert@pironex.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 24 Aug 2025 11:32:03 +0200
X-Gm-Features: Ac12FXxYYTvgVa2JgwPYQKiYXU6-E4Nt-pol62TlEvFFb-H-QjOO33Uk1u5_pZQ
Message-ID: <CANNYZj8ryACqE4A99AXuCPD+SMPUVXW2HjyjWTogOmyAn2H--A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] scripts/runqemu: raise an error when bitbake
 was not found
To: r.gruenert@pironex.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 09:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222364

On Thu, 21 Aug 2025 at 15:10, Richard Gr=C3=BCnert via
lists.openembedded.org <r.gruenert=3Dpironex.com@lists.openembedded.org>
wrote:
> I am new to Yocto/OpenEmbedded and compiled poky by following the Yocto
> "Quick Build" guide. I later tried to call runqemu
> from a terminal different to the one I ran the compilation in
> and runqemu was not found.
> Wondering why it was not found, I ran it directly as `./scripts/runqemu`,
> which was a misconception I had because you are supposed to have
> `oe-init-build-env` sourced. However, there was no error that told me
> this when running runqemu like I did. So I thought it would be
> good to add this error message to notify the user that bitbake
> was not found. At least it would have helped me and saved me
> some minutes of head scratching.

It's better to trim details of your skills and personal experience out
of the commit message. Describe what the problem is and how the patch
solves it.

For example:
- what happens if you run runqemu without having bitbake in PATH
- how the patch solves or improves the issue: what happens when the
patch is applied.

> +            raise OEPathError("bitbake could not be found")

This should be improved:

"Bitbake is needed to run {cmd}, but it is not found in PATH. Please
source the bitbake build environment."

Alex

