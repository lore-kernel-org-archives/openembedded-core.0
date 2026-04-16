Return-Path: <fra.schnyder@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37A7F8D75F
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 15:51:19 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17937.1776354676645692173
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 08:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Tvtsax3K;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: fra.schnyder@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488971db0fdso82010405e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 08:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776354675; x=1776959475; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ijxK31UKfkp1DpRBTTIzwXNN21ByR9LiwFdqvBVazLc=;
        b=Tvtsax3K5P9VGyCVdonK4ptx6SQ3jmLEvi+7TLVapg+5ZWx5xy14cRNdMb9H8KEHDr
         xQEtU+qlW87UM5tWOGd2ow9qpHZ99utHhWiG3WRkoyuslvAzc5c7w0cBQtmhBh2AsfgH
         4TQBi9qGvxy03U3e+HHF/r6lCvLwezvdis41v3RPU8qCtqEOKxAUOLlYod15/0LZ1krA
         Jokh7nPPH5qa4WukFvB++0p6D9SWDALPdCxE/qO5PpR61BFOfHtR2AJcfqrQnRQtCncT
         RElO5tw29Z5Z+s3MpiHk7L0RbmT7oifIAE+GJf6ZAcPYKrAGaTskJnuGzoX8ELr4MbLp
         UeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776354675; x=1776959475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijxK31UKfkp1DpRBTTIzwXNN21ByR9LiwFdqvBVazLc=;
        b=DlSbKlOLUXP1gMe7hnm27mlCzjvL0TsAMesBr98+AmPhUKM5WTFrLhMhoN72bqLJjs
         27nYlakSKkeEQUEkNhtGoo9eUJVwNq8Y58TmqmSTZ/7de9oq5Z9kV9DmHost75yxJJQ/
         fyKttWr+/YLBIVAYhF/cDaI7M2CKxUOIEX60DJWHRUoJQgcWMZR5wxeIRYgCMRe6FsWa
         9zAUtQj1z65pJgvcPVl90CVjfcAaPirMm22UvZ3AkrSK77yHnh6BT69YjSM9nGni0FCP
         mYXvL43ajSyrTeR3l32A27dYPAh8tMCsu91QzebAnqA22HpQKRweH+jM3S54B9IqfQ60
         ZPKA==
X-Forwarded-Encrypted: i=1; AFNElJ8xl2XR+68+c69y3JhnPhR0sA2x8nolDvzGzdQT+yPyZVAiWOtNQcDQQOCF4YI/ymQgjYlQIFosa+CA3ZTPN/JLNg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxk0QSTIpMgdNvPc0ew7tVNp5NhuOrf7LWP2flPabE/Lu+Ohe/m
	jGFgg2LtIAI9RI2nLMP9mEttdqcsvL/KnvlJGHE+UKragQf0EJcsbQjg
X-Gm-Gg: AeBDiev4yEYvPXI9RKts2d+2VY19cb6/emxgK/WuJNENEzo72zHVk1DAmptr3+UmC1K
	PFbKwkhmwNEo389rltk2UTJ8z5OQdlk1o+HP6suDvsZywYatigrSznwAV+ECWEtAPLnI9VGq/5Y
	HtgbHIHBCMVEKzueC5BAm0D6bt4i8Dz30Pqmi0BIGoLS9MkTp6wN+eR49INJufaXXQiFdERzA/8
	IfRikpWTZ/aJzoMz5SlPIFpqOEugINqo7jDKNY3xINxJDenvBjoEqVlhNNZgb9yxJZJB/cGICxA
	MQ3RLgG8e7TfsFC1I9Km97dG6qkyha6nMWpVQB89ZD82Q3y6gvTsA9Y0UONaK/aW5UWfJyGevSX
	1XFFwR4aPZDScCzO4XsBZ6ctF/3khgOPugYZxVHEBidRN4BH+glF8JZtIWl5vFot9I9Haituh6T
	nBdynJGouRBzP4kZs7cz5Q5EKUNnu7x+Ib18LUx6oeIj8e6uPwV0vXCdL+KI1St89ZcvXX/HVpi
	y52E2ogKubp4iSjFmEz4O0z693A7tVwOJQFCXGMW2v4Aln3M64gR+vbIC/6FdQjRhgdr6wxDw==
X-Received: by 2002:a05:600c:8207:b0:488:bf0c:a372 with SMTP id 5b1f17b1804b1-488d68a0ec8mr376113135e9.31.1776354674594;
        Thu, 16 Apr 2026 08:51:14 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f584e306sm74276835e9.11.2026.04.16.08.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 08:51:14 -0700 (PDT)
Date: Thu, 16 Apr 2026 17:51:13 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
Cc: u-boot@lists.denx.de, trini@konsulko.com, 
	"openembedded-core @ lists . openembedded . org" <openembedded-core@lists.openembedded.org>, Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH] tools: mkeficapsule: Add disable pkcs11 menu option
Message-ID: <7xe72m3tkzultqh3hw4cubfognfryjk5ababajoe6w6zt7jx4c@aaxa2kehv635>
References: <20260409074710.1322519-1-Wojciech.Dubowik@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409074710.1322519-1-Wojciech.Dubowik@mt.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235413

On Thu, Apr 09, 2026 at 09:47:07AM +0200, Wojciech Dubowik wrote:
> Some distros are using gnutls library without pkcs11 support
> and linking of mkeficapsule will fail. Add disable pkcs11
> option with default set to no so distros can control this
> feature with config option.
> 
> Suggested-by: Tom Rini <trini@konsulko.com>
> Cc: Franz Schnyder <fra.schnyder@gmail.com>
> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> ---
>  tools/Kconfig        |  8 ++++++++
>  tools/Makefile       |  3 +++
>  tools/mkeficapsule.c | 14 ++++++++++++++
>  3 files changed, 25 insertions(+)
> 
> diff --git a/tools/Kconfig b/tools/Kconfig
> index ef33295b8ecd..ccc878595d3b 100644
> --- a/tools/Kconfig
> +++ b/tools/Kconfig
> @@ -114,6 +114,14 @@ config TOOLS_MKEFICAPSULE
>  	  optionally sign that file. If you want to enable UEFI capsule
>  	  update feature on your target, you certainly need this.
>  
> +config MKEFICAPSULE_DISABLE_PKCS11
> +	bool "Disable pkcs11 support"
> +	depends on TOOLS_MKEFICAPSULE
> +	default n
> +	help
> +	  Disable pkcs11 support. Can be used in cases when host GnuTLS
> +	  library doesn't support it.
> +
>  menuconfig FSPI_CONF_HEADER
>  	bool "FlexSPI Header Configuration"
>  	help
> diff --git a/tools/Makefile b/tools/Makefile
> index 1a5f425ecdaa..60e84bfbf20d 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -271,6 +271,9 @@ mkeficapsule-objs := generated/lib/uuid.o \
>  	$(LIBFDT_OBJS) \
>  	mkeficapsule.o
>  hostprogs-always-$(CONFIG_TOOLS_MKEFICAPSULE) += mkeficapsule
> +ifeq ($(CONFIG_MKEFICAPSULE_DISABLE_PKCS11),y)
> +HOSTCFLAGS_mkeficapsule.o += -DCONFIG_MKEFICAPSULE_DISABLE_PKCS11
> +endif
>  
>  include tools/fwumdata_src/fwumdata.mk
>  
> diff --git a/tools/mkeficapsule.c b/tools/mkeficapsule.c
> index ec640c57e8a5..ad1c46f0e909 100644
> --- a/tools/mkeficapsule.c
> +++ b/tools/mkeficapsule.c
> @@ -229,9 +229,11 @@ static int create_auth_data(struct auth_context *ctx)
>  	gnutls_pkcs7_t pkcs7;
>  	gnutls_datum_t data;
>  	gnutls_datum_t signature;
> +#ifndef CONFIG_MKEFICAPSULE_DISABLE_PKCS11
>  	gnutls_pkcs11_obj_t *obj_list;
>  	unsigned int obj_list_size = 0;
>  	const char *lib;
> +#endif
>  	int ret;
>  	bool pkcs11_cert = false;
>  	bool pkcs11_key = false;
> @@ -242,6 +244,7 @@ static int create_auth_data(struct auth_context *ctx)
>  	if (!strncmp(ctx->key_file, "pkcs11:", strlen("pkcs11:")))
>  		pkcs11_key = true;
>  
> +#ifndef CONFIG_MKEFICAPSULE_DISABLE_PKCS11
>  	if (pkcs11_cert || pkcs11_key) {
>  		lib = getenv("PKCS11_MODULE_PATH");
>  		if (!lib) {
> @@ -259,6 +262,7 @@ static int create_auth_data(struct auth_context *ctx)
>  			return -1;
>  		}
>  	}
> +#endif
>  
>  	if (!pkcs11_cert) {
>  		ret = read_bin_file(ctx->cert_file, &cert.data, &file_size);
> @@ -301,6 +305,7 @@ static int create_auth_data(struct auth_context *ctx)
>  
>  	/* load x509 certificate */
>  	if (pkcs11_cert) {
> +#ifndef CONFIG_MKEFICAPSULE_DISABLE_PKCS11
>  		ret = gnutls_pkcs11_obj_list_import_url4(&obj_list, &obj_list_size,
>  							 ctx->cert_file, 0);
>  		if (ret < 0 || obj_list_size == 0) {
> @@ -309,6 +314,10 @@ static int create_auth_data(struct auth_context *ctx)
>  		}
>  
>  		gnutls_x509_crt_import_pkcs11(x509, obj_list[0]);
> +#else
> +		fprintf(stdout, "Pkcs11 support is disabled\n");
> +		return -1;
> +#endif
>  	} else {
>  		ret = gnutls_x509_crt_import(x509, &cert, GNUTLS_X509_FMT_PEM);
>  		if (ret < 0) {
> @@ -320,12 +329,17 @@ static int create_auth_data(struct auth_context *ctx)
>  
>  	/* load a private key */
>  	if (pkcs11_key) {
> +#ifndef CONFIG_MKEFICAPSULE_DISABLE_PKCS11
>  		ret = gnutls_privkey_import_pkcs11_url(pkey, ctx->key_file);
>  		if (ret < 0) {
>  			fprintf(stderr, "error in %d: %s\n", __LINE__,
>  				gnutls_strerror(ret));
>  			return -1;
>  		}
> +#else
> +		fprintf(stdout, "Pkcs11 support is disabled\n");
> +		return -1;
> +#endif
>  	} else {
>  		ret = gnutls_privkey_import_x509_raw(pkey, &key, GNUTLS_X509_FMT_PEM,
>  						     0, 0);
> -- 
> 2.47.3
> 

Hi Wojciech,

Shouldn't it be the other way around? Use of pkcs11 should be disabled 
by default and enabled if required. As it is now, it would still depend
on the the gnutls library having pkcs11 support and therefore still 
would break our OE builds with mainline u-boot if we don't change our
modules defconfig.

kind regards

Franz

