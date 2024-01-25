Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3974C47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 09:25:53 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.13499.1706174748441046238
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 01:25:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RBC99oMQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5100b424f8fso2710177e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 01:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706174746; x=1706779546; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xCgYHXgI6lD2HMqFexenEb7PpVeFUEwsQbLXIuBndGE=;
        b=RBC99oMQCuXWJqdY7GVOPKGJkln/+lx7WrLWJy1RoCVW3t38vXPc0yhC2HgYEN3XHV
         j4jQ7BoXQdkqcT+kEbP2U42tnM0bdws6NmVU/s5wTvmkePp+41er9CcVabM/wZMmCF45
         8GZyKgfsC59nFYlWbZXKfQMCzpzp0kBS70MfcY+Abr7G2my8el2FmdglkkQBY+riMdIF
         3Cu3i/Cthi3bWGHxvEcm+cOml+GrqRn5aShfeFqZ9WgFikUZLZSes9gR1mrDCzjUmG0S
         Wqc3xeOBdBGX4d7CqF3gtC1CuXtnS49pF8ZN78BIOakd1cAYc4uaavCQhmMlWzB5h2Zf
         gtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706174746; x=1706779546;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCgYHXgI6lD2HMqFexenEb7PpVeFUEwsQbLXIuBndGE=;
        b=AZArBpFVi+CKLJRUuNfVZRshLZMkpkmaYsMUbfp+B2lc1isXwmN54aISJRhy0zSnxQ
         Yi/PGwGzyu6NumIaIEx7kU8WBtEGbBLfOww0CaviTnuWonTadqtko4JpiO5CGXyBd9X4
         MVXk/FqY8cav41JHYgkTmFQ0EVkobr1uX2mM5rw1keLBk3pEDeyPh1rfK5U3TLRbEPH+
         zt/Qb6yyY8FSFwkLXRvvyCKBo0cFUYr5qkCfpbIir+tCLfRVgkfNAOWMVA8xSZjpeVal
         KpwJLmQRCXdXcH1qMnF3h41HA9FXQ9k/v4vtOUXBZLV4k72/MAjhttPIFxiV8BhfPsO0
         4JJg==
X-Gm-Message-State: AOJu0Yx9/+eKCSYy4ITvsnIQVrQrTIbC3EY41BfD0xquBUhy2wa7a/GC
	2tiv/noS1/O1u9/cdrstegJ47NkO0YsL8N7zTCQZsDyLlx6OedXGjOgDFU4sDaZKnsWzww5bOrf
	OnI1f64q6Vp9g//qyhgW/CyDD55Q=
X-Google-Smtp-Source: AGHT+IHt8EHuFnVkYD6f5tphiMv7qaivApY+s/a6PXhR6vWm+vnj7bafkvP3Po7aKKobI5U9bMdPxx2pEqm1CbO5adk=
X-Received: by 2002:ac2:4a69:0:b0:510:ecd:d2e3 with SMTP id
 q9-20020ac24a69000000b005100ecdd2e3mr302297lfp.53.1706174745723; Thu, 25 Jan
 2024 01:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20240124090402.3126423-1-chi.xu@windriver.com>
 <CANNYZj-XFMk+Zburj-Q2xLk04BWg=qv8Kk0+=XAOwDdKpjpkQQ@mail.gmail.com> <DM4PR11MB5390ECC49B2DB7A888D1209D9A7A2@DM4PR11MB5390.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB5390ECC49B2DB7A888D1209D9A7A2@DM4PR11MB5390.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Jan 2024 10:25:34 +0100
Message-ID: <CANNYZj8tmsQDN1X5oa8t7ao1N2pXeXjKhTkMPJ06kPJt-u7wzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] xz: Add ptest support
To: "Xu, Chi" <Chi.Xu@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 09:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194309

On Thu, 25 Jan 2024 at 03:55, Xu, Chi <Chi.Xu@windriver.com> wrote:
> > I still don't understand this part. If these scripts are executed as a part of
> > standard in-tree unit testing, what prints PASS/FAIL in that context? Shouldn't
> > we reuse that, to replicate the in-tree testing sequence as much as possible?
> >
>
> According to the description on section 4.2 in 'INSTALL' file of xz,
> "The shell script tests can be copied from the source directory to the target machine to execute."
> So I copy them to target and execute them in ptest.
> They don't have out put like "PASS/FAIL", just return zero or non-zero, so in run-ptest, I print
> "PASS" or "FAIL" according to the return value.

Thanks, I confirmed from the source code that binaries print PASS/FAIL
directly. Shell scripts only indicate the test outcome with a return
code. Then Makefile (produced with autotools macros) prints PASS/FAIL
for all of them.

So run-ptest is fine, nothing needs to be changed.

Alex

