Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 165C57F69D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 12:53:02 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n15so7147023wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 05:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Xfku6JruwTrvkZnCvr8qzfbpq2/L2wDrrFh1KzPdAjo=;
	b=iLJ260BCDwLbJCK2PheuAzGGgh+xoYo7Gw15CBxYixU98CQZtO1TiCfEqjF/W5k0y+
	Vfwgiq24NQ7qnZNUoQsFT5WXL2c1qgw9SMEGE2WtC6vmVYuFry5dda7HSxFL1hdLufwL
	VdtHlAX9zqdQwB4pKDo9h5jUZuZdukpGk8WlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Xfku6JruwTrvkZnCvr8qzfbpq2/L2wDrrFh1KzPdAjo=;
	b=RcS0amncTE5VXTSa8tszFalmbGB6OQ/Y0zGD0sVrONS/nn5H6meR+UIneNLCV2Xxy4
	F2qJGcxdA8UpMG2AschQ9v816V/B+H2mtd96HnriYGnTg+j49cTaOdDtDA2WFuidOYN1
	tgrOPUZDtQMG0n9Poezfscvocb8KwJa9weIKo5brNIjwImnI6QjVvyTBfQLLRnLELfyB
	CDlEvgRBIoHh3IEqJN7C7E/2ekSjtesjVX5s/Eo6Ojbek9kvF5hobTpA3f56jxekhC5F
	16nUXqMcIoSWdRseXltW9pMSEVTvIztQIKGZRyVvmpgk45VJ/tfJgD/IKf+MAAjLfEjn
	/adQ==
X-Gm-Message-State: APjAAAXgPeaHDrLCZ9Ff5AoLLdYgcE5x/Jt3rve45G4cOFSIoG+1X6yZ
	/sTBtqV5d8rhvlG6ugm+dF5WtRbTiN8=
X-Google-Smtp-Source: APXvYqyyI9mllAdJxjoJHYT7Deol5UzMc2aqX3Z1O8pFZKtiNtcUeHijroCQnGZCVs7twHy5D0vsrg==
X-Received: by 2002:adf:f90f:: with SMTP id b15mr3410326wrr.76.1571748783713; 
	Tue, 22 Oct 2019 05:53:03 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s10sm11516211wrn.46.2019.10.22.05.53.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 22 Oct 2019 05:53:02 -0700 (PDT)
Message-ID: <3accc96ca5ddaf4240f535f655ca8d89a314dc1d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dan Callaghan <dan.callaghan@opengear.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 13:53:01 +0100
In-Reply-To: <20191015224456.22136-1-dan.callaghan@opengear.com>
References: <20191015061510.21803-1-dan.callaghan@opengear.com>
	<20191015224456.22136-1-dan.callaghan@opengear.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v3] elfutils: add PACKAGECONFIG for compression algorithms
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Oct 2019 12:53:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-10-16 at 08:44 +1000, Dan Callaghan wrote:
> Elfutils has optional support for bzip2 and xz (lzma). It uses
> this for decompressing embedded ELF sections like the .gnu_debugdata
> section for "mini debuginfo":
> 
> https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html
> 
> Previously this support was unconditionally disabled but the reasons for
> disabling them seem to no longer apply. Both the target and native
> variants of elfutils can build successfully against both bzip2 and xz.
> 
> Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
> ---
>  meta/recipes-devtools/elfutils/elfutils_0.177.bb | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.177.bb b/meta/recipes-devtools/elfutils/elfutils_0.177.bb
> index 78c3791936..f050577c0d 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.177.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.177.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://sourceware.org/elfutils"
>  SECTION = "base"
>  LICENSE = "GPLv2 & LGPLv3+ & GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> -DEPENDS = "libtool bzip2 zlib virtual/libintl"
> +DEPENDS = "libtool zlib virtual/libintl"
>  DEPENDS_append_libc-musl = " argp-standalone fts musl-obstack "
>  # The Debian patches below are from:
>  # http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz
> @@ -46,8 +46,15 @@ SRC_URI[sha256sum] = "fa489deccbcae7d8c920f60d85906124c1989c591196d90e0fd668e3dc
>  
>  inherit autotools gettext ptest
>  
> -EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
> -EXTRA_OECONF_append_class-native = " --without-bzlib"
> +EXTRA_OECONF = "--program-prefix=eu-"
> +
> +DEPENDS_BZIP2 = "bzip2-replacement-native"
> +DEPENDS_BZIP2_class-target = "bzip2"
> +
> +PACKAGECONFIG ??= "bzip2"
> +PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,${DEPENDS_BZIP2}"
> +PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
> +
>  RDEPENDS_${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils"
>  
>  EXTRA_OECONF_append_class-target += "--disable-tests-rpath"

Breaks nativesdk-elftutils:

https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/1157

Probably need to do:

DEPENDS_BZIP2 = "bzip2"
DEPENDS_BZIP2_class-native = "bzip2-replacement-native"


but I still think the default should be bzip2 off for -native unless
someone can tell me why we need it. That would mean adding something
like:

PACKAGECONFIG_class-native ??= ""

Cheers,

Richard



