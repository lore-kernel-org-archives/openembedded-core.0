Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web11.21159.1589139763451566370
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2020 12:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RGyV/Qd7;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id z1so4290066vsn.11
        for <openembedded-core@lists.openembedded.org>; Sun, 10 May 2020 12:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=esyq33oIEpV0A/jSh3GETZZsq9f7826D2CMVFnQJgEI=;
        b=RGyV/Qd7lg9vS12CxVerm+JltxYS78NCxsEHLhea0OVBy7MtbK5IkfMDu/somDDbSj
         K8V6h1T7Ut2V5RlUsjcwuhxCs0I8lUOdPTxfncOT5by7GmlKGRgUgIKqUvomuIKGE4cb
         ZSX6ciPHhNen97HOKdCNZ53bZJHvTTL1wvxWXNFW/kPkCPYrC1TtARCvD/qjkdhd0ZVj
         xoGaBtsFmULDAd5H+pNRTNNAyGgy1aE45/bRqMTp8/cItFduQ9Ag5aHNhUAs5K9ZOwcT
         Ijzz8yh17r3wBAnXdOIbT//qVByX9B5GPyW5jnhNuQhdcZ5Po6Ar2Bu8vYutmHxmSGYi
         OgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=esyq33oIEpV0A/jSh3GETZZsq9f7826D2CMVFnQJgEI=;
        b=EhnifBGA6hhR5eoiwJMPqhkKFBkboDcxf99WbQFv0jZTNkoi6EGOhBkf7TOicrW+00
         W3wC5jkY3lT7B97wgOQe620AZ9I3omXNByS8MqYwi9NkTRn69fNWJjkjQZTxkKVvJa9Q
         1X9afkP2pJ9kJ+0nZdKmeqjPvum4G03QeZmfzi4Qe39WCvoXGTHH1iskBBw/O23lM1zc
         VHVy3H/GjFSWqbTv1S0GA1EwWDFs65Xhep4gyE3neRLeg8keWwu1vVXIK2ATnDiqDQJ/
         kq/rQ6q1ZMiYHdFR6coPXM1swvljORYZiD4pgmh39C4FSYlobmXcHIIw8K1p10l3Ol3K
         uTUA==
X-Gm-Message-State: AGi0PuYgglfPhh/J7kFwl5ycsVqUe4wndmmi/g47K6iw8AatwpgSJiWm
	5rgotKX3F4KSpqN+vfO2HAIGF3aghYAOKsDgI4U=
X-Google-Smtp-Source: APiQypIKONqm0QITv+gzSe4ZNHKiKQ+ILFwRM5yytyTBRF9p8dLmBDLBKYtJYLMYGvHimOKEwH9PA8/9tZ5/EYcAzMs=
X-Received: by 2002:a67:342:: with SMTP id 63mr8347981vsd.11.1589139762597;
 Sun, 10 May 2020 12:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <AM7PR05MB68811EB3A3AFB3B8C6876C4EA8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
In-Reply-To: <AM7PR05MB68811EB3A3AFB3B8C6876C4EA8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Sun, 10 May 2020 12:42:34 -0700
Message-ID: <CAJ86T=VYW7sHiQSfjQCsua-Fout4ktGaW2OeAvuvw0+qTd0m+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] file: add PACKAGECONFIG for auto options
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, May 9, 2020 at 2:08 PM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
> A few options of file configure are set to auto, which can lead to
> unpredictable effect when something in the sysroot does provide
> things that satisfy the autotools checks.
> In the worst case this will lead to package-qa failure as libraries are
> not set in RDEPENDS but configured for the tool.
>
> To mitigate changes of accidental configure set explicit options via
> newly introduced PACKAGECONFIG variables for bzip, lzma and zlib
> support, where the default is just zlib, as it was before
>
> changes v2:
>
> - add explicit enable options
>
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/recipes-devtools/file/file_5.38.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/file/file_5.38.bb b/meta/recipes-devtools/file/file_5.38.bb
> index b8f09107e8..e528d84cdd 100644
> --- a/meta/recipes-devtools/file/file_5.38.bb
> +++ b/meta/recipes-devtools/file/file_5.38.bb
> @@ -8,7 +8,7 @@ SECTION = "console/utils"
>  LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdda1b"
>
> -DEPENDS = "zlib file-replacement-native"
> +DEPENDS = "file-replacement-native"
>  DEPENDS_class-native = "zlib-native"

If you use PACKAGECONFIG to express the dependency on zlib then you
should do so consistently for both target and native. ie remove the
DEPENDS_class-native above and then add PACKAGECONFIG_class-native =
"zlib" below.

>  SRC_URI = "git://github.com/file/file.git"
> @@ -18,6 +18,11 @@ S = "${WORKDIR}/git"
>
>  inherit autotools update-alternatives
>
> +PACKAGECONFIG ??= "zlib"
> +PACKAGECONFIG[bz2] = "--enable-bzlib,--disable-bzlib,bzip2"
> +PACKAGECONFIG[lzma] = "--enable-xzlib,--disable-xzlib,xz"
> +PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
> +
>  EXTRA_OECONF += "--disable-libseccomp"
>
>  ALTERNATIVE_${PN} = "file"
> --
> 2.20.1
>
> 
