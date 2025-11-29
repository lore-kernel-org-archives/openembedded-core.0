Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C665FD116F3
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 10:16:35 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12425.1764411388471254137
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Nov 2025 02:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y3GztgnW;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ee328b8e38so23925331cf.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764411387; x=1765016187; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MhGooQJO0JgauW55frN105/KPYubRm4CrJgaaPFhu+8=;
        b=Y3GztgnWT3SpiGomq7UYMLymkYM1ulGsNQmQgHa+LbmPIYomBAOr+GX2OM3ZWEMCD+
         Otxk5iJxXVyRm9z2xVwiKMdQ6m7XKbW537P/reYNvFuqHIPiWZNccHLOmJNd4oqwjI0f
         FWDJ2xNsX4xkvDVc07DYMz2JKioIrDjIrFi3x3RGTB0yLYzd46cpQaT/kvSmqJA3NvnV
         B53TVU5/cPVeH8BHyuH51FAZEhDf74nFGcGZQTWzoBrajf2CYB55SAUEqIVY02zD/PKj
         JRPTdBi7Mk7xOJoJIF7ibJKxaAVaL/CqoytkeapfdXO9kCUA/rtOc2DhDimRZXWdilEF
         aMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764411387; x=1765016187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhGooQJO0JgauW55frN105/KPYubRm4CrJgaaPFhu+8=;
        b=lHgb1jQs3e0OS91Bfn0bbZLpIb+RjEiAOaRYcIZzMWZ7rUpITJKFKfng7thWL/BHpi
         t9Hn34N2VQcpEUWdt6HFa+avvpechSdh3tpJotrWCUJV6nP6NjmAsmtkjL5E5rbRahLK
         83jUBlXQOKNPTE0Jy0GOzm7Swo6AGliLFkLhtxaswR16pXgecK5HpONbXEX5cIKJjTna
         PwSwCcpbbxMCQOiZ0Yd5mbhe7BEvM3R9twJam8fYE5DJ/XvDGXeetuWfbO4rOgzruKN7
         S3AyMaiFRU9yk6uqpJ+MQ+aGGQO88PnXJrDqK980dH2aKVI9hDGXoezL8jQOhYRztsFt
         nqEw==
X-Gm-Message-State: AOJu0YwQ2eUimaxokLOoSWo5cAxa0aAQWQYMqGc25kuPojfXNAGlVAWF
	6e0EVycmYCzCxT/nnH0hk8op6AX+3yJLxoUYybpWHPMKl9AAYxAR8+8NKOG6u708VPdWABPwkER
	+TpGrFl2OCji9omlmLIPrCqpOqED5mMM=
X-Gm-Gg: ASbGncsKl/8GBaG2j4aE2hKEh9QOdvouUbm4dglKvUcvzasPOcnhm9iWkwIIRGMgkjf
	tJXrjCCXqY0Cnvp1CXSJKmXoO4nHc90rJ0sPUg5lcCAQ/EfZLVEKvoxO5rQ5OsUDn9GN+igB8Ng
	Ycr7tmv2+Rxyy4zadXpy9mP0wC8SEoOrVbTaV7D7J6BU18YbPPOrCmkrofaM8+mtYDR+LCxeAuB
	Oba4XTHhSEjfqmNsma4JSLVmN9jwVPPglYTU4Y1cq0DcgSS7DY3fnD4IwikIwMEze32zEqCjFcO
	EecbrEZdHcganH+m+eN4HECaQJys7w==
X-Google-Smtp-Source: AGHT+IGMvuUExYwrXSH80sYEjnSZBMyDuBE8OaMDcVZ0ofgOw2OZ/NgbZ4ttcPxnqXDjom1wbR1WtF5AFCpflzBW6ws=
X-Received: by 2002:ac8:5908:0:b0:4ee:173e:c73 with SMTP id
 d75a77b69052e-4ee588aa717mr441606501cf.60.1764411387229; Sat, 29 Nov 2025
 02:16:27 -0800 (PST)
MIME-Version: 1.0
References: <20251129035436.249679-1-Qi.Chen@windriver.com>
In-Reply-To: <20251129035436.249679-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 29 Nov 2025 11:16:16 +0100
X-Gm-Features: AWmQ_bmUYO3ArX73WWkcJunJuaOFLYJb-Sr5TU7TcgC1VYR94kiND7ioRcMgYJk
Message-ID: <CANNYZj88Ohg3uETcRsn3FFw153XccZoziQugQirrzo+A045pEw@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2 1/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org, alex@linutronix.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 10:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226932

On Sat, 29 Nov 2025 at 04:54, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> It's possible that users use EXTRA_USERS_PARAMS to set password
> for root or explicitly expire root password. So we need to check
> these two cases to ensure the 'no password' banner is not misleading.
>
> As an example:
> In conf/toolcfg.cfg:
> OE_FRAGMENTS += "distro/poky core/yocto/root-login-with-empty-password
> In local.conf:
> INHERIT += "extrausers"
> EXTRA_USERS_PARAMS += " passwd-expire root;"
>
> Note that allowing 'empty-root-password' image feature + setting/expiring
> root password has been working since available. This patch focuses on
> the banner. We want to ensure that it's there only when root really has
> empty password.
>
> We need to ensure that the function runs after set_user_group function
> from extrausers.bbclass. This is because the check is valid only after
> things set in EXTRA_USERS_PARAMS are done. So change to use :append.

If you are setting a password for root, then why at the same time you
add root-login-with-empty-password to fragments? Aren't they
contradicting each other, and you should pick one or the other, but
not both? Yes up to now EXTRA_USERS_PARAMS setting took priority over
the empty-password setting, and gave you the desired outcome, but that
does not in itself make the combination a valid configuration with a
well-defined behaviour that needs to be preserved.

Alex

