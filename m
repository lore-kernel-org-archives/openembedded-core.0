Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id B2027781DF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 13:55:31 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id b11so9387519pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 06:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L+JWhH9YkkyxXOoAIN8WGsjAkvPuHF0PoW/e5oeNzdY=;
	b=f+ml6nCX0sZ/FLvZcSZDQ/OLcB+Qi0XZ3kai+N2US1VOGws1lYV4JFYFb+wuqHVNHD
	UYmSh1xB+Ar9PvJqhM05w1OQAB+ZTC6CbvT/PVJUqtYmRHySR3ZrmGQNVc7gvpS2T/MR
	8/7ACcCd1onOxWbrONAWxR0Z4J72lQ0YyqLhX3eUEd2LEm1cIJMNXSGejoBpZzy36xmW
	0MA7fNpluxgsTeAmHs2QmMYUN7kBgDyTFljf0Di9R1R/Lv2NCDK7zkHntUbiFLu28M2H
	+5Wo97StxoiyEz/lTkrk8EAZcGoJY4bxezm23hU46RjhdnsNLqStt18EeQnoLCkTMlnX
	988A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L+JWhH9YkkyxXOoAIN8WGsjAkvPuHF0PoW/e5oeNzdY=;
	b=jlotUfaQCn7ZUApBvLVNlVwztXxhHvcW4lgHwtN0tnW7TzMB/ouEoHGh1HMRtpWS4H
	0dbkSJOh5kqG1oJUu9mQsT4/igv/sTuMdi6nOWCOOFl+ASatpG0PGkGVz4acp1pRjA6c
	YnvpEM3PomrROTucjtUzLntAimiwqQbMIcqRmMnGfFdXT1YtrMvrvR6/Qq58IIDZ/3bH
	VtUHWqt/k8v+I3rFd7wbUHTfnruHxg26G+krunrhTeLNP0jCSPm2EVmdovX2Q/Oa9gXE
	bAlz+bHzZisyDuip7CezMGKosWMBy5zxBZKfAiTnAx6RCCvZPL6X9+S8aVoMOnNluUNC
	gl/Q==
X-Gm-Message-State: AMCzsaUMpbVE/JvhwYXkdWWPKpgIqVGfKAthmttQjPX6Eg10JnrS8Xsp
	RVLIr2yamVJEuYwSbSolC5MpaBrmqJl155lDweI=
X-Google-Smtp-Source: AOwi7QDgVOPPhJUUeqQrQYE5yjK+kXwVwbX5ZbSbFIUP1VAS6p57UaRI/l73VVaebJWdmznsARE196t4DA8yKdhSTbY=
X-Received: by 10.84.240.137 with SMTP id z9mr2062167plk.114.1507298132966;
	Fri, 06 Oct 2017 06:55:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.135.23 with HTTP; Fri, 6 Oct 2017 06:55:02 -0700 (PDT)
In-Reply-To: <20171005080227.20685-1-n.merinov@inango-systems.com>
References: <20171005080227.20685-1-n.merinov@inango-systems.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Oct 2017 06:55:02 -0700
Message-ID: <CAMKF1soz2yx3pcSXdV4Ym3geuxCUj+=Tb4RW0wJ6MTsdDDQF6w@mail.gmail.com>
To: Nikolay Merinov <n.merinov@inango-systems.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cross.bbclass: Remove usage of host flags for cross-compilation
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
X-List-Received-Date: Fri, 06 Oct 2017 13:55:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 5, 2017 at 1:02 AM, Nikolay Merinov
<n.merinov@inango-systems.com> wrote:
> BUILD_* flags can't be used as TARGET_* flags even for "cross" packages.
>
> gcc-cross buils leaks config.log's through "gcc-stashed-builddir" and
> TARGET_* flags to libgcc cross-build through "gcc/libgcc.mvars" file
> on "gcc-stashed-builddir". This means that if BUILD_CFLAGS contains
> host-specific flags like "-isystem/usr/include" libgcc build will
> fail "do_qa_configure" and "do_package_qa" checks.
>
> Remove host-related flags from TARGET_* flags for gcc-cross build.
>
> Signed-off-by: Nikolay Merinov <n.merinov@inango-systems.com>
> ---
>  meta/classes/cross.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
> index 4887317a9a..29d4424829 100644
> --- a/meta/classes/cross.bbclass
> +++ b/meta/classes/cross.bbclass
> @@ -28,10 +28,10 @@ MULTIMACH_TARGET_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
>  export PKG_CONFIG_DIR = "${exec_prefix}/lib/pkgconfig"
>  export PKG_CONFIG_SYSROOT_DIR = ""
>
> -TARGET_CPPFLAGS = "${BUILD_CPPFLAGS}"
> -TARGET_CFLAGS = "${BUILD_CFLAGS}"
> -TARGET_CXXFLAGS = "${BUILD_CXXFLAGS}"
> -TARGET_LDFLAGS = "${BUILD_LDFLAGS}"
> +TARGET_CPPFLAGS = ""
> +TARGET_CFLAGS = ""
> +TARGET_CXXFLAGS = ""
> +TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
>

I think using TARGET_LINK_HASH_STYLE could create target specific
dependency on cross packages, which might not be an issue for gcc but
could be issue for other cross packages.

>  CPPFLAGS = "${BUILD_CPPFLAGS}"
>  CFLAGS = "${BUILD_CFLAGS}"
> --
> 2.14.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

