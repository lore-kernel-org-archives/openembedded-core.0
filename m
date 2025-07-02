Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11639C8303D
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 01:40:40 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.13455.1751420437495746479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 18:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=far6ffrq;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d402c901cbso575921885a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 18:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751420436; x=1752025236; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=944HBSsRq+S5lbrj8Xl1HnvCywI6jr/tdHw5r7/vVUQ=;
        b=far6ffrq9cr8ebg0Yi6bUk6F39/aD5Y0atk/GxOfCdGyp3eWFhFbXKFom0u+Cj4Bfd
         nA3tkUeGKOfGZuaCAEodo/5UBOFi7GWRHaiffiWQLYqD4m1BEKEcnC7aX4HlOo5slRpB
         q91BjxvZtoB0Ahs5aW/TnQEksZNAauQ9tCia5mOhcZ/txAHMTb7wEPhUBc1G3EwJ7z6q
         7HutOLx08171dFU6F1Uo5htruW30F24VuQBZqKTztc6JjXhHamWwKL8HmZHrPwuTxNrG
         P7kd1JX8m+MUNpooMJkz/QheuAbvL+poZjdGIvYxd5m+CS2vZKcW7D/peQRQT2/1DHqL
         d3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751420436; x=1752025236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=944HBSsRq+S5lbrj8Xl1HnvCywI6jr/tdHw5r7/vVUQ=;
        b=hmMS9AuHoSC8v4P1Qi1jCWlIMelFiKjPIhRuM3enipz9ayrLwB3CivtQc5iZF0ZTzt
         JryMRLam5fOg9eX7h8XNYrNxEjzCv7IxBSogTzLzIjorHvnwLJEev6q3mlVqooEqslyD
         XbdXZx7uT39rX8XuA5Vv76pxKJg5rq59FH2x6L/rhXwKrkBicpMPgKz9QIWB/nPOVm2d
         dcYftZ9GG5x5iN8oHcA9jYIhEA3e31QAjLD3ilU5bvrxpS7/biuESr/x1f7u5PMBW3xC
         /lFyZ0xv7DtN1do7TnHfmXXfiT04Sp8QYNK1AnUcXY51QHYrWZQaRPj/tpyg5GkXRuPW
         Ax5Q==
X-Gm-Message-State: AOJu0YzWTOf1zoNtahcd+8fCiQ5fN6xZtOITloO/Z6tq/OEqb4Sx8vwk
	mFTnNEgXGmPTyXpZoSVobV4mxZL5kh9XBcb5YxGo2+A0LjV47PPfghG6qxBNEAKjoFU=
X-Gm-Gg: ASbGncuuZcrMLi1D1Qq4eQuYqtTC8E5fHOql9YaePNBFrvVxM3nNF3PH2AMr6NgilLl
	6y9k6cw5bbgh2A/g2hBWGEIuD08rfU4orvNBx2dtoE4/mpguFlXxiXFYip5ZcWHAJ7HZrHgwyUf
	V3tsHL7hMOm0MOaOPW96MchkSmdhjDX1fJ1irvB9MBVbf8/qW4x4BF05RxlBJUvHqErPqOOz9gz
	xDDNs5veOVPOpJa4MGABZIyZ6w4uqE5wWNgAZxXXMZ1QBL6+141mrwaUcJGNB3lmxM9RrMygW5g
	djVmdDDifKN/JtCbV41zGmPh+ScZeSlRdqGxO4EHGktFirWZFHzp1tABjMz8/KcKSI+yGRwRNE0
	6605rAu0KeqbvVhTdDQoY2ZEK45rycWEu//aKZxG7OuOmiKdIk0U=
X-Google-Smtp-Source: AGHT+IFgrfCPfWJRJNMYavfVMeNpRFOp1ge0jDZ+aVaabjy6JlvB+hmqs2wQvExOawuXE+/Yz0x8Ig==
X-Received: by 2002:a05:620a:178e:b0:7cc:8a39:29df with SMTP id af79cd13be357-7d5c4661a4fmr199279785a.9.1751420436333;
        Tue, 01 Jul 2025 18:40:36 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d4431391f4sm869820585a.5.2025.07.01.18.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 18:40:35 -0700 (PDT)
Date: Tue, 1 Jul 2025 21:40:34 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] kernelsrc.bbclass/perf: make package
 version consistent with kernel source
Message-ID: <aGSOEsGsdU+84kJn@gmail.com>
References: <20250630121708.4010323-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630121708.4010323-1-hongxu.jia@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 01:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219744

In message: [OE-core] [PATCH 1/2] kernelsrc.bbclass/perf: make package version consistent with kernel source
on 30/06/2025 hongxu via lists.openembedded.org wrote:

> If recipe inherits bbclass kernelsrc to use kernel sources,
> the recipe should explicitly set ${KERNEL_VERSION} to ${PKGV}
> in task do_package, otherwise package version (${PV} is usually
> default 1.0) is not consistent with kernel source.
> 
> For example, there are 5 recipes in meta-openembedded to inherit
> kernelsrc, but 4 recipes explicitly set PKGV.
> 
> meta-openembedded$ grep -e "setVar(.*PKGV.*KERNEL_VERSION" -e kernelsrc -rn *
> meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb:9:inherit kernelsrc
> meta-oe/recipes-kernel/bpftool/bpftool.bb:8:inherit bash-completion kernelsrc kernel-arch
> meta-oe/recipes-kernel/bpftool/bpftool.bb:44:    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
> meta-oe/recipes-kernel/cpupower/cpupower.bb:8:inherit kernelsrc kernel-arch bash-completion
> meta-oe/recipes-kernel/cpupower/cpupower.bb:32:    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
> meta-oe/recipes-kernel/turbostat/turbostat.bb:98:    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
> meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb:25:inherit kernelsrc autotools-brokensep
> meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb:68:    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
> meta-oe/recipes-kernel/spidev-test/spidev-test.bb:7:inherit bash-completion kernelsrc kernel-arch
> meta-oe/recipes-kernel/spidev-test/spidev-test.bb:26:    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
> 
> This commit moves the setting of PKGV to kernelsrc.bbclass for
> common use, the recipe (such as intel-speed-select) will not be
> required to set it explicitly

Technically all of these packages don't have to be versioned
exactly the same as the kernel. Although they are in the kernel
source tree, they aren't always used that way.

That being said, I don't have an objection to the patch, but the
commit message should clearly state if a patch is fixing an issue
or is just a cleanup.

Which is this ? A cleanup or has there been some issue with the
versioning ?

Bruce

> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes-recipe/kernelsrc.bbclass | 4 ++++
>  meta/recipes-kernel/perf/perf.bb      | 4 ----
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes-recipe/kernelsrc.bbclass b/meta/classes-recipe/kernelsrc.bbclass
> index ecb02dc9edc..93361842989 100644
> --- a/meta/classes-recipe/kernelsrc.bbclass
> +++ b/meta/classes-recipe/kernelsrc.bbclass
> @@ -15,3 +15,7 @@ LOCAL_VERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
>  
>  inherit linux-kernel-base
>  
> +# The final packages get the kernel version instead of the default 1.0
> +python do_package:prepend() {
> +    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
> +}
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 157aca4d791..4f29bd5bbc3 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -385,10 +385,6 @@ do_configure:prepend () {
>      done
>  }
>  
> -python do_package:prepend() {
> -    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
> -}
> -
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219515): https://lists.openembedded.org/g/openembedded-core/message/219515
> Mute This Topic: https://lists.openembedded.org/mt/113906486/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


