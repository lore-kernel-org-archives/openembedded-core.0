Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C65C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 15:39:53 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.18519.1737473986094661945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 07:39:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A6FoaHXP;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d888fc8300so27578916d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 07:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737473985; x=1738078785; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tt1P28AkTJ170whd/VxrqUKTcDHbcNU9RMuzDbc0kwg=;
        b=A6FoaHXPfGHNoMYpq0OjLZD+vdFYmBvrUa9kbfRJ01V7vNUWUl1ExWKJhR/a/gsXQ+
         rDM7O2moulJ3bbl0SNgI0q3mrMsp1HW6qYWw5eEMSmhNgyHKXD1rU9Fn4bYTVfjgt9uz
         KCGXGtV/blFHDNlY0jK/7zHkHfMQQgSbXYR4hSbR+B5E6dytzoLdtRnqWCYXB/ZjNkmz
         k14iP6UNZL4tEkYsnEb9HFRMTlFG1OO1789TMB0GYtuQRYR4crVG1C6HaNeuEbDF5SmY
         yv5sp69QkyFA0DSu1pHzVDQgWuFT6WEJPbi8gvUdKSSbTVJQn00ISUJbtXHq4jVDLhjO
         cyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737473985; x=1738078785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tt1P28AkTJ170whd/VxrqUKTcDHbcNU9RMuzDbc0kwg=;
        b=O7y0ZTwb3ochPtjuGZ6dqq/9U+Wzg64zs8IlN6iWKat/1n6OjXGYlHCXR6L7eA5C5t
         nCaMywswOz3ESgh7uR5seIDOhCEKcAGgtHNQdDT86x4MFk7h/cDMeLHBpMBcKs1Ahv68
         dbp9F6T52J4hCBO0hGOb3eZNCiGMkTg2KF/11p0/LmWJTm9dGcXih6hnf+fYbXBLUEsw
         s+Z06kShjOheykGqCeMmLxN8nXfF5zN4vAvwsA+rs8jfpSejckdp02y4U4fKWtJn/A/M
         P8Mqh5ig50PJuontDtY/GbH3ChM1INPR7IW7Lg78lrMv8EWWADFluyeap3u0sy6QkI4W
         uHFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFLHQ67soG2VPViNqc6OLBriG2qeQYsfL0PT0BFPI4NqPwLuRkmO6EJEvH7zb0vOt1wC3iBaV0yOxg23dHoE9pdw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw5jk4+LpJoBZKc835dXY6EvPId2DGzLMQ8efi2jqcHP0M57CFO
	MotD+JdDMY0OwrEwh9XJqYSH71G7eSS1QF0VBXzAzPVbwAXaL3/agw28VDhvVe274RZ3+H2h3Lz
	rYUZ5pECmW2Vv4ozzmeI6YIKBBkY=
X-Gm-Gg: ASbGncu/LJ+5NQs5HAVvFev0AFrBQ3AMkk7XHbID/JE1EdiMbc4MuRWVR6FRRBodR3p
	wB9QRyx+j1XJc1Ms2rqA95Z/hG9dWVMkQLXFegA1098gDoNCCeG96sv1uIMI2rTNtBdZSpgdKuI
	iPMERGAtTaJw==
X-Google-Smtp-Source: AGHT+IGiEK13RQS8TNmmdgsfllo0YMt93anDYrWYmlBpbHc+B1MO6MrPA63M2aO/sgSRSUcZtl2azG6KtlPYNV4Zlhc=
X-Received: by 2002:a05:6214:2586:b0:6d4:b1e:5418 with SMTP id
 6a1803df08f44-6e1b21c46b2mr263980546d6.33.1737473984935; Tue, 21 Jan 2025
 07:39:44 -0800 (PST)
MIME-Version: 1.0
References: <1736986779-18213-1-git-send-email-wangmy@fujitsu.com> <B0D54F55-821C-42B5-8EF6-285E7055A9D8@arm.com>
In-Reply-To: <B0D54F55-821C-42B5-8EF6-285E7055A9D8@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Jan 2025 16:39:32 +0100
X-Gm-Features: AbW1kvZTUQBBGDeIrfWGlElICekPEwFurvbxW0fV76pPNyuPu_0EHDKVUSUgBCc
Message-ID: <CANNYZj8Lbz7s6JeQzrXu=MCbyQ5bC6RZcyLYLMc6MyHvcXLc6g@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflict when
 enable multilib.
To: ross.burton@arm.com
Cc: "wangmy@fujitsu.com" <wangmy@fujitsu.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Lei Maohui <leimaohui@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 15:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210101

On Tue, 21 Jan 2025 at 16:31, Ross Burton via lists.openembedded.org
<ross.burton=arm.com@lists.openembedded.org> wrote:
> > The host_os when enable multilib is as folloing:
> > host_os of aarch64 : linux-gnu
> > host_os of aarch32 : linux-gnueabi
>
> Seems like the proper fix would be to change the glob to *linux-gnu* (and sent that upstream first, obviously)?

This is an outcome of my review; in the end of it I had asked to send
that proper fix upstream, but provide the oe-core fix as a tweak to
configure flags. Basically because we don't know if upstream will take
the proper fix.

What would help is to include the link to that upstream submission
into this commit message.

Alex

