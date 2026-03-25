Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EACA106B531
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 13:02:35 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21654.1774443749017306244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 06:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PTKdkhcR;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-899eabc5292so64481916d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 06:02:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774443748; cv=none;
        d=google.com; s=arc-20240605;
        b=b5E8MKNcIE94PsBwCVL7qO3eEiVbXn7F4z4eThFehPaOKjeSWzXYPES+RA8kPo5VUR
         eZHSF70EirPTyL5h978qeWA29xWU0ozG7gzloe+6gaRSRF62B90IupFaguXhTAD2qexz
         4tvYZU5gQAvJhM9LbxamlS9iZ6kOoncDEL93YetRxCPNKMtnEABFqkYI+uvTjUlgCwz7
         wWlxqqVZJhF6O195TBNFuNIcTpi0ZdwStMjRTg9Fj+fJ1EP/Yv3g/Ez3xdFgykSQmxmS
         YYE4aFRHZB33aBdFulXk+ROHjB6oaiyslQafqrFBDyE1KcWUKxvzCYDjm64qyccSEwuN
         jKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=93uwi5CRwJBbbccqDTXZpd16K9c/B1S49zixP2jHrI8=;
        fh=h7OBrjiyKaaWdPaBqXoZyPvNN4s0mMqrcV5qNxxPMp4=;
        b=Pt59wyp6+rhJx5dLHlI+KilCT8TWjgNJCiVi/r3ZLY69LQqJyfJXf/dtaEX8lTDnEj
         cu0/kqZGsM0JFcKGzPQwmG1PRv44IIn5e+ZmZTGL2DAqnpXeoXA/0cQQpE4oYZBk9e70
         jHTZjnqTeMg/3204E2+V9KbrNblEr9br6xwO/gk90aaNqIRkTLoUUxNogv3Xa+NOv4oM
         BXKAewlgRPvGffrNb168T1q44WC1KgPmJvN05FIGnzi8zb9Kh2wSJm3jaTERgQg2UeKx
         FVeYIHdVRw52Tehej7VQF3DdTBDrtem0Vi/T1DXeQlBfoEJrX+Yz/BSN0JwDzy6Cq0iL
         v6kw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774443748; x=1775048548; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=93uwi5CRwJBbbccqDTXZpd16K9c/B1S49zixP2jHrI8=;
        b=PTKdkhcRxQfiTjz29wLmMR33lnPhQ8nj6SO4GtvlVPiOnDMnHXbMgNlYsbc6eArVVA
         JIg0uIn98ccT0AjgGCnhpSlMWZvVY15RmNQzs6MsReyotPrS6Ucb/dc5/3HMj8/MvLzM
         4Ksstq/XShCU0x/aqx+nHYpj8Dl3nQjY7mRHYV6gUIFr688KCbCHXWSkpkbX+/LhxrVv
         meEIiJm+uG297srrwdKnifZxL0UeET2FQLXPzeQGtl7/M8oe8/vDWrLeGrInBdzqqcMV
         7oMN1NLEgpebOwqfNAspP9NavS7BtQeyQ4akBaNRiPrWnGqF3Qv9E2o1u63gm5COTNlr
         4UVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774443748; x=1775048548;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93uwi5CRwJBbbccqDTXZpd16K9c/B1S49zixP2jHrI8=;
        b=dotHkCvVnDDpVhNocMRhWB8CUxuwmDnVHv3UKe2Ilj8qPm5A1sgHkg5yoFR4kld3R5
         YBSRrST0RQBf0b3xGmqGHCZLdw+W8zn8r7ygJamfXuTaNq3WqncjpNst5NsuI0q608oL
         ttq6ZezVj2M3/0vyYdBG7UOeS3rlTE/tTBVoN/M+7vr48X0xXuskIVxycQ6z2kD6FRCg
         zkazy0c30APdlkupZ8Xu3TerIJkUPVBDQATvrVDSoKBv66LAUcsF4HvZ1k8i33zFszNU
         7iURI9mA7HJFspRA6qa+a8iJ2D+0yWqtbEEcPj/4y48QoK9+xRzMvkJ5fUCX1XnRoVdF
         zqkA==
X-Forwarded-Encrypted: i=1; AJvYcCWz/Ng6CWnbWr0wBuKBhfjo3EiwJRiu9z/gzhtIzUbyZFeoGkCl2NRUIK0YHClf9JuzK0Dcm17tlgmC8GMFjg8Gqw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyt8GeVUcWa5Iu//azv6lMeNvkqJPfTlW/gm1lp3giZtQZF5qpx
	fML3t2gSf/wF7dK/xJOtD9I7C80DyGfK/WczO3mhOe/d59tHd1dqIFoE4+s0d4P9bUqORiHcZdu
	yFNstKMXBTehNv1t+zbwRUizfpssAG5p1hv2L
X-Gm-Gg: ATEYQzyL6ilxLty6BXPpVLfkqxiM6jvzbA8TDR/knyqZWEtK0boHOCCW+69rnz1/F9A
	9rNzfAuERcUR50v2pFIQAM7aUUQ5ONG5RxYWIaOBqv7iJmggUjsddHwyNteX9tuZXu/bAqDVFec
	qeWQoMhlEwTLF1Cfe5pLJXuJH1OM2U3xZ/QzXufLHBNFmv83Cq+AoDWMqVwL9oCyenHr7KjlYSZ
	vwmG014pRhnOGpO6cgtAORBM77/faGsMFDv/4KOc9bpdEUSjHPFHDLzM7wiusqDqEz+AttfumXN
	AN1xU0o5z4zxH2Q2yE89ndBCGZxmZZEd5FJAtyQErg==
X-Received: by 2002:a05:6214:808e:b0:89c:c5cc:4bf4 with SMTP id
 6a1803df08f44-89cc5cc68abmr39668056d6.16.1774443747919; Wed, 25 Mar 2026
 06:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260325084021.3915804-1-daniel.turull@ericsson.com>
 <20260325084021.3915804-2-daniel.turull@ericsson.com> <CADkTA4PkenyxfFJR6fvFSpjKV_3MhyChDQZLZ3d5hB7HZbGyOA@mail.gmail.com>
In-Reply-To: <CADkTA4PkenyxfFJR6fvFSpjKV_3MhyChDQZLZ3d5hB7HZbGyOA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Mar 2026 14:02:15 +0100
X-Gm-Features: AQROBzCEgHNjSEy6c__6EteO7yEngloQwu8jiMOUnXGytMUc0Yn4_ZIwDrWYG14
Message-ID: <CANNYZj8ys_-bBq8LSOnmyoFhqU+iFgSgukWkZOSspTy+LtSsZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk
To: bruce.ashfield@gmail.com
Cc: daniel.turull@ericsson.com, openembedded-core@lists.openembedded.org, 
	pratik.farkase@est.tech, richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 13:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233907

On Wed, 25 Mar 2026 at 13:58, Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> For something like this to be considered for merging, I'd have expected
> a lot more information.
>
> Is the test coverage the same as before ?
> What are the results of the tests versus the previous harness ?
> Is it truly a drop in replacement for the previous runner ?
> .. etc
>
> Switching the executable is the easy part, ensuring that it actually works
> a replacement is the hard part.

>> Assisted-by: Claude, Anthropic

I have to add that this line ^^^ doesn't inspire confidence in the
patch either. On the contrary, it raises suspicions that the code was
written quickly after the issue was raised yesterday in the tech
meeting, and wasn't actually tested well or at all. The commit message
*must* reassure that it was.

Alex

