Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3642E6093A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 04:59:17 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id y195so4676607vsc.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 21:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pXaZHJeoQjyLBtvGZU+HovuKQ5HO6IkdF0IAn+HBxM8=;
	b=Days6Rp6+iPHZMMqfiQhOhNAzjHT2po4YeS+aDuMu9Ft9xv6yBwOnUbQ28yhpycOLN
	QfC6f2CionjS7XMPozlUwGjWwkdk3DAU57zw2ss38179rZlBi/5vQ0F5BINaFnYVxQBT
	eA0ffs0//ZYWJLXkKPl+7azVJEdTmQQnVmnaHSSdnJQj5TOxuhwnI6GL5htVokC7ZzeM
	KR5G/kciTuNt/cjIaOm7qfqm84NON/wP0OKPDQssL4NkSLAccN1e9q44UA9BToGRza4H
	UsYv2YzvXvSBEgSgWCU6VoVWQaOZg1pVriVPWiu4+AFrQatsCYJux2OUUX2BqYu968rk
	z8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pXaZHJeoQjyLBtvGZU+HovuKQ5HO6IkdF0IAn+HBxM8=;
	b=mYhA6mhHYYRp+ltmVUW4AZ1Z05KYkGjg838QbydVWRRDNeTIiEob5RtlBC0irfmGDk
	CaEC6cF078uoImpeQ8rIfSXgp7YV2aKsXfzx9kNXkC0yMcLa6Xlf0oKPNAaClMUEw/js
	gRvoh9/+rQHDyuQQIjsElsesCWgW8tKaLLRt6j3Sxwmm+avjaQF3/SzllhSn4Z2L06W0
	/KggRUlRTyt+W2ORr1AEUcRKDRb77D9uyN0bMY5EW4z68raJKVh+VhrcGMyBByGtxMnC
	qUucFf5aiJ6BiqnUoI+nNLPY949L0lG0cUdXj63n3X7iHvn54fzGCG250rrxPRYOzajj
	wKIw==
X-Gm-Message-State: AGRZ1gICQLC9Pb4qHS3mxXzeHAXvVgG3LO4QblfNlxPxU1vXunOSZLIZ
	L6sR8DTqgX+63xr2+ZDNuWB0s868GbrYAlgGxQoZ32eY
X-Google-Smtp-Source: AJdET5c5zSIeq6lSnkoGzMRWXtG6Vh8sNDMdveP3H5wwjP7s+trCYRGs79Shnmg9HQu6v5N0QCmVd6OCuVzfJhGbfB0=
X-Received: by 2002:a67:c285:: with SMTP id k5mr36585vsj.130.1540443558815;
	Wed, 24 Oct 2018 21:59:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2914:0:0:0:0:0 with HTTP; Wed, 24 Oct 2018 21:59:18
	-0700 (PDT)
In-Reply-To: <1540441116-366611-1-git-send-email-changqing.li@windriver.com>
References: <1540441116-366611-1-git-send-email-changqing.li@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 24 Oct 2018 21:59:18 -0700
Message-ID: <CAJ86T=Unn7MyQ5jvuuBefA2EfbYprUbkmSVG_9BQBW4+7ej0sg@mail.gmail.com>
To: changqing.li@windriver.com
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: change make install run serially
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
X-List-Received-Date: Thu, 25 Oct 2018 04:59:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 24, 2018 at 9:18 PM,  <changqing.li@windriver.com> wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> openssl offcially don't supprt parallel make install, and have
> occasionally install fail problem for parallel build,
> according to upstream suggestion, just make install serially.
>
> refer:
> https://github.com/openssl/openssl/issues/7466#issuecomment-432148137

Wouldn't setting PARALLEL_MAKEINST be cleaner than patching the Makefile?

> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...nssl-let-make-install-stop-parallel-build.patch | 37 ++++++++++++++++++++++
>  meta/recipes-connectivity/openssl/openssl_1.1.1.bb |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-openssl-let-make-install-stop-parallel-build.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-openssl-let-make-install-stop-parallel-build.patch b/meta/recipes-connectivity/openssl/openssl/0001-openssl-let-make-install-stop-parallel-build.patch
> new file mode 100644
> index 0000000..0726d04
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-openssl-let-make-install-stop-parallel-build.patch
> @@ -0,0 +1,37 @@
> +From adb36f6dadecf8775cf9603ee4745aed6ee20af1 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 25 Oct 2018 09:43:48 +0800
> +Subject: [PATCH] openssl: let make install stop parallel build
> +
> +openssl offcially don't supprt parallel make install, and have
> +occasionally install fail problem for parallel build,
> +according to upstream suggestion, just make install serially.
> +
> +refer:
> +https://github.com/openssl/openssl/issues/7466#issuecomment-432148137
> +
> +Upstream-Status: Inappropriate[oe-specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + Configurations/unix-Makefile.tmpl | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
> +index 16af4d2..c8f60df 100644
> +--- a/Configurations/unix-Makefile.tmpl
> ++++ b/Configurations/unix-Makefile.tmpl
> +@@ -437,6 +437,10 @@ depend:
> +
> + # Install helper targets #############################################
> +
> ++ifneq ($(filter install,$(MAKECMDGOALS)),)
> ++.NOTPARALLEL:
> ++endif
> ++
> + install_sw: all install_dev install_engines install_runtime
> +
> + uninstall_sw: uninstall_runtime uninstall_engines uninstall_dev
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
> index af9038a..8330162 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
> @@ -15,6 +15,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://run-ptest \
>             file://openssl-c_rehash.sh \
>             file://0001-skip-test_symbol_presence.patch \
> +           file://0001-openssl-let-make-install-stop-parallel-build.patch \
>             "
>
>  SRC_URI_append_class-nativesdk = " \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

