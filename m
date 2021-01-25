Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web10.34220.1611565321993959401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 01:02:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4DPP4k4NkTz5tlC;
	Mon, 25 Jan 2021 10:01:58 +0100 (CET)
Date: Mon, 25 Jan 2021 10:01:57 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Dorinda <dorindabassey@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/5] elfutils: add support for ipkg
Message-ID: <20210125090157.qllctjfbqfbsameg@qschulz>
References: <20210124135559.21894-1-dorindabassey@gmail.com>
 <20210124135559.21894-3-dorindabassey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210124135559.21894-3-dorindabassey@gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dorinda,

On Sun, Jan 24, 2021 at 02:55:57PM +0100, Dorinda wrote:
> debuginfod scanner 0.181 could only support RPM and scan .debs, it can now scan .ipk
> 

Typo here? The recipe version is 0.182 not 0.181.

> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
>  .../elfutils/elfutils_0.182.bb                |  1 +
>  ...d-support-for-ipkg-to-debuginfod.cxx.patch | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch
> 
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.182.bb b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
> index 7b829cc7d5..b3d8c8f8ac 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.182.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
> @@ -20,6 +20,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
>             file://run-ptest \
>             file://ptest.patch \
>             file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
> +           file://0001-add-support-for-ipkg-to-debuginfod.cxx.patch \
>             "
>  SRC_URI_append_libc-musl = " \
>             file://0001-musl-obstack-fts.patch \
> diff --git a/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch b/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch
> new file mode 100644
> index 0000000000..4bb39c91e8
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch
> @@ -0,0 +1,32 @@
> +From b647d1df55c20772a9cc7ce96fcf323c500481bf Mon Sep 17 00:00:00 2001
> +From: dorindabassey <dorindabassey@gmail.com>
> +Date: Sat, 19 Dec 2020 01:11:46 +0100
> +Subject: [PATCH] add support for ipkg to debuginfod.cxx
> +
> +added support for ipkg to the debuginfod scanner. 0.181 only supports RPM and scan .debs, with this patch, debuginfod scanner would be able to scan .ipk
> +

Same here.

> +Upstream-status: Pending
> +
> +Signed-off-by: dorindabassey <dorindabassey@gmail.com>
> +---
> + debuginfod/debuginfod.cxx | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
> +index 5621030..cc78c93 100644
> +--- a/debuginfod/debuginfod.cxx
> ++++ b/debuginfod/debuginfod.cxx
> +@@ -442,11 +442,13 @@ parse_opt (int key, char *arg,
> +         {
> +           scan_archives[".deb"]="dpkg-deb --fsys-tarfile";
> +           scan_archives[".ddeb"]="dpkg-deb --fsys-tarfile";
> ++          scan_archives[".ipk"]="dpkg-deb --fsys-tarfile";
> +         }
> +       else
> +         {
> +           scan_archives[".deb"]="(bsdtar -O -x -f - data.tar.xz)<";
> +           scan_archives[".ddeb"]="(bsdtar -O -x -f - data.tar.xz)<";
> ++          scan_archives[".ipk"]="(bsdtar -O -x -f - data.tar.xz)<";
> +         }
> +       // .udeb too?
> +       break;
> -- 
> 2.17.1
> 

This looks like a trivial patch, have you sent it to elfutils mailing
list already? Didn't find any mail from you in their archives.

This way you could update the Upstream-status to Submitted and give the
link, that'll make it easier for maintainers of Yocto/this recipe to fix
a failed recipe upgrade (upstream project might decide this patch is not
enough or they want a different implementation, having the whole
discussion easily reachable is usually very helpful).

Thanks,
Quentin
