Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 91131771D7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 17:03:44 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k6so33906274wre.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U6U6K/kby8KQbCGwxmpClyVL9UyTCTX/WLDXTS5r+GE=;
	b=c585tLsgl+9KC9yDY93lQU7wMeB80XTYVBK2qOK97vEwGv+afOjR5bA+Zunk4eiUhK
	gPCWWjQDcKqZP983ml3FJO4ig8skfJHDcZgg7crcUFeV684e6hwFGYBxVVu1mL704Aoz
	LjVJGXMsk6BLP2tC2QiXMkWda7QagwsSwS86lsHMP4PNjv1uxozzY66uIU5D5dPAytH8
	8sOjhsix8Xgrt74QVUDzmOpb/gJ06qKFMVejQAPFS6UlpUhvws2JoFYaDTX4kQArgSHk
	S30DfbdIUT9XJW9rL/UqNwEp/nbq1wH9JwSn0rloinAuc/uXM4rEFSGtXObj7OlUHa2j
	GWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U6U6K/kby8KQbCGwxmpClyVL9UyTCTX/WLDXTS5r+GE=;
	b=duE1GEcqjX24ACFkKBZ8snjMwpxiV0moNgjYSWHkd5pvcXZ1BRtZLMbBnZwGbdMoOq
	85TYpMLk4qgVdF5da8e+PVoiStnvjcMyqxa10Du8SKxNATUI5qg6FQ9CczeM0cnTDY75
	g/UTBu1R3HVZljQnQ+CfE9THt2SMS5b1Ou7Q3dl7zlDLdaUouL4Eq7Q7LibVtnx2QgHz
	rTneXF8vggcs+iATcYrU+TlBbljw4/PNHrra5MXxKcCzR3Rn3DV0zOKmEo1e5+zUooMS
	2anYHgDyPKbw6+B3ct48itt7FkQT3RAMzA+wk/GaLPF0uykXQswtwABEsoj+30P3BKpn
	dQvA==
X-Gm-Message-State: AFeK/H1iLzZq/mToeuTZktoUG1uEr3VH07E4HRouo0k1MTNvZeGN6FDS1Luem/7GT3QgYoZoyH441r9tw1DXaQ==
X-Received: by 10.28.224.11 with SMTP id x11mr10968499wmg.98.1491239025252;
	Mon, 03 Apr 2017 10:03:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.152.55 with HTTP; Mon, 3 Apr 2017 10:03:44 -0700 (PDT)
In-Reply-To: <1491221074-30437-1-git-send-email-ross.burton@intel.com>
References: <1491221074-30437-1-git-send-email-ross.burton@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 3 Apr 2017 10:03:44 -0700
Message-ID: <CAJ86T=WFKTpB=ZAffa0_zttrh3uEjuKV+1gLcvmxcgkxPhTb-Q@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] libjpeg-turbo: don't depend on NASM for non-x86 targets
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
X-List-Received-Date: Mon, 03 Apr 2017 17:03:44 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 3, 2017 at 5:04 AM, Ross Burton <ross.burton@intel.com> wrote:
> NASM is a x86-specific assembler so it is only required when building for x86
> targets.  Use x86-architecture and class-target overrides to depend on NASM, but
> explicitly disable and don't depend on it for native as complications in the
> native overrides meant NASM was enabled for x86-64 but disabled for x86 (this
> will be investigated later).
>
> Original patch by Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>, more
> work to solve selftest failures by Richard Purdie
> <richard.purdie@linuxfoundation.org>.  I just wrote a nice commit message.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb
> index 70d38f4..6f407cc 100644
> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb
> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb
> @@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=13;md5=05bab7c7ad899d85bfba60da1a127
>                      file://jpeglib.h;endline=16;md5=f67d70e547a2662c079781c72f877f72 \
>                      file://djpeg.c;endline=11;md5=b90b6d2b4119f9e5807cd273f525d2af \
>  "
> -DEPENDS = "nasm-native"
> +DEPENDS_append_x86-64_class-target = " nasm-native"
> +DEPENDS_append_x86_class-target    = " nasm-native"
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
>             file://fix-mips.patch"
> @@ -26,6 +27,9 @@ RCONFLICTS_${PN} += "jpeg"
>
>  inherit autotools pkgconfig
>
> +# Add nasm-native dependency consistently for all build arches is hard
> +EXTRA_OECONF_append_class-native = "--without-simd"

Missing space?

> +
>  # Work around missing x32 ABI support
>  EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--without-simd", "", d)}"
>
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

