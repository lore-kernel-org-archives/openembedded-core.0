Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.7646.1618164245919695495
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Apr 2021 11:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jWrg0khx;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id c123so6273707qke.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Apr 2021 11:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SavhmQ3GUkV2kQ8u4rqH32PQiUoGcgH+X3YXk06OmUo=;
        b=jWrg0khxAK03yJI/ti38D3eHGq0MPtyngwWWp7B7Y4ntmhL1mGIaL7dRl+9C6hyJR9
         vGj84HB+8GVPMkvGAoZ0B/46slvFh9FF3yobOuihR4uNY5ItZtpidQRXL/rBPeA8SjW/
         fT9bodbU1bSnnyL5q0IbOYVFUJoee1MiIyyEShi9ihPmUhECZoySFIedxiVRhp9zV/CF
         jHAMU26dVYpnKIoK60RzrMaN1Y7HUOI4se+VQh2QFXZNBlewznc0m5+FLvKBzEOVwoUy
         CdNtKFmchOvsiXhKBxqCVA2euA3THRZqKYhAdPdrHXGHAxRtoPtP4B9O7Ew3MbXo5hYH
         bVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SavhmQ3GUkV2kQ8u4rqH32PQiUoGcgH+X3YXk06OmUo=;
        b=cakUDqDDGrUHiHSDkxQFTU2fdm2ea4gu6B++rwCx1kdbGGmQDsb6jf0tiRlVHinA95
         BOUQCH9/fN490E5w3w8enZ2nLNCjImsiT6qcPZSfRSlXQCs4a/4JbT4GsXTFRSTjqlMq
         V9UAaTkg61gxNdatb/FK+ywJn6BY0J5wSWUJg5iES4DE0AAjkZmne8PZNU6DxhIoq6LB
         LwWsDzjotWeH3GQCuY782WIPB1XNQrdz+9buOLOPZ/k965Oi1VA3Lh4noVU2XlaCgMm9
         fVHKyPUP978qvQdoVp52kh+5qqpgE0vYsSiJUXqzUhCHVSa7lvFXcXOnnTQ9aeT7vOP2
         jZuA==
X-Gm-Message-State: AOAM532UYsDwX15Jl1kSoSjQa9wYILyxDRz5PhWffRYLjFajQbT+bPVP
	OEP1B04mufA+Eqi0wJHLGwptdWw1kj1LJV8H5RQ=
X-Google-Smtp-Source: ABdhPJywCAE9cnUft6ZH6qwijVEzAMRco67xBgODqWKl2PQRJuW39qk1Hp4golBLi4oaS315OW/eSGHlWKWQydxMnWc=
X-Received: by 2002:a37:8ec4:: with SMTP id q187mr23442991qkd.381.1618164245037;
 Sun, 11 Apr 2021 11:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210411154900.20331-1-akuster808@gmail.com>
In-Reply-To: <20210411154900.20331-1-akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 11 Apr 2021 11:03:39 -0700
Message-ID: <CAMKF1so45P=eZyYuLr2SVwfYQscM81URUQR37urrmppPdKJLWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: rename BRANCH var
To: akuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 11, 2021 at 8:49 AM akuster <akuster808@gmail.com> wrote:
>
> If BRANCH is defined in local.conf then that name is used to d/l sources
> for binutils. You will get this error:
>
> Fetcher failure for URL: 'git://sourceware.org/git/binutils-gdb.git;branch=hardknott;protocol=git'. Unable to fetch URL from any source.
>
> Rename to SRCBRANCH like glibc has to avoid the more common variable name BRANCH.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.36.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc b/meta/recipes-devtools/binutils/binutils-2.36.inc
> index 2968291889..f638f02e8f 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.36.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.36.inc
> @@ -19,13 +19,13 @@ def binutils_branch_version(d):
>  PV = "2.36.1"
>  CVE_VERSION = "2.36.1"
>  BINUPV = "${@binutils_branch_version(d)}"
> -#BRANCH = "binutils-${BINUPV}-branch"
> -BRANCH ?= "binutils-2_36-branch"
> +#SRCBRANCH = "binutils-${BINUPV}-branch"
> +SRCBRANCH ?= "binutils-2_36-branch"

if dropping to use BINUPV then lets drop setting this as well. Which
also means you can drop
binutils_branch_version as well which is fine with me.

>
>  UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
>
>  SRCREV ?= "7651a4871c225925ffdfda0a8c91a6ed370cd9a1"
> -BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${BRANCH};protocol=git"
> +BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
>  SRC_URI = "\
>       ${BINUTILS_GIT_URI} \
>       file://0004-configure-widen-the-regexp-for-SH-architectures.patch \
> --
> 2.17.1
>
>
> 
>
