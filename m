Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5035C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 21:04:08 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.93866.1723237445145023901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 14:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JjJUSQK1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.171, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso33487191fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 14:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723237443; x=1723842243; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KdKEOJYW/111kyNTxGvbPiYPUEqV45yymeXUXI6/i7s=;
        b=JjJUSQK1iPiXCGohsFIyi0WnKTIWayDZapIlIS5+CSm+hI5apdSfAoCJp+iHfqCKc3
         As3cQA+VIIkXb4SdJmNM0M2Wh36/wmRmG/AcNVQxEKsyOj/HiZzVnjcRZUj/qBLYEgwW
         ZK0FhJqGNszY+iaz4/qeUdtCF9/oUzHOkoPrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723237443; x=1723842243;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KdKEOJYW/111kyNTxGvbPiYPUEqV45yymeXUXI6/i7s=;
        b=RZAhBofLkbjotr9Qa4Q8toNqXbLM6iN9nGbV/FbvmUl9p5oSXlShEz9NJWMbSeQ1PV
         RsxIh+oQLheSgIbdVp+aBivWIQT3NGKzelAjwyZ5fCLUALcfo8CEyYMHbKT25mUliYcG
         ZK97UTIn51i2Ig7dkxbheMv9pmyVVQg/weh8IYMwsXr1ZKqFnu2T8d6lDrXDKuRsKV5u
         WT6BCfVSyNg9o7jwQaunE/j3JxR5Rl5Y1OsQMg9/i7y1Sz3XA9wo0L1q6zPkNcYenrnp
         xN5HFb28/UpX7/rCRpn/cbhJfmco5/skPgszlT+OIUu/vNd00U37uELRrg53gmK3lO9y
         ENAA==
X-Forwarded-Encrypted: i=1; AJvYcCVGFAv7+D6L8lgf9dRMRlN3ar8bon/Itw1mcixCCzfLNQpjnDoMQ6Catl05osqsRBbbHHCZyXHxUlvAhNoP5Ra9MdKmB1x8SDT8AZHvmHzwopGr12jDDU6w
X-Gm-Message-State: AOJu0Yxmwug0PlxfwfWesCYTaJPJeVVSmK2gS303RXhb+bbbma3aIHlK
	13fAzbWH9xsOoMVyJEjrzTOk0/h68PJQIKOOdObBoGzjZGWTxnQxvEkyNlFK+EM=
X-Google-Smtp-Source: AGHT+IEwk8piyr6Juohv4bxxV35glhWbxe/017IW2hSFfO7pAuamk2zw/S3wkhnMskT/S5Ps8t1+0w==
X-Received: by 2002:a05:651c:69f:b0:2f1:5c73:f215 with SMTP id 38308e7fff4ca-2f1a6d6f786mr17805421fa.46.1723237442788;
        Fri, 09 Aug 2024 14:04:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5546:7409:b74:3f82? ([2001:8b0:aba:5f3c:5546:7409:b74:3f82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c77510asm95480855e9.33.2024.08.09.14.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 14:04:02 -0700 (PDT)
Message-ID: <257eb995292da776f1d068e741dcb36f12f5d566.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] gcc-runtime: enabling "network" task
 specific flag
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Date: Fri, 09 Aug 2024 22:04:00 +0100
In-Reply-To: <20240808145042.3914762-1-Harish.Sadineni@windriver.com>
References: <20240808145042.3914762-1-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 21:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203178

On Thu, 2024-08-08 at 07:50 -0700, Sadineni, Harish via lists.openembedded.=
org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> Adding a "network" task specific flag which then triggers networking to
> be enabled for this task, it is otherwise disabled which will cause
> failures while running oe-selftest.
>=20
> Fixes the following issues while running oe-selftest for gcc:
> 1)ssh: connect to host X.X.X.X port 22: Network is unreachable.
> 2)Bad owner or permissions on /etc/ssh/ssh_config.d/50-redhat.conf.
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/gcc/gcc-runtime.inc | 1 +
> =C2=A01 file changed, 1 insertion(+)

This series looks like good progress but we did see a build fail in testing=
:

https://autobuilder.yoctoproject.org/typhoon/#/builders/145/builds/2038/ste=
ps/12/logs/stdio

Cheers,

Richard

