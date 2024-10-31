Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40ED7D7495C
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 20:29:30 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.22585.1730406568752107429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 13:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bNA2A0ML;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so1794629e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 13:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730406567; x=1731011367; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2G/Yjx42t1QiN/zO5jYRwisWz+lxlypBFim53wub/Sg=;
        b=bNA2A0ML+JAwpCQPDddMUQoyWU1WT+ZeyMZZuH1bROvSlqv2uUCjL38PY6rLkMFWJ1
         INO31/yqH6CLxibzpgOidBFSbfo0JtUvdSf3gDYueMKDDh0NbNWmxee5LmNSeLNC6TiM
         qd92ZecGLObwlpRRFtDJcHBuVcb0GLI6wF+mhSW7MHJfiFyLJjLp0KdVNHKs18rDkPgO
         m8nOiDhRvySTkqq4j/4XoZU+JdPPzHQHr/Hodl/6yyzT8mVmt4G3Oaz7BoFznMYK2Z0W
         +TQkfQVl2ofwumuAwvR9bzrPbgSw4h7oMP1Y9M+al2+Lg8CCkNcLPVmroy9AVGSEWA73
         m9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730406567; x=1731011367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2G/Yjx42t1QiN/zO5jYRwisWz+lxlypBFim53wub/Sg=;
        b=vUwmsQmiV00p/OcqvELhhaAM40WG0r1Qy6XsijZ71g+zebeishFKt4Ft0QbZMxT6cE
         VrCDnmzSNjQ4Yl3whs08Q6doJCrffbGnxDIV3Jl5dfEDf29tQc0Z76DwxP9qBJQrduJo
         nGd2unxj2592lyjou2bntKzvhZA9YzpXH3L95hFkF4DSUg7sLhNRgAJuHGgypV4I+i95
         sKzhCm+D7KWv7rxzUcP4Mm9kS6j0Z64wo96dwUDtbIzN4YkPXiH7Zot23JbwombXQl2D
         vCd2GDXowMNMxMuYTJDsXPaH2bE/5PbfF+9ujSNDYHDBHjaKJXrHw2T1Luk2Z/geKm29
         39eQ==
X-Gm-Message-State: AOJu0YzbXXAI1a67fWbR3vvhkAzU5tKtk++L+Eu0UeBVPk4KgGGM8Lrq
	5MIn+M3hcKNjVk211J7lmn3SA4BgYYppe1JoDvZJAW123rJcVSpT85qz61chFaX0m1CXVQ/zBUU
	B2gOoFFRzMoKjbKjh8+yQq9VH4S4=
X-Google-Smtp-Source: AGHT+IFZXXSfZ8chmbwSlLUXw7wIcP3049VeDGCFnSgSXVR2XOLsJDi2qFEU/u+9VRRxbP1BL/idIYdH/8aTk8RCY3Q=
X-Received: by 2002:a05:6512:3d05:b0:539:df2f:e115 with SMTP id
 2adb3069b0e04-53b34909ffamr11581883e87.23.1730406566581; Thu, 31 Oct 2024
 13:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241030050745.3702603-1-hongxu.jia@windriver.com> <20241030050745.3702603-4-hongxu.jia@windriver.com>
In-Reply-To: <20241030050745.3702603-4-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 31 Oct 2024 14:29:14 -0600
Message-ID: <CAJdd5GbTi_BUS1v_+=Y_Q_5W5sK2x75Aij8KvD_OoLS_mgrZvQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH 3/6] meta/lib/oe/spdx30_tasks.py: improve debug
 log in add_package_files
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 20:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206591

LGTM

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Tue, Oct 29, 2024 at 11:07=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.c=
om> wrote:
>
> While SPDX_INCLUDE_SOURCES =3D "1" [1], there are mess of `Adding file'
> in debug log
> '''
> DEBUG: Adding file tmp/work/x86_64-linux/gettext-minimal-native/0.22.5/sp=
dx/3.0.1/work/sources-unpack/COPYING to http://spdx.org/spdxdocs/gettext-mi=
nimal-native-1fa0d5cb-2bb8-5631-9fab-cd219801733f/e2c2366654a818397af8b8ddb=
45fda88c2c71aa2d71695861f82376a658d8e66/document/gettext-minimal-native
> DEBUG: Adding file tmp/work/x86_64-linux/gettext-minimal-native/0.22.5/sp=
dx/3.0.1/work/gettext-0.22.5/.tarball-version to http://spdx.org/spdxdocs/g=
ettext-minimal-native-1fa0d5cb-2bb8-5631-9fab-cd219801733f/e2c2366654a81839=
7af8b8ddb45fda88c2c71aa2d71695861f82376a658d8e66/document/gettext-minimal-n=
ative
> '''
>
> Summary the total number other than print for each file.
> '''
> DEBUG: Added 7201 files to http://spdx.org/spdxdocs/gettext-minimal-nativ=
e-1fa0d5cb-2bb8-5631-9fab-cd219801733f/f5e0e04913ac4c595be791fc001d545a7751=
9ed6ee8c743deef721ca0898bc94/document/gettext-minimal-native
> '''
>
> [1] https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-SPDX=
_INCLUDE_SOURCES
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index e0b656d81f..5aeed5cd6f 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -155,8 +155,6 @@ def add_package_files(
>              if filepath.is_symlink() or not filepath.is_file():
>                  continue
>
> -            bb.debug(1, "Adding file %s to %s" % (filepath, objset.doc._=
id))
> -
>              filename =3D str(filepath.relative_to(topdir))
>              file_purposes =3D get_purposes(filepath)
>
> @@ -187,6 +185,8 @@ def add_package_files(
>
>              file_counter +=3D 1
>
> +    bb.debug(1, "Added %d files to %s" % (len(spdx_files), objset.doc._i=
d))
> +
>      return spdx_files
>
>
> --
> 2.25.1
>

