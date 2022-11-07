Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498AEC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 13:56:52 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.3583.1667829401644607847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 05:56:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CTyglPX+;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id r12so16877532lfp.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 05:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K4MwnjhU0aAjSoe5vN5klRCtWy2fqTRXVr2i8mBWYQ0=;
        b=CTyglPX+L0ka20lxQRAX0mi6hd2cfqjjiTvV+QJ8SMqVhhMK72QTC3SEqr1RN4ER6H
         i1ganPyRpLF6co72Kh8TKzvh8oZES9zkTmm0ryIkOW7clKVg8hj/lsWEpzn8UQXy+aqU
         O1qzWSiV+fkb8lpbOhKGjheQzCmq2NWKoQorIg6KjuSfq2x1mjr70fjZ0PaWqdn3yv46
         s1peAEcnxtx3yeXonZdMm+eban2QBKsvM21ee+Ai7k4fAqV7iym9TjCTAzSddXBc/NBH
         MfS1qRjXsKS/Hqaz6E3vKupkM8NbM4EPdRQmN+H9/C/L2O8D1eNir9BOlfyeh7rzJCPR
         IgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4MwnjhU0aAjSoe5vN5klRCtWy2fqTRXVr2i8mBWYQ0=;
        b=045cW7ZB0TrxIP6dfF90OnxTMVVBN77LG1Jb/R/fOGbf6JQc7VhZ2oGEACB5zMJsJR
         RxDeaf9WE3RCXGkli8sN1mCuK2Johj69u25mJMIO+olHCNfuPUMzJDbDzs8HbdlHctuX
         a8a09uG2UlGz0i6dBntcC9+6Rruwq/J1Im68Eg9fZU+T1S7wVv1EBT5b/hSiO+SkGQeL
         TOQi1zZG1JqcLtVz+JGWOCFmxLFnrS4/qsx2BO+IpANWoDlhOlBHM4ej4Jyu/f7zddlR
         gq0PVzJy0d307hTwYdh4ryMSeiP+kXYUC7OYomtTtlw8GqlsUyZ+N9InVLVEF/uVJOug
         kHJg==
X-Gm-Message-State: ACrzQf1vAd4J2s8b2QYgQDDjDcr+BOonR7OaevB0dh7OBP4EYfgrnvhk
	a2DtsSp7SC3ycGiZzwv7ddsx+GW9YAhDj/0YDwo=
X-Google-Smtp-Source: AMsMyM410WUXmwQFb16Td9gYIACApgk0BwvpMkr+PO4jzQFGPu3Mv/Pf3pC7XCuBJLXV9/LO4H43cN5ZpvSjSWyJlhs=
X-Received: by 2002:a05:6512:2399:b0:4a2:94d6:da27 with SMTP id
 c25-20020a056512239900b004a294d6da27mr18039003lfv.131.1667829399576; Mon, 07
 Nov 2022 05:56:39 -0800 (PST)
MIME-Version: 1.0
References: <20221107135423.19834-1-s.zhmylev@yadro.com>
In-Reply-To: <20221107135423.19834-1-s.zhmylev@yadro.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Nov 2022 14:56:28 +0100
Message-ID: <CANNYZj_Dter5Pz_2EVE=9GBhK2O6OTNUiKLB02kFoDQg7_MiHA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] wic: make ext2/3/4 images reproducible
To: Sergey Zhmylev <s.zhmylev@yadro.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 13:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172843

Since this is v2, and v1 was controversial, it is good practice to
document the differences with v1.

Alex

On Mon, 7 Nov 2022 at 14:54, Sergey Zhmylev <s.zhmylev@yadro.com> wrote:
>
> From: Sergei Zhmylev <s.zhmylev@yadro.com>
>
> Ext2/3/4 FS contains not only mtime, but also ctime, atime and crtime.
> Currently, all the files are being added into the rootfs image using
> mkfs -d functionality which affects all the timestamps excluding mtime.
> This patch ensures all the timestamps inside the FS image equal to
> the SOURCE_DATE_EPOCH if it is set.
>
> Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
> ---
>  scripts/lib/wic/partition.py | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index bc889bdeb9..140f3c12dc 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -294,17 +294,38 @@ class Partition():
>                  f.write("cd etc\n")
>                  f.write("rm fstab\n")
>                  f.write("write %s fstab\n" % (self.updated_fstab_path))
> -                if os.getenv('SOURCE_DATE_EPOCH'):
> -                    fstab_time = int(os.getenv('SOURCE_DATE_EPOCH'))
> -                    for time in ["atime", "mtime", "ctime"]:
> -                        f.write("set_inode_field fstab %s %s\n" % (time, hex(fstab_time)))
> -                        f.write("set_inode_field fstab %s_extra 0\n" % (time))
>              debugfs_cmd = "debugfs -w -f %s %s" % (debugfs_script_path, rootfs)
>              exec_native_cmd(debugfs_cmd, native_sysroot)
>
>          mkfs_cmd = "fsck.%s -pvfD %s" % (self.fstype, rootfs)
>          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
>
> +        if os.getenv('SOURCE_DATE_EPOCH'):
> +            sde_time = hex(int(os.getenv('SOURCE_DATE_EPOCH')))
> +            debugfs_script_path = os.path.join(cr_workdir, "debugfs_script")
> +            files = []
> +            fields_to_set = ["atime", "ctime", "crtime"]
> +            if 'ROOTFS_RESET_MTIME' in os.environ:
> +                fields_to_set += ["mtime"]
> +            for root, dirs, others in os.walk(rootfs_dir):
> +                base = root.replace(rootfs_dir, "").rstrip(os.sep)
> +                files += [ "/" if base == "" else base ]
> +                files += [ base + "/" + n for n in dirs + others ]
> +            with open(debugfs_script_path, "w") as f:
> +                f.write("set_current_time %s\n" % (sde_time))
> +                f.write("set_inode_field /etc/fstab mtime %s\n" % (sde_time))
> +                f.write("set_inode_field /etc/fstab mtime_extra 0\n")
> +                for file in set(files):
> +                    for time in fields_to_set:
> +                        f.write("set_inode_field \"%s\" %s %s\n" % (file, time, sde_time))
> +                        f.write("set_inode_field \"%s\" %s_extra 0\n" % (file, time))
> +                for time in ["wtime", "mkfs_time", "lastcheck"]:
> +                    f.write("set_super_value %s %s\n" % (time, sde_time))
> +                for time in ["mtime", "first_error_time", "last_error_time"]:
> +                    f.write("set_super_value %s 0\n" % (time))
> +            debugfs_cmd = "debugfs -w -f %s %s" % (debugfs_script_path, rootfs)
> +            exec_native_cmd(debugfs_cmd, native_sysroot)
> +
>          self.check_for_Y2038_problem(rootfs, native_sysroot)
>
>      def prepare_rootfs_btrfs(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
> --
> 2.37.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172842): https://lists.openembedded.org/g/openembedded-core/message/172842
> Mute This Topic: https://lists.openembedded.org/mt/94866134/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

