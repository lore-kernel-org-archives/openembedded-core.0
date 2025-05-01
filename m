Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D39C369DC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 13:34:52 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.12243.1746106483100267816
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 06:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JzvvFlAE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c1efc457bso636643f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 06:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746106481; x=1746711281; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5e+yNKGXD9yJvp+z8P5jIR6TPMCJrTTFJeJiTg+2qac=;
        b=JzvvFlAEVZ7HNEVMXeFzkW5C3VxoRDaP9oc1xJCZtpznbEiRjOM+ZBvL0fQwzmW1TM
         eLo4IJu387l6a13QdF9YReDhJqowKKZ4DdtbHtz9yFpeonlHwHLddGMk+C1TCKEZuKIj
         d/z3TskkigvG2hRI21517UpOZrq0vv1Kb0dY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746106481; x=1746711281;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5e+yNKGXD9yJvp+z8P5jIR6TPMCJrTTFJeJiTg+2qac=;
        b=t7GCZJDG0optgmNeUxn1/rGiT2vioArS6eTK/xeLRcxi9eBkw7/NHe738zCUyR1mHK
         m61KlPTFb4nRHg2aJU06Xg02cJCTcVa+1f9MheoR8JjKHPCjNpFaMKVZ2WIUT+e8/fOy
         SoDFc3wWc62tAgHo6gXV8Nwq790TZkmrmxOVa0yLNDmry/Y+7RuTgCls+rAKHY9PLIAT
         zG0eydRlDOiu9VVlSX2AldyieuSf8eXS+JNTTb3fmWAzz1uAYlWWHqq4gGE8OKxbGTHI
         oAh9HKgW4qbmcCErju9hNBBInKlvHpR0F0GXAx4qUd6qQamTnVKlQo6ggk8eFPWNfoUg
         oaMQ==
X-Gm-Message-State: AOJu0Yy60M27g9PTkMcBgjkUWJq3vT0hzISLJbh7jLEeWBnPmpF/qJQ0
	gexapnwaPiU+ajBN4cS+DErAd8RvLnNBiNdjz9ZP3se3/Agdy1itLndlfyThvbk=
X-Gm-Gg: ASbGncsi8f0NsTeRTogahxuse5df8halV4TtofIYbGTqpBOrZ+9CNPe6OHpB26xBVWE
	yfNC15EG0DYZ21DD68ax28K+T3YmTQv0k/Ag76XRyWckA2yWyUkLT6b84kylaBbukh81Blvxqji
	DdL231mMDTjAq1EIVi1SDi9VP3nCcHCGxWTbrsR8Lrsmfl/uM0F8fT5IdVJhsmwJFAMWzWkXMzm
	9GzPHhjxozKvMhhf8l1tlNwI26AZZGza0l8JmDh1x2SzEiMDx/Fj2Y/ZS3NKv2ax2h3FXODmCfm
	F8UwRuHlXPD7INtYked/giZ5bs0GjCKdjUG60fHN4U6jEmrjACFxLFVbNwRS0/biMCjDJwzZOUV
	lf/dmzqCZRHsxyY06PjWKQbARLRxLN0gb5kYS6iUP
X-Google-Smtp-Source: AGHT+IHVZKZcsbds8hpOqzxmBDwqVC92ECuB5b6BnlbPzmpjvAbc732RSAy838N74+E+CxWmAZbFhA==
X-Received: by 2002:a05:6000:1447:b0:39c:1257:c96f with SMTP id ffacd0b85a97d-3a08ff555f8mr5696854f8f.59.1746106481274;
        Thu, 01 May 2025 06:34:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:51d0:373a:bb39:f60c? ([2001:8b0:aba:5f3c:51d0:373a:bb39:f60c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a3df73sm863726f8f.8.2025.05.01.06.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 06:34:40 -0700 (PDT)
Message-ID: <7fb64f75433c27ba79046137a53b8cc4bf2312c6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] util-linux: ignore mkfds BPF related ptests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <Ross.Burton@arm.com>, Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 01 May 2025 14:34:39 +0100
In-Reply-To: <95D57B65-8829-4CEA-9AC1-817CD298F4DB@arm.com>
References: <20250501054339.3770986-1-richard.purdie@linuxfoundation.org>
	 <95D57B65-8829-4CEA-9AC1-817CD298F4DB@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 13:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215771

On Thu, 2025-05-01 at 13:13 +0000, Ross Burton wrote:
> On 1 May 2025, at 06:43, Richard Purdie via lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > # lsfd/option-inet has races in the test script:
> > # https://github.com/util-linux/util-linux/issues/2399
> > -./tests/run.sh --use-system-commands --parsable --show-diff --
> > exclude=3Dlsfd/option-inet | sed -u '{
> > +./tests/run.sh --use-system-commands --parsable --show-diff --
> > exclude=3D'lsfd/option-inet lsfd/mkfds-bpf-map lsfd/mkfds-bpf-
>=20
> I=E2=80=99d like to see a comment in the recipe like the lsfd tests givin=
g
> some context to the skips to avoid having to dig into git history,
> especially as the intention that these are being skipped temporarily.
>=20
> For reference, https://github.com/util-linux/util-linux/pull/3343=C2=A0is
> the upstream PR to use GCC 15 in their CI which _presumably_ sees the
> same problem.

This was the final piece of gcc 15 so I merged it with a small comment.
If anyone wants to extend it, I'm happy to take followups.

Cheers,

Richard

