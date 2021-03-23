Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web09.412.1616536383791255887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 14:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i5AX+clW;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 184so27626941ljf.9
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 14:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IL3jnRpxOLakNzkACNnSVj6zXhsSnNRRyy58rQijmW0=;
        b=i5AX+clWVbQL5cxdfz8beI1l7YnnzVJavUMMYgwUCH82vaeqPBtQJCZOLyvqdNpr6W
         YJX+JyikmpCg3pndADlbGJCWr1z2auGO8AFJArBkHShMKSs+xExW66WQHbbR9z4NVN24
         ydxy6WA+ixCGuUVY31hodXOpJ3MvMCBOiF9Zw4E5SihcEtnhnoJajQCOFoALNsaUQogi
         7RlUXwlg/O0MS3I5kGkrDJs2GjzB7AYaN/0wzOdmSDYmw2+D+s6pgRdA/rQAAYpjEP68
         j1ryVnXUVC71N21EwqrrAaVwKYlZL/Zah+LMx1Hg9utxt0IXGH6Zg77Mw0ep/35bn3L+
         wDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IL3jnRpxOLakNzkACNnSVj6zXhsSnNRRyy58rQijmW0=;
        b=Ijrc+/vJHG5BReaMjhK/0wpebnRObHHRZiKAY1/1BBBSVX7ymSI/DUYufI+m7/hAyx
         GeTLiCIWbf4qx+Kp79ttjOKkDVHKinGAQzM4HfYohjHAhGpYs+lz86Q2CbmcIo4t0NkK
         TKevUy+jJ62OcP9I83epOdvYJLdQC3PgzwM0eH6tQfksm4GcgswQiBcH01u5lRBIP0Fg
         WclUZbMe8pTPBzkdyapjEJbF78bY0C0GJoewNxJqxyewNbNSgP9FI/j19SjGQaljYzKc
         61jqEYcxL4QEZyylFEf2vNtW/7zVAUzeqQxi2ZpQqmPjLliehMuti4d9ATsTopLHYCdv
         RD6w==
X-Gm-Message-State: AOAM533HsrSJYAKbOlGzubohbag3mvwee79BWGZ3vHUcCBZs048cIfZ1
	+vLOn883xv8DsrcJ8JKlIBbPaJCaVn4eEzgMwzs=
X-Google-Smtp-Source: ABdhPJzrBnTvKxVQPoB1o7t2aEicEfrAziFfk4WJKYkgLsSS3WWQuYldxckPrhOIhMkRZ6tWF/sB+gRCNXz1hb87ygk=
X-Received: by 2002:a05:651c:387:: with SMTP id e7mr4353616ljp.425.1616536381665;
 Tue, 23 Mar 2021 14:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210323212814.567119-1-ross.burton@arm.com>
In-Reply-To: <20210323212814.567119-1-ross.burton@arm.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 23 Mar 2021 14:52:50 -0700
Message-ID: <CAJ86T=UsfzS0KMHVpyXkeL3aio9mU-9hszabKq56EBeZ+RxEuw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf: ensure BUILD_* tools match target tools
To: Ross Burton <ross@burtonini.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 23, 2021 at 2:29 PM Ross Burton <ross@burtonini.com> wrote:
>
> Add a few more tools to the BUILD_* list, to match the target tool list.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/conf/bitbake.conf | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index ecd4d1638e..d4bda80736 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -541,7 +541,10 @@ export BUILD_AR = "${BUILD_PREFIX}ar"
>  export BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
>  export BUILD_RANLIB = "${BUILD_PREFIX}ranlib"
>  export BUILD_STRIP = "${BUILD_PREFIX}strip"
> +export BUILD_OBJCOPY = "${BUILD_PREFIX}objcopy"
> +export BUILD_OBJDUMP = "${BUILD_PREFIX}objdump"
>  export BUILD_NM = "${BUILD_PREFIX}nm"
> +export BUILD_READELF = "${BUILD_PREFIX}readelf"

Do these new variables need to be exported?

As far as I remember a few of the BUILD_xxx variables are "official"
autotools variables which some autotools packages may expect to find
in the environment (although googling now doesn't find any
references).

If so then the rest (i.e. most of them, and certainly these newly
added ones) are OE specific and only used in OE recipes and classes...
and therefore don't need to be exported here.

>  export MAKE = "make"
>  EXTRA_OEMAKE = ""
> --
> 2.25.1
>
>
> 
>
