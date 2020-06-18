Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.4043.1592473971015546639
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 02:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cI/kyBMW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id p5so5338561wrw.9
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 02:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=uSfwEjByOsYORxLttSwLlgWgCOuC8rOkaZpeKIuhqF4=;
        b=cI/kyBMWOuB2bSHg6R7cDY0OV9oF8Y5fmvJ4myvjyxfhxfDFyap2Urgwh3c/QS50vk
         Gfj3UK/yNxfe+8Ddm+XzBEPpdnhe/VlO/7e93EZqe4IepRR4JR9buw0N1rodOQyWktu/
         Ak+ehqKW03cvtCOXkN5Hi2g/8kDWkgwe7o+GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uSfwEjByOsYORxLttSwLlgWgCOuC8rOkaZpeKIuhqF4=;
        b=muqv4jSEPBkUWS3JvwisDMuGIb07NBlMyQKI+dafQ5ZO5y7U3AclFd/kksS26G6fAF
         CejxU8oLkleNmIUKLt7hDEhdgJmpRBvdagF+jBBPb+wEC7f80vvPs/oC7BSzImzNhbZW
         X2RV/abcJqU0sXwNKx+6vtDRT3L/loI23XDFt0wyaOnct++A+lPkzjl0JVUqgxiTfz3A
         FACbvoVufYR9tjsVCD6n7QL6otKnZcdGnvNh/xcbQjjF1QNL+DV4Ph6PN020/A8eLEBy
         GCyYsBrNr3zDcDk9wsCq5HyBZ89EEdtCGbpxsnIgLvueObd2neNB05q0OvH1ysY15rs1
         j7Jg==
X-Gm-Message-State: AOAM533TsuO20O51lj8JRdT9qvBw9GKDjCLRJko8gWCLAyYbOGLhn2cz
	AcnFYL+q5T8Ksk2vUkEjNvrz4Q==
X-Google-Smtp-Source: ABdhPJz2tIqKMEzqtql83+CWJofVIY9aiQ2j3jUaOW45mvF0ZVNOllNXhl2YkC0j7qZWoR8bx0xhYg==
X-Received: by 2002:adf:f083:: with SMTP id n3mr998299wro.297.1592473969471;
        Thu, 18 Jun 2020 02:52:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id w13sm2876646wrr.67.2020.06.18.02.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 02:52:48 -0700 (PDT)
Message-ID: <5e93588e648dfac9263dfc9520ba9b205d933703.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] classes/kernel: Use a copied image for kernel*.rpm if fs don't support symlinks
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Xu, Yanfei" <yanfei.xu@windriver.com>, 
	openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com
Cc: zhe.he@windriver.com
Date: Thu, 18 Jun 2020 10:52:47 +0100
In-Reply-To: <20200618075725.39434-1-yanfei.xu@windriver.com>
References: <20200618075725.39434-1-yanfei.xu@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-06-18 at 15:57 +0800, Xu, Yanfei wrote:
> From: Yanfei Xu <yanfei.xu@windriver.com>
> 
> Some filesystems don't support symlink, then you will get failure when
> you install or update the kernel rpm package. Now we use a copied iamge
> for these filesystems instead of symlink.
> 
> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>  meta/classes/kernel.bbclass | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 41101a64a0..749d1a0f29 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -94,6 +94,14 @@ python __anonymous () {
>          d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kname, typelower))
>          d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>          d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
> +        d.setVar('pkg_postinst_ontarget_%s-image-%s' % (kname,typelower), """
> +set +e
> +ln -sf %s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
> +if [ $? -ne 0 ]; then
> +    echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlinks, falling back to copied image (%s)."
> +fi
> +set -e
> +""" % (type, type, type))
>  
>      image = d.getVar('INITRAMFS_IMAGE')
>      # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0,
> @@ -386,7 +394,7 @@ kernel_do_install() {
>  	for imageType in ${KERNEL_IMAGETYPES} ; do
>  		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
>  		if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
> -			ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
> +			install -m 0644 ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
>  		fi
>  	done
>  	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}

I am a bit concerned about this since whilst it solves one problem,
doesn't having two copies of the same file around significantly
increase the size of the packages and the update payloads updating such
systems would need? Are these two copies of the file in the same
package or not?

Perhaps the symlink creation should fall back to a copy on device
rather than having the copy at build time (as I understand it)?

Cheers,

Richard

