Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18ADCD1288
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 09:43:10 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.33710.1711964584251106056
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 02:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HTvEV2d8;
 spf=pass (domain: linaro.org, ip: 209.85.208.52, mailfrom: fathi.boudra@linaro.org)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56c197d042fso4591868a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 02:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711964583; x=1712569383; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lOu4T3VnSW/eF/L32c1G+tZbPSKqexQnP0YcNHjKQqQ=;
        b=HTvEV2d8/KD0+EA+bbco6rt/4/jwX0KBZM+E2fQO/wsc4oMcd/Dry61sokBxUvGSYm
         1puuOP4LjaMa4f8UfnNIBCbLbaNWCAqL2UfpqVTHU+WgLWJ1CHWTVHpZpo6U9omUNZoQ
         zcqRdZ8bKHjARs7r/p2QoBiNvuondYkj9t6J2BteakucVRAMElSk1AzvmqhTTQAPWrSL
         YywsyHArPQgc4GdztGAV/kpQ3mmXsALDSgyh2Av9tpilp3IeQEg/hCWIxnJRYqKinWM3
         ODYG6slKAY6GMurjmRXUvdoArbc9A1bZdeYDKNcy2TxZ9NVlgZe5ydeIX59WYu055zpw
         fQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711964583; x=1712569383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOu4T3VnSW/eF/L32c1G+tZbPSKqexQnP0YcNHjKQqQ=;
        b=vHuYDCaV9ZogivKySuJgnKnUZrouH1BJqDNDUBAfazfV1WeNexad/8x82aeIWxcXV2
         s869NDLKEt50Ofw96QN/Zz6YvYqPbFY9U+lGLdjMoEIap2oEN7sNhCmRUkiCeRmfxaZT
         6FDbEP0ELiV2nm1zxQr/jHBJ8RJPAhnFT2xozzlnck2w2dCfw/CQTw0kyJPjt4EIFNOJ
         LMtSkq3yFPE3QD/IBikg/t0qfPv5x0Ms42udzrgMQ2zg2we/WWhrux70b0els2DpfI6W
         X3ZnpjFnATNR7VXSzypfFt+uInx1TKXOkpT0ecGESybMNUviOcuT8Fdwv9Hfp0NtYy+5
         +Heg==
X-Forwarded-Encrypted: i=1; AJvYcCU5aW7ozByzZ7u1cxUyclZex3YRGb2R6NwCKzogXkN5K+kQ95Mrb7VTatqFk5Dzqm6k6kq05zDE+8pIEuGJ0g6nZSjxA+xk9orCGA/7vdQo0xZAecHaodJ2
X-Gm-Message-State: AOJu0YwLEAnXlnRzz7JDoXMqtDOsiN6y9OJLAZk2amJsdH1p0OQfufK/
	xnmjOzW3TWyt6VHJ1IgICuyaBud0qAESBH34qz3IkY3c+6cJa8gkY8vO8+1W6BKamHaPgrqCMQc
	TCjUl58/DSIz/EjEfEdV54hHLZrYXpsEQvkJMbg==
X-Google-Smtp-Source: AGHT+IGVu7WbVlZPaBeJM28WPQ8DtAjJf/VRkDkg4ckOwbOvbb7Fu/Op+Eus3Ur0hTYnEArfxSq7LDmcYGkIMMnpmHc=
X-Received: by 2002:a05:6402:4315:b0:567:29d9:99ae with SMTP id
 m21-20020a056402431500b0056729d999aemr6623827edc.28.1711964582579; Mon, 01
 Apr 2024 02:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
 <1710313714-12541-36-git-send-email-wangmy@fujitsu.com> <2d88c7fc227e44acf14470103dadd92e026b62f9.camel@linuxfoundation.org>
 <36b1d7d1-c1ea-4d1a-b7a7-27ff550cdcc7@kernel.crashing.org>
 <CAApg2=Tq7i4u3+U9iNXQufH8kKwnfty2OG=OUeL23j9PT9gFJA@mail.gmail.com>
 <d21d06c112a43b8d29ab98a05a3088a16c5d4dac.camel@linuxfoundation.org>
 <CANNYZj8DCqKE9_ftZTKfj8UY5tnDUnPhETN++3SjeNDT_S4_iA@mail.gmail.com>
 <CA+chaQd5mQv5ciJWbXHG1OdsQ7AW_H8dfVJrNaTV-p7qiqHusw@mail.gmail.com> <13c0dc257dd36f6048561a1ce6b2f76e9a04700f.camel@linuxfoundation.org>
In-Reply-To: <13c0dc257dd36f6048561a1ce6b2f76e9a04700f.camel@linuxfoundation.org>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Mon, 1 Apr 2024 11:42:51 +0200
Message-ID: <CAGNsrLBM7DptiF-7t_B5aK=v_uBcYD52Ksp2ebgS44Ny0NvxaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 36/36] xz: upgrade 5.4.6 -> 5.6.1 _WARNING_
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Martin Jansa <martin.jansa@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	Mark Hatle <mark.hatle@kernel.crashing.org>, Marta Rybczynska <rybczynska@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, wangmy@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 09:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197681

On Sat, 30 Mar 2024 at 17:18, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2024-03-30 at 14:06 +0100, Martin Jansa wrote:
> > From what is publicly known it injected malicious code (through m4
> > macro using payload hidden in obfuscated compressed test file) into
> > built liblzma.so.5 which then hijacks RSA_public_decrypt call e.g. in
> > sshd (when sshd is built with patch adding systemd notifications
> > which brings liblzma dependency to sshd e.g. on debian and ubuntu
> > based systems).
> >
> > The build systems which just built this xz version shouldn't be
> > affected (as it won't be using the liblzma.so from the OE build on
> > the host).
> >
> > This publicly known part should be OK for OE, but it's right to be
> > worried about the other things which aren't known (not only from
> > these guys or from xz project).
>
> I concur.
>
> It is worrying but I've kind of been expecting something like this for
> a while unfortunately.
>
> We need to watch what is going on and act accordingly if/as anything
> else becomes known.

https://nvd.nist.gov/vuln/detail/CVE-2024-3094

Distros have downgraded to older releases, still trying to figure out
which version to use.

> Cheers,
>
> Richard

