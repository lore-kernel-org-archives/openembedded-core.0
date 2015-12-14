Return-Path: <mario.goulart@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id A5D716612D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 20:08:49 +0000 (UTC)
Received: by qkht125 with SMTP id t125so153529984qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=BzBcccY+EKHDD5jTx4O2kMbnsL7THatWjTxEXY4FRss=;
	b=cLPSeUtgfrn2Qct2xCP89KSmmMB41svGthZNkpx1DWPOgOpWf16A5KR4Q8pF4aT5NR
	TJzR45wwQhlMChW4oJtOTvvxBRpQfCNxMEbelWrNlAt+KUseyLMohEZ2KyqSd4ak2KHs
	+Ifq50YgA5dtkCDIq7LhrUaUCxR5z6EqMzzqnabrlhSI0jsk6Ad5fW7eDdyhcOYXKaQe
	crFDu1N2DwghIO4Je0YyRzQvipxMh+MxyfEX5MSEdPH+eSjlVFQ3XPAyy7Y8IkLhjuoG
	YRlJBEvMoYjbga93xuAZIFrdzNuVwArhb3ptTnRMWmZypQIimprQ2UYSMFkqcgv671JO
	RbIA==
X-Received: by 10.55.217.149 with SMTP id q21mr45830488qkl.55.1450123730138;
	Mon, 14 Dec 2015 12:08:50 -0800 (PST)
Received: from email.parenteses.org.gmail.com (email.parenteses.org.
	[198.199.72.94]) by smtp.gmail.com with ESMTPSA id
	201sm5072315qhf.21.2015.12.14.12.08.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 12:08:49 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Andre McCurdy <armccurdy@gmail.com>
References: <1450123490-3438-1-git-send-email-armccurdy@gmail.com>
	<1450123490-3438-2-git-send-email-armccurdy@gmail.com>
Date: Mon, 14 Dec 2015 20:08:47 +0000
In-Reply-To: <1450123490-3438-2-git-send-email-armccurdy@gmail.com> (Andre
	McCurdy's message of "Mon, 14 Dec 2015 12:04:50 -0800")
Message-ID: <87io40dc8g.fsf@email.parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] kernel-yocto.bbclass: move do_kernel_link_vmlinux() into kernel.bbclass
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
X-List-Received-Date: Mon, 14 Dec 2015 20:08:52 -0000
Content-Type: text/plain

Hello Andre,

On Mon, 14 Dec 2015 12:04:50 -0800 Andre McCurdy <armccurdy@gmail.com> wrote:

> Move do_kernel_link_vmlinux() from kernel-yocto.bbclass into
> kernel.bbclass so that it's available to any kernel recipe.
>
> Note that the task is not enabled by default in kernel-yocto.bbclass,
> so don't enable by default in kernel.bbclass either. To enable, see
> the example in linux-yocto.inc, ie:
>
>   addtask kernel_link_vmlinux after do_compile before do_install
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 12 ------------
>  meta/classes/kernel.bbclass       | 12 ++++++++++++
>  2 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 3762d1d..558515e 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -348,18 +348,6 @@ do_validate_branches() {
>  	fi
>  }
>  
> -# Many scripts want to look in arch/$arch/boot for the bootable
> -# image. This poses a problem for vmlinux based booting. This 
> -# task arranges to have vmlinux appear in the normalized directory
> -# location.
> -do_kernel_link_vmlinux() {
> -	if [ ! -d "${B}/arch/${ARCH}/boot" ]; then
> -		mkdir ${B}/arch/${ARCH}/boot
> -	fi
> -	cd ${B}/arch/${ARCH}/boot
> -	ln -sf ../../../vmlinux
> -}
> -
>  OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
>  KBUILD_OUTPUT = "${B}"
>  
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 4ce1611..2e60139 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -408,6 +408,18 @@ python split_kernel_packages () {
>      do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
>  }
>  
> +# Many scripts want to look in arch/$arch/boot for the bootable
> +# image. This poses a problem for vmlinux based booting. This 
> +# task arranges to have vmlinux appear in the normalized directory
> +# location.
> +do_kernel_link_vmlinux() {
> +	if [ ! -d "${B}/arch/${ARCH}/boot" ]; then
> +		mkdir ${B}/arch/${ARCH}/boot
> +	fi

Wouldn't "mkdir -p ${B}/arch/${ARCH}/boot" be better here?

> +	cd ${B}/arch/${ARCH}/boot
> +	ln -sf ../../../vmlinux
> +}
> +
>  do_strip() {
>  	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
>  		if [ "${KERNEL_IMAGETYPE}" != "vmlinux" ]; then
> -- 
> 1.9.1

-- 
http://www.ossystems.com.br

