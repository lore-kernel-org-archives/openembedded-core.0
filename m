Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id BC2866013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 14:25:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 0947E600FD9
To: openembedded-core@lists.openembedded.org
References: <1445420828-7756-1-git-send-email-b28495@freescale.com>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <562A4373.6090406@collabora.co.uk>
Date: Fri, 23 Oct 2015 15:25:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1445420828-7756-1-git-send-email-b28495@freescale.com>
Subject: Re: [fido][PATCH] oprofile: update --with-kernel option to find perf_event.h
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
X-List-Received-Date: Fri, 23 Oct 2015 14:26:00 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 21/10/15 10:47, b28495@freescale.com wrote:
> From: Ting Liu <ting.liu@freescale.com>
>
> Update --with-kernel=${STAGING_DIR_HOST}/${prefix} to find kernel
> headers (linux/*.h) to fix the error:
> | checking kernel supports perf_events... unknown -- perf_event.h not found
> | ERROR: You requested to build oprofile with '--with-kernel=/buildarea/lyang1/test_f2/tmp/work-shared/qemux86/kernel-source',
> | but headers were not accessible at the given location.
> | Be sure you have run the following command from within your kernel source tree:
> |      make headers_install INSTALL_HDR_PATH=<kernel-hdrs-install-dir>
> | Then pass <kernel-hdrs-install-dir> to oprofile's '--with-kernel' configure option.
> | configure: error: Unable to build oprofile. Exiting.
>
> This is part of the commit b5b3085d9d6a351a1de86f95d5c8ba28dbfbddbb which
> already applied in poky master branch.

I've queued this patch in my joshuagl/fido-next[1] branch.

Thanks,

Joshua

1. 
http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/fido-next

>
> Signed-off-by: Ting Liu <ting.liu@freescale.com>
> ---
>   meta/recipes-kernel/oprofile/oprofile.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
> index 49e6b16..435e4ed 100644
> --- a/meta/recipes-kernel/oprofile/oprofile.inc
> +++ b/meta/recipes-kernel/oprofile/oprofile.inc
> @@ -27,7 +27,7 @@ SRC_URI = "file://filemode-fix.patch \
>
>   inherit autotools pkgconfig ptest
>
> -EXTRA_OECONF = "--with-kernel=${STAGING_KERNEL_DIR}  --without-x ac_cv_prog_XSLTPROC="
> +EXTRA_OECONF = "--with-kernel=${STAGING_DIR_HOST}${prefix}  --without-x ac_cv_prog_XSLTPROC="
>   do_configure () {
>   	cp ${WORKDIR}/acinclude.m4 ${S}/
>   	autotools_do_configure
>


