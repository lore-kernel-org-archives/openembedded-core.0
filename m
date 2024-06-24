Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2ED0C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 20:33:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.152667.1719261223778632762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 13:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dfqHrnCE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42278f3aea4so39524045e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 13:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719261222; x=1719866022; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sOEPx0h8+IfZ37Ta6p3BtDDeFE4ju2ix95e4tLFEaJ4=;
        b=dfqHrnCEu0FZuPykhVvPbTtLwsbpTvy/gvYvuIRFxR64Ro+vetVuKDcbFqRmDEMfCU
         MjhZ7/n/pYJyjx27/wZG86v3PU/IceJGPI8C3dDb3eT1hS9ElGAN3MyyoKiS1Yv5x7rq
         PnftLnbOYw5wfQVRwM+vg9R0/c5c04jYOwqdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719261222; x=1719866022;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sOEPx0h8+IfZ37Ta6p3BtDDeFE4ju2ix95e4tLFEaJ4=;
        b=f5r7b4mmk4BK5OiTAz5IvcnVUo7Q4aJrKrbBSXwHLycc/w/nMmrq51+PlwAOgJ3cyg
         LaPbT91/Qd+tlJg8rjy1XnAWGJYrKcHCJsN5xNFoyic0gU4Qg2G+8d4Y/nTqtqqaKAPC
         iVVptPjHxVfA8Hc8A7G9nOuT285+so29HpeEX/4M3B60vSPaatur9FlniIDyy0E/M+CQ
         a2EkmJestXtdeoARjEFCiH3cLiv2osU0qDwEa/qCVRY9JmrB5VqmOEdda21zGC58+QYR
         Vz8HfccOXns6dr0r4Vu2KNyLSZwh3ldW6ZGxOKbYtnpsbIzytBwpQ9zBJ9jC3SUgWMiO
         JcJA==
X-Forwarded-Encrypted: i=1; AJvYcCW80WmWrdo1TPVoNC5kYp5A/bQXIwF/tzLaV1PR8DTE7sAvSxzXGugY08txzIHn22IECZhIxGwa7mYzy5KfWCuP6Mwolu8lq234aAbQxADFisQTdZZaKNfb
X-Gm-Message-State: AOJu0YzsEg1uTm9sdqpxCqVHtc3rUu5Wd2/J41PoW9kpnG3rbInBuEPe
	nZmbBzmfC8WGhQnSCqSL2HSv3ly3jcLDxPyTzU2dzQgN5i/TVP1rm+fxi0WBS6E=
X-Google-Smtp-Source: AGHT+IGkOev9gzBOlEBJMrLvX5RL0TDPgsWMT3dXVYqCR7wzNHmFQ8wCkxX+aws1223qbcsmECng9w==
X-Received: by 2002:a05:600c:4a99:b0:421:29e1:998 with SMTP id 5b1f17b1804b1-4248cc67376mr35883565e9.39.1719261221805;
        Mon, 24 Jun 2024 13:33:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a414:f157:db24:7df7? ([2001:8b0:aba:5f3c:a414:f157:db24:7df7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0be9fasm187552835e9.16.2024.06.24.13.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 13:33:41 -0700 (PDT)
Message-ID: <de66e3216fb54cf24171e800ea032770517fab69.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 02/11] devtool/upgrade: add
 RECIPE_UPGRADE_FINISH_EXTRA_TASKS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Mon, 24 Jun 2024 21:33:40 +0100
In-Reply-To: <20240621103414.2842509-2-alex.kanavin@gmail.com>
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
	 <20240621103414.2842509-2-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 20:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201114

On Fri, 2024-06-21 at 12:34 +0200, Alexander Kanavin via
lists.openembedded.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> This is modeled on RECIPE_UPGRADE_EXTRA_TASKS with the difference
> being that the tasks run in 'devtool finish', and only when
> finishing an upgrade operation. This allows recipes to define
> custom operations, such as renaming additional supplementary
> recipes (such as *-initial, *-native etc), or any other custom
> handling that devtool cannot know about.
>=20
> The idea is to teach glib, cmake, mesa, systemd, libva, rt-tests,
> go, rust, etc etc about upgrading themselves properly with this,
> improving success rates in AUH.

Whilst I understand the desire, I'm not sure this lives up to way
devtool works.

By that I mean that devtool upgrade usually does testing of the result
but with what you implement here, the second recipe is never actually
tested so things could easily break after devtool finish and you
wouldn't know without further testing.

Thinking about this a bit more, we should be able to ask bitbake which
other recipes "share" files since I think the list of included files is
actually cached by bitbake. Yes, we may need API but in theory this
means devtool can know which other recipes it needs to upgrade at the
same time, and when doing so, run them through the same process as
normal upgrades.

So yes, it will be a bit more work but the end result should be more
generic and scalable?

Cheers,

Richard

