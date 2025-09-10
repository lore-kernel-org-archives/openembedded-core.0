Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4232FCA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 11:17:01 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.14875.1757503018592683045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 04:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KDb//QQQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3df3be0e098so3653118f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 04:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1757503017; x=1758107817; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uQkvyMQ1eAbTv/0WlB1goDKQhTNpiEUqM/KJ55AF8d4=;
        b=KDb//QQQvGvy9nnyUKxO+qqtw7HfDEodcOC0bOA+FZdfjbYpzFG2fr7okMprtNg5lP
         x20ovPIc4mAwVsee8u3sBiX/aArBapOdjntk0nu7Yi7imTRXe6N0BInkou0ltl81CMiw
         sSTKyNzfNe6jNgTsWRTiutHJbYueggrI6WaT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757503017; x=1758107817;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uQkvyMQ1eAbTv/0WlB1goDKQhTNpiEUqM/KJ55AF8d4=;
        b=BqdBbKlX22qnt1x8OWgZ+TCUjy6Ukzxu+Tp/0nQTU+Uc/I3lphXy5pCMMWuYLkdJJJ
         qgl3w+EhlqMxY35ibYrRwsyAQAS/SUv7CLDuup3FRUD3qIGcV9Mg3+PkE4b31EFhku/I
         pogmGR78BR66KTvy2Sc7hlTdQSzx8b9Pp8vJQDl9AT73c1vCcspjCk7sdEBjnFok6DpF
         dXPfUgpRU3Rg7rkELDcKM6XRPjc6+4vFypyDr03Xs+qFCaLfv6czERhHWZVFNUbhD+df
         FfkyYibM/a9MLX6gzFSgQiAEXuF9D7UyNulYP3jmnQKfQFCPXORerMeDiqIR6GKqY4Dm
         3NPQ==
X-Gm-Message-State: AOJu0YyvvPvjSNrSwwXL3ozy4rt+BZhl58MNR5DUUofU6y76+g7JxUJJ
	pKQWG8fJRA+ZEztbxf9z1iT8TJulHty2anWS4XOlzMkGtaEtYqb7Weh5VJYW0nte+4k=
X-Gm-Gg: ASbGncsAdjOr+fDWsX4sNnHzN/B5vqxegR7nxXJqu0sUWj/8/ZqhNq2h4AdPuKufqv/
	u62Nkp5fAIExItNbRl+J+Lf9b4wO/rARhLlxWnDFMfJPwlXJ3kS8geeUqbtYQBHVLwuT/qd5+nH
	DTKYpffSPqPJ5kynAPqCBKEz9nQxuEqK+2BbAI1fpIMDaw8QZIpsiCdyiwcofTYAKABd4DQMhJt
	GClf7jbcudpiIgWMW2SfIF+zSIv2KFW5vklJ7QBtuhEwf8TFt+Gqkjip3uChnRX+u79zWzFBwe3
	L/vtSDL0AM4HpSFd/X9SRJYw0H/4IGjblkKL0fKUIDGei/gUkN6FlrwjU8pNoZ9fbI/epGHb6nL
	Z96XjvkpQuI8zVH0FC2VIPiXtxATciK80dE7Ihe12eTvGxI7VE4cx84IMaeeXmV90y3skjbxMWU
	V7nnu9MClmlcSU6YUWqSt7og==
X-Google-Smtp-Source: AGHT+IHk9SJ0TKx8+yTddqI5BoAZv8XT+1vYn9242l600FB7W/CXT+8Z0vDI15MvnNgm7xkhrm/dgA==
X-Received: by 2002:a05:6000:400b:b0:3e7:47f2:253 with SMTP id ffacd0b85a97d-3e747f205damr10869318f8f.56.1757503016909;
        Wed, 10 Sep 2025 04:16:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3ead:2ef7:6003:aff8? ([2001:8b0:aba:5f3c:3ead:2ef7:6003:aff8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df823483fsm23922495e9.22.2025.09.10.04.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 04:16:56 -0700 (PDT)
Message-ID: <c2e11f23330c22a09a7e98a789aa2b26bd260ad0.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/4] kernel-yocto: 6.16 fixups and genericarm64
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	mikko.rapeli@linaro.org
Date: Wed, 10 Sep 2025 12:16:55 +0100
In-Reply-To: <20250910050822.3273330-1-bruce.ashfield@gmail.com>
References: <20250910050822.3273330-1-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 11:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223204

On Wed, 2025-09-10 at 01:08 -0400, bruce.ashfield@gmail.com wrote:
> These should cover the first set of warnings / issues that were
> seen with the 6.16 reference kernel.
>=20
> The first fixes vboxguestdrivers in meta-oe
>=20
> The second is the qemux86 configuration warning fixup
>=20
> The third is to get genericarm64 building and uses the changes sent
> by Mikko.

Thanks!

I don't know if I missed a patch or something else went wrong but the
number of warnings went up. The ones I spotted are:

qemuarm:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/2386
https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/2343
qemuarmv5:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/2207
qemuriscv64:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/449
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/468
qemux86 + poky-tiny:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/2384

Also warnings in other layers:
meta-agl-core:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/2209
meta-arm:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/2245

and meta-virt which I suspect you know about.

The build failures are resolved though, so progress, thanks!

Cheers,

Richard

