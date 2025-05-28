Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D418C3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 21:37:52 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.7039.1748468267781464326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 14:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G4N+620V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so3311165e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 14:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748468266; x=1749073066; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rnJwdDhWOTkY5aqRorqqMwaJEP8dF7fH/DzbWvyjtVg=;
        b=G4N+620VGNRxWVW9kae4u6Py25D05icz6+EkMexB47ibL7rSYTUAYsKJw+Wr2mvdnD
         eAO1JN0In8i+d1cWv5fHMUmYaNr7kMwnNo9h9B9MzUToIugv1YxefaweqLl4EYYvesSM
         qGjvHpebw2+hJqJ50yim0UgdGkRqi8fAIydY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748468266; x=1749073066;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rnJwdDhWOTkY5aqRorqqMwaJEP8dF7fH/DzbWvyjtVg=;
        b=d7zJ3V+T6O4WH+/rHINVnw2sckmM6lrIuug6nKJk+ai5w1nQy32FpJGnA8NIR5BvuT
         GlSdK2nMLC+O+7jM0+Jzw9tdlu7VnGPyCY3i+HUV2bcYMxBwd+ioT05iBrE6Y2s4lU1i
         AJJz2R/4P0SwwZEqAiViAWAt7ltzFu68iSGVEdDO1oCeeJthyS9JKx7w9045+ArkbjMD
         JW8xXpFrChAPF93P8kl+P3EJGgTta2fjwCBVrJyfvkW6hDeuks6Soo9lzwESZm3Z4yzQ
         S8N2ZcjMyOQvFuSKUGtR7bdjuTxJ6crsJJXlnnJeJKCjGPcxuW7ueA5JOkmO2ejIfTkx
         sOHw==
X-Gm-Message-State: AOJu0YwTAuNyLawuVZPMC0QfR8c2kkx75lC/GW8e/vpqyWt2lnYljwFm
	M1j5LJ44LkMDiv+5kXVH/CL9vCeowkdqFppYRm9AsGhuDECgCXdPrwF6MppiAVvhlkY=
X-Gm-Gg: ASbGncuNaMgjA1ETDsZPDLj3U64jA2dwF3rOptWPcxDLO1syZpot84Ja3IYLK27NJU6
	3Gt/kKnAWJu2+dTBAGVfO5mOYJS6S8FVd7e5NgTQeYoPaYsFc9tZVFLQ/alIlo+tM1zET9LMbPN
	E6w8iAU6Ry977ETyOJf+TiOAFRWSkIOVvXzsPnaQKJjifzW+MaIiOWdWUW4cKIShVMj9/V6v0UQ
	+MXVEwz3tZvhzitEjYm7XtXRXLWt9lfoUpNIQV8QL+bnnhSo3KDa7zQfPH4setydqmyI6gJKIAM
	rJAwx7KDYRs3DGHYMOPyiOCpA7FSm/kEMkWw6q5I7ChbdadKWt3u58pySdYF/02s4UAfBbndfge
	Btwvlbv/KtPcLC60yc7yDvuVJ4l9UO7yJQVaWXpXG
X-Google-Smtp-Source: AGHT+IFmvRVh4EBzhEPebc40uR95XiiJzxTcIVFrQNK9ZRAk7L2CBqKfuIczXoi5dMSqbc3+7haR+A==
X-Received: by 2002:a05:600c:4e16:b0:43d:98e7:38dc with SMTP id 5b1f17b1804b1-44c917f674amr152802185e9.5.1748468265734;
        Wed, 28 May 2025 14:37:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:da37:7871:ca58:3bd4? ([2001:8b0:aba:5f3c:da37:7871:ca58:3bd4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfbf3e69sm2468825e9.5.2025.05.28.14.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 14:37:44 -0700 (PDT)
Message-ID: <8378752f319ac4c4bf8d24215563caf14aef304a.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/4] linux-yocto: pull request (-stable and config)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 28 May 2025 22:37:44 +0100
In-Reply-To: <cover.1748456757.git.bruce.ashfield@gmail.com>
References: <cover.1748456757.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 21:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217398

On Wed, 2025-05-28 at 14:28 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> Here's the latest round of linux-yocot stable updates.
>=20
> I've been sort of following the kernel CVE update series that
> have been floating around.

Thanks. I'll queue them for testing.

>=20
> If that format has solidified, if someone reaches out to me,
> I can start updating the CVE exclusions at the same time I do
> the -stable merges.

I think we do need to start running that again as it is active now and
does cause build warnings when out of date.

> Otherwise, this is pretty basic stuff.
>=20
> I plan on doing an intermediate linux-libc-headers bump until
> I can better predict the version we'll use for the fall release.

Sounds good to me.

Cheers,

Richard

