Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D783AC87FCA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 11:35:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.49671.1754566552959911983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 04:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D2EFU2Gv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451d3f72391so7679815e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 04:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1754566551; x=1755171351; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nncQPPB3swee1KLelvJr8pVcfc6PMcxZOl6rER+cObo=;
        b=D2EFU2GvWj/AMnAgQlVZkJfDY34Cy+h4FqH3NMX5MmtNg0TT0fW5PXiTTcj6bnqbAP
         q8b6w13iecrIMDEw6791ehV25oEpibCEpk5zOcU0klxAnN2DjUwQJZTKp6IxzUCGaV17
         XsnNz2BqGBLyxttl8PbtEXPHmToFZ1AMwb5t8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754566551; x=1755171351;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nncQPPB3swee1KLelvJr8pVcfc6PMcxZOl6rER+cObo=;
        b=RFliVinVxD5qarA4YDyiTLRxBJ0EwmcoGvkcJ4hwcOaMGHW9t9XqjZXrbE1X+zZV9V
         20DTte1rWmTP+YWXp0GEnxPlutnvVB9ns9zFtLVUhkdaqN/1YS4eXary3UslXn+h0u6u
         X+HrsKUw+omPXRux9qTnug3PiCOfzx20DbN9YUUiGUT3Oj/WLtEd4qf6iWqrZIA/8TZq
         jOKOYrck44JHddXkh95abOyEkedsYCDdoPsGWx/he8L6un00MiXEdZx2SXWtQC9w1TYo
         394h+ZHYluE5ak9HsctoO8y6/UpdEPvgdfuBWKHxsQ0E3l2Q9sxm+jKrij45QOVm8TKs
         gjwA==
X-Forwarded-Encrypted: i=1; AJvYcCXhkFBgwv+8ifqj6kxyrCRgUhlvpb34oincbm1ctQ1lBy8WncS0moGj43WWjsGP3n54eZkyU2KQOI4CFEk2lJCHug==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxlCQpB9/frQdkEWX5eyKBit+8QiZcwR8NCgqqAkiU60/hzHbZs
	fN9+JefqGmjTH8hjh53EiWNX52XmmHyInljF1mvxW3HxgTLZjYKRj1mZfAMpFL/MWGI=
X-Gm-Gg: ASbGncvhZ2ch/y+NLtGfLqv6AfarCX0WF+iV3LvHfEaj8VcwCWDRisjqXq9zest5LMz
	djhkqOsw8KqIdca0ZiCUsvhy8RPetCbLWY17CFLgIzv98G4LNpCyEzyPluyi5ZxnLj5iPEHF4I7
	uXchHNTPidi62pWX0SMLP9CcXVi5HaZmWd+4iq/oBajTQmoMZhNI7q+CvBbnG1y9xk79eC0eydU
	PwzUXK5jv23JRXjp0oX4uWtJM+jQJjSzIF4c8NUJHvWep0cbjPgj30ISdssnNtesI0lOzTfXbEx
	7eWEtS2xGAxtqeYe20/8aap4A/ZpI0D5bKq4Esrsj0iwYdvlQMNj4HsawXYhgyo9KAWsL1RDafW
	xJQllZbm7+E7J3M29L1h6ft1MH2XOO48nVpEuts49qj5OUXq+NWmZREclForgEi0x6fsz+bbZk7
	KvG3MhEOcZaLw=
X-Google-Smtp-Source: AGHT+IEXnDA/m2a6WwMy+RWJJi+C2NTtbyYABjm11l2pBYVr/CXI6p3lhjyim+ryU3hXwqJA/xyuiA==
X-Received: by 2002:a05:600c:4f4c:b0:459:d821:a45b with SMTP id 5b1f17b1804b1-459e95af9camr54774765e9.9.1754566551200;
        Thu, 07 Aug 2025 04:35:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5103:399d:3bd1:49c6? ([2001:8b0:aba:5f3c:5103:399d:3bd1:49c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459db3048bdsm175500905e9.29.2025.08.07.04.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 04:35:50 -0700 (PDT)
Message-ID: <567c2becce21c752b39d412b8c80770d12415b88.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v6 1/3] bootimg_pcbios: initial import of grub
 legacy bios boot
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: vince@underview.tech, openembedded-core@lists.openembedded.org
Date: Thu, 07 Aug 2025 12:35:49 +0100
In-Reply-To: <20250802220229.2826203-2-vince@underview.tech>
References: <20250802220229.2826203-2-vince@underview.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 11:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221565

On Sat, 2025-08-02 at 18:02 -0400, Vincent Davis Jr via lists.openembedded.=
org wrote:
> Moves syslinux config file creation,
> partition prepare, and mbr install
> tasks into there own seperate functions
> before removal from SourcePlugin class
> functions.
>=20
> Add 3 new functions for creation of
> grub config, preparing boot partition
> to contain grub config and modules,
> and install grub boot.img to resulting
> wic image.
>=20
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
> =C2=A0.../lib/wic/plugins/source/bootimg_pcbios.py=C2=A0 | 351 ++++++++++=
+++++++-
> =C2=A01 file changed, 350 insertions(+), 1 deletion(-)

Thanks, this is definitely getting better and more readable. We
discussed this a bit on the patch review call and there are a few more
tweaks which would help this be more understandable. We really need the
commits to show isolated specific changes and also explain both what
they're doing, and why.

I'd suggest the first commit should create the new grub functions and
call them from the existing call sites. This way we can just see the
code move without new code (such as the syslinux code) or any
functionality changes.

The second commit can then add the loader selection code (just calling
into grub).

The third commit would then add the new syslinux functions and their
calls.

The fourth patch adding a test is good.

The commit messages (and summary) should make it clear that the
existing code only supports grub and that the changes add syslinux
support alongside grub. It would also be helpful to mention what
happens to the defaults, I know that has changed as the patch series
has evolved.

Cheers,

Richard

