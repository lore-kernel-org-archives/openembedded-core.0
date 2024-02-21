Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA47C48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 10:08:36 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.9923.1708510112147136809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 02:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FRD5r2ET;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-511570b2f49so6114641e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 02:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708510110; x=1709114910; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vdHCM85LQCb0Vd1Huese06g+3PKFzVWxJ2Bp6Trg3o=;
        b=FRD5r2ETvGKlHnqjlLepwHZDjUEfITNjzLkBHjqbfS00poZ16LXNPZH0X1A+ksfSot
         HqPPvlXDQRvGUrotEqCIxt/QCruntlhU6tcKImL6pCU9qt/g2kdseabch9/pUTwNMiH1
         FtsUJD6qxDj5FDu79MBG+piTVBA29ytMea5n01zwrerZEaqxDfMW8y3IKBG0txINuqT9
         qRC8/oD/UWjgnLQHJcBh1Y20OYkcMCgyibQ9n+mQ7ct/c8XBp3+I+auhfeQKKG3c91oi
         JVnUqKcQjXk1A5VwJGXdgHliOhue+8Y0fqEQ6vJfzOupS0TjPuEgjbfjSHPTNm1HT+3n
         dhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708510110; x=1709114910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vdHCM85LQCb0Vd1Huese06g+3PKFzVWxJ2Bp6Trg3o=;
        b=ZRhe0y7vrwISxW3yMV6Q4L3Ot84HGYteQ+uK9g3ggdPXC5E7f/wsWkw+Dqc1DwjrPH
         WqqtB0wdbF3vBSQw0yQLxzLlbSN1OvRQzPwpLXxxEyfLMtGESw0JDDYMX2NGX3FzvshS
         IIlYWeDlFvbeoTxiSD578we7U5u8flPjPKsCd1AjUAvanFs46cy5zK+0SdhOWUjzgAL4
         V20kioegCkqHEHioZRDYu7hMt5beKCWbXoawZppD31GBEetKQJKyhp3Va1Vfxgo+aBXl
         VEUo7CAJjf3RcEN0aVnC1vcgeu08fqitOLvDw7ABgI7D33pnU110vILYP25J3eFImKmb
         +tMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ8nOoRz5Wwod33VLE4mSGfgbwyOSX5tPLN9o/uCQscpE5uyJ0mwFfgWUB6/LC/GMtcv7nIbaHnocjSP/enljRzIVtvu1HDQqeXX7aYeECAeQzPEjmbofH
X-Gm-Message-State: AOJu0Yx1N7h46TBBFYhWEhWSdHmDFmatIVlv3Vi85wBf8tJtrlcda82u
	sBbmw/stnpQY5vHxzKPerFGVRXW64ueIRketx4gD4xRc7RApZ3mpXIFN8f4zxazCmanLl6KDW6r
	WdKNQk0mF2KxjElpGuipjA6trXzk=
X-Google-Smtp-Source: AGHT+IH6MUvcbEY2uYKoUSkmKAHEi1v8P4tzGwGTW8redwtpuAAjuCPBcTqWZ7y7At2N4RTR7VEDetfZzh4zGJi2Nis=
X-Received: by 2002:ac2:544c:0:b0:511:9800:30f5 with SMTP id
 d12-20020ac2544c000000b00511980030f5mr6623766lfn.12.1708510110230; Wed, 21
 Feb 2024 02:08:30 -0800 (PST)
MIME-Version: 1.0
References: <20240209140939.186588-1-michalwsieron@gmail.com>
 <94AE8BC1-9AA9-4DFB-B7B6-80CC83897ACD@arm.com> <b128ef22-03b4-ebd7-1b2d-40b2d8ab2201@windriver.com>
 <461776CF-3A33-4053-9FCA-009B4BA98246@arm.com>
In-Reply-To: <461776CF-3A33-4053-9FCA-009B4BA98246@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 21 Feb 2024 11:08:19 +0100
Message-ID: <CANNYZj9N5SyTPoJas+Zb5rJ9ztQRke_roNZ2cBafXo-5zhDsDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: raise_sanity_error if /tmp is noexec
To: Ross Burton <ross.burton@arm.com>
Cc: ChenQi <Qi.Chen@windriver.com>, 
	"michalwsieron@gmail.com" <michalwsieron@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 10:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195965

On Wed, 21 Feb 2024 at 10:48, Ross Burton <ross.burton@arm.com> wrote:
> You _can_ export TMPDIR but that has to be done on a per-recipe/class bas=
is very carefully as TMPDIR means something else to Bitbake.
>
> The problem is recipes that use mktemp to write files and execute them (b=
e it shell scripts, or as a place to write C and then compile in the same d=
irectory).  These will be in /tmp (again, we can=E2=80=99t set TMPDIR becau=
se for foolish historical reasons, TMPDIR is used by bitbake).
>
> We first noticed this with Meson where noexec /tmp meant the configure te=
sts failed. We worked around it at the time by assigning TMPDIR when callin=
g Meson, but since them Meson writes to its own build tree now.  This has b=
een seen before though, but luckily noexec /tmp is fairly unusual so I doub=
t this will break many builds.

I'm actually curious where noexec /tmp can be observed. It does seem
rare, because I think it's the first time someone came up with a
sanity check for it. Perhaps it should be treated as a bug in that
respective environment/OS/container?

Alex

