Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.1457.1610700316382744480
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 00:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KyF9sMqW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id m4so8381328wrx.9
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 00:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=FaXKfP/hkhC7EfMLYkiixL7dDQS8VlGI2IHYuqwzTho=;
        b=KyF9sMqW+N9/Wr4a4Z0u3qPEO3RkBKF77Z3LJsoEt1ieaghC46nOBrjcY6g6moTbPS
         qKLg7kmsfxxwn1t5krvJ9+qsbqwjozM/fQRaZORWK7KFfal20k6vSyd3ortbYOnqZ4KA
         DlRSmfzwvuvaK9ovHaKXbJn3vhmZ9ysIAHd2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FaXKfP/hkhC7EfMLYkiixL7dDQS8VlGI2IHYuqwzTho=;
        b=l57MB+IilyhSLKtks0vFf0095cMc6R5OFpjgKS30b3dov2qhq3LH+hE+RqXLLmFERP
         3pck3H8lGH5I7sTbstdkaCPxErGJyuIQK7444TbpxNYWZpK622aKZ0AyXCC8cYIkepko
         KWQADasnCtZSv50nowX/VO0h0SOYpCfDnslFAAiv8b2FAGkcK0kLbp1V7fG9e3gqoXAR
         4yZQjz/RUnNVBZYtbFG/s1yRQSjPvddhcPfyTUrx1Y6X0BhiWjhBvRVUOtMMW5ubFZgU
         LgqKyusVB1TWpFjMz1C+/WzcIuNJttdG0htrhGC8+9bko90FJBi9vT4Zig4npSs70FwC
         MI3g==
X-Gm-Message-State: AOAM5312nOrJyfBPWspTFvKOpoNzvf+uYiyWTtIxuZ5ElkNzCOEtigjy
	NRtD/J4E/xm4AXz54rdIn7g0jA==
X-Google-Smtp-Source: ABdhPJye00oawLzh1W0DFVVyX+nSrja0SNA1TMUrc9MRD9OWDMCt0s/uN878nqzd0Lz5zH7bG+C7mQ==
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr11781247wrw.421.1610700314690;
        Fri, 15 Jan 2021 00:45:14 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:974a:2423:c71:b423? ([2001:8b0:aba:5f3c:974a:2423:c71:b423])
        by smtp.gmail.com with ESMTPSA id w18sm13610896wrn.2.2021.01.15.00.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 00:45:14 -0800 (PST)
Message-ID: <4e34eedd6cd84c361e5a316325c508499a7d75a6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: use ${RECIPE_SYSROOT} for PSEUDO_IGNORE_PATHS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2021 08:45:13 +0000
In-Reply-To: <20210115032309.24983-1-mingli.yu@windriver.com>
References: <20210115032309.24983-1-mingli.yu@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-15 at 11:23 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> When multilib enabled, there comes below error for packages which
> inherit useradd bbclass randomly when build eSDK.
>  $ bitbake image-name -c populate_sdk_ext
>  Exception: subprocess.CalledProcessError: Command '/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/lib32-recipe-sysroot/usr/bin/postinst-useradd-lib32-avahi' returned non-zero exit status 1.
>  Subprocess output:
>  /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot-native/usr/sbin/useradd
>  Running useradd commands...
>  NOTE: lib32-avahi: Performing useradd with [--root /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot --system --home /run/avahi-daemon                               --no-create-home --shell /bin/false                               --user-group avahi]
>  useradd: Warning: missing or non-executable shell '/bin/false'
>  abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
>  Check logfile: /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/pseudo//pseudo.log
>  ERROR: lib32-avahi: useradd command did not succeed.
>  ERROR: Logfile of failure stored in: /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/temp/log.do_sdk_depends.20567
> 
>  $ cat  /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/pseudo//pseudo.log
>  [snip]
>  path mismatch [1 link]: ino 26553244 db '/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot/etc/group'
> req '/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot/etc/group.33605'.
>  [snip]
> 
>  Check the PSEUDO_IGNORE_PATHS in [1], the recipe-sysroot part is
>  /prj/tmp-glibc/work/corei7-32-wrsmllib32-linux/lib32-avahi/0.8-r0/recipe-sysroot.
> 
>  Use ${RECIPE_SYSROOT} for PSEUDO_IGNORE_PATHS to guarantee the
>  recipe-syroot part to be /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/recipe-sysroot
>  to fix the above issue.
> 
>  [1] /prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std/1.0-r5/lib32-recipe-sysroot/usr/bin/postinst-useradd-lib32-avahi
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 96c1c62b10..1dc08344ca 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -686,7 +686,7 @@ SRC_URI = ""
>  PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
>  PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
>  PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
> -PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
> +PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${RECIPE_SYSROOT},${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"

This isn't correct since we're aiming to ignore both WORKDIR/recipe-
sysroot and WORKDIR/recipe-sysroot-native which the above does since
the paths can be thought of to end with "*".

I'm also confused by your mention of corei7-32-wrsmllib32-linux above
in:

/prj/tmp-glibc/work/corei7-32-wrsmllib32-linux/lib32-avahi/0.8-r0/recipe-sysroot.

since I thought you were working in:

/prj/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-std

?

Cheers,

Richard








