Return-Path: <hayashi.kunihiko@socionext.com>
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB6877CF1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 08:25:51 +0000 (UTC)
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
	by mx.socionext.com with ESMTP; 12 Apr 2017 17:25:50 +0900
Received: from mail.mfilter.local (unknown [10.213.24.62])
	by kinkan-ex.css.socionext.com (Postfix) with ESMTP id 79CC31800A2;
	Wed, 12 Apr 2017 17:25:50 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP;
	Wed, 12 Apr 2017 17:25:50 +0900
Received: from [127.0.0.1] (unknown [10.213.134.37])
	by kinkan.css.socionext.com (Postfix) with ESMTP id B64F71A184C;
	Wed, 12 Apr 2017 17:25:49 +0900 (JST)
Date: Wed, 12 Apr 2017 17:25:49 +0900
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Message-Id: <20170412172548.AE3D.4A936039@socionext.com>
MIME-Version: 1.0
X-Mailer: Becky! ver. 2.70 [ja]
Cc: Jassi Brar <jaswinder.singh@linaro.org>,
	Masami Hiramatsu <masami.hiramatsu@linaro.org>
Subject: Re: [PATCH] kernel.bbclass: Use the correct path of kernel build image file except for vmlinux
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
X-List-Received-Date: Wed, 12 Apr 2017 08:25:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

[Adding the maintainer - Richard P]

The log is a bit descriptive. In short, we would like to compress and
use the arch/arm/boot/Image for cases like AARCH64.

Best Regards
Kunihiko Hayashi

On Thu, 30 Mar 2017 00:57:23 +0000 <hayashi.kunihiko@socionext.com> wrote:
> Use the correct path of kernel build image file except for vmlinux when
> producing gzipped kernel image.
>
> The kernel_do_compile() function produces the gzipped kernel
> image from the original kernel image when an image types included in
> KERNEL_IMAGETYPES has a suffix .gz.
>
> Although the original kernel image file is usually built on the
> directory arch/${ARCH}/boot/ except for vmlinux, the name of image types
> included in KERNEL_IMAGETYPES doesn't have a path of
> 'arch/${ARCH}/boot', then bitbake fails to produce the gzipped kernel
> image which type has a suffix .gz.
>
> This fixes above failure by using 'arch/${ARCH}/boot/' prefix for image
> path unless ${typeformake} is "vmlinux".
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
> ---
>  meta/classes/kernel.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 244087a..5e26965 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -268,7 +268,11 @@ kernel_do_compile() {
>                 for type in ${KERNEL_IMAGETYPES} ; do
>                         if test "${typeformake}.gz" = "${type}"; then
>                                 mkdir -p "${KERNEL_OUTPUT_DIR}"
> -                               gzip -9c < "${typeformake}" > "${KERNEL_OUTPUT_DIR}/${type}"
> +                               if test x${typeformake} = x"vmlinux"; then
> +                                       gzip -9c < "${typeformake}" > "${KERNEL_OUTPUT_DIR}/${type}"
> +                               else
> +                                       gzip -9c < "arch/${ARCH}/boot/${typeformake}" > "${KERNEL_OUTPUT_DIR}/${type}"
> +                               fi
>                                 break;
>                         fi
>                 done
> --
> 2.7.4
>




