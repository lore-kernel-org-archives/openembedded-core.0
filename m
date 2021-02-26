Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.15175.1614370193648725091
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 12:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GFGbCunA;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id q85so10373847qke.8
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 12:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=PjQK4p0SkjqrDOaFY3RJmHMscJ7kIa/YCHQjrrxEcuw=;
        b=GFGbCunAgQheVFADizk7cj/VMM2a8Y9MjrdfSJ6zz1I3z361ZS3m+P2XATya+9viRz
         gO3GMVK9FZ8Nb/7zLZpZqqFcZMZYXY4vaRgi9q2FBVyeDs9wfayE0PXUcSH6zLCuqRQG
         hL+WL3LsnvRAUGNroo2XT/Ejm5tRpnvBNOzInou2GA17NBGMug6CkOXYNQ57SKXiBZq7
         5sDD0Bkb3jSIkzJihEnxiZ6W3kYJQQHSQozgYNO8vEFakybgcu5I0qac85RS92SxMPHl
         fZWLpkUmVQUedZ5B7Q9YQA9BOJ6yezj6KRBYSUWXNVol74TYD833E49tav7lM8QjLf/W
         Q/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=PjQK4p0SkjqrDOaFY3RJmHMscJ7kIa/YCHQjrrxEcuw=;
        b=nSsWbynJcUiE6tQTGjjacquuB3AXneLtqg6v9DyuuevEYwZkZ0/AE2/NPR9RFSMiob
         KyS7/LZsEoONC7CgDvivXEcystIUpE38wKoRPb0g939xuc/3ZFbf98QqKCbEVGVzWLd0
         dEG6TPWrAtZ+GZxU3MvqGt2EiVmfzwfQJ37rdb9HkvGp756Rz9GZvSS0idDNPRlWoR2v
         eslOJ+mp8q0KZnAHiN3MbxWl2uiKcoi2JOTFXgJ3b19IpCgguZv5Ufbn0arLEbjLRPPV
         4bF84wulpD5vLZo/pQ+BNI2+RJrqJjfuESDNyjeoeE6dbGzdwFAyoBohibJnx+bEkldB
         7zeg==
X-Gm-Message-State: AOAM532+9UZu53BmriHhgZgQ2rgt4FGv75/v2B4MCxkEyxgD93THplb5
	w1Gid4irtlqKas2Cg1jNKpKw1z9BauQI9dlQUuhaI+I48yFQqw==
X-Google-Smtp-Source: ABdhPJyKhPEErnF2WbcANJ5TJMmYEBgXWEVEY0kJbFfPkgfyfvTyG9UsaTwCIGPbpDOikwe75DF1bmYWuhsA2M5PMHU=
X-Received: by 2002:a05:620a:12ae:: with SMTP id x14mr4555878qki.25.1614370192454;
 Fri, 26 Feb 2021 12:09:52 -0800 (PST)
MIME-Version: 1.0
References: <20210225212026.176719-1-raj.khem@gmail.com>
In-Reply-To: <20210225212026.176719-1-raj.khem@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 26 Feb 2021 12:09:26 -0800
Message-ID: <CAMKF1spAHPAgOcG_yg+yqygHL1qcySx=Nu4iJAc-aD7d+fcwEg@mail.gmail.com>
Subject: Re: [PATCH] core-image-minimal: Raise size limit to 16M
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this patch is not needed, for record I have
EXTRA_IMAGE_FEATURES_append = " package-management
ssh-server-dropbear" in config metadata which trips over the df test

On Thu, Feb 25, 2021 at 1:20 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> latest core image mimial/sysvinit has less free space
> so df tests fail with
>
> AssertionError: False is not true : Not enough space on image. Current size is 2717
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/images/core-image-minimal.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
> index 19f27f8395..a48e634546 100644
> --- a/meta/recipes-core/images/core-image-minimal.bb
> +++ b/meta/recipes-core/images/core-image-minimal.bb
> @@ -8,5 +8,5 @@ LICENSE = "MIT"
>
>  inherit core-image
>
> -IMAGE_ROOTFS_SIZE ?= "8192"
> -IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
> +# 16M
> +IMAGE_ROOTFS_SIZE ?= "16384"
> --
> 2.30.1
>
