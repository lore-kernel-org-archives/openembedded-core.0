Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74037C3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 16:44:06 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.55343.1747068236570904266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 09:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BquqAl+R;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-326ced52aa9so25173851fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747068235; x=1747673035; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONA996nrPYwHs5Wsaa2pBAVrftZ9R6GHkOE8Aht8FCE=;
        b=BquqAl+ReyjecOgSHBtNtr8mafLvP1oOJFpwNrMHWLkQl+cg5hXFcxZfCtz0AbA3GZ
         D6cLTWASkjkOMQiCCvALhtaLqsGgaVS3S9sa/2vxbWJjYfFnKfTv6MQfXqr8B5Ihs9GJ
         NLAxxYylVM3vvrqXwOsqYT2jGa692/eFIE9kkK83TSiRf7fXHfa+SBr9z0EWS3e6IVzS
         Xc4BBCxJHaYAKrsON4A5gDFcit0KIe/AnrL0hRytwk6flLw4Hv/CwUQCgCZ5mzgb7zgd
         6ArJaaqcfv/wfz/o0ecMEpRfQunHP5nsPg/nC4rODuOF+B2zo5DBthYP0Ci11RfNwKSM
         Bc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747068235; x=1747673035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONA996nrPYwHs5Wsaa2pBAVrftZ9R6GHkOE8Aht8FCE=;
        b=BWxoWdQMsyBhHTejZLtgm19CcfLkdabhv0Q5hmJq9nR5gKzzCItSceKHhFjeFXYoim
         jSbJNQeOzVLsH9OBolcGyIlJIR0jw/QE83iXQ7afhuiTHuhVTAetOXyka1Ep+zkDKSZ+
         gfmFi3NNMD4SRcUWj9rWPnQCoMO/jV0YeDDKtuvtRsAnuqahjRemiuFLb2oA4nZVbKP+
         pv7E07QrJygaQJgI2c+7vm8fYUj1rqgPnJ3sbD57oNwj51p/Uh33VZgUY92Ce/qVvcAX
         +RRkXno3IpXBoHYAdescwfmXzwNK8s86cnhxfy/TNxJz2Y6B7xIxVijvO3jr9neWzwJR
         zOCw==
X-Gm-Message-State: AOJu0YxUuwvM/iYpmrcXo/Yf80LzGUzQeJmyVrEiJFZnLTysBMEYfxGq
	+4fpxTvVPnHowR2UJEWOWvDeJ1otj70z+VQe42tDILPEMnn1uAI5KD/DdAcCIvxI5CYya6zHFIR
	i5vairxcyJ4a7S0BXQOYORiDPfNY=
X-Gm-Gg: ASbGncsHodIHEKOXslJ/gPK/F/JMBR4CI/W/IUWACtRbGSZi7xbZL0v879NSsxi0ZFA
	aNRzBanUmjsayxtp3fbpWJ8OqDiqpMUKVJA4TSGulIedRgyO37QfTWiz93wWYngJicViSRkHK/t
	vUkbxuCqmwZpYapC/1TSPD2s/HxFvKy4fq/o4vi5UDA6o8/DNzzn6P+rOJAg==
X-Google-Smtp-Source: AGHT+IERL5t6mesBQDXDUaKPJerFo3wGp8OI5nRRSY7zunL0ORm7N38SIVdCASQGY9kxAMwUO5CvGjDyOQR2zUQYyfk=
X-Received: by 2002:a05:651c:221b:b0:30b:f006:3f5 with SMTP id
 38308e7fff4ca-326c457bd62mr48588361fa.15.1747068234399; Mon, 12 May 2025
 09:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250509094421.20786-1-mark.jonas@de.bosch.com>
In-Reply-To: <20250509094421.20786-1-mark.jonas@de.bosch.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 12 May 2025 10:43:41 -0600
X-Gm-Features: AX0GCFtrQyD_wYagowrtapJDMVzOwIHlLMSAi0aKtorSLUl_VHa2i1Hfo_gQooE
Message-ID: <CAJdd5GZ-LkBC-8iZXhAYvKsOhxCm2hYL5tCkTS9SOud-d5+ifg@mail.gmail.com>
Subject: Re: [PATCH] udev-extraconf: Allow optionally skipping systemd-fsck
To: mark.jonas@de.bosch.com
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com, 
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 16:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216380

On Fri, May 9, 2025 at 3:44=E2=80=AFAM <mark.jonas@de.bosch.com> wrote:
>
> From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
>
> When the fsck backend does not respect the exit codes predefined by
> fsck, systemd-fsck might not work as expected.
>
> This is the case for fsck.fat from dosfstools [1]. When a FAT formatted
> and write protected partition is checked with fsck.fat it will terminate
> with exit code '6' [2]. What fsck.fat wants to signal is that a write
> protected device cannot be checked. However, that code is interpreted by
> systemd-fsck as a bit mask:
>
> - 2: System should be rebooted
> - 4: Filesystem errors left uncorrected
>
> As a practical example, a write-protected, FAT formatted SD-card will
> not be mounted in this case.
>
> This patch introduces the environment variable SKIP_SYSTEMD_MOUNT_FSCK.
> When SKIP_SYSTEMD_MOUNT_FSCK exists systemd-mount will be called with
> the --fsck=3Dno option. Thus, the partition will be mounted without
> running systemd-fsck.
>
> In general, this new feature is useful when the filesystem is known to
> be clean and the fsck backend does not respect the exit codes.
>
> Finally, one way to use this new feature would be to add
> ENV{SKIP_SYSTEMD_MOUNT_FSCK}=3D"1" to the udev rule calling the mount
> script.
>
> [1] https://github.com/dosfstools/dosfstools/issues/89
> [2] https://github.com/dosfstools/dosfstools/blob/v4.2/src/io.c#L63

This is a pretty generic work around for a very specific problem in
dosfstools. It would probably be better to patch dosfstools to have
the expected error codes instead.

>
> Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> ---
>  meta/recipes-core/udev/udev-extraconf/mount.sh | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipe=
s-core/udev/udev-extraconf/mount.sh
> index 0cbae48729..d6de05f0b6 100644
> --- a/meta/recipes-core/udev/udev-extraconf/mount.sh
> +++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
> @@ -83,6 +83,10 @@ automount_systemd() {
>
>      MOUNT=3D"$MOUNT -o silent"
>
> +    if [ -n "${SKIP_SYSTEMD_MOUNT_FSCK+isset}" ]; then
> +        MOUNT=3D"$MOUNT --fsck=3Dno"
> +    fi
> +
>      # If filesystemtype is vfat, change the ownership group to mount gro=
up, and
>      # grant it with  w/r/x permissions.
>      case $ID_FS_TYPE in
> --
> 2.34.1
>

