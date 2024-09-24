Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5D2CF9C71
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 07:52:22 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.8477.1727164339191911542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 00:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GzoDx849;
 spf=pass (domain: linaro.org, ip: 209.85.208.173, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f75129b3a3so51885201fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 00:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727164337; x=1727769137; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PCHh55wW8djyDLLWKAErpQrZRRbzKGMrBBaLPngdSaA=;
        b=GzoDx849e/siUuviJc38/TxQ+ha5XWhcdbNGnKMwT8npNuGJPB/LAUpLPkasgH139K
         SwxHRrHFLmHF889sMOYmLo+TXbprb5ZwzUXgZ1pmwd4RWIn2BsZR8TXbUfkiiIT1prMd
         yZ8Gx9Xg0hJo7ul8G7DUGqY8DhbPoHymmAzZUzWAzxucKI8bTd5kIBs83u+3fSr+IV6M
         Dp2Ixf6t6bezgc4YfvmJ/oaJ5PkJzAjfQSjH2TL6+19A5sT42DVn/3fM8/4WI48bvjcv
         8/Sure33oNozySgjaPiI4/uiOYdnxFdqny9qPlVDFbCrhtVaAiV/8XmjmMp85tXO7Mmb
         WpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727164337; x=1727769137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCHh55wW8djyDLLWKAErpQrZRRbzKGMrBBaLPngdSaA=;
        b=A+VpjlUU+2mZHE3x3I75wwzKEvHlSnVA+O6n55ove+ZhCLGusxX3ODvp6rdH1D8vgT
         An5VVOaioz9d9sUr9LG+V2yIbeH/PTxT19GafNMFUG2YMYC17zjpY0/yVEHw8LCvavtA
         3jZCxIZG4yAb/WRgu2NdwCD+yyDqq79kAfJD/YI+XsRV0lTkWOy4LXD2BMDjuq5b5hpR
         7o1OgGOciYwlWVTw3OKoiCb0Pf8sSj7fAkG6K/SiHT2kdYI3vluPfVoOrPK5tjPl+h1v
         ubxSTp9JO57G0aPpV8Mfe/XeGJdICKdgPrF79BA3LImTx5xPVj7fgS43R5HOW61hJJsE
         Wf/g==
X-Gm-Message-State: AOJu0Yw4oM8+N5tzQfn15dVgQbscGkTe8P+aD2zt1c39LYrso6rh1ZRl
	QhIdLIZzmAVv9pVLoeeuneUKE5KUTLPUltuFZ/8vnzpJiVPta0aVmQr1gLpTbtw=
X-Google-Smtp-Source: AGHT+IH1H+zhzzBC+yXZhyjyoBgLgDUiUtYweCyBsg2xBDQZ9u0Rb8MZ8tdczA0OUcyD3Kjen2tbsQ==
X-Received: by 2002:a2e:9111:0:b0:2f7:5c58:cc7c with SMTP id 38308e7fff4ca-2f7cb358051mr55658051fa.44.1727164337054;
        Tue, 24 Sep 2024 00:52:17 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d284d101sm1339231fa.66.2024.09.24.00.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 00:52:15 -0700 (PDT)
Date: Tue, 24 Sep 2024 10:52:11 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: liezhi.yang@windriver.com
Cc: openembedded-core@lists.openembedded.org, david.reyna@windriver.com
Subject: Re: [OE-core] [PATCH 0/2] proposal: Append VENDOR_REVISION to PR for
 CVE scanners
Message-ID: <ZvJvq2MtzI_0BPMd@nuoska>
References: <cover.1726821150.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1726821150.git.liezhi.yang@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 07:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204837

Hi,

On Fri, Sep 20, 2024 at 01:53:13AM -0700, Robert Yang via lists.openembedded.org wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
> 
> The VENDOR_REVISION is for cve scanners to know the CVEs have been fixed in a
> lower version, CVE scanners such as Trivy can know the CVEs have been fixed in
> a higher version, but it can't know the CVE is fixed in a lower version without
> a helper, we have the following ways to set the helper:
> 1) Use PR server
>    This doesn't work since the server updates PR for any changes.
> 
> 2) Update PR manually when add a CVE patch
>    This is doesn't work either since:
>    - This is very trivial and people may forget to update the PR
>    - The PR may be updated for other reasons except CVE patches
> 
> So we need a specific part such as VENDOR_REVISION for cve scanners.
> The VENDOR_REVISION is designed as part of PR:
>   PR:append = ".vr51"
> - ".vr51": The VENDOR_REVISION
> - "vr": Vendor Revision, can be set to other values such as oe or poky
> - "51": Convert from DISTRO_VERSION (Yocto 5.1), it can be customized with
>         a function defined in GET_CURRENT_VENDOR_REVISION.
> - The VENDOR_REVISION will only append to the recipes which have patches
> 
> There are two bbclasses to manage the VENDOR_REVISION automatically:
> - gen-vendor-revision.bbclass: This is used for generating VENDOR_REVISION
>   automatically, and save all the recipes' VENDOR_REVISION in
>   vendor-revision.conf, it is like:
>   VENDOR_REVISION[meta_recipes-support_libssh2_libssh2_1.11.0.bb] ??= '${VENDOR_REVISION_PREFIX}51 \
>    CVE-2023-48795:CVE-2023-48795.patch:b6c68cd1f0631180914ff112ac0c29c4 \
>    notcve:0001-disable-DSA-by-default.patch:61b6368d4a969d187805393d8b8fee85'
> 
>   And in the second release such as Yocto 5.1.1, the bbclass will update the
>   vr51 to vr511 when both of the following 2 conditions are met:
>   - The DISTRO VERSION is updated, for example, from 5.1 to 5.1.1
>   - The recipe's patches are changed (Patches added, removed or updated),
>     otherwise, it will still be "51" when Yocto updated to 5.1.1, this can avoid
>     unnecessary PR bump.
> 
> - enable-vendor-revision.bbclass: Append VENDOR_REVISION to PR
>   After the VR is appended, the rpm package is like:
>   openssl-3.3.1-r0.vr51.core2_64.rpm
> 
>   There is no change if the recipe doesn't have patches, for example:
>   base-files-3.0.14-r0.qemux86_64.rpm
> 
> Check the comments in the header of gen-vendor-revision.bbclass for more details.

This is very much backwards, like Alex mentioned as well.

There is no need for this. If CVEs are fixed with patches, then those patches will
mark the specific version and patch applied as not affected by the CVE.
The classes export this data. If anyone feeds this data to external tooling, then
the CVE patch status is a critical detail which must be exported and imported into
the tools as well. Otherwiser the external tooling is not really up for the job.

I've seen several commercial tools not managing the patch status at all. IMO these
tools are broken and can't be used to manage secure patches of real products
which have to apply CVE patches and can't always update SW versions.

When managing a yocto based Linux distro, IMO, the tooling is already there
to handle CVEs etc. External tools frequently cause more pain than actually
improve things.

Cheers,

-Mikko

