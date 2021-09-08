Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.10164.1631100720683322372
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 04:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 57D5E200008;
	Wed,  8 Sep 2021 11:31:58 +0000 (UTC)
Date: Wed, 8 Sep 2021 13:31:57 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC PATCH 7/7] package_rpm: use zstd instead of xz
Message-ID: <YTie/qN+H1Yo4qjp@piout.net>
References: <20210830184800.954770-1-alex.kanavin@gmail.com>
 <20210830184800.954770-7-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210830184800.954770-7-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Alex,

On 30/08/2021 20:48:00+0200, Alexander Kanavin wrote:
> zstd has similar time and space performance in compression but is
> vastly faster in decompression, which benefits rootfs creation
> (especially when installing very large packages) and on-target
> package installation.
> 

I believe this caused the following repo failures:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210907-bv62etev/packages/diff-html/

I started a subsequent build without the patch and it have the issue.

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/classes/package_rpm.bbclass | 4 ++--
>  meta/conf/bitbake.conf           | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 88d861c0e7..fc1e4b3a4a 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -684,8 +684,8 @@ python do_package_rpm () {
>      cmd = cmd + " --define '_use_internal_dependency_generator 0'"
>      cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
>      cmd = cmd + " --define '_build_id_links none'"
> -    cmd = cmd + " --define '_binary_payload w6T%d.xzdio'" % int(d.getVar("XZ_THREADS"))
> -    cmd = cmd + " --define '_source_payload w6T%d.xzdio'" % int(d.getVar("XZ_THREADS"))
> +    cmd = cmd + " --define '_binary_payload w19T%d.zstdio'" % int(d.getVar("ZSTD_THREADS"))
> +    cmd = cmd + " --define '_source_payload w19T%d.zstdio'" % int(d.getVar("ZSTD_THREADS"))
>      cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
>      cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
>      cmd = cmd + " --define '_buildhost reproducible'"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 2140d498f7..52d40738f4 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -814,6 +814,9 @@ XZ_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
>  XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --threads=${XZ_THREADS}"
>  XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
>  
> +# Default parallelism for zstd
> +ZSTD_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
> +
>  # Limit the number of threads that OpenMP libraries will use. Otherwise they
>  # may fallback to using all CPUs
>  export OMP_NUM_THREADS = "${BB_NUMBER_THREADS}"
> -- 
> 2.31.1
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
