Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A027C47DD9
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 16:20:02 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.78889.1705940395961590839
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 08:19:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dHrgoRgc;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e7d6565b5so3957253e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 08:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705940394; x=1706545194; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VKJ5bxtUQgkrVlVY1g+NIj7mbgHCZtjsFSMZqnTSVOc=;
        b=dHrgoRgcvEyUYuZBKJuFY2HLkX3B9RkT05U4DXp5AOR36yPUCLUsnd30WkcMC560nY
         +oFqdhklleNHcRzCQSwQ4wBHyXaqhF7NT5sB0D1eZknb/GKGdpF1FhqcnBJAwNALsgFo
         Owjtw6rUi91eKrmJh4AnYn1WA4NLfB7uiPYJaIL6kc+lg+J/wU3/NsuGJzRDLGYAyugo
         MMtnRHnT0DRAjNuXzeVX6jq34n8+xiw8qyHB/CyNqmzMD0c2M+GC4rdt52bJwgUUtlRS
         BaYJgM1MVAGs5IKfN96bIf3JJ0wxNRfvx6OioHmAinIPto2fP+z2XuYd0t+umv5Nzulg
         wIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705940394; x=1706545194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKJ5bxtUQgkrVlVY1g+NIj7mbgHCZtjsFSMZqnTSVOc=;
        b=i8RJlgVllx/IOmA+lNSMWjTSDRZsuC3G6n6BYWh4reNwpr021xx4p1mFGd2qpJlcHR
         UYgvZj/TqlCu6ysK9h6zBMFvm1LS7cXnJYe9/rN6ZPeIKJdYK4n5gWWX41Za6R/HhrCL
         vGp/KbdOJ/SQMXXdQ66WiGtRZCJsU0gBZq0QBZ70roZsh1lvO2MJK31PLdDPQprVmtLk
         TUYuaA07N51S5pLvpuZFhC/9AiyzKP0URDZ0gEug9Z5FBeFuLTaX49H98xUYllAumSRn
         sGFVvnVnbMLLYRjMe+IbPsdqG00+9P0iMUKLe47Nkct6Kcu97WSwS5Ckx5cM0G4oahpU
         ldmw==
X-Gm-Message-State: AOJu0YxltuMU60aDvVV5iKSnx5mZy2qT07PqDRFXgtYRi6LnJcpIaV05
	FvP80jwj7ZlndpsvV1mMbxU7hCYofdKfZ7JBMEqlXE2IHza1DkwxcNC5FXkd03eBGL10unz5TGu
	TF7VwoGHM30RGTbV/ckXkS7bV/nU=
X-Google-Smtp-Source: AGHT+IGztkKZCipjnlVVtUSlW2j7UKkbMxfrDiV6x3/sQHLzpMnMkJjUOaqvMraStwVYko98SblnSUpmSpJrrhRw1WM=
X-Received: by 2002:ac2:5384:0:b0:50f:732:c4d5 with SMTP id
 g4-20020ac25384000000b0050f0732c4d5mr1529208lfh.64.1705940393894; Mon, 22 Jan
 2024 08:19:53 -0800 (PST)
MIME-Version: 1.0
References: <5387538c4d9cdb021ad26dec9d8553ed0ead8e6b.camel@infinera.com>
 <CANNYZj8hkwep=rLn2_tiBmFJhYPpgB9gbkGssdpq6uZbn_qZig@mail.gmail.com> <15c60ef81ccec80f50643b4ebbe40a6dbacd4f5c.camel@infinera.com>
In-Reply-To: <15c60ef81ccec80f50643b4ebbe40a6dbacd4f5c.camel@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Jan 2024 17:19:42 +0100
Message-ID: <CANNYZj9HM_U=rvhVSrnEb-Ydgd593ytgcBJMYWtPiC-5XM4C8w@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest -v -K -r reproducible.ReproducibleTests.test_reproducible_builds
 always succeeds, even when pkg is non-reproducible
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 16:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194183

On Mon, 22 Jan 2024 at 16:59, Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
> Maybe but what about the missing reproducibleA/tmp and reproducibleB/tmp ?
> Would these be missing if sstate is used for both?
> In the log there is this:
>   INFO - Building reproducibleB (sstate NOT allowed)...

It's possible your local/distro config somehow overrides all of the
test settings, including the separate TMPDIR directories, and simply
builds things twice in the same directory. The log does seem to
indicate that:

2024-01-15 18:07:16,424 - oe-selftest - INFO -
vars_A:{'DEPLOY_DIR_IPK': '/home/jocke/yocto-xr/build/in
fn-xr/gmcu-st/tmp/deploy/ipk'}
2024-01-15 18:07:16,424 - oe-selftest - INFO -
vars_B:{'DEPLOY_DIR_IPK':
'/home/jocke/yocto-xr/build/infn-xr/gmcu-st/tmp/deploy/ipk'}
2024-01-15 18:07:16,424 - oe-selftest - INFO - c in package_classes:ipk
2024-01-15 18:07:16,424 - oe-selftest - INFO -
deploy_A:/home/jocke/yocto-xr/build/infn-xr/gmcu-st/tmp/deploy/ipk
2024-01-15 18:07:16,425 - oe-selftest - INFO -
deplay_B:/home/jocke/yocto-xr/build/infn-xr/gmcu-st/tmp/deploy/ipk

You can do the test with a plain poky checkout first and see the difference.

Alex

