Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.370.1620237516648823221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 10:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=on0d7uoO;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id x8so2422129qkl.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 10:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dmGrTX8hqWp1tl1vRDGCg7vpWFunFw8qhilIMsR6JZY=;
        b=on0d7uoOwafUKPamgb5+qZ+d4PIyDaQQ+fXl2X4CO8ZClp426MzJIwuv6bwKIrUTQQ
         BYcbovL1mXxvwSdk8TnxCO/IMev8rxs1z1AgH30Y/oRAgjsWLYG1NgseuNbXjB8VJyKf
         R+edAuj22/Ilpkg4R2EYGRcw9iaMrzyC+FVJfrYvGCvJ6uj+z1NjNzMpKGoZhNLSnTcu
         pEdkexOx7P8HqDOFzjvuvnBE9/QgvbaFn6PITMsWH9SCzTnsnw9UmMhEJJ/DiF18WtCN
         5ezRA1s/9lVaTnn7X2qjO1HovFrkYwCqpuEjx2ZlPYvQQ5y15JRDVoDlgOf15vYmiwOH
         mKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dmGrTX8hqWp1tl1vRDGCg7vpWFunFw8qhilIMsR6JZY=;
        b=Kt27Q5DjysJYpc/MqmHNgXVxDb0S9FW62FlAuWFBct88xhIwwXqe1NSqgXyExFSBoA
         3ABK+aLXXWdQIz8rcWI2q+yq4q44apGeVYGNHDbmaPoMzfhaVFZemC4G4N2ivn2rv/oD
         5LcKLWXHpDx/FNYQ451SNzdU6XaCUdAiCeSv6JzmMiIRLe+NCeNrqq7EPzaV8uzyzZ1C
         pygVbYmQ8VGXH07HIb2v40eFiHDCgtaOuZYnEgFjJxh9iwuIzZ87VDPVRVi0mKhPkoNH
         pdCYhfF7eTabqby+45+0hFBU7AyGSxFom5xZ6m9QNMEApyBt14u4dGkYwBg6EgaoUnYz
         xHxQ==
X-Gm-Message-State: AOAM531Y4eT6aMRRO4iy5qNvabnCYD4MXHKNaIg+eLuLUrQsvRsNFYo7
	6GK7IvG1ViYo+FsB5HlSi9c0WrjXO0NVKtK2wrs=
X-Google-Smtp-Source: ABdhPJxJ/DC4OPeGfAsZxnrur2T+9kGyhlvzLOa4H2kq30queDVtc4t+eXLl4gwEx1oFbMwqOi3415F7PpaFCppSQSs=
X-Received: by 2002:a05:620a:9c8:: with SMTP id y8mr3156770qky.125.1620237515489;
 Wed, 05 May 2021 10:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com> <20210505151850.660512-12-alex.kanavin@gmail.com>
In-Reply-To: <20210505151850.660512-12-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 May 2021 10:58:09 -0700
Message-ID: <CAMKF1spjh5QsFYNmmGWpoiSKM6QNMhS+7pYgN1TLxhZV5e0NbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 12/61] systemd: backport a patch to avoid unnecessary rsync dependency with latest meson
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 5, 2021 at 8:19 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...d25119a495009ea62f79e5daec34cc464628.patch | 53 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd.inc         |  4 +-
>  2 files changed, 56 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec34cc464628.patch
>
> diff --git a/meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec34cc464628.patch b/meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec34cc464628.patch
> new file mode 100644
> index 0000000000..ae449791f1
> --- /dev/null
> +++ b/meta/recipes-core/systemd/files/7c5fd25119a495009ea62f79e5daec34cc464628.patch
> @@ -0,0 +1,53 @@
> +From 7c5fd25119a495009ea62f79e5daec34cc464628 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
> +Date: Mon, 12 Apr 2021 14:03:32 +0200
> +Subject: [PATCH] meson: do not fail if rsync is not installed with meson
> + 0.57.2
> +
> +https://github.com/mesonbuild/meson/issues/8641
> +
> +Our CI started to fail. Even if the change is reverted in meson,
> +we need a quick workaround here.
> +
> +Upstream-Status: Backport
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + man/meson.build | 25 ++++++++++++++-----------
> + 1 file changed, 14 insertions(+), 11 deletions(-)
> +
> +diff --git a/man/meson.build b/man/meson.build
> +index 3cae8446cda..f9c4b83dc81 100644
> +--- a/man/meson.build
> ++++ b/man/meson.build
> +@@ -184,17 +184,20 @@ html = custom_target(
> +         depends : html_pages,
> +         command : ['echo'])
> +
> +-run_target(
> +-        'doc-sync',
> +-        depends : man_pages + html_pages,
> +-        command : ['rsync', '-rlv',
> +-                   '--delete-excluded',
> +-                   '--include=man',
> +-                   '--include=*.html',
> +-                   '--exclude=*',
> +-                   '--omit-dir-times',
> +-                   meson.current_build_dir(),
> +-                   get_option('www-target')])
> ++rsync = find_program('rsync', required : false)
> ++if rsync.found()
> ++        run_target(
> ++                'doc-sync',
> ++                depends : man_pages + html_pages,
> ++                command : [rsync, '-rlv',
> ++                           '--delete-excluded',
> ++                           '--include=man',
> ++                           '--include=*.html',
> ++                           '--exclude=*',
> ++                           '--omit-dir-times',
> ++                           meson.current_build_dir(),
> ++                           get_option('www-target')])
> ++endif
> +
> + ############################################################
> +
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> index 7d3b3064ba..3a919fd82b 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -16,6 +16,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>
>  SRCREV = "17472dca0160cbe7b807ca648475fd70d0d62fe5"
>  SRCBRANCH = "v247-stable"
> -SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
> +SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH} \
> +           file://7c5fd25119a495009ea62f79e5daec34cc464628.patch \
> +"

the patch should be added in systemd_247.6.bb

>
>  S = "${WORKDIR}/git"
> --
> 2.31.1
>
>
> 
>
