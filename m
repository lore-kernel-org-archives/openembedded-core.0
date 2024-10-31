Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1D6E68949
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 02:46:14 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.4029.1730342766207500181
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Oct 2024 19:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pus6CgHo;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3e6089a1d39so272190b6e.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 19:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730342765; x=1730947565; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecUbHjBILh4qHXqDNpNcHp7Cvei0GeyWvhwmcRJ0yOA=;
        b=Pus6CgHo22v+mUkq7xFTWHphaCQPxNJ8mYXnmuo23nMQzSq1CnLtXtYyhJc3jr7FxW
         VPTt2CV8wM/gBaVmaZXH3kk+oNiYMrF3yVwgpsDDaC1slM9HDGr0GV9kUb13yuTQgW49
         eTn8r1P7umKTra6RLZCVxsCYlD7KASII6U5FyK8fQ2DiX9YE9RBbnxNK4EyBjNVxYOsQ
         B0O8RopXfqKwJYOm0+d4stB3GnXkWsZQWEtfV6Jf3AAYW/AQ/YNGLvKqV8PGJSJzy5kR
         3igK7bkCMOlOTWy7YMOXwl6bbV1qVeiueFWJY3z6TkZlWQkkewvbtPbN3U2tJ9SYWalY
         0xFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730342765; x=1730947565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecUbHjBILh4qHXqDNpNcHp7Cvei0GeyWvhwmcRJ0yOA=;
        b=GFLTRIUDuwH6lIUPZRpJlYJ2gtrn9ypearVQNvLYtV4NgE83p68Fh8c7SXIswm2yjm
         rfhgITTSFosoOEkUwN0WrJNvh5q9e5tMZtqrM7HfjGtVcUspSYHyFyPVxFtqGmTfhZ32
         Qanzziq35Sfa/mtWVZcQN3zR5YgoBFd9cFAb22EdoVkvw95sMVnJfFc4qov/8m0k/Quv
         7X5asq2FnTN6cFY4FSxtrkPPVEZhSLKwCDMOQXg6DuOI7QQaKf8NrXhRwXiuyl+vozLq
         lPOEy4FOGBj6hTRlkfanXd1F2hSI7FWsU7TORGdF1A/cymB5WUdDSng8gA+ifheKJo/o
         MPpg==
X-Forwarded-Encrypted: i=1; AJvYcCVAxHiTUhn+ODeoeujLtv43KawC7JG46MadszETkAmrjtSeqz/FowEgP7Xv25GEhINsz46cLFKa7LFy5N6AoSiCXA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxceypXp7C/pfY4IV+y9Rh/sD2b/ardMPu5YXq2N3+QvivTsiC9
	U+LuzK8Iwn1M9xxqWTxis4vlwmVMGwcc8VlLsEmdt7PaPseTsGo8NNZFPxRyBIMnTmeybcks1vK
	ifFrCKTPEXpSPxn3tugloVcW6g0A=
X-Google-Smtp-Source: AGHT+IEDuLNH8IXACOqoI43Z7waybnEGRswLCegPEk55SDawneVBN6K7IkhUaRqn3WDjlZccOG58tQhiCUnP1qMSoh8=
X-Received: by 2002:a05:6808:182a:b0:3e6:2d97:ca67 with SMTP id
 5614622812f47-3e6384ce4fcmr15948732b6e.44.1730342765323; Wed, 30 Oct 2024
 19:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20241028034618.1504830-1-vince_chang@aspeedtech.com>
 <CANNYZj_KF41W10duL5u0mDDbv1aFUxdcGAmUtO2fEc0EtZ4ymg@mail.gmail.com> <TY0PR06MB5707BE94581CC7F425214A2EE2552@TY0PR06MB5707.apcprd06.prod.outlook.com>
In-Reply-To: <TY0PR06MB5707BE94581CC7F425214A2EE2552@TY0PR06MB5707.apcprd06.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Oct 2024 19:45:38 -0700
Message-ID: <CAMKF1srdKcP7HMPkQF+iCqOkCfpGv6oB0M8R7=qbO3C216xgmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/2] wic support different sector size
To: vince_chang@aspeedtech.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 02:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206567

On Wed, Oct 30, 2024 at 7:11=E2=80=AFPM Vince Chang via lists.openembedded.=
org
<vince_chang=3Daspeedtech.com@lists.openembedded.org> wrote:
>
> Hi Alex,
>
> On Wed, 30 Oct 2024 at 21:01, Alexander Kanavin via lists.openembedded.or=
g
> > These two patches have merged, and unfortunately there are now
> > failures on the autobuilder:
> > https://valkyrie.yoctoproject.org/#/builders/35/builds/346/steps/14/log=
s/stdio
> > https://valkyrie.yoctoproject.org/#/builders/54/builds/325/steps/14/log=
s/stdio
>
> It's strange that this line of code fails to execute. It works fine on my=
 build machine. Is there a way to find out which version of parted is being=
 used on the autobuilder?
>
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeq=
a/selftest/cases/wic.py", line 877, in test_wic_sector_size
>     res =3D runCmd("export PARTED_SECTOR_SIZE=3D%d; parted -m %s unit b p=
 2>/dev/null" % (wic_sector_size, images[0]))
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeq=
a/utils/commands.py", line 212, in runCmd
>     raise AssertionError("Command '%s' returned non-zero exit status %d:\=
n%s" % (command, result.status, exc_output))
> AssertionError: Command 'export PARTED_SECTOR_SIZE=3D4096; parted -m /srv=
/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3537958/wic-tmp/t=
mpr6vrw11i-202410301331-sda.direct unit b p 2>/dev/null' returned non-zero =
exit status 127:
>

perhaps make it
PARTED_SECTOR_SIZE=3D%d parted -s %s mklabel %s" % (self.sector_size,
device, ptable_format), self.native_sysroot)

> Thanks,
> Vince
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206566): https://lists.openembedded.org/g/openembedde=
d-core/message/206566
> Mute This Topic: https://lists.openembedded.org/mt/109308341/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

