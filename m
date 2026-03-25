Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D78109E526
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 22:18:04 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35526.1774477074718202826
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 15:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Gz5XMTYZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7986fb839f5so3797407b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 15:17:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774477074; cv=none;
        d=google.com; s=arc-20240605;
        b=dhSUuUpV0XnNR0qr3qslF3Pt6uhM1fze92zIr2u2BB9ycXgrKLJGvsTah/gmAUCpvv
         ChX8EQxiPYyZdxo+yS/H9dR1JcERjSYtT3/vzLSs1eyqp0Ie7cJWtYjR61kU246FelPL
         otyMSuFroAM2K1v6LWi8j/tNkUDUN487xvA5nU/zQDI6NvnRaCOM7aWSPmYvqA9mUE85
         KYQGBVbjVfeXG5xZ5vas0OTmBg26aSb0IKSGbKIJbzamOr7AujXpEnRNQ4yD+1COWvMg
         Eq7cyW478NLPNq+b36mWNwI4AlCw496jhgCrKLmLYeWXUrAQfOJFAKdbe1l0PDuJKNwW
         O9CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7aRSfjU+G5atvz06TSSBLvSDhQP6oF/24pd4dWWArQ4=;
        fh=cQhUk7FAYywZLjh/YY/rvLfGRDiwQ5sI2rOGkKBxWGQ=;
        b=R9ZnZ+uC+3x8ZQtM/g3mvW7FlVxvhSSJClnAL3ggqrNwhSPYVPcSdiH9kZfFGQ+LBw
         CI4ICroTtYpQF7QrUjvqs40gD0eAuwP2JFElf+sMiFNt3b0X29yTK0q67u/gnPqDVBs1
         ps+qtAzZ229IR0MsOZglzypZ/9Hsc/8jfZLQ2pGmtgvzbPsfdOcou5ud/XZHjXYkVpJ9
         fa83EHRnYDO7o9okOzo0RPU9imJf7qiYBFmMI03+TSo2FtA/rF3KWRL3NU0vpeB0SorH
         ar772Y43vB+nwfWPU/TDLvyo+2MO45eUoUKx5NKGURQx5JaJITM85DfaucRAbHBEzIEl
         goqg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774477074; x=1775081874; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aRSfjU+G5atvz06TSSBLvSDhQP6oF/24pd4dWWArQ4=;
        b=Gz5XMTYZPIsHqT6dVyI9HGtIORj18GQwjSE1KWP+HB77BbRDJ8b3ETe3MZGI64i9Mc
         kXFZlKXBkiJcJyHuqtBcY2MWeg9UcKK84HHAmNOgtxkJk2io4f3R97c8hzUCFE1mZ1Bk
         +7KnnoQNAnTa2wWTUus3ZvLcX29Y8i4zLlbNUjg12zJchr5jaOh5kzHuBLlhQvZGtbmB
         cf9r95Kl2d1PhpCVwn3RFGSpI0ZtHjcFMPFynVGi9K1Kx2rjBhuPa3kuETFMP3a+uuOw
         EbWaMhsui0x5NxvZlTozmYsEVbQsqacEDReah0MGp7rNfPxsb2tD+8WV+zi6Kne11L7x
         hW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774477074; x=1775081874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7aRSfjU+G5atvz06TSSBLvSDhQP6oF/24pd4dWWArQ4=;
        b=LB9SSInduIpvUMO2nneiSIbI5ycPlr/41OqejvI4PInSTLegalkFzoy2CTs0763GbQ
         b0+TQ/65sNhJmDESNlJZIBJXGFdLe49HyWSwfjVWclC3QipQOmelrNXmJC7VNqu0f42S
         N+22WkgNWqqS30ZoxukEV04AAjPwcUQMXtlgoW2fWtN/TNnLEaNpSZ73T1HIZ+EItrjU
         0fscGTb0/FQc3ZFXqDOObpN9togZ4VSSHZzu5V1oeiDYLGAOeWTF4GO0k7H+8jnLTtQM
         k0U6T3cF+IPh41B5n8RUXCHCn1yrstPQowgkCTMCYdqqzdpmIMunGrzCinWZ+zEbwci8
         3h+Q==
X-Gm-Message-State: AOJu0Ywfc0H1iUT0VFGzGa97Z5ynOh7bBQKoT6qJdUKC4paOCqkFv4pY
	JygGwVBU/07kTMFaWhbZsu110+O3BT6iDgVS1v2IsC4ge8j91WkJo6464jWWoXdGFfWqPAU63cz
	QB+P8YQFj3AY2YLxZnMDz6yvl+ft+gtPfldyr
X-Gm-Gg: ATEYQzyfeBiuNRKfdy6yllSFnw4UVw7ZJ0GNVVd0B4CzI2e2vVaoE3hHK5QPilRHHae
	wY7F0QH4u2JgemX8ppRHFZgsCgRCxjOE7P1iTGrzpmWSMmZRPlpqSVNEICHmJy5SBYU4WbXtdyN
	28Ji6x/cS3fLtd/nBDz17/uwRg8o7tiC20RPLn2DwfBSB7L459Q2v0eHlGOvS5JUgVzJPWC/F6n
	Ey6qQ11pLUtV3mAsc2BFO0p+mUN/sQqdwvBIWWP5Ekt5QIF28IZ1BGKirWq+zIJ21InuqeL9cPW
	raAT1ID0fE4JX+suwID+1kA5gP2DUudD
X-Received: by 2002:a05:690c:f02:b0:79a:d067:1b45 with SMTP id
 00721157ae682-79ad0671f6amr53111177b3.22.1774477073712; Wed, 25 Mar 2026
 15:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260325171631.1048346-1-JPEWhacker@gmail.com> <acQ9L4xr3OE8nYqT@navimatix.de>
In-Reply-To: <acQ9L4xr3OE8nYqT@navimatix.de>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 25 Mar 2026 16:17:42 -0600
X-Gm-Features: AaiRm52xfgoQj17w_9uySV1fbkVzw3kKFYWIMXISfVRwdTJJGgPRbXrvr22fdA4
Message-ID: <CAJdd5GYyaYytJPp=ruw4bP9yVxHnfFS8C1KG6+GMPQAiswpV=Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] Remove SPDX 2.2 support
To: =?UTF-8?B?SsO2cmcgU29tbWVy?= <joerg.sommer@navimatix.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 22:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233937

On Wed, Mar 25, 2026 at 1:56=E2=80=AFPM J=C3=B6rg Sommer <joerg.sommer@navi=
matix.de> wrote:
>
> Joshua Watt via lists.openembedded.org schrieb am Mi 25. M=C3=A4r, 11:16 =
(-0600):
> > Removes SPDX 2.2 support in favor of SPDX 3 support being the only
> > option. The SPDX 3 data is far superior to SPDX 2.2 and thus more usefu=
l
> > for SBoM uses cases.
>
> s/uses/use/
>
> Could this be delayed until after the release of 6.0, so 6.0 would contai=
n
> SPDX 2.2 support? For internal tools we still use SPDX 2.2

We already had discussion on the OE arch list:
https://lists.openembedded.org/g/openembedded-architecture/topic/proposal_t=
o_drop_spdx_2_2/118281203
please feel free to chime in there.

>
>
> J=C3=B6rg
>
> --
> Navimatix GmbH           T: 03641 - 327 99 0
> Tatzendpromenade 2       F: 03641 - 526 306
> 07745 Jena               www.navimatix.de
>
> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
> Registergericht: Amtsgericht Jena, HRB 501480

