Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id E645C60116
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 15:16:10 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id i30so13723552qtd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2016 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BzUYtjTSiuBeQIOJYRtywO1+p1Rgzw59blVbWXqH854=;
	b=guFuKvd65cec5hvw62mG9C70cV5h+sZbddp2PX7lzUMp777ELVbrO2pV3Z0WEoaXmh
	n6pEC2apzi7TrQgoAQpWG3X0iqy1h0p9zo4EBUsoyQzp42E248NO5fokMiIdwypLEF7T
	r0HWtWEFWGi/LKHytNT9m7Me8l929Wmm3lRqm88pZd/isXmEfkgjhpZpKCtOa66xd696
	82lbsdVnsLFdWpZSxiAgxbdrLhC3+V4J6Bo5jv+NUDj/W8gxdGs5iyV1Kv640+3IMEtk
	tyE5s6BD6I/sNXlsVhjemmJ8rRgDxl/x5k3V/p15zp0EVMmvWLi0U+tSxfPmUxIWK7RF
	IdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BzUYtjTSiuBeQIOJYRtywO1+p1Rgzw59blVbWXqH854=;
	b=nOG99kq8N1b/Bx0D/18Uci7bkbjHFnWhPnP6RQLDd1h04OVyvxDYD7CaiXABipGzNG
	6sWzz+bzBmdrG2JBV1TgxAxGGI3FymeDXYFl7vyVe3DWpm7aaDZhqf+7ndJDB2+vp+VV
	PPvmZN/1g7jZBVCH9nAua70NmtJQHr3B9Mm59K1gVEohMFkYXyCXJZjF1Yihf+5wesK2
	f9XdyWvdFALsdcFeD6Qw/ViznmT/yyOVc3SZC9s53fqGuvtRsGN2jbr+csr5mStnMT2F
	3P3OFGWeuMB3MVeZJ3I7AOTlDXvx4qlPUEURODOLig6JJpsMsX/5UDgqS6DpG3r3GqHL
	Z2fA==
X-Gm-Message-State: ALyK8tKS9MmAvt0MUwRroT5knhA9TqR08vOlk+l2rMKLxZPV8lFPEK3gCifn5aP7RhscxyEEAj+y4s+oO9fmUg==
X-Received: by 10.200.33.172 with SMTP id 41mr27941275qty.26.1467731771139;
	Tue, 05 Jul 2016 08:16:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Tue, 5 Jul 2016 08:15:41 -0700 (PDT)
In-Reply-To: <1467699658-4985-1-git-send-email-zhenhua.luo@nxp.com>
References: <1467699658-4985-1-git-send-email-zhenhua.luo@nxp.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Jul 2016 08:15:41 -0700
Message-ID: <CAMKF1soJ0_8FcopQ4ipqLv+Bgi9qFyvTOUKVshdxvcEphRi6sw@mail.gmail.com>
To: Zhenhua Luo <zhenhua.luo@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcl: fix INCLUDE_SPEC and LIB_SPEC
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
X-List-Received-Date: Tue, 05 Jul 2016 15:16:12 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 4, 2016 at 11:20 PM, Zhenhua Luo <zhenhua.luo@nxp.com> wrote:
> TCL_INCLUDE_SPEC -I+<includedir> and TCL_LIB_SPEC -L+${libdir} break
> the cross-compile of packages which require tcl headers and libraries.
>
> One example is that postgresql configure failed at the following error:
> | checking for tcl.h... no
> | configure: error: header file <tcl.h> is required for Tcl
>
> Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
> ---
>  meta/recipes-devtools/tcltk/tcl_8.6.5.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.5.bb b/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
> index 46fc8a7..d75232b 100644
> --- a/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
> @@ -56,8 +56,6 @@ do_install() {
>         ln -sf tclsh8.6 ${D}${bindir}/tclsh${VER}
>         sed -i "s+-L${B}+-L${STAGING_LIBDIR}+g" tclConfig.sh
>         sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
> -       sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
> -       sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh

does this now include some of your host headers in build then ?

>         install -d ${D}${bindir_crossscripts}
>         install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
>         install -m 0755 tclConfig.sh ${D}${libdir}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

