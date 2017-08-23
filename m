Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 30ACF6093C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 03:40:32 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h75so496487pfh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 20:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wT54de8t7rt4681YHxL7vrXWzN2i4UK4l6QSp5RlWpY=;
	b=SB5kA7bNYR52BvJ84b5UMhUF5F6V3Yc94J5EDeLKdJFiScWCf41SLpB8xjYF1Ugoxd
	ScJj5NuVm0hXhKoAO4AvrSVwJClSCbjBseXjHQP5yQm1zDRO6PdZn+qOiIKluUCebkBh
	WcLQR/Im7h2ONAQA4m5ZEFloAuErvyOIdbBdZd5QquYbqEQY68GL1L6PCydC32XOUwE+
	utUBBmFkTgXkBrjjupjDAvngTDUN5VSmvdWESgE8LMOYM7Ta3k+9pLuUvqoXtT/oyqVc
	9KIxpusGHnA/NKLAkUbiywZLKsdH1XpniXslk0Jaff9uOGkdit5fDxF2ngGF9cTepl1r
	9bTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wT54de8t7rt4681YHxL7vrXWzN2i4UK4l6QSp5RlWpY=;
	b=kfW/WDM3l9p3mTk85/MIQfE7OoPCi+kUkOBZsj/uPMjXk40SDIGg05WnSmEk8MJWWs
	6O/KsTYJMqoXJbWTaHmd1eIBhxbg8IeHuSVxGeFF2zaLaN38jN/mxCYOV4rMupf+hWAV
	/kUria+nePGWiQcf01dydD80BFwTcmVHzotTNE+PXZOr2OLRpuoTjr+wtmbai7Vh0Uvq
	zNBtLRIyB+ho0RivfpSVihTpQ9tGaAvynEkjc3JqEeBVsIhaK6CtPVWdt8WeyfNor254
	HLEDIr5fF5uC2lgWTsVrsDtyiienbjn4O+A1480slvdOkEG7ORqh9SPeDMf7hITPiZoz
	sGmQ==
X-Gm-Message-State: AHYfb5i8cNR0FA4Vw7S+xlRu4wklkVQxvH+7J/MmA5ym7h3YKjsQVCK5
	xambG7OpqjtMUMu8lmTUt6z6MV8uKw==
X-Received: by 10.99.1.140 with SMTP id 134mr1267888pgb.233.1503459634282;
	Tue, 22 Aug 2017 20:40:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Tue, 22 Aug 2017 20:40:03 -0700 (PDT)
In-Reply-To: <ab92e7d90c416d6e5cdb17cdba269e09ec967607.1503283308.git.bruce.ashfield@windriver.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
	<ab92e7d90c416d6e5cdb17cdba269e09ec967607.1503283308.git.bruce.ashfield@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Aug 2017 20:40:03 -0700
Message-ID: <CAMKF1soEQpj++eDz_Cq23t-OEJGi8jJW7V2sYStEyMHwrUrm2g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] kernel-yocto: ensure that only valid BSPs are built
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
X-List-Received-Date: Wed, 23 Aug 2017 03:40:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 20, 2017 at 7:58 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> There was a bug in the search routines responsible for locating
> BSP definitions which returned a valid match if only the ktype
> matched.
>
> This meant that someone looking for "qemux86foo" (which is an
> invalid definition) would potentially end up building "qemuarm"
> and be none the wiser (until it didn't boot).
>
> With this fix to the tools search routine, and improved return
> code testing, we will now stop the build and report and error to
> the user.
>
> [YOCTO: #11878]
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/classes/kernel-yocto.bbclass                       | 3 +++
>  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 1ca0756c4959..3c6df92131bc 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -143,6 +143,9 @@ do_kernel_metadata() {
>
>         # expand kernel features into their full path equivalents
>         bsp_definition=$(spp ${includes} --find -DKMACHINE=${KMACHINE} -DKTYPE=${LINUX_KERNEL_TYPE})
> +       if [ $? -ne 0 ] || [ -z "${bsp_definition}" ]; then
> +               bbfatal_log "Could not locate BSP definiton for ${KMACHINE}/${LINUX_KERNEL_TYPE}."
> +       fi

this breaks non linux-yocto kernels which are using the kernel infra
from OE-Core
since they may not have kmeta structure and bsp_definition may be empty for them
so either provide a way to override bsp_definition to something dummy or infact
fall back to dummy by default with a warning or note during parse
time. fatal is a bit harsh here.

>         meta_dir=$(kgit --meta)
>
>         # run1: pull all the configuration fragments, no matter where they come from
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index 2217a31076a2..4a78b897d34f 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1b
>
>  DEPENDS = "git-native"
>
> -SRCREV = "9cd2b626d652bec10c6bc75275b35bfee74d447c"
> +SRCREV = "0571411cc033c11df7827508dd786876ce2f8c83"
>  PR = "r12"
>  PV = "0.2+git${SRCPV}"
>
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

