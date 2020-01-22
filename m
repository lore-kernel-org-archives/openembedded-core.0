Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id B2534914B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:49:19 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 21so5429515qky.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 22:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZbWAwzepXvjs6n51OSjTmrYjaL/e8G1KhEwN45veOws=;
	b=Pys3cfmyNnAkIuZZuh4P+BvxnfKrWXxsqvkQ2VCLcnIRuuoaFqrxCASDU00mALt3dA
	rbCy/GKgsHlQhmXUabpikhVKIhay3W5VNxwvrJAhYpFkit9me4JAuaRBTKxyJBUTSW7A
	QKhZWKQeZNSyqjrfRMyrFpyZdNbHSX1jFeCBOKhQkB3HPAygBdPKlp/1zDtxrxWTb+AO
	3Um/dWnEs9TbHCPoxEl7mBk9VI7s6g0l0PdhE7z/fYzEwFGMDlBA0SicpZth3/yhbO1K
	ug9oL+uMO4oFFonyDkEnlLegMp+zPLFFem+y50E7MnB8R+V8xKi+n6FiJZEKSI8I9I3k
	GSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZbWAwzepXvjs6n51OSjTmrYjaL/e8G1KhEwN45veOws=;
	b=k/Eu6UYQOqfCbPBWB2eSnkHk+EKzbdr74qqzdEoa4cQlGWwV1dCA9+Juyc0/0cnvWn
	SAyhXARhS9u9aisFYtW7PTQZtHg0MNGfOSsrRFvNpZVs7QukgWiB23j563iuya+uzgPu
	YCoFRgxzlT7MLDwtQmj/yGn+WQINv/jhRe28EVszk9R/aS+IwQSD7gW7AgZWrOq2p+n6
	pa+L+obS11z4cLXKyEltMuU9ZJcKFzCvRL5Mr+9Gzv+pRcIMlLjI+k3tFYMJzhWRgHgi
	GklRwbyqPEEdetAU5JrB2iR2ODvfTg3FpE1Tggq2xzO+IPopus36vDnacghI+ylX29rn
	5/AQ==
X-Gm-Message-State: APjAAAXM3uvhGXlERqbPl+8tiVFQ9TUCOhCR2PIP7xkwtyFx44B8H5g0
	Y+5blhgEwldnuymKp7JrP6ipsn4peG3luGlXtwYxgjzG
X-Google-Smtp-Source: APXvYqyUx0PAF7gsjNXBe5I3xqdLkO403rb8WlrYUe+UvKshCD43ksXkq9plwD9VtfVAMZ5l9DI0pctuxe34KutWA7M=
X-Received: by 2002:a37:de05:: with SMTP id h5mr8714316qkj.474.1579675760369; 
	Tue, 21 Jan 2020 22:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20200122002702.166957-1-mark.hatle@kernel.crashing.org>
	<20200122002702.166957-2-mark.hatle@kernel.crashing.org>
In-Reply-To: <20200122002702.166957-2-mark.hatle@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jan 2020 22:48:54 -0800
Message-ID: <CAMKF1sryZBqOsM=ntW1S-QujuF19Gw74Ld9evNOkeAsGp0DFSg@mail.gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libgcc.inc: Fix an issue w/ a recursive symlink
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
X-List-Received-Date: Wed, 22 Jan 2020 06:49:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 21, 2020 at 4:43 PM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> From: Mark Hatle <mark.hatle@xilinx.com>
>
> If the OS is not Linux, the code could end up generating a recursive symlink.
> This can happen because the same symlink can be created twice in a row.  If this
> happenes, the second symlink becomes a link to itself within the directory
> pointed to by the original link.
>
> In order to prevent this, verify that the destination does not already exist.
>

does this happen with ln -sf too ? if not then perhaps that will be simpler

> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  meta/recipes-devtools/gcc/libgcc.inc | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
> index e008d14f36..6d48ec9809 100644
> --- a/meta/recipes-devtools/gcc/libgcc.inc
> +++ b/meta/recipes-devtools/gcc/libgcc.inc
> @@ -9,14 +9,18 @@ do_install_append_class-target () {
>                         "linux-musleabi") extra_target_os="linux-gnueabi";;
>                         *) extra_target_os="linux";;
>                 esac
> -               ln -s ${TARGET_SYS} ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
> +               if [ ! -e ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os ]; then
> +                       ln -s ${TARGET_SYS} ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
> +               fi
>         fi
>         if [ -n "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', 'hf', '', d)}" ]; then
>                 case "${TARGET_OS}" in
>                         "linux-musleabi") extra_target_os="linux-musleabihf";;
>                         "linux-gnueabi") extra_target_os="linux-gnueabihf";;
>                 esac
> -               ln -s ${TARGET_SYS} ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
> +               if [ ! -e ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os ]; then
> +                       ln -s ${TARGET_SYS} ${D}${libdir}/${TARGET_ARCH}${TARGET_VENDOR}-$extra_target_os
> +               fi
>         fi
>  }
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

