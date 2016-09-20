Return-Path: <raj.khem@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id E279E6060E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 20:56:59 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id v2so1216273ywg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 13:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Pd8n6S2bEOExigOHDgNRYaBw/2BvWfPD3zTdXOIiTfI=;
	b=qbmSvjuaPuBhQqahN2d58LmrWnPEYfH+dqG4IAeSjJm4rbllckduSwE9PUS09Yiwaj
	FKqnSwipxZLybPpd1ZndPuNWBPtiX/TtCP16QXCpY+HmP0w9TPYcDaAiARNPzGzl2UKe
	KmdVzjE0c2K/jjUR6bF7qG9BUVA9fLxRk/M02QdKFyEHDQ19U1KL8eF9yRcYmWsV07yn
	62fTrcGyIZbTW83S7Z36ak5YSTBe30/btoEzP4VVKxPSsBDFCPtrHF1c8OiCa7b9PsYt
	oowsjkFf5ujPs/LnXmZ6NjPSIHBCnV0l+07O+RacfPju+casw0hh3/Wz2yMXsGYsFH86
	ycJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Pd8n6S2bEOExigOHDgNRYaBw/2BvWfPD3zTdXOIiTfI=;
	b=BQf3c3+W2jUELsdlVLCFn/PepfTczoQcA5p3eoi75xI/G8JUDpDORwF58+MDirewje
	Zavh/ZJ8lvCTXQSKA5GNQx2qxbz7rZTpYkXzCnrUTxgBhyKvAPz8BE75bq4xuQ4/pwLp
	oM17vQNOZb4IKAguKsMpRbI7d7/rv8iU3kWYlHu/N/vhHCZOb9ABxoPC9oNMYsV8n29q
	PTNLWbWHMLgSvhGMLe+JdeRw5CUswurwxLLr7xCwD7AckZuUiATCDImgNpyJuHLAm2Sd
	uFrQO5v9gZfIZ7JQ8ygJ/6uEooTSUxRevw+P6Rb+2VEI9yZjlH6CEk2PcLQnWM7zFmz5
	NKjw==
X-Gm-Message-State: AE9vXwPOplvFkWEcamDezuJtG2OwQDre8cSfmEG+Zm26Nj1UdachxTptMF1lR0vlT4lYcHWjCcWBNrTyNo1Yrw==
X-Received: by 10.13.203.81 with SMTP id n78mr25255010ywd.350.1474405020960;
	Tue, 20 Sep 2016 13:57:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.80.33 with HTTP; Tue, 20 Sep 2016 13:55:50 -0700 (PDT)
In-Reply-To: <1474305360-24208-1-git-send-email-sgw@linux.intel.com>
References: <1474305360-24208-1-git-send-email-sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Sep 2016 13:55:50 -0700
Message-ID: <CAMKF1so_fAuUUy8tLep8jAJxDYHzgAP8+KaDjsO9hYjoATyCGA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Haitao Huang <haitao.huang@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gcc-configure: Enable initfini-array
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
X-List-Received-Date: Tue, 20 Sep 2016 20:57:00 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 19, 2016 at 10:16 AM, Saul Wold <sgw@linux.intel.com> wrote:
> This adds the correct support for initfini-array which replaces .init
> and .fini with .init-array and .fini-array.  There is no appreciable
> size difference with this change.
>
> The change is needed since configure will not correctly detect support
> when building cross-compilers.
>
> Signed-off-by: Haitao Huang <haitao.huang@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> v2: Enable for all Architectures

What is original motivation for this patch ? this change expects libc
to support init fini arrays
please test it on all supported libcs as well.

>
>  meta/recipes-devtools/gcc/gcc-configure-common.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> index f4f76bd..b374c30 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -44,6 +44,10 @@ EXTRA_OECONF = "\
>      ${@get_gcc_multiarch_setting(bb, d)} \
>  "
>
> +# Set this here since GCC configure won't auto-detect and enable
> +# initfini-arry when cross compiling.
> +EXTRA_OECONF_append = " --enable-initfini-array"
> +
>  export gcc_cv_collect2_libs = 'none required'
>  # We need to set gcc_cv_collect2_libs else there is cross-compilation badness
>  # in the config.log files (which might not get generated until do_compile
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

