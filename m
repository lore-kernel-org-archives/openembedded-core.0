Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B50C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 16:05:14 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.375.1667491513314023275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 09:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dN0X3U/A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5so1453881wmo.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 09:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZT/SNsj6yY8IlBl7K/r8cmVIq5vUeolyu09iq6jWP/Q=;
        b=dN0X3U/AQKCvM0rB6Lg3IvEbLT85Jo0vUFow6Ekygcban3cjVwlFzayY80QJaDtlza
         aA3PHuaEz2NXE7OcScncb9FIER+RnEYYtNfmHp9PewEN39t815tntf2rNKKNa0ASq0E6
         9As4fwVvJExvnDpdXtEXCFIbR2n1Pps/DFfvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZT/SNsj6yY8IlBl7K/r8cmVIq5vUeolyu09iq6jWP/Q=;
        b=zHeeJZ9m7u3ovCFY7ZfMxiCYpIAZ1nfxKBtG/Z/FpgxBY+6PkRRiI6Cxd98i7OBv7G
         qRcxXUfbRqaPhGahg1wQeMSs+f10IhP3rQ5iHaeVlzuyF+1pqigD5XeI68vKxAkSRBe+
         lS/Iv/Cu0CQqhuiQRTNYylbFqR1e0vAGV5R6xZbQlBZxUG1A8jGM0rxvFx4CMDqf1I5z
         6xu3B2pUz8i2axdS6QDJFY1GPKfIw9EUm1hAeVazAjNZ2DzSU6ve1hw2UM+XadnTwvO+
         fOQPFU7yYSx9Ys/XO8K9ZR1IZFhQ6Rh71ccJ06/l+F90mOyX0qY3ZITPs3wxdGdGDPYP
         Z6Qg==
X-Gm-Message-State: ACrzQf2HkDo9eJ0KfMZMALCZrf4L6Dyy7fhzPiR3jV37lvIDF/4jJmsW
	ESQpcoXZdzgzmXxu55Z3o6bpjg==
X-Google-Smtp-Source: AMsMyM6cnv/gog2IHL6GX++2PoL+UcJA2X8j2IN51XjabCXuA0Q02JMYJ/X1LwAsdb5U6eUA6khKhA==
X-Received: by 2002:a7b:c409:0:b0:3cf:4c81:8936 with SMTP id k9-20020a7bc409000000b003cf4c818936mr29896303wmi.38.1667491511605;
        Thu, 03 Nov 2022 09:05:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fec4:d12e:21c:2d17? ([2001:8b0:aba:5f3c:fec4:d12e:21c:2d17])
        by smtp.gmail.com with ESMTPSA id i1-20020a05600c354100b003cf7055c014sm408356wmq.1.2022.11.03.09.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 09:05:10 -0700 (PDT)
Message-ID: <70a1078f7098f7f1a83b88edac014be98b2da46b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wic: make ext2/3/4 images reproducible
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sergey Zhmylev <s.zhmylev@yadro.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 03 Nov 2022 16:05:10 +0000
In-Reply-To: <20221103152607.3940380-1-s.zhmylev@yadro.com>
References: <20221103152607.3940380-1-s.zhmylev@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 16:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172640

On Thu, 2022-11-03 at 18:26 +0300, Sergey Zhmylev wrote:
> From: Sergei Zhmylev <s.zhmylev@yadro.com>
>=20
> Ext2/3/4 FS contains not only mtime, but also ctime, atime and crtime.
> Currently, all the files are being added into the rootfs image using
> mkfs -d functionality which affects all the timestamps excluding mtime.
> This patch ensures all the timestamps inside the FS image equal to
> the SOURCE_DATE_EPOCH if it is set.
>=20
> Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
> ---
>  scripts/lib/wic/partition.py | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
>=20
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index bc889bdeb9..b7965267cb 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -294,17 +294,34 @@ class Partition():
>                  f.write("cd etc\n")
>                  f.write("rm fstab\n")
>                  f.write("write %s fstab\n" % (self.updated_fstab_path))
> -                if os.getenv('SOURCE_DATE_EPOCH'):
> -                    fstab_time =3D int(os.getenv('SOURCE_DATE_EPOCH'))
> -                    for time in ["atime", "mtime", "ctime"]:
> -                        f.write("set_inode_field fstab %s %s\n" % (time,=
 hex(fstab_time)))
> -                        f.write("set_inode_field fstab %s_extra 0\n" % (=
time))
>              debugfs_cmd =3D "debugfs -w -f %s %s" % (debugfs_script_path=
, rootfs)
>              exec_native_cmd(debugfs_cmd, native_sysroot)
> =20
>          mkfs_cmd =3D "fsck.%s -pvfD %s" % (self.fstype, rootfs)
>          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=3Dpseudo)
> =20
> +        if os.getenv('SOURCE_DATE_EPOCH'):
> +            sde_time =3D hex(int(os.getenv('SOURCE_DATE_EPOCH')))
> +            debugfs_script_path =3D os.path.join(cr_workdir, "debugfs_sc=
ript")
> +            files =3D []
> +            for root, dirs, others in os.walk(rootfs_dir):
> +                base =3D root.replace(rootfs_dir, "").rstrip(os.sep)
> +                files +=3D [ "/" if base =3D=3D "" else base ]
> +                files +=3D [ base + "/" + n for n in dirs + others ]
> +            with open(debugfs_script_path, "w") as f:
> +                f.write("set_current_time %s\n" % (sde_time))
> +                f.write("set_super_value hash_seed %s\n" % (self.fsuuid)=
)
> +                for file in set(files):
> +                    for time in ["atime", "mtime", "ctime", "crtime"]:
> +                        f.write("set_inode_field \"%s\" %s %s\n" % (file=
, time, sde_time))
> +                        f.write("set_inode_field \"%s\" %s_extra 0\n" % =
(file, time))
> +                for time in ["wtime", "mkfs_time", "lastcheck"]:
> +                    f.write("set_super_value %s %s\n" % (time, sde_time)=
)
> +                for time in ["mtime", "first_error_time", "last_error_ti=
me"]:
> +                    f.write("set_super_value %s 0\n" % (time))
> +            debugfs_cmd =3D "debugfs -w -f %s %s" % (debugfs_script_path=
, rootfs)
> +            exec_native_cmd(debugfs_cmd, native_sysroot)
> +
>          self.check_for_Y2038_problem(rootfs, native_sysroot)
> =20
>      def prepare_rootfs_btrfs(self, rootfs, cr_workdir, oe_builddir, root=
fs_dir,

I don't think this is the correct behaviour as it will effectively
remove all timestamp information.

Many of the timestamps are ok to use and are reproducible (e.g anything
from the packaging backend). There will only be recent entries like the
ftab one that specifically need to be set to SDE.

Some changes here are good (like the first/last error time and mkfs
time and so on) but I think changing all of atime, mtime, ctime etc. is
not needed.

Could you see if there is a way we could only change the needed
values.=C2=A0

We could also consider a clamp approach where we only change timestamps
later than SDE as that is successful in some other places.

Cheers,

Richard


