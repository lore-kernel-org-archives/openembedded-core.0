Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id EEC787ECC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 17:45:15 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id k10so20526306qtq.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 10:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=z8Qh8EzegJDyykql6xX229Wo5rQiKp4O57ISL6QPayc=;
	b=Da9gbqCO8s4eP6NiXXEGFRDvDkIPwZOAtNPuxNDW5qY3NLzI9L8hRck2e0HnY0zFue
	1YnW9aAY5JAKRVUjQE4TeJoFPvt7DS9lI0xzQBwuROpXnzLFLyb/joZ9bHP43G+vgpga
	Kh9yJMWAoL0joARXn1nQB96NrhEL20Q4SFRC5/rH/1VjVjpWXVue4bSje/aefkT9bbJv
	aKNbl4K1A6+sDUOC+4zejW7oSaydmIWgswQohecMBcGAB2Q5rOpkDJ1Fumf2TpG+yLk9
	4viKae1hf5jBjDMLRzuzK7Nn/VCJex5rEKYZBvRDqYXvRyvO729wyWHo7Oi0LbdIXGmL
	VK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=z8Qh8EzegJDyykql6xX229Wo5rQiKp4O57ISL6QPayc=;
	b=FkI/85t7k6s1wDVuE3eyKE4dFFoeho1shqpKdJAfS332K3IMLuP704Ry5LlfJxaSz5
	40ywxayBE6A/5jO3n+DCGpYUKu8Q9/2QYG4Zzbk0BDJbLqyvoKTxommc6w4zYrxUlGLt
	FX3tt7bu0a4wiXDwk45SDT1Ga3OEcPD8edVdlSZ4Pb1s0xpFhi74To+Q5tw98YqLe6bp
	NPcYdsoI151l8J6nnBW16FI74l6pm/4qRyArtNxsYv3IVkRnhMEHrtoM2Ufufs7yFTuV
	uaUVKfLoN9AUlS/InVZfnx8KVCRcJDeqipUEwIGVeHV4xit/Nz4Ht5rM+E4YsL/JGYz/
	iiRg==
X-Gm-Message-State: APjAAAWkL8gHuvvSxMo+8YByDtTnnejRwHXLK9ufTsKSkxutFzAoFbgH
	10j+597jw1teMiYoxJ1NYIGZRZourZFpMazdNAk=
X-Google-Smtp-Source: APXvYqzgJ4CTCmKYC+zq8345idUrsr88iNgr4qnBPbAtr1qCpStsGlFcdeMPpU+stxpKS7Taj6jxhkXKM3mooRkBaVI=
X-Received: by 2002:aed:3644:: with SMTP id e62mr23351515qtb.80.1563299115850; 
	Tue, 16 Jul 2019 10:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190716124721.22289-1-ross.burton@intel.com>
In-Reply-To: <20190716124721.22289-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 10:44:48 -0700
Message-ID: <CAMKF1sq-84rTZhBOVCF4wL8KX=LsX5WQgOOg4vSdDA-yYThYtQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: exclude child recipes from CVE scanning
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
X-List-Received-Date: Tue, 16 Jul 2019 17:45:16 -0000
Content-Type: text/plain; charset="UTF-8"

seems good to me.

On Tue, Jul 16, 2019 at 5:47 AM Ross Burton <ross.burton@intel.com> wrote:
>
> As glibc will be scanned for CVEs, we don't need to scan glibc-locale,
> glibc-mtrace, and glibc-scripts which are all separate recipes for technical
> reasons.
>
> Exclude the recipes by setting CVE_PRODUCT in the recipe, instead of using the
> global whitelist.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/cve-check.bbclass            | 4 +---
>  meta/recipes-core/glibc/glibc-locale.inc  | 3 +++
>  meta/recipes-core/glibc/glibc-mtrace.inc  | 3 +++
>  meta/recipes-core/glibc/glibc-scripts.inc | 3 +++
>  4 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index 5979edf3d17..19ac48cfd49 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -37,9 +37,7 @@ CVE_CHECK_COPY_FILES ??= "1"
>  CVE_CHECK_CREATE_MANIFEST ??= "1"
>
>  # Whitelist for packages (PN)
> -CVE_CHECK_PN_WHITELIST = "\
> -    glibc-locale \
> -"
> +CVE_CHECK_PN_WHITELIST ?= ""
>
>  # Whitelist for CVE and version of package. If a CVE is found then the PV is
>  # compared with the version list, and if found the CVE is considered
> diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
> index bf5eaee9380..ef06389ff94 100644
> --- a/meta/recipes-core/glibc/glibc-locale.inc
> +++ b/meta/recipes-core/glibc/glibc-locale.inc
> @@ -98,3 +98,6 @@ do_install() {
>  inherit libc-package
>
>  BBCLASSEXTEND = "nativesdk"
> +
> +# Don't scan for CVEs as glibc will be scanned
> +CVE_PRODUCT = ""
> diff --git a/meta/recipes-core/glibc/glibc-mtrace.inc b/meta/recipes-core/glibc/glibc-mtrace.inc
> index d703c14bdc1..ef9d60ec239 100644
> --- a/meta/recipes-core/glibc/glibc-mtrace.inc
> +++ b/meta/recipes-core/glibc/glibc-mtrace.inc
> @@ -11,3 +11,6 @@ do_install() {
>         install -d -m 0755 ${D}${bindir}
>         install -m 0755 ${SRC}/mtrace ${D}${bindir}/
>  }
> +
> +# Don't scan for CVEs as glibc will be scanned
> +CVE_PRODUCT = ""
> diff --git a/meta/recipes-core/glibc/glibc-scripts.inc b/meta/recipes-core/glibc/glibc-scripts.inc
> index 2a2b41507ed..14a14e45126 100644
> --- a/meta/recipes-core/glibc/glibc-scripts.inc
> +++ b/meta/recipes-core/glibc/glibc-scripts.inc
> @@ -18,3 +18,6 @@ do_install() {
>  # sotruss script requires sotruss-lib.so (given by libsotruss package),
>  # to produce trace of the library calls.
>  RDEPENDS_${PN} += "libsotruss"
> +
> +# Don't scan for CVEs as glibc will be scanned
> +CVE_PRODUCT = ""
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

