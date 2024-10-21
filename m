Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8DBD0E6E4
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 10:25:27 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.42812.1729506326446113732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 03:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d5alNjgp;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539fb49c64aso5861331e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 03:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729506324; x=1730111124; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vrGrVlc1NXP0TAnlmtpn4cVo4rTE1OH+kR2iqocyt8=;
        b=d5alNjgpcSmE8NhNtu2Qqwfn2rwcrDNRkohQowytInjPO/RlFC3RY2zgkOr8YRBc5D
         x3hrEydFSwxbKQ2CERTRipTC2EWl4+q/NIwhkmpEuY+sSrAtYMvJwH1YswsMWRaps6A/
         tkLBXNAyL/opEczcRxNWQWoo9hCHn3b+U3Ik74wnOJF3XlXQECLzKh7JLN+9FIKIKRey
         jRusE7+zxE/wkREjsf7e040tlnLlkh2+iRHvFHB1Wk6qSw06O834NZ4iQidPuJgMhi+k
         HVjErqOlTfreBCE8zmIkEpaQEZw8dkuh6fk1hawTPBrGeQSqIjrMfB/ViW4KQ4kgZvS1
         5RTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729506324; x=1730111124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3vrGrVlc1NXP0TAnlmtpn4cVo4rTE1OH+kR2iqocyt8=;
        b=aW6VQ1mFwj3SszRlDSlBHzGYnamXQBBUDg7bAie7Stn0kXpn6V6bYl8nwlWb/KRKsu
         K52L7o05ULNbo8AJpbDAVLD/iIarHQ82oV+v4vmWlunj8W4T8u9NC9mGmSOVINNwgpU3
         4jlCiDJ/UMeAZjTNDIjknFWdhoTnvQDqombSJ2/5YmEG78skGsJ8GNUWf60gHp5YnGsv
         EprMD2D871o2Z0xWazQEktdzG6Lb3cctKDXeQFR8kPzXk14rlaEDrMTRtWjWtn7sab0f
         lkJLESXI6JVJ+lSTeSNEb9rpo1D11ozJ5mzA/2YZPcBOs2fsQaXR/mu6UTU6lCl64V7x
         8wgA==
X-Gm-Message-State: AOJu0Yx9voU9ftYH3doVMgHJNq8dCM/rS3zGN9mmy4rI+nu8D1iy/9iy
	dCKzGEWR7r96PHJ+Yy5+P+lTLkMalbBO8peJaL7TvJqTayywgfKPKS8MUdMcdTZ4Bku2EVRi4FQ
	cq3q5Y5Q3UVX3wR1YRU1kSSB1W+0=
X-Google-Smtp-Source: AGHT+IGnrWR4em0rRNCG/xW0FKhhN8bCJoDmdWK6SVA0+0qZskW8ZHt9soDlSRPANX8HpGhjNG88tXldWf47DXYUPSs=
X-Received: by 2002:a05:6512:350f:b0:536:55cc:963e with SMTP id
 2adb3069b0e04-53a154ca15bmr6231300e87.44.1729506324120; Mon, 21 Oct 2024
 03:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20241019021935.2105739-1-gael.portay+rtone@gmail.com>
In-Reply-To: <20241019021935.2105739-1-gael.portay+rtone@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Oct 2024 12:25:12 +0200
Message-ID: <CANNYZj-bdtFmFHnK2ppSMY+iXRDX-J5GwWaQjYMwX_t66SnJoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes: rootfs-postcommands: set better sane
 time to systemd
To: gael.portay+rtone@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 10:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206103

Can this be done from systemd recipe itself? Items in
rootfs-postprocess list should not be recipe-specific.

Alex

On Sat, 19 Oct 2024 at 04:19, Ga=C3=ABl PORTAY via lists.openembedded.org
<gael.portay+rtone=3Dgmail.com@lists.openembedded.org> wrote:
>
> When systemd is started, it sets the system clock to epoch to ensure the
> system clock is reasonably initialized if no working RTC.
>
> As init process, systemd sets epoch very early to the more recent
> timestamp of[1]:
>  - the build time of systemd (-Dtime-epoch)
>  - the modification time ("mtime") of /var/lib/systemd/timesync/clock
>    (systemd-timesyncd)
>  - the modification time ("mtime") of /usr/lib/clock-epoch (systemd)
>
> The first epoch timestamp is is hard-coded at build-time by the systemd
> recipe (using either SOURCE_DATE_EPOCH, git-tag, or NEWS modification
> time[2]).
>
> The second epoch timestamp is maintained at run-time if the system runs
> systemd-timesyncd.
>
> This implements the third epoch timestamp at image build-time, from a
> newly introduced rootfs post-process command that is very similar to
> update_timestamp.
>
> It touches the file /usr/lib/clock-epoch with the modification time set
> to either the current timestamp (now) or to a reproducible timestamp if
> REPRODUCIBLE_TIMESTAMP_ROOTFS is set.
>
> Note: That newly introduced rootfs post-process command is automatically
> set if systemd is set in the distro features.
>
> [1]: https://github.com/systemd/systemd/commit/863098fdc9cd91e4f760085356=
ac02c4b7ba6df1
> [2]: https://github.com/systemd/systemd/blob/v256/meson.build#L804-L825
>
> Signed-off-by: Ga=C3=ABl PORTAY <gael.portay+rtone@gmail.com>
> ---
> Hello,
>
> With this patch, one can have a better sane default time set by systemd
> very very very early in the boot (i.e. even before systemd outputs its
> version!).
>
>         # dmesg
>         (...)
>         [    3.347641] Run /sbin/init as init process
>         [    3.350435]   with arguments:
>         [    3.350440]     /sbin/init
>         [    3.350443]   with environment:
>         [    3.350447]     HOME=3D/
>         [    3.350451]     TERM=3Dlinux
>         [    3.431275] EXT4-fs (mmcblk2p2): re-mounted. Opts: (null)
>         [    3.523997] EXT4-fs (mmcblk2p4): recovery complete
>         [    3.527828] EXT4-fs (mmcblk2p4): mounted filesystem with order=
ed data mode. Opts: (null)
>         [    3.694440] systemd[1]: System time before build time, advanci=
ng clock.
>         [    3.714755] systemd[1]: systemd 250.5+ running in system mode =
(+PAM -AUDIT -SELINUX -APPARMOR +IMA -SMACK -SECCOMP -GCRYPT -GNUTLS +OPENS=
SL +ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD -LIBCRYPTSETUP=
 +LIBFDISK -PCRE2 -PWQUALITY -P11KIT -QRENCODE -BZIP2 -LZ4 -XZ -ZLIB +ZSTD =
-BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dhybrid)
>
> Thus, one can do time-based related things offline or before the system
> clock is set by the network (if trusting the time does not matter that
> much for sure).
>
> This happens if the system has no hardware clock or if it is way too far
> in the past and if using an old versions of systemd; systemd v250.5 sets
> the system time to April 28, 2022 5:53:22 PM (1651168402).
>
> Also, please set REPRODUCIBLE_TIMESTAMP_ROOTFS to any appropriate value
> if enabling reproducible-builds (the default). Otherwise, bitbake sets
> the timestamp to Friday, March 9, 2018 12:34:56 PM (1520598896).
>
> If you have a better idea on how to implement it, please tell; in the
> meanwhile...
>
> Kind Regards,
> Ga=C3=ABl
>  meta/classes-recipe/rootfs-postcommands.bbclass | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/class=
es-recipe/rootfs-postcommands.bbclass
> index 5f4d67f93c..cc74c75cfa 100644
> --- a/meta/classes-recipe/rootfs-postcommands.bbclass
> +++ b/meta/classes-recipe/rootfs-postcommands.bbclass
> @@ -22,6 +22,9 @@ ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_a=
ny("IMAGE_FEATURES", [ 'deb
>  # Create /etc/timestamp during image construction to give a reasonably s=
ane default time setting
>  ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_update_timestamp "
>
> +# Create /usr/lib/clock-epoch during image construction to give a reason=
ably sane default time setting to systemd
> +ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("DISTRO_FEATURES",=
 "systemd", "rootfs_systemd_timestamp ", "", d)}'
> +
>  # Tweak files in /etc if read-only-rootfs is enabled
>  ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", =
"read-only-rootfs", "read_only_rootfs_hook ", "",d)}'
>
> @@ -402,6 +405,19 @@ rootfs_update_timestamp () {
>         bbnote "rootfs_update_timestamp: set /etc/timestamp to $sformatte=
d"
>  }
>
> +# Can be used to create /usr/lib/clock-epoch during image construction t=
o give a reasonably
> +# sane default time setting
> +rootfs_systemd_timestamp () {
> +       if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" !=3D "" ]; then
> +               # Convert UTC into %4Y%2m%2d%2H%2M.%2S
> +               sformatted=3D`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS=
} +%4Y%2m%2d%2H%2M.%2S`
> +       else
> +               sformatted=3D`date -u +%4Y%2m%2d%2H%2M.%2S`
> +       fi
> +       touch -m -t "$sformatted" ${IMAGE_ROOTFS}/usr/lib/clock-epoch
> +       bbnote "rootfs_systemd_timestamp: set /usr/lib/clock-epoch mtime =
to $sformatted"
> +}
> +
>  # Prevent X from being started
>  rootfs_no_x_startup () {
>         if [ -f ${IMAGE_ROOTFS}/etc/init.d/xserver-nodm ]; then
> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206078): https://lists.openembedded.org/g/openembedde=
d-core/message/206078
> Mute This Topic: https://lists.openembedded.org/mt/109095282/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

