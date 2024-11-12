Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B50D597A2
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 20:23:20 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.96482.1731442991968823131
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 12:23:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bbnrw6qk;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f2b95775so7758794e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 12:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731442990; x=1732047790; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cOeEfjWEEysGVRKXXXXsXmJq6elvvNQXI5kOtWzLy4=;
        b=Bbnrw6qkesCAoxmbVHlcWFit5a/jcGWTkFkFCyGKidpwrArMFSeOvC4t2+MxhGzD3E
         jZQCX6FQ/EaFM7VZWYVpReYmcKzMQY0Myq7L9jdjCMLRqSM38YSlfxSAfgdl8rZYHqA/
         Geg/YX8uob3Ca6IibQREVmIG3Ipe+dP9GshzNhN5dLo2eoCTGGlwtvYqTj3/5kLE45nP
         u1LPCEOjqPpwUttx7+H95FCmwUC0/cfTVmQnsom5fzQiXNCFp5ALo9OZBn2AApVK9cVf
         VwSjRweVj+vr6bUGLsNirFpbIUGBY8+X0SBi7IQGx2PKpMvTU93/17o7pqR3XCaHTeAn
         BSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731442990; x=1732047790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cOeEfjWEEysGVRKXXXXsXmJq6elvvNQXI5kOtWzLy4=;
        b=QKGBWRSJACjA3YKbJwhKnoYuIR++LDubjudoTNzWBfGvtClKbpZFyPhgJ6oWuXIXSc
         9zIcCwziThGR92fTdEguD/JxiD8++TlfIHLY6OmEdeuwTi0i69vMR+Tuj+Bw2QCCR8k0
         TP2mBoBhv/FNYfzQzo4Ms72r38m1eFTildrHFRPBL+0lhfBqCL/nUQcOrurIP8y7aI6I
         U1kxV5kGgszgFAZEFtSdzlsPg829PjEc9tWsm3MIrmkTHStSZWC+Rds+X4iI2fOUjy4V
         K9eORICteFYEfWt+3BWn+G6xkhAh9nqsgu1ucLbUIUpnt/LalF4h87K09MJNxefZV5HD
         nOfg==
X-Gm-Message-State: AOJu0Yz5NvTYKqv1Aer/Kas5hamgBmISrGPxJtYPwmO6AyuioWO/9vZu
	2dF2o7RjY6Y29FVZ0leSxksRjKMWR4CMU8LNlxclw8M+A+HA69GBRBprrlij3Yw6TUkZWl/H2pT
	AqM9zLzXdfO3faPhWILQSSWNhKnI=
X-Google-Smtp-Source: AGHT+IFGUw+OzTDT1+l6WWestk1gjUV1/lbO4Uaj8KjoKXpoRtEZHTHkO6WfTLX/XuailtVRfPbUowicT9wYp4onKTw=
X-Received: by 2002:a05:6512:6d6:b0:536:54ff:51c8 with SMTP id
 2adb3069b0e04-53d862c6fa8mr11140083e87.17.1731442989715; Tue, 12 Nov 2024
 12:23:09 -0800 (PST)
MIME-Version: 1.0
References: <20241112192214.1644312-1-gael.portay+rtone@gmail.com>
In-Reply-To: <20241112192214.1644312-1-gael.portay+rtone@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Nov 2024 21:22:58 +0100
Message-ID: <CANNYZj-TUJahfs4GLfjtcLVJRBOxx4Mf93X8b_9GAu_iToUdgA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] systemd: set better sane time at startup
To: =?UTF-8?B?R2HDq2wgUE9SVEFZ?= <gael.portay+rtone@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>, ChenQi <Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 20:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207066

I'm sorry, this was probably already covered and I'm just forgetful,
but why not do this in do_install?

Alex

On Tue, 12 Nov 2024 at 20:22, Ga=C3=ABl PORTAY <gael.portay+rtone@gmail.com=
> wrote:
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
> The first epoch timestamp is hard-coded at build-time by the systemd
> recipe (using either SOURCE_DATE_EPOCH, git-tag, or NEWS modification
> time[2]).
>
> The second epoch timestamp is maintained at run-time if the system runs
> systemd-timesyncd.
>
> This implements the third epoch timestamp at image build-time, by
> touching the timestamp file /usr/lib/clock-epoch from the package
> post-install script.
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
> the timestamp to Friday, March 9, 2018 12:34:56 PM (1520598896, i.e.
> REPRODUCIBLE_TIMESTAMP_ROOTFS[1]).
>
> **Important**: It works on scarthgap and kirkstone; "all" image files
> are timestamped to Tuesday, April 5, 2011 11:00:00 PM (1302044400, i.e.
> SOURCE_DATE_EPOCH_FALLBACK[2]) on master branch; that branch appears to
> not use REPRODUCIBLE_TIMESTAMP_ROOTFS anymore. Therefore, an update of
> the SOURCE_DATE_EPOCH_FALLBACK value should work (I guess).
>
>         root@qemux86-64:~# stat /usr/lib/clock-epoch /etc/timestamp
>           File: /usr/lib/clock-epoch
>           Size: 0               Blocks: 0          IO Block: 1024   regul=
ar empty file
>         Device: fd00h/64768d    Inode: 837         Links: 1
>         Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/  =
  root)
>         Access: 2011-04-05 23:00:00.000000000 +0000
>         Modify: 2011-04-05 23:00:00.000000000 +0000
>         Change: 2011-04-05 23:00:00.000000000 +0000
>           File: /etc/timestamp
>           Size: 15              Blocks: 2          IO Block: 1024   regul=
ar file
>         Device: fd00h/64768d    Inode: 510         Links: 1
>         Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/  =
  root)
>         Access: 2011-04-05 23:00:00.000000000 +0000
>         Modify: 2011-04-05 23:00:00.000000000 +0000
>         Change: 2011-04-05 23:00:00.000000000 +0000
>
>         SOURCE_DATE_EPOCH_FALLBACK ??=3D "1302044400"
>
>         Supports Unix timestamps in seconds, milliseconds, microseconds a=
nd nanoseconds.
>         Assuming that this timestamp is in seconds:
>         GMT: Tuesday, April 5, 2011 11:00:00 PM
>         Your time zone: Wednesday, April 6, 2011 1:00:00 AM GMT+02:00 DST
>         Relative: 14 years ago
>
> [1]: https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbak=
e.conf#n689
> [2]: https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbak=
e.conf#n688
>
> Changes since v1:
>  - use pkg_postinst() to touch file /usr/lib/clock-epoch instead of the
>    rootfs post-command rootfs_systemd_timestamp()
>
> Note: v1 is titled "classes: rootfs-postcommands: set better sane time
> to systemd"
>
> https://patchwork.yoctoproject.org/project/oe-core/patch/20241019021935.2=
105739-1-gael.portay+rtone@gmail.com/
>
> Kind Regards,
> Ga=C3=ABl
>  meta/recipes-core/systemd/systemd_256.6.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_256.6.bb b/meta/recipes-co=
re/systemd/systemd_256.6.bb
> index 68f15ab065..f288bedc9e 100644
> --- a/meta/recipes-core/systemd/systemd_256.6.bb
> +++ b/meta/recipes-core/systemd/systemd_256.6.bb
> @@ -867,6 +867,10 @@ ALTERNATIVE_TARGET[runlevel] =3D "${base_bindir}/sys=
temctl"
>  ALTERNATIVE_LINK_NAME[runlevel] =3D "${base_sbindir}/runlevel"
>  ALTERNATIVE_PRIORITY[runlevel] ?=3D "300"
>
> +pkg_postinst:${PN}:append () {
> +       touch $D${libdir}/clock-epoch
> +}
> +
>  pkg_postinst:${PN}:libc-glibc () {
>         if ${@bb.utils.contains('PACKAGECONFIG', 'myhostname', 'true', 'f=
alse', d)}; then
>                 sed -e '/^hosts:/s/\s*\<myhostname\>//' \
> --
> 2.47.0
>

