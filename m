Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 131466E630
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 03:21:41 +0000 (UTC)
Received: by iggf3 with SMTP id f3so3302075igg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 20:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gdjF7lEHcQXNKYWNJaBH/422JFVo8VEcZI8AyAvdpLc=;
	b=C14wx2KBtr1cJFS8wGWB5Lvm+IXOLDkKwOkWAiZb7fsxWblV8Qfcxgz2PZYam/uXZl
	da4mX0rkXxi0EceB3RQqzXcvNjAIlSYPjm5xQKqHFw76k4x9dnNcByIEOGpY/f2mq/z8
	Eht+ITHLT15GN1ollOR6N0rAMh4bbiD1A8xiqwEyzyuSvNZs2OU2mevAyWdUk/n9w5yU
	Hd+kM6czae74ijEpjV0R5BSgQrFhXBB9qtF3+vgajGAKy0XZ7Kh5Sif4A5sK95GJt4sw
	u3Tbves/p4iSLUavi2z828WmBpfM+ySgT2nr4bQY1RaZEeerKjOFt5sV1wK8lUwygwB0
	YFKw==
X-Received: by 10.50.30.105 with SMTP id r9mr1096532igh.11.1438831301699; Wed,
	05 Aug 2015 20:21:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Wed, 5 Aug 2015 20:21:12 -0700 (PDT)
In-Reply-To: <1438696733-234279-1-git-send-email-paul.gortmaker@windriver.com>
References: <1438696733-234279-1-git-send-email-paul.gortmaker@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Aug 2015 20:21:12 -0700
Message-ID: <CAMKF1srAsjA3NBgxP6bg3AcX8JWvLws9qh0uHR=LpJ89QSUQDw@mail.gmail.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: exclude drm headers from sysroot
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
X-List-Received-Date: Thu, 06 Aug 2015 03:21:43 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 4, 2015 at 6:58 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> While diagnosing a problem with xf86-video-intel I noticed we had two
> copies of drm headers in the sysroot; one from here and one from
> the libdrm package.   The xf86-video-intel turned out to be another
> thing, but that doesn't mean we want two copies in the sysroot with
> different content and luck of include path indicating which one we
> get.
>
> This one landed in usr/include/drm and the libdrm one put its files
> at usr/include/libdrm, so there was no obvious over-write conflict.
>
> The obvious risk here would be unearthing implicit dependencies on
> the libdrm; things trying to build before it has populated the sysroot
> but two full highly parallel builds containing a full desktop graphics
> suite did not show any issues.

I dont think this is needed. Both have different namespace. Packages
needing libdrm one will either use
#include <libdrm/drm.h> or if they use #include <drm.h> will add
appropriate -I=/usr/include/drm or -I=/usr/include/libdrm
to demand for which devel packages they require. if they mix it us
then the package should be fixed. by removing this
from kernel headers we are changing the fundamental API that we have
supported like many other distros.
right now there might be packages which are using kernel-headers
instead of libdrm headers their behavior will silently change or
break.

>
> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> index 566bc1e6154b..bda9d3f765ed 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> @@ -61,6 +61,10 @@ do_install() {
>         # Kernel should not be exporting this header
>         rm -f ${D}${exec_prefix}/include/scsi/scsi.h
>
> +       # if we take drm from the kernel, and a different set from libdrm
> +       # at different paths in the sysroot, then mayhem can result.
> +       rm -rf ${D}${exec_prefix}/include/drm
> +
>         # The ..install.cmd conflicts between various configure runs
>         find ${D}${includedir} -name ..install.cmd | xargs rm -f
>  }
> --
> 1.8.2.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

