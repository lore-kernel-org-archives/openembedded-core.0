Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26DEC636CC
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 12:16:33 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.10571.1675167384287683451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Jan 2023 04:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S7+KC/oP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso10435008wmq.5
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 04:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ga9xdA3229yNHB/iDTrUBD655+WWMz9RN7rjwEByabI=;
        b=S7+KC/oPLbZB9XM4ye1nMYPf0w/1h2wy5rFhDqjxm3a1N8bMde2CQej2Gb7xo5Ephe
         BOrVC5lvJscL8iQ490iek7IFSsQB03puHS2da8JRgRR6MFe8MAi/c6NkvtgUklT8lUKp
         cPgEbtbb1h7vELEfIr/oMPRvo8EY0qLbsnwfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ga9xdA3229yNHB/iDTrUBD655+WWMz9RN7rjwEByabI=;
        b=AyXMNzLykLXaBAS2I/oXaBxKrWYiZJ3vUChAwpm1Q2yXtMew+dbRNircrEuEzsw/jX
         NQsk46j/oUlVgwzq28pImSmko6VoQs4aAyrwMxMNgDQwjTVLD6xQJCEH+8Hk0MYjTnXJ
         axk7L39mNfpg5KMeyA0G805Sf+2QI7ha52Hffq7ahrcurxbANCx1245VKlfYHIOt4aeL
         avRud/PuinEFkHNAEntZfGtnLXttL8lQnawklyi+AILzoskNYS5PRuVdZJiDx60cClJn
         fmAPvrNakmRVrIMmHvZfeeedD7s84yjOWLa8B95KiyC+U/k/3Ex7ZXSva0CKBDoavAVT
         0tWA==
X-Gm-Message-State: AO0yUKWsyAU3NG29EUCDBFA09fObT+QDqV0UUKY3Fkytnc/XMp6HYNyg
	SYFy1XIfUrXqJJ+uTWc2FLIAag==
X-Google-Smtp-Source: AK7set8c+WbCCq+OpQWX9uYbzTMBRIXr8HyWjXaXAU38fOFxUlW27lrdEuIouz8eDjj+YXCXWxSZNA==
X-Received: by 2002:a1c:4c19:0:b0:3dc:5342:9f53 with SMTP id z25-20020a1c4c19000000b003dc53429f53mr10129591wmf.38.1675167382607;
        Tue, 31 Jan 2023 04:16:22 -0800 (PST)
Received: from [172.27.246.116] ([212.187.182.163])
        by smtp.gmail.com with ESMTPSA id x2-20020a05600c2d0200b003dd86c24005sm1181489wmf.42.2023.01.31.04.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 04:16:22 -0800 (PST)
Message-ID: <6113ca281120b581edd4c594813f6f9717b2f9ba.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bootimg-efi.py: Skip installing kernel-image
 into boot partition for rootfs-reliant systems.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kareem Zarka <zarkakareem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Kareem Zarka <kareem.zarka@huawei.com>, Stefan Schmidt
	 <stefan.schmidt@huawei.com>, Andrei Gherzan <andrei.gherzan@huawei.com>, 
	Zygmunt Krynicki <zygmunt.krynicki@huawei.com>
Date: Tue, 31 Jan 2023 12:16:21 +0000
In-Reply-To: <20230131120455.2966241-1-zarkakareem@gmail.com>
References: <20230131120455.2966241-1-zarkakareem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 12:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176518

On Tue, 2023-01-31 at 13:04 +0100, Kareem Zarka wrote:
> From: Kareem Zarka <kareem.zarka@huawei.com>
>=20
> The issue with installing the kernel-image to both rootfs
> and boot partition is that some systems rely on the kernel-image in
> rootfs and not in the boot partition.
> This leads to duplication of the kernel-image, which can cause
> unnecessary storage usage and potential compatibility issues.
>=20
> This patch provides a solution to this problem by adding a new
> parameter "skip-kernel-install" to the wic kickstart file, which can
> be passed to the plugin.
> If the parameter is provided, the plugin will skip installing the
> kernel-image to the boot partition, avoiding duplication and potential
> issues.
>=20
> By adding this new parameter, we give the users the option to install
> the kernel-image only in rootfs, or to install it in both rootfs and
> boot partition, depending on their needs and preferences.
> This will help to improve the system's storage usage and compatibility.
>=20
> Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/=
wic/plugins/source/bootimg-efi.py
> index 4b00913a70..e04d49abe6 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -363,9 +363,13 @@ class BootimgEFIPlugin(SourcePlugin):
>                  objcopy_cmd +=3D " %s %s/EFI/Linux/linux.efi" % (efi_stu=
b, hdddir)
>                  exec_native_cmd(objcopy_cmd, native_sysroot)
>          else:
> -            install_cmd =3D "install -m 0644 %s/%s %s/%s" % \
> -                (staging_kernel_dir, kernel, hdddir, kernel)
> -            exec_cmd(install_cmd)
> +            # skip_kernal_install was added to source_params to conifgur=
e installing the kernel-image.
> +            # set skip_kernal_install in the kickstart file to skip inst=
alling it into hdddir.
> +            # if not set then the kernel-image will be installed.
> +            if not  source_params.get('skip_kernal_install'):
> +                install_cmd =3D "install -m 0644 %s/%s %s/%s" % \
> +                    (staging_kernel_dir, kernel, hdddir, kernel)
> +                exec_cmd(install_cmd)
> =20
>          if get_bitbake_var("IMAGE_EFI_BOOT_FILES"):
>              for src_path, dst_path in cls.install_task:

I'm fine with adding such an option but could you also add a test for
it please? wic has good test coverage and I'd like to keep that. You
can run the tests with:

oe-selftest -r wic

Cheers,

Richard


