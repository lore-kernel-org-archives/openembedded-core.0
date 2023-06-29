Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3C5EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 11:44:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.6137.1688039059502278468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 04:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=cuw0E3y5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fa9850bfd9so5397935e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 04:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1688039058; x=1690631058;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWSctFoY6DqPCOl20xAWMzAoJVl8w+GhzOaPigoZmGg=;
        b=cuw0E3y5hS6YD/InU/Vr75D5jnI9356cWn+y3XhtYV86muRmrP61yAhiEu8INXoRiS
         UegzCBRkWExQPI/i8P363VEJ5c7o/V2X4xKjB95b7yyOq9zBB9EHUogDSkjYH/330qgu
         2Hd1A2E32WkBsKxryD3aCnSDK3BT8X2FpopvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688039058; x=1690631058;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cWSctFoY6DqPCOl20xAWMzAoJVl8w+GhzOaPigoZmGg=;
        b=WBeIbUJT3bOVMkiSTBFdfbrhzY+h35Swb2a95vOrOGXrHCuZrTT9wlQlhCaqWWuHKP
         /dHWDTx8ikOOiSvXYy1Slo7iXzMpnEJt/FvWBx0c8vA3aP6ybBYbI9Cghqzt+yw5VhTQ
         hlYQ7jF1nzkDDWCyKIUcpbfXgXWBS0sBsSEnX6IzmaAuvmKjKuf2FSLeLx1BmL//aOID
         MGQmAUrG4oxiYWUgGOXh0eTSTL0zLs5HTTRZqMTFt0drdRt8f/jTPNtJOJDkHPYjmA7C
         v+0jVy4xuKlmeHGtjcgn9E/8Adtc677GjJHA1obxo/FYnb2wfwFjSsTC4RkqiUvRyroa
         0Y5g==
X-Gm-Message-State: AC+VfDznqwbp0w6GXraKLvi/Sp6MQAHO3zK/tugQ5RjmtqXDu33kV2P6
	puEMXjyqb8Lo7iI6kji3EF7Srdw5snHdfAoe2d4=
X-Google-Smtp-Source: ACHHUZ48zTF/fiG7QAiHKIJHY2IVRyBRuTp2yNlurzyyZfTM7tRF3tsOXOQAtQy5OcJOqPC8+s11XQ==
X-Received: by 2002:a7b:c4ca:0:b0:3fb:4165:9deb with SMTP id g10-20020a7bc4ca000000b003fb41659debmr6991365wmk.18.1688039057781;
        Thu, 29 Jun 2023 04:44:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717? ([2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717])
        by smtp.gmail.com with ESMTPSA id a10-20020a1cf00a000000b003f8fb02c413sm16318555wmb.8.2023.06.29.04.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 04:44:17 -0700 (PDT)
Message-ID: <54b0fde47c4a83f27b045d7f988fafcfd8bdc8ff.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH V2] systemd: fix a dead link under
 /var/log
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 29 Jun 2023 12:44:16 +0100
In-Reply-To: <20230629101038.3772750-1-changqing.li@windriver.com>
References: <20230629101038.3772750-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 11:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183620

On Thu, 2023-06-29 at 18:10 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> Commit 6fe23ff31c0 changed README to a symlink to README.logs, and
> install README.logs under systemd doc dir.
>=20
> But for OE, systemd doc dir is splited into package systemd-doc, when it
> is not installed on the target, there will be an dead link:
> Eg:
> root@intel-x86-64:/var/log# ls -l README
> lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/syst=
emd/README.logs
> root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs
> ls: cannot access '../../usr/share/doc/systemd/README.logs': No such file=
 or directory
>=20
> Meantime, relative path for a symlink also will meet issue like
> "No such file or directory"
>=20
> Since OE have set ForwardToSyslog=3Dyes, this README is not needed.
> So remove this symlink from package systemd
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...on-t-create-symlink-README-in-this-f.patch | 42 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_253.3.bb    |  2 +-
>  2 files changed, 43 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-legacy.conf.in=
-Don-t-create-symlink-README-in-this-f.patch
>=20
> diff --git a/meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-=
create-symlink-README-in-this-f.patch b/meta/recipes-core/systemd/systemd/0=
001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch
> new file mode 100644
> index 0000000000..a2644bba8e
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-create-=
symlink-README-in-this-f.patch
> @@ -0,0 +1,42 @@
> +From b17826490c1db2051dda23550ebdcd7f10e23479 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Wed, 28 Jun 2023 13:49:41 +0800
> +Subject: [PATCH 1/2] legacy.conf.in: Don't create symlink README in this=
 file
> +
> +Commit 6fe23ff31c0 changed README to an symlink to README.logs, and
> +install README.logs under systemd doc dir.
> +
> +But for OE, systemd doc dir is splited into package systemd-doc, when it
> +is not installed on the target, there will be an dead link:
> +Eg:
> +root@intel-x86-64:/var/log# ls -l README
> +lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -> ../../usr/share/doc/sys=
temd/README.logs
> +root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.log=
s
> +ls: cannot access '../../usr/share/doc/systemd/README.logs': No such fil=
e or directory
> +
> +So remove this symlink from package systemd
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + tmpfiles.d/legacy.conf.in | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/tmpfiles.d/legacy.conf.in b/tmpfiles.d/legacy.conf.in
> +index 4f2c0d7c43..62e2ae0986 100644
> +--- a/tmpfiles.d/legacy.conf.in
> ++++ b/tmpfiles.d/legacy.conf.in
> +@@ -12,9 +12,6 @@
> +=20
> + d /run/lock 0755 root root -
> + L /var/lock - - - - ../run/lock
> +-{% if CREATE_LOG_DIRS %}
> +-L /var/log/README - - - - ../..{{DOC_DIR}}/README.logs
> +-{% endif %}
> +=20
> + # /run/lock/subsys is used for serializing SysV service execution, and
> + # hence without use on SysV-less systems.
> +--=20
> +2.25.1
> +
> diff --git a/meta/recipes-core/systemd/systemd_253.3.bb b/meta/recipes-co=
re/systemd/systemd_253.3.bb
> index 87fbf6f785..d8b94e370c 100644
> --- a/meta/recipes-core/systemd/systemd_253.3.bb
> +++ b/meta/recipes-core/systemd/systemd_253.3.bb
> @@ -28,6 +28,7 @@ SRC_URI +=3D " \
>             file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-=
to-.patch \
>             file://27254.patch \
>             file://27253.patch \
> +           file://0001-legacy.conf.in-Don-t-create-symlink-README-in-thi=
s-f.patch \
>             "
> =20
>  # patches needed by musl
> @@ -760,7 +761,6 @@ FILES:udev +=3D "${base_sbindir}/udevd \
> =20
>  FILES:udev-hwdb =3D "${rootlibexecdir}/udev/hwdb.d \
>                     "
> -
>  RCONFLICTS:${PN} =3D "tiny-init ${@bb.utils.contains('PACKAGECONFIG', 'r=
esolved', 'resolvconf', '', d)}"
> =20
>  INITSCRIPT_PACKAGES =3D "udev"

The whitespace change in this patch shouldn't be there.

I'm not sure we really want to carry a patch doing this "forever".=20

Could we turn off CREATE_LOG_DIR or would that break something else?

Cheers,

Richard



