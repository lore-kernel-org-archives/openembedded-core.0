Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 104846059E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 08:08:22 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u138so13891118wmu.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 01:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xR2/f0EXA7CJZPom6bhZtShQiuqkb5JwjyrAR+m1ttc=;
	b=fgv0zAiWfwCXE5GXLBEAN1hkzB1KBlzHJOTAn2jnb7D4UHKJ+crWrn0gqulyFbwV4o
	sph0/hCmmnC0AnQ1tu1dShCPSWRvnt06xJFtLjV8K6rs858go796gHQkIOtsLb6EbsIE
	s0GTsHszi5KZjpIKpUO60rIxRVrFkHiFQDd5OhkICpowr4hdxFgUht5m3JDfCCZP7V7j
	XB/t6TPqKXlzyDG15clFPNhyQSQYC4kYVD3ePWE/Is7ItTSYI26evizQefx+wGtnRA/d
	kAKhDdcTScii6EhhKcw4qf2eGG124vggppkGTWxavbzXExZtEL8gH6bDalg4V4dQO3es
	nK7g==
X-Gm-Message-State: AMCzsaWC81UPWGwF+nvI8Tmo6/oDwoz0G2ed66u9mZSy88Mj6HzYK6pk
	yVtgR4TZ94WHdo5lQW/FvimoqsRj
X-Google-Smtp-Source: ABhQp+QzP68CVm2QfMv4Tj3AGsXMizUZM0yiNjZ5QyZkJ7ektH3MDNjB1cp8n7WncWgPn4thjX0cLQ==
X-Received: by 10.80.146.83 with SMTP id j19mr8302460eda.298.1508832503330;
	Tue, 24 Oct 2017 01:08:23 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	x10sm9284351edb.24.2017.10.24.01.08.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 24 Oct 2017 01:08:22 -0700 (PDT)
Message-ID: <1508832501.13607.13.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Oct 2017 09:08:21 +0100
In-Reply-To: <20171023162325.10686-1-thomas.perrot@tupi.fr>
References: <20171023162325.10686-1-thomas.perrot@tupi.fr>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Subject: Re: [meta][pyro][PATCHv2] Avoid a circular dependency between do_concat_dtb and do_assemble_fitimage
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
X-List-Received-Date: Tue, 24 Oct 2017 08:08:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 2017-10-23 at 18:23 +0200, Thomas Perrot wrote:
> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>

Your commit message doesn't explain what problem you're trying to solve.

I can only guess that it's the same as this:
http://lists.openembedded.org/pipermail/openembedded-core/2017-September/142619.html
http://lists.openembedded.org/pipermail/openembedded-core/2017-September/142621.html

? If so, just submit requests for backporting, or explain why this doesn't
work in pyro.


> ---
>  meta/classes/kernel-fitimage.bbclass |  2 +-
>  meta/classes/uboot-sign.bbclass      | 21 +++++++++------------
>  2 files changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-
> fitimage.bbclass
> index abbc309b09..5ad439e82d 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -31,7 +31,7 @@ python __anonymous () {
>          # the fitImage:
>          if d.getVar('UBOOT_SIGN_ENABLE') == "1":
>              uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
> -            d.appendVarFlag('do_assemble_fitimage', 'depends', '
> %s:do_deploy' % uboot_pn)
> +            d.appendVarFlag('do_assemble_fitimage', 'depends', '
> %s:do_deploy_dtb' % uboot_pn)

You should also update the description of the executed tasks at the top of
uboot-sign.bbclass if you're changing this.

Cheers,
Andre'


>  }
>  
>  # Options for the device tree compiler passed to mkimage '-D' feature:
> diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-
> sign.bbclass
> index 8ee904e7df..2f616bf2a9 100644
> --- a/meta/classes/uboot-sign.bbclass
> +++ b/meta/classes/uboot-sign.bbclass
> @@ -47,16 +47,14 @@ do_deploy_dtb () {
>  	cd ${DEPLOYDIR}
>  
>  	if [ -f ${B}/${UBOOT_DTB_BINARY} ]; then
> -		install ${B}/${UBOOT_DTB_BINARY}
> ${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
> -		rm -f ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SYMLINK}
> -		ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_SYMLINK}
> -		ln -sf ${UBOOT_DTB_IMAGE} ${UBOOT_DTB_BINARY}
> +		install ${B}/${UBOOT_DTB_BINARY}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}
> +		ln -sf ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_SYMLINK}
> +		ln -sf ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_BINARY}
>  	fi
>  	if [ -f ${B}/${UBOOT_NODTB_BINARY} ]; then
> -		install ${B}/${UBOOT_NODTB_BINARY}
> ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
> -		rm -f ${UBOOT_NODTB_BINARY} ${UBOOT_NODTB_SYMLINK}
> -		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_SYMLINK}
> -		ln -sf ${UBOOT_NODTB_IMAGE} ${UBOOT_NODTB_BINARY}
> +		install ${B}/${UBOOT_NODTB_BINARY}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE}
> +		ln -sf ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_SYMLINK}
> +		ln -sf ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_BINARY}
>  	fi
>  }
>  
> @@ -70,11 +68,10 @@ do_concat_dtb () {
>  			oe_runmake
> EXT_DTB=${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
>  			install ${B}/${UBOOT_BINARY}
> ${DEPLOYDIR}/${UBOOT_IMAGE}
>  			install ${B}/${UBOOT_BINARY}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_IMAGE}
> -		elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e
> "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
> -			cd ${DEPLOYDIR}
> -			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} | tee
> ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
> +		elif [ -e "${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE}" -a
> -e "${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE}" ]; then
> +			cat ${DEPLOY_DIR_IMAGE}/${UBOOT_NODTB_IMAGE}
> ${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_IMAGE} | tee ${B}/${UBOOT_BINARY} >
> ${UBOOT_IMAGE}
>  		else
> -			bbwarn "Failure while adding public key to u-boot 
> binary. Verified boot won't be available."
> +			bbfatal "Failure while adding public key to u-
> boot binary. Verified boot won't be available."
>  		fi
>  	fi
>  }
> -- 
> 2.13.6
> 

