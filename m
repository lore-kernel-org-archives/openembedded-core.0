Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2807FC3ABDE
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 08:46:11 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.71724.1747125966044527850
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 01:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gUx4BZVg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso55753345e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 01:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747125964; x=1747730764; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+Zx685KcZLtv6Y/0nunSvQjfrnJJFcexRvSboOFPGxI=;
        b=gUx4BZVg0vjqD1LBp9KouKUBBmAP7y1C0jNhI/UxUttK5KaDrOFpCikJk+ysNlVzgw
         fCnj6tXz1AsOuAVbpuXOmVYVy042fk2cIK8yqst8f4egEKL1phKBnqo/4FVTgkS/3bWM
         70B1rSd4TiXtmn9mfTBE/1A8ihSBfpynFuwzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747125964; x=1747730764;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Zx685KcZLtv6Y/0nunSvQjfrnJJFcexRvSboOFPGxI=;
        b=fS7Slotrs2huz1tccrU1/lWDmY45hAjQZRWq6UvCGhhDE+L3QLpaziXS61PHF7IqDx
         O2Rgg4yl+eKGDFi8npVTjC9j93HXnlkyLmobl9EWcH6mKaUg/iDT01u6+dtt6eAUnLpO
         MnCXvIHZzfYDZXE6A9HalW7vzncW6aRgbshv3zlDzpCyEgoJeF186cJVc4ILlEQTn6Gk
         rlE7FC171QoqeE+ib56dYUKUenYaqJGqPfe+wkQipisjWtNef69+xISDvJKivsxVrduF
         8guODI/ir4mcA3sbuuCqXCEWS8Mnbgl32NVB8aA4zvtN7DewLHofYgNU1NKivjxFA0ml
         rIhg==
X-Gm-Message-State: AOJu0YwKnVDu22mohJuyi7EcK8CzOdc2PGEJjZj6DQwguojuXXS7iYN8
	UV6jQ2vHdUNfVFOS+c5uBeVkrHzYyRCkdCd3RVdDo31/zLcuWagMsuSYEmMDZMY=
X-Gm-Gg: ASbGncti2uOY392VBkdPkuyGjqzLJU+MVdfGAz5DvSPi0PBxvBsGMCqBy7AamwHnsOH
	r6bF/tWGq/2P8577xvVT2uobOcaQU/C7Iw0Sc7civb0eumV6Ilp9VVaVQghLT8dVQbQkZS0XYQm
	1oFbGewNUiSQICJ2CsLlZposTrArLCBHFPgs+lhxizyuOVQkskhON6N2vLWMjI6PU7hxA72vO0G
	osy5hWTb4fkpX7f4H2zj7uXAqRYc6L+ZJ8kGgnt4KHRMaMcYc6dh3NMZusiJvaM966LItM6d9C5
	Hm/AJg1qztiUcQTL9nqIIDGQWExZs5fwDPEf25E6mavWrRvAVbNj3Q80xc3KSuzrUsgnzBnXWLC
	4OlSeYa8g/Cp1TPwcX1A5Zn3A73D0BcwbCjn+eA==
X-Google-Smtp-Source: AGHT+IE6GH0fp+ulDGGbRbbJCiomaUCowazNQ6I/ygMWC4eGYLrFic4UOTL6oKTkGm2bFP2qG9VQxA==
X-Received: by 2002:a05:600c:1e18:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-442dc95a564mr119733665e9.15.1747125964367;
        Tue, 13 May 2025 01:46:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8d0:97f6:fa2f:73cd? ([2001:8b0:aba:5f3c:8d0:97f6:fa2f:73cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3aeca5sm206530385e9.26.2025.05.13.01.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 01:46:03 -0700 (PDT)
Message-ID: <8bbbcfe81a99f36e90718015150e135a4ef8202b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] udev-extraconf: Allow optionally skipping
 systemd-fsck
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mark.jonas@de.bosch.com, Joshua Watt <jpewhacker@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	 <raj.khem@gmail.com>, "Simoes Ricardo (BT-FS/ENG1.1-2)"
	 <Ricardo.Simoes@pt.bosch.com>
Date: Tue, 13 May 2025 09:46:02 +0100
In-Reply-To: <DU0PR10MB7076F9B59B85FEC850F9A8D9AD97A@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
References: <20250509094421.20786-1-mark.jonas@de.bosch.com>
	 <CAJdd5GZ-LkBC-8iZXhAYvKsOhxCm2hYL5tCkTS9SOud-d5+ifg@mail.gmail.com>
	 <DU0PR10MB7076F9B59B85FEC850F9A8D9AD97A@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 08:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216402

On Mon, 2025-05-12 at 18:16 +0000, Mark Jonas via
lists.openembedded.org wrote:
> Hi Joshua,
>=20
>=20
> > > From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> > >=20
> > > When the fsck backend does not respect the exit codes predefined
> > > by
> > > fsck, systemd-fsck might not work as expected.
> > >=20
> > > This is the case for fsck.fat from dosfstools [1]. When a FAT
> > > formatted and write protected partition is checked with fsck.fat
> > > it
> > > will terminate with exit code '6' [2]. What fsck.fat wants to
> > > signal
> > > is that a write protected device cannot be checked. However, that
> > code
> > > is interpreted by systemd-fsck as a bit mask:
> > >=20
> > > - 2: System should be rebooted
> > > - 4: Filesystem errors left uncorrected
> > >=20
> > > As a practical example, a write-protected, FAT formatted SD-card
> > will
> > > not be mounted in this case.
> > >=20
> > > This patch introduces the environment variable
> > SKIP_SYSTEMD_MOUNT_FSCK.
> > > When SKIP_SYSTEMD_MOUNT_FSCK exists systemd-mount will be called
> > with
> > > the --fsck=3Dno option. Thus, the partition will be mounted without
> > > running systemd-fsck.
> > >=20
> > > In general, this new feature is useful when the filesystem is
> > > known
> > to
> > > be clean and the fsck backend does not respect the exit codes.
> > >=20
> > > Finally, one way to use this new feature would be to add
> > > ENV{SKIP_SYSTEMD_MOUNT_FSCK}=3D"1" to the udev rule calling the
> > > mount
> > > script.
>=20
>=20
> > This is a pretty generic work around for a very specific problem in
> > dosfstools. It would probably be better to patch dosfstools to have
> > the expected error codes instead.
>=20
> You are right. We also thought at first that we should fix the
> problem in dosfstools. But the project appears to be abandoned. The
> last commit in the repository is from October 2023. And the last
> closed issue is from August 2023. Lastly, there is an issue which
> sounds as if the maintainer lost access to the repo
> (https://github.com/dosfstools/dosfstools/issues/210). But the
> maintainer(s) did not even reply.
>=20
> Instead of fixing the problem upstream we could of course also add a
> patch to the meta-layer. But the patch would be rather big because
> the overall exit code generation is spread over the code. There is
> more to fix than only this single situation to make dosfstools adhere
> to the fsck standard return codes.
>=20
> We would definitely not be able to maintain a fork of dosfstools.
>=20
> How else could this be handled?

I think we should probably carry a patch to dosfstools until the
upstream situation gets resolved. I don't like doing that but
ultimately it will lead to a better end result. It is likely other
distros would be interested in such a patch too.

Attaching that patch to the github dosfstools so there was a patch
ready would also increase the chances of it merging too.

Cheers,

Richard


