Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 832DA7E85E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 15:51:46 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id x2so15948294qtr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 08:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UKLRmQoYuQAyLXwhv2u7josCpB3wwxK9fblkSr9noT8=;
	b=l3Jht0MmJeChs7NFEfPRDJHBZxgZ6IUbFfGv3d87rKMY9PY4JW3DlGSAoVaZxV5qHD
	2qQ9FVec2PxJ/KIszmXSFjACy2TpGCXSdnhXYb/LNjFGEcVTWmu2X26QcFM3fi0t//r7
	IQgKJzvbDQ+tXsPJYDtl9b/TAodmXu/vaei/TfBIGx2ReS2LbBelMDKWG2ZNjX84UEHS
	rvDGCmsiCw4pW4HqxjW7+7eBeShLg5ps6k0KcuQHk7g62lSQJIP3gVSCR7bwD65zeVt4
	Jn5VySW4RjWCxe4g6vdj9Wni1iOwWmvVTh0RyHIUGC2SA6YXJzgIwNnpZ/1Y1NaWVPop
	ULWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UKLRmQoYuQAyLXwhv2u7josCpB3wwxK9fblkSr9noT8=;
	b=AytzTKvOPGx93r0J4947SuHntDhQfI6ePcRsHU0PFTK/oFuaywBQIXYHc8p//Tx9gt
	u8iOXr3bZvuqpIw3LUKrMWEjlp16uYN+0k7sW8A9PT4xr86NbdzfzKoWF6S5orzQazUh
	WD2Xvyq7kkPB5kaNGKyf67H2mXJJE7bcsUYdvEeZvrZShcRwXCFwCSMadZkXtRKjZiYZ
	xEhMu1aQxCsJ5IwDktIzeOUZdU4hxeklH79d0Q1UM/gh3lkLLPTzHSkoR+mjs7UeBFEh
	F1J1WtyLNOOD6HYgBZ24Quy229pFSFr62hPcQOVNa4MqD9JdtL3JYWZ9lt48obYvaMRU
	V/CQ==
X-Gm-Message-State: APjAAAWkUfN++0kAO2PYnpHwW2aMAXf5WnBUrh3sfx8ZALMFqT7ZTxbg
	ZBAIbE0DBnmPpZfjkyIcDes06V/KKp4+mFsvqqU=
X-Google-Smtp-Source: APXvYqy0t5kwkMx5Zxr9OAgpfacSJgUINiGStm7JvTUu9MFDTAQRVxOh/ka3H4Tz7UZQOEhRXgqm6UlJWqhDudEofzo=
X-Received: by 2002:a0c:89f3:: with SMTP id 48mr28195380qvs.68.1560873107363; 
	Tue, 18 Jun 2019 08:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190618104735.25849-1-ross.burton@intel.com>
In-Reply-To: <20190618104735.25849-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jun 2019 08:51:21 -0700
Message-ID: <CAMKF1spb0ouiuW+44jvXqbBYOa5TAw2cbabmQmuTo0z4n9BLZQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binconfig: don't try to fix up .la files
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
X-List-Received-Date: Tue, 18 Jun 2019 15:51:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 18, 2019 at 3:47 AM Ross Burton <ross.burton@intel.com> wrote:
>
> If we're going to clean buildpaths from installed .la files then we should do it
> globally, not in a class that only six recipes in oe-core use.
>

while I agree, are there assumptions in the recipes using binconfig on this ?
especially packages outside oe-core ?

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/binconfig.bbclass | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
> index 133b9537cf0..9112ed46085 100644
> --- a/meta/classes/binconfig.bbclass
> +++ b/meta/classes/binconfig.bbclass
> @@ -40,15 +40,6 @@ binconfig_package_preprocess () {
>                     -e 's:${STAGING_DIR_HOST}${prefix}:${prefix}:' \
>                      $config
>         done
> -       for lafile in `find ${PKGD} -type f -name "*.la"` ; do
> -               sed -i \
> -                   -e 's:${STAGING_BASELIBDIR}:${base_libdir}:g;' \
> -                   -e 's:${STAGING_LIBDIR}:${libdir}:g;' \
> -                   -e 's:${STAGING_INCDIR}:${includedir}:g;' \
> -                   -e 's:${STAGING_DATADIR}:${datadir}:' \
> -                   -e 's:${STAGING_DIR_HOST}${prefix}:${prefix}:' \
> -                   $lafile
> -       done
>  }
>
>  SYSROOT_PREPROCESS_FUNCS += "binconfig_sysroot_preprocess"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

