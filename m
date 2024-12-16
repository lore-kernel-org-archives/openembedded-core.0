Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF77E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 15:01:00 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.58533.1734361252895108625
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 07:00:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CYRxc6ds;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.171, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e3989d27ba3so2996059276.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 07:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734361252; x=1734966052; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+EMLsaRNcwwjA0eHPqclKePtihE8Iui9tk54/25qh0=;
        b=CYRxc6dsFuS/r2BgigoK2csa0KpCDNT2/UkJmq4vKZNJ9rvucaVjFJ0plpoICplhlv
         vvkr7tZoVWNqeNzM3AwOe+uVtGRvYAsfvFBILc8kgUnNF8QhdVtUesCjgSpUI1Wrgyf8
         gEctFxFjZSM5rxD0SvfboBhmp2PMkB+659NOg5utmu34/PiUQgfyV2jjErvRZhxsazus
         eAhvD1q49mJ1tvDRqulJ8s8NbilqmLBlVys0lQz5yGRC4bfcTWKfLQGb7hKEtv0yl6fb
         VuLwLrFtit0a3pYQx7pCb05xF2XapODcMnbwiTOQvG6TcyBAdEvLD3ULOfXH+uP4A5SG
         lfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734361252; x=1734966052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+EMLsaRNcwwjA0eHPqclKePtihE8Iui9tk54/25qh0=;
        b=BBAdHZnmK0Rbu/kYez+G89MDh6Cl8bdNUmK1tBPaYaCnhMAJMvmifpHp3Wz17YpEHD
         bNRabG1yaMCPxgR+xUKnYvDyVgVgiGg4FlS3DU2p9/7VIa+i+VqkfNSKazKXTnZs2IwN
         yi3amXKih5Vt+87WHo0bagFd3eFpHq+nqTw7cudx3D304FkW6Y4F7V5jZ6x3297e085O
         xFY8DLTGsWlykF5A30IEYoiE4kmYeNT1aTPIH4HgU3Gl3comP0PMfvjRoIlwKxVp/b/n
         oJI+Ri4jF1riRUVD1ECHbv1kGfEzHj17z+9jIvYOxDcUVwuOTtHJavU1DzfJj5aG9osr
         gwCA==
X-Gm-Message-State: AOJu0YytX4E6bypTaHVxJ8pqRKqEs7Ojok9JYMM84c9nKKOUu5kxhBNH
	Xs6fbu5KynYPuV79lxKsNk7vFIqg8EnL7m02GlWAKlGyMKIIig9rrOXHARPj+aGBuW46FqMmwCE
	ScUdx4kiCPu414GssU+pBbvwK+nfjjTO62EjX/w==
X-Gm-Gg: ASbGnctli+Gs5WyDgO99Gz9wFimtugH+tRHVBHJZCTB3BK4lgjjEUNjysHAkbcuPs3w
	C+vtIXzxv/KYuLsjP3HtzwzkGvIPNDeaXZCh0tw==
X-Google-Smtp-Source: AGHT+IFDLob+Swegflo0VBRQMIMiifWls8/LEFn9hDfBNtIzePxKzhWJmIIGHxcSBOzUm8LVEdT7vyfnbMTfDIU917k=
X-Received: by 2002:a05:6902:248f:b0:e38:fbd:48db with SMTP id
 3f1490d57ef6-e434b8836c0mr8725781276.29.1734361250895; Mon, 16 Dec 2024
 07:00:50 -0800 (PST)
MIME-Version: 1.0
References: <20241215135335.128188-1-gudni.m.g@gmail.com> <4730.1734273404497872554@lists.openembedded.org>
In-Reply-To: <4730.1734273404497872554@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 16 Dec 2024 07:00:40 -0800
Message-ID: <CAOSpxdar4VwF2P01z8GYgc7rgTZE48Aseu242ph+VyYeet=0xw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] python3: upgrade 3.12.6 -> 3.12.8
To: gudni.m.g@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 15:01:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208773

On Sun, Dec 15, 2024 at 6:36=E2=80=AFAM Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Note: This patch doesn't apply cleanly to styhead due to scarthgap missin=
g one commit: https://lists.openembedded.org/g/openembedded-core/topic/scar=
thgap_patch_1_2/110128235

This patch doesn't apply to scarthgap either:

Applying: python3: upgrade 3.12.6 -> 3.12.8
Using index info to reconstruct a base tree...
A meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-ter=
mios-before-calling-t.patch
M meta/recipes-devtools/python/python3_3.12.6.bb
Falling back to patching base and 3-way merge...
Auto-merging meta/recipes-devtools/python/python3_3.12.8.bb
CONFLICT (modify/delete):
meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termi=
os-before-calling-t.patch
deleted in HEAD and modified in python3: upgrade 3.12.6 -> 3.12.8.
Version python3: upgrade 3.12.6 -> 3.12.8 of
meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termi=
os-before-calling-t.patch
left in tree.
error: Failed to merge in the changes.
Patch failed at 0001 python3: upgrade 3.12.6 -> 3.12.8

Also, I will need to have this version bump in styhead before I can
take it for scarthgap.  So please send a patch for styhead too.

Steve

> I submitted two backport patches with the missing commits from styhead to=
 scarthgap to sync the branches. Should make things easier to upgrade both =
branches at the same time.
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208754): https://lists.openembedded.org/g/openembedde=
d-core/message/208754
> Mute This Topic: https://lists.openembedded.org/mt/110127757/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

