Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393E5D1AD3A
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 10:01:56 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.19139.1729072911430164477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 03:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KWHlM96+;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so25439931fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 03:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729072909; x=1729677709; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mxEp/Oa6J+qMDcXqP8+Tu8U9bJ+ZccmBS6mXAIH9Has=;
        b=KWHlM96+tkHtbkiII11BT0tlyNnbktVcEfrkGIvpt26Xs9tZdgfqBjsqQRBgYMoYlk
         1Hij+DiauX+DVTM/NX3utM/hXAf6AEVCLWkinGZO857xSF8x6qAw7xukp4jr2bcz8VWt
         9s86UKFwCH209i26Dio8ovBX/HMNvQj8liU9YBHKU+IitezXQhw0eczS7u/vaLgTpCkz
         D5xOi2ABoi/Gr8AXhrjeGlEKq89BIAvZK7dhdK34TWMNwxLNDG50z1PjDRwhlQj3Wu1K
         YzcEN9pJoSPJtFLTLMV4S7gdORy4xtYRWhkU0e+8E2MB3Bz3eJ3/SpFbuiAxNW24ziTK
         K7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729072909; x=1729677709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxEp/Oa6J+qMDcXqP8+Tu8U9bJ+ZccmBS6mXAIH9Has=;
        b=iw0S2Nhy/+saY2mxIHgdIrnK4UIBjt0F1eqpdOFngVQTLCbdHmaDrlBA/wIpkZO8/z
         7A9ZYeUfg7Jw4lGJMFDEUqA03ekaoJv8S2b6Uzh2fITUVcptk2AOBk1n6SRer7PI+A7q
         XGrW1Z+OGZwTWzy+IP22P7KPNxTN6v/NGHn8mm0sJa7Ch7f5o5/6yaoqtzv6MCsa40va
         L/Xe9/ipk5zO0OujqdvI74kYyxF2mcaxuNky5L8vaxCGzQuR5S+Cheh33kUG4tr+izyY
         fLg9xacVwFX4vcbM+WAxuBmK/h8GH9U2J4nwwiQDWJmJgopFyThJ+j16KxpM4OjQPzdc
         IbwA==
X-Forwarded-Encrypted: i=1; AJvYcCU1wey/zRpLZcNisv5xqx3jYAt8/Asxq85RoRpB+Jz0nDvVJTaTgLhaJsQ59TaAFSmORc4WY8elN9DAopwCFdHrrg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwqJ486VkjdHRJEF7x9pUT7Lfjxt80Nm+K4UmtzYd1PflQcxsu9
	oWPQO0kpUGDtOzddg5CAPApkhGdx7GM1d8tlG8X7uyOPh3u9E0ctDM92EWm6E1k3X78gD9caynd
	MYbfxniJESZ3t3+9ZIP0y+tBiwXk=
X-Google-Smtp-Source: AGHT+IHokBizoJ30nODSJ5M0VbikNGkxG1KfSiUKz7wwzCbs+zbM1qgNDqDC5zaD+s3QQVHufmfw0ln0jIjZoBVUOmY=
X-Received: by 2002:a05:6512:2351:b0:539:dca9:19a2 with SMTP id
 2adb3069b0e04-53a03f77e49mr2234980e87.39.1729072908773; Wed, 16 Oct 2024
 03:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <F3CE27E5-346C-4673-A31B-3D2C85379F88@amazon.com>
In-Reply-To: <F3CE27E5-346C-4673-A31B-3D2C85379F88@amazon.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 16 Oct 2024 12:01:37 +0200
Message-ID: <CANNYZj-gAt9hOSkYRrgO+mofUiQObF1UxtW1U=XwcgkjW1v1Cw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate: remove corrupted artifacts from local mirror
To: "Yu, Max" <yumx@amazon.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Sobon, Przemyslaw" <psobon@amazon.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 10:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205959

On Wed, 16 Oct 2024 at 00:43, Yu, Max <yumx@amazon.com> wrote:
> How do folks normally update sstate mirrors? Do people usually only have a single/small number of writers? (For our use case, we want to keep the remote sstate mirror very up to date.)

The standard, recommended setup is that all CI builders write directly
to a shared NFS mount (and read from it, obviously). This has been
stable and proven for a very long time, and is relied heavily on by
the yocto upstream CI itself.

Then this NFS is as well exported directly over http as sstate mirror
for usage by machines that can't be trusted to write into it, e.g.
company developers or even a public URI for 'the world'.

People try all sorts of deviations from this setup, such as having
explicit synchronizations after the fact, but this can introduce
issues, and certainly introduces cache misses and longer builds.

Alex

