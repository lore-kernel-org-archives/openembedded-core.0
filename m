Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.5708.1592863616305412742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 15:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H3bPqkHb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id o11so10649879wrv.9
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 15:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=N43JPvjALsh2xLm6G1xts1lgXT261ZHd3P8qRWfzNnc=;
        b=H3bPqkHbsWlPqUsIxCtF2x1/8OU7yneZ1Z1qYmW4/7FWY8XTyWHbJmQ/ud1PAbKkNL
         GFgJfpCyUc7MqHTqfQzgfU5nifHSJ+a0HHMKTDHuewk2HAGPDMs3ynTWN5i0pAFGdD50
         y9Bp9lRvE1MTfpbGzYL8e/e3Nhz7nHE8Pt7Oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=N43JPvjALsh2xLm6G1xts1lgXT261ZHd3P8qRWfzNnc=;
        b=lq8F+qCU0dYCHndLMukf2Jnk1knDxlKe+mHsJ/HQ8Tx7aK4FMlLYECQD/FIRnkEFBu
         xAhl1yuA1PtqO5rkpr4rBIA8hXB+16hMYGsQavYXUXRP7oWYwFolDBXx9CwinFoWfFdO
         nHjDUa4BmctGOhpAyoWZRKfOIwS4I9ppkZRgvNPj+TBo8zyMeTMpG2GCpRszLpsomjat
         85dv/gtQfLQHm4XBujDfzhbbemeVGIUl2oM9qjhvYl87yLftvM9obnpSpY2PmV2Oc6cF
         OwecMpnPV5Dljjhe41pcilykGBUIkxMBH5k1mkWsu1ffkkfWeQbzylK/7RdrOtCU7m7n
         VpuQ==
X-Gm-Message-State: AOAM531fuqiTuod17OJrRMciixgAqZVQy/5b8ep8qjTta8L5A6DiBhZM
	iPV71LYVTJWtNoVEDLDgfNHv2w==
X-Google-Smtp-Source: ABdhPJzEOQgO1s0LVoXii/gJT72rCzbyD+mosj+qEZnqrnlI69LidAdT8tbWl4KpBxdRKw6FUNkNSg==
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr14252972wrq.56.1592863614762;
        Mon, 22 Jun 2020 15:06:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d24sm986887wmb.45.2020.06.22.15.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 15:06:54 -0700 (PDT)
Message-ID: <ccbfaaf49b7c20b3b9dfef021d726f1ddf54b2f2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel-fitimage.bbclass: allow passing UBOOT_SIGN_EXTRA_OPTS to uboot-mkimage
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Torben Hohn <torbenh@linutronix.de>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2020 23:06:53 +0100
In-Reply-To: <20200622135025.16141-1-torben.hohn@linutronix.de>
References: <20200622135025.16141-1-torben.hohn@linutronix.de>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-06-22 at 15:50 +0200, Torben Hohn wrote:
> To use pkcs11, it is necessary to pass "-N pkcs11".
> And there are also a few more options, that are useful.
> 
> Pass UBOOT_SIGN_EXTRA_OPTS to uboot-mkimage, when signing the
> fitImage.
> 
> Signed-off-by: Torben Hohn <torben.hohn@linutronix.de>
> ---
>  meta/classes/kernel-fitimage.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass
> b/meta/classes/kernel-fitimage.bbclass
> index 72b05ff8d1..afb62f1071 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -474,6 +474,7 @@ fitimage_assemble() {
>  			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
> len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
>  			-F -k "${UBOOT_SIGN_KEYDIR}" \
>  			$add_key_to_u_boot \
> +                        ${UBOOT_SIGN_EXTRA_OPTS} \
>  			-r arch/${ARCH}/boot/${2}
>  	fi
>  }

Does this new option need documenting in the class headers? or at least
somewhere? I don't think it currently exists?

At the very least there should be a ??= assignment to "" as a default
somewhere?

Cheers,

Richard

