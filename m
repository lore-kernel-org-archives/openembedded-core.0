Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.8163.1609941499512892493
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 05:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dYnfbEAO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id c124so2503860wma.5
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Jan 2021 05:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=G73Ubo8ae1WBSqxafo4KXJkXBIh3ZtgwazKn4ZK4yKk=;
        b=dYnfbEAOEbZSvRdRBabLjSJx1MMF90ZlR/h6ldawCCCyC42rnFD2h3PfF+RZd/GJ+5
         V3u3QBsbtOYH2r8dnBlkGeCRNiTiF2PyAwMOdC3sz748xRkgTku1aQQieh4WwZbdBtjl
         y2gFGxGvYVqwqnWcjJrVS8nxQBvtz7dI2J9mU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=G73Ubo8ae1WBSqxafo4KXJkXBIh3ZtgwazKn4ZK4yKk=;
        b=Fu3ExSrjbsRYpT4B52HkxsB9lMiQ1BnPVR8Ae3/E+vnWWOxYnJ1oY3wM5rHZLgLCFg
         G2YCH59Xg0yA0CCuAc21OBQ1+Z64F05/fVkC7AHYW9q4aIZrxkm0ZqnXjz1SR2POc+Ev
         jXTlsiabp5QmzHfAD5fpHRRyAz+DtTva6rVHfsnsb99OJGjqkk8mPd5NQpxR1ag8993c
         DoqmfNytr6laEroJCCKxZiiaH4M3OHA6lsmS8ObdCMKOrrfrK4Az5J3MbHSyMbZGHQGq
         8TcnQOOqXcKUFpn+0MlYjbIONY5xdMBz6RfbIOgAjVmizQ77cBmP4n5DZWjIfjVkl2kf
         VdJg==
X-Gm-Message-State: AOAM533EDjiEpSDfCHOk9uFuneWY7+Gt9PV7paQoL3ivmrdZZDDcf6tw
	Pjd8rswZGZFuvhm0UHYplIcTvLKpZsN+5A==
X-Google-Smtp-Source: ABdhPJwkYhZzQRNgAP7DHg7QRmLWdLjDePtaTD3xBjiYoQsTTdkSAtz7y/U5AWs5LZkyVEyfplIQcA==
X-Received: by 2002:a7b:c208:: with SMTP id x8mr3755296wmi.179.1609941497873;
        Wed, 06 Jan 2021 05:58:17 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f056:12a7:edca:60f8? ([2001:8b0:aba:5f3c:f056:12a7:edca:60f8])
        by smtp.gmail.com with ESMTPSA id m2sm3045313wml.34.2021.01.06.05.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 05:58:17 -0800 (PST)
Message-ID: <5b9e857b70fe4e4c346d1f28789bd11a9e9d2beb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libpam: support usrmerge
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 06 Jan 2021 13:58:16 +0000
In-Reply-To: <20210106084927.30657-1-changqing.li@windriver.com>
References: <20210106084927.30657-1-changqing.li@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-01-06 at 16:49 +0800, Changqing Li wrote:
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../0001-Makefile.am-support-usrmage.patch    | 28 +++++++++++++++++++
>  meta/recipes-extended/pam/libpam_1.5.1.bb     |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-extended/pam/libpam/0001-Makefile.am-support-usrmage.patch
> 
> diff --git a/meta/recipes-extended/pam/libpam/0001-Makefile.am-support-usrmage.patch b/meta/recipes-extended/pam/libpam/0001-Makefile.am-support-usrmage.patch
> new file mode 100644
> index 0000000000..5c6bc92705
> --- /dev/null
> +++ b/meta/recipes-extended/pam/libpam/0001-Makefile.am-support-usrmage.patch
> @@ -0,0 +1,28 @@
> +From c09e012590c1ec2d3b622b64f1bfc10a2286c9ea Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Wed, 6 Jan 2021 12:08:20 +0800
> +Subject: [PATCH] Makefile.am: support usrmage
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + modules/pam_namespace/Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/modules/pam_namespace/Makefile.am b/modules/pam_namespace/Makefile.am
> +index ddd5fc0..a1f1bec 100644
> +--- a/modules/pam_namespace/Makefile.am
> ++++ b/modules/pam_namespace/Makefile.am
> +@@ -18,7 +18,7 @@ TESTS = $(dist_check_SCRIPTS)
> + securelibdir = $(SECUREDIR)
> + secureconfdir = $(SCONFIGDIR)
> + namespaceddir = $(SCONFIGDIR)/namespace.d
> +-servicedir = /lib/systemd/system
> ++servicedir = $(systemd_system_unitdir)
> + 
> + AM_CFLAGS = -I$(top_srcdir)/libpam/include -I$(top_srcdir)/libpamc/include \
> +         -DSECURECONF_DIR=\"$(SCONFIGDIR)/\" $(WARN_CFLAGS)
> +-- 
> +2.17.1
> +
> diff --git a/meta/recipes-extended/pam/libpam_1.5.1.bb b/meta/recipes-extended/pam/libpam_1.5.1.bb
> index 486c9d8aad..8c008a9701 100644
> --- a/meta/recipes-extended/pam/libpam_1.5.1.bb
> +++ b/meta/recipes-extended/pam/libpam_1.5.1.bb
> @@ -22,6 +22,7 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
>             file://pam.d/other \
>             file://libpam-xtests.patch \
>             file://0001-modules-pam_namespace-Makefile.am-correctly-install-.patch \
> +           file://0001-Makefile.am-support-usrmage.patch \
>             "
>  
> 
> 
> 
>  SRC_URI[sha256sum] = "201d40730b1135b1b3cdea09f2c28ac634d73181ccd0172ceddee3649c5792fc"

I think we meed to create a patch which stands some better chance of
making it upstream. Can we add something to allow servicedir to be set
through configure? That patch might then be acceptable upstream?

Cheers,

Richard

