Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597AFC02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 10:46:54 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.37573.1738838811826569286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 02:46:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ifpFx0tn;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6f53c12adso59190985a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 02:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738838811; x=1739443611; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6xtVc5yHYLRzqA5H5GLRkW55DRa4eYGpuvlraFGhP0=;
        b=ifpFx0tnx1InF4IOv/UzuaN6CYdPolIosQcQl4XnO7NYmCGOb8Nncx4uwbq9i/EsRv
         wmct/6tH+GmkHgJAql5+witNqmcaKdoXdsZAEA2sn6FyytksdVXT47+DvZLV07gsmLhk
         0FTSjtqkksI6i5jP/+eJbPhm5nNkKb/ezlTtt8riBcz0YZa+iY4jyHaPSwF2Etpf5H4v
         /WNC06b/slrDxgcZsAae1UGQS6KGQlWIyI2cpf40r8U/d0PtuEKjd0t1JxZFaAOPJnrp
         N/rf97ld3UNcBUr4e4EF6+TnH6wozoNCACMDLO2SsGJvXNY6qhjv7bG0wF5q2ubVyIzS
         VJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738838811; x=1739443611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6xtVc5yHYLRzqA5H5GLRkW55DRa4eYGpuvlraFGhP0=;
        b=mLaL/j5DieCEBaifXU0bfz2VQV/93tVRm/0tn1HDXagbVLO/btDXLG47CPirO7hGUd
         ad9rV21qbRi6SVpP01rePT5e0Yxi/cDusUK7QOhJzOWh3KwBQZpkaGVry8fByEV4X5fg
         /Sh8HAsgF4gB1fkiGZ6ljp+osAGvcM6bmoXV9CsmgDb20Gzbk6WoOgajkDnIVzzmxcit
         U6ttst7VbYndLWO675W677tdJC0FH8JorE35RUAfJgYs3xENd1A2OAitHqKRSSBPKLaX
         R1IxjCJKXaHQSHpc2+kVGztLqoIkIm/WN89ADk/jKcLM/PV+apUu4xKEMz5G8y6+y8xb
         jpjQ==
X-Gm-Message-State: AOJu0Yz7RZPljMQebKOAECIttVR3bjOw8vaWs29R/rN+apcRHeCOnq65
	uGsnNYVrkx34ujfK3eps7tGBIcihhbUxb1a0h/7FSkW/Yyg7r7/oSvJz4bnK6TVJjWzbVPNHLm5
	B+vDYYrRBrBi1NU/WA5Ia/4qLD/4=
X-Gm-Gg: ASbGnctYVMpMt89Gy0+ag03vHpWK1tedruq3BZrCq3K8m7j37GjMJbbxCeI6Jz9QYTk
	KBB1zH3ZxN2UkJRnt2WdyHixc4tjQZpa5fRsi/C8++FSmNkgN9hGa4inbCBtig2KMM8wOEez0+u
	PPKbo++8dW02QCqFRZzRMkLavMsupvDWk=
X-Google-Smtp-Source: AGHT+IEic+PeJwQpGf+Vu6ZPkUqADBSLECa1DlwDITLAXODk19CZd6WnHzFfWpv0VN41stVQOt0H/1fiuMFTO1RMel4=
X-Received: by 2002:a05:6214:3bca:b0:6d8:a76d:b66c with SMTP id
 6a1803df08f44-6e42fc3854amr69115716d6.30.1738838810815; Thu, 06 Feb 2025
 02:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20250206055222.3319167-1-zboszor@gmail.com>
In-Reply-To: <20250206055222.3319167-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Feb 2025 11:46:40 +0100
X-Gm-Features: AWEUYZkgbvYwAZVc0r4r4K9_fQyFj-2RxJ9ZR-rw9GZxNxx_STBVFyWho9r_s-k
Message-ID: <CANNYZj_yTPvtPO+yX5Tir_EZdJcyWg1RxsCsd2gj53M+yihYng@mail.gmail.com>
Subject: Re: [OE-core][PATCH v8 1/5] rpm-sequoia-crypto-policy: New recipe
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 10:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210916

On Thu, 6 Feb 2025 at 06:52, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszo=
r@gmail.com> wrote:
> +SRC_URI =3D "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;p=
rotocol=3Dhttps;branch=3Dmaster"
> +
> +# Commit ID for crypto-policies 20250124-1.git4d262e7.fc41
> +SRCREV =3D "4d262e79be1cd15c84cad55ad88c53a2d7712e85"
> +PV =3D "20250124"

Do not set PV at all here. Git repo doesn't contain these tags, or any
useful tags actually.
Set UPSTREAM_CHECK_COMMITS instead so we just update to latest commit
from time to time.

> +do_compile () {
> +       make
> +}

To fix an error reported below, use MANPAGEXSL=3D.. prefix to make
invocation that points to this file in the sysroot, check the upstream
Makefile.

Alex

