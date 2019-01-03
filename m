Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1815E6D563
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 16:07:15 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id p6so29484797eds.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 08:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ktFIkoJob+i8rcey3M7fb5IecFLjOKvAG6EH0Yz/FoQ=;
	b=su2Pltp733Vm5Fsf/6+zWrngvqaYWjHUAFOvf+bGGdSHxOCyCz+/NymK6cyAMkXIgL
	o1rQqvJvqeHe32rcrcUHzB73jmiGUQepCETx1vnhXj7DeVDwgetdXjKTxw1zKqxNbvRS
	yH58Qh9YBcpUvPvMHGLf9w+pY3NU/iIT8KWHFhujR/e0Lonl1Oj9+nbhDCLhmoPUJAQw
	7SMkxsevvpzaP/Yuwa8A/pLXCcvkQV+9x4wkhHTtsydJI1ivGBqBf+sFgDRQjzl0NsDm
	xO2jsi2Mtds8CXpeVEgquHVOCzQtgPPxBC4MTH6ULx5SRGt03YWUy89rNK+bf1iQMfkd
	fZCQ==
X-Gm-Message-State: AA+aEWYSbsEYGD7z13B6RhxqD4rOjt8n2NK0HrsLt/HBg+8AvKc8F+p0
	3Zba5pU8Z+tQhqkIci2NYX1/QvUx
X-Google-Smtp-Source: AFSGD/VWPuleq+Wnq/Z+nkq6lpebitFwjqt5cS5U3X7+xNdYHG5n9ABoLr9IELm4IShkP7j28pFXIw==
X-Received: by 2002:a17:906:4944:: with SMTP id
	f4-v6mr36348324ejt.72.1546531636394; 
	Thu, 03 Jan 2019 08:07:16 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	n11sm25371395edn.14.2019.01.03.08.07.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 Jan 2019 08:07:15 -0800 (PST)
Message-ID: <033c3d0a620da4834ae4fc4d02a9ebb87a637f45.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 03 Jan 2019 16:07:14 +0000
In-Reply-To: <1546491100-4909-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
References: <1546491100-4909-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] kernel.bbclass: Fix incorrect deploying of fitimage.initramfs
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
X-List-Received-Date: Thu, 03 Jan 2019 16:07:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-01-02 at 20:51 -0800, Manjukumar Matha wrote:
> When kernel-fitimage and initramfs is enabled using
> INITRAMFS_IMAGE_BUNDLE = "1", kernel do_deploy tries to deploy
> fitImage.initramfs with following error
> 
> > install: cannot stat 'arch/arm64/boot/fitImage.initramfs': No such
> file or directory
> 
> Skip deploying fitimage.initramfs, since fitimage does not
> create fitimage.initramfs
> 
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> ---
>  meta/classes/kernel.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index e04d2fe..60382bf 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -682,6 +682,9 @@ kernel_do_deploy() {
>  
>  	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1
> ]; then
>  		for imageType in ${KERNEL_IMAGETYPES} ; do
> +			if [ "$imageType" == "fitImage" ] ; then
                                          ^^

== is a bashism and should simply be = instead.

Cheers,
Andre'

> +				continue
> +			fi
>  			initramfs_base_name=${imageType}-${INITRAMFS_NAME}
>  			initramfs_symlink_name=${imageType}-
> ${INITRAMFS_LINK_NAME}
>  			install -m 0644
> ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs
> $deployDir/${initramfs_base_name}.bin
> -- 
> 2.7.4
> 


