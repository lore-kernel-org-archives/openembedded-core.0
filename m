Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841BED29C33
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 14:38:21 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36381.1768833496698175925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 06:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WIrIEQfk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso28634015e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 06:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768833495; x=1769438295; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vQjFwCQued8VyOC5dXrxrV0P51s8keZjMTAXI6CHx5s=;
        b=WIrIEQfkpAikJLtZX1gOiXVMVCpSsgFS2n/ywv8a64lAKuHhKd1/5S7ZZ8ANcJC12q
         WsJvX1Z+bre6OizKJ2N8v3iz8FwiGN1PzRKaA1wAjY0z5G2oSclaq3S2tCAttNk3rdMa
         Xa0u5108fsrBiEU1ifWfU4JVfRu+3iV/XAAzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768833495; x=1769438295;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vQjFwCQued8VyOC5dXrxrV0P51s8keZjMTAXI6CHx5s=;
        b=takHR//vD1Qiwm+F6te6Cpm7lx/1H8mCbUBxAimxwmMak7pKI/1UwhoxB1UzW1l62e
         0r+iNXOzVsMueN/SJV8Cz+1YymIIfylxmsf2reQOL+A+rXlChtf7c9PHTtucdkDYsVUh
         lO1GuiS1szA94ovhJ2s/hU0b49wWLKODDXj7oxccYLejBXzhhGB5326X6N4KfjO1gpUi
         vS1r4BT3MTPhdJHOuLB9y/m2B2MfX5dGA5jZnwfq17FGUCVC+MVBR9pfK8VuEFGFg4Ue
         FBIbqMaZqRJ+PnQg27EIlG9pzqGiDDYqP9T5AAxwRdV7gHeV8vjmDjm+lwq6sEw9sS8Y
         92oA==
X-Gm-Message-State: AOJu0YxI0TRkmA8UhaFwDnwvz9WFmstKybGQmAFCCORrRcCXisuTmlcl
	FV5ClGMcPdT+V3jkxoT+xW1IRcrLLP5/MpwqQQca+uP7YlaePD+UjB+74nv4GqK38wU=
X-Gm-Gg: AY/fxX6y4LyzG3LXW+S7+sTjQdzQaX9Si9kc36LZE2NSrwxOmwBc1fW4Ra5AZ24yZ2+
	3dlBfxfbPXwBI4xa32BWRuiSuqi3JQsgEZhZmwozWeEjE5pihPpMDTnn3Usg3IcuAokxC618tQo
	TTG/8sVxLBE8zxCxS/0qnvGdek+XijZGfzWzSi5A3Nlza79wSrqVLMp7ZONi2hZF/jFfxzO+6av
	TE/W5juQ2u9nZcQX+Xv5WTim3FCSY/OQQFpDweEpmufl9WzamneL9CI6k71TfA6XJIgznJPrqKx
	/zviQombGrnZvF4dIR1kwk5/omMXkurDHdFezLApOIspt7V+xXWMEmiko34+L3segUAWbPUdi+e
	Tx/MNQb8wnR5QwaYqHdsDJCeL3KdMeB0ZKcBy44AWQ7G13dn9DQzRl+ThdZyjSvVY/ZBINbGkWa
	CqISf/3jAZZOZd1DxaxxjZuxvlw2WDFAhe+a4sinBMDCpeVL4g6yR7dPcXU0y2WFQg2RgIWi81E
	O0LATq4euwL6w==
X-Received: by 2002:a05:600c:314f:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-4801e67c8ecmr136277665e9.15.1768833494977;
        Mon, 19 Jan 2026 06:38:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7cb0:ccc0:c4cf:d0a1? ([2001:8b0:aba:5f3c:7cb0:ccc0:c4cf:d0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f429071besm249012885e9.10.2026.01.19.06.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 06:38:14 -0800 (PST)
Message-ID: <3d99b9245edf44f560cb198e7bb0cb2ed3ce8159.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] dpkg: Fix ADMINDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, mark.hatle@kernel.crashing.org
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jan 2026 14:38:13 +0000
In-Reply-To: <CANNYZj-fAJ4xS2GuHazHeExo7FQduObgdvjXYcq_wShv+sp4mQ@mail.gmail.com>
References: 
	<1768683431-5604-1-git-send-email-mark.hatle@kernel.crashing.org>
	 <CANNYZj-fAJ4xS2GuHazHeExo7FQduObgdvjXYcq_wShv+sp4mQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 14:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229622

On Mon, 2026-01-19 at 13:30 +0100, Alexander Kanavin via lists.openembedded=
.org wrote:
> On Sat, 17 Jan 2026 at 21:57, Mark Hatle via lists.openembedded.org
> <mark.hatle=3Dkernel.crashing.org@lists.openembedded.org> wrote:
> > +Subject: [PATCH] lib/dpkg/options-dirs.c: set_rootfs was not checking
> > + environment
> > +
> > +The set_rootfs function was using the hardcoded ADMINDIR (define).=C2=
=A0 It
> > +should be checking the environment, and then falling back to the defin=
e
> > +if not set.
> > +
> > +This matches the behavior in db_dir.c.
> > +
> > +Upstream-Status: Pending
>=20
> Please no pending patches without a reason. This should be submitted
> upstream first.

I understand the sentiment however I should mention this is blocking
pseudo getting updated to resolve several bugs. I did queue and test
this overnight and can confirm it does fix problems in dpkg once we
merge the pseudo fixes...

Cheers,

Richard

