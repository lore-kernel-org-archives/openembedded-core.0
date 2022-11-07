Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61129C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:10:52 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.3677.1667830249000360865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HD3R+F0d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id l14so16428256wrw.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w17H1gBjcnwnhNpPciA/CZV8iKb60GGCUpPjjViyW0o=;
        b=HD3R+F0dub52+sQH8udNkZa9RJ97HV5HYtpUXTSclHyUnXmO0OeRtfSYfl72TSzmiK
         dPdbLlKbih/1eXuKwFWpJk6TqcJ3a9nW486icT87ElL+i06e5VfxlCOyGndIYcqkH5O7
         P2KG2s0GmZ/zYXEC8of6UhXl7R+c7ZG/HxVp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w17H1gBjcnwnhNpPciA/CZV8iKb60GGCUpPjjViyW0o=;
        b=X7vq7aL8QPRVfMFjbdCj39t+y5t8RVvQY0VNDOlFUYbm48CP/shbT0qF/nKcErjIN8
         BUimaixfbrEBgTnRlNp2779HIx5Rn5lKax6tXBG7QsJAcGimWeYEhApoQTVjIngnWrO7
         hcIWKUPc5hBj7dzf+Y5Q1Rn1Vk/+QTSdww/kOrKKEXO29nuV0GdcAkttdxn8M8cW6cDF
         609alRYxsSAoK3KVyWA2KAshcAVnxHRxUhtxGbkMkJeCrnweBbitLos6d+DFqlnumNO2
         +GfdqkGHIiS1toz5BopVa81482TEcrEDjO/ZcTQnUBY9+2n0uTcrWIUyoFx31TJS4Hec
         ghuA==
X-Gm-Message-State: ACrzQf15+rqMEPDcQMShNLMbfjBWxNUsIrnevWSqqF6zeLUJNMVA/2eb
	PRg7exzPUB/ubvIJfgvDuE2UwA==
X-Google-Smtp-Source: AMsMyM7OMDJG+bSIHYM4MVY+t4RZnbrWFRXOF17UBYgodVVyUxZ8XWroWROdFAaT8AkwT8IQUuPZ1Q==
X-Received: by 2002:a5d:4486:0:b0:236:6a53:3a19 with SMTP id j6-20020a5d4486000000b002366a533a19mr576142wrq.409.1667830247371;
        Mon, 07 Nov 2022 06:10:47 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5b94:fd41:9ce0:fad? ([2001:8b0:aba:5f3c:5b94:fd41:9ce0:fad])
        by smtp.gmail.com with ESMTPSA id v14-20020adfedce000000b00236883f2f5csm7521475wro.94.2022.11.07.06.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:10:46 -0800 (PST)
Message-ID: <c4f121e566303454f6ac8e75c99e592b2f75f0cf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] wic: make ext2/3/4 images reproducible
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sergey Zhmylev <s.zhmylev@yadro.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 07 Nov 2022 14:10:44 +0000
In-Reply-To: <20221107135423.19834-1-s.zhmylev@yadro.com>
References: <20221107135423.19834-1-s.zhmylev@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172845

On Mon, 2022-11-07 at 16:54 +0300, Sergey Zhmylev wrote:
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
>  scripts/lib/wic/partition.py | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
>=20
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index bc889bdeb9..140f3c12dc 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -294,17 +294,38 @@ class Partition():
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
> +            fields_to_set =3D ["atime", "ctime", "crtime"]
> +            if 'ROOTFS_RESET_MTIME' in os.environ:
> +                fields_to_set +=3D ["mtime"]

This isn't mentioned in the commit message and isn't documented. I
don't think we should add "magic" variables like this that let us work
around issues.

> +            for root, dirs, others in os.walk(rootfs_dir):
> +                base =3D root.replace(rootfs_dir, "").rstrip(os.sep)
> +                files +=3D [ "/" if base =3D=3D "" else base ]
> +                files +=3D [ base + "/" + n for n in dirs + others ]
> +            with open(debugfs_script_path, "w") as f:
> +                f.write("set_current_time %s\n" % (sde_time))
> +                f.write("set_inode_field /etc/fstab mtime %s\n" % (sde_t=
ime))
> +                f.write("set_inode_field /etc/fstab mtime_extra 0\n")

What if we didn't modify /etc/fstab? Shouldn't that be left in the code
you remove above instead?

I'd suggest dropping these mtime pieces, then this patch can merge and
we can discuss the other pieces. I do think further work is needed to
handle mtime correctly and not need to hack around the issue.

Cheers,

Richard

