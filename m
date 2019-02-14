Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7B55A7C614
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 16:22:59 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id z9so14535233itc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 08:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nOSVjbm58gQmKJo7XmCspdsH34u4nPhBrrkHUFnfjmw=;
	b=aEjvaX2HqWn3xvcSR9hL6aHDi7pzyKWg6dnCdiOprUlg2Hg8D8Ulxiwmp2CZaGuolE
	rA38aRVzEPClB8lMR3BWWjEv417itdw3TKOeDtQXS0Isji3bbVY/K6BDVYvm71Ls2eKX
	mTXQuJOD4uDfUcbOsRjAsxDw6FXNLfrxTmfz+Mvoa+rpCs/ASc12FJQivc9hyIOb6iQE
	XTFNCZn5Ksfg/oysjYEY3UvYznmbOecl/3lgEKEHgR98NexjJwhB5tz+5cI9cMHRWVGL
	GMZzyQ0DTJrcYzTaCvp9/CiWbg3ZSxabJLW1y92HyryyxNj3bluWrCbJ24FZve9brgV2
	MFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nOSVjbm58gQmKJo7XmCspdsH34u4nPhBrrkHUFnfjmw=;
	b=b4x6gUWJptZyHZna7/lyCqWZnV1Ez76f+JD5cArAPvMDgXBX06PSMpA4PXgK/DeL4S
	HaEJcnynVVyR+DZKM+3qIozFeF+/KauVJj/P33isRgwN+uf29fCG0MjpOkRgLd5zSP5D
	Dy5+aLhPKY0Y3RzHRVDSz+6ZucTFngJ0Lw39J/W4VWxo9B4Yeo0Vn7VbRPVbzchF2vaa
	2VhUrlmdeYPaYffaH+7Q+cUhD081PhGLveINcZMYO0zoj7OUiEo7PcYdEBwnYP+RPt3Z
	uaFSoVg1VEMZinEpVUU31KcuWV7kORd90dUJLmeVLaOCV+SMVhGJejcuxnGWj1cGL2wB
	Eh6w==
X-Gm-Message-State: AHQUAubYJt3HNWFX9W+3tX5wkFn2bEs8kzOhsKx6AyfYinjYk5LwigrG
	EPK1+FT7EAX81d0x+XEdGzX6qYrSX184gPQsxfhB2A==
X-Google-Smtp-Source: AHgI3Ia9bzRvqh49D1oSJTZuJRDABan8d3Lhf3Rrco8RBrsM7c3Civ0JMYi8WmO2AQKOXI8HLH9tAX/Z213DBeqqFm8=
X-Received: by 2002:a6b:ee1a:: with SMTP id i26mr2534174ioh.201.1550161380431; 
	Thu, 14 Feb 2019 08:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20190214161529.25843-1-pascal.bach@siemens.com>
In-Reply-To: <20190214161529.25843-1-pascal.bach@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Feb 2019 16:22:49 +0000
Message-ID: <CAJTo0LbyT8_1wrD=Eb5kg1Ya3nG46JjK6k3gyxvjOrHyJnTNeA@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nfs-utils: build tools with target compiler
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
X-List-Received-Date: Thu, 14 Feb 2019 16:22:59 -0000
Content-Type: text/plain; charset="UTF-8"

Will you be sending that fix upstream too?

On Thu, 14 Feb 2019 at 16:16, Pascal Bach <pascal.bach@siemens.com> wrote:
>
> Some tools were built with CC_FOR_BUILD which points to the target
> compiler. The current patch avoided issues by deleting some of the
> binaries during install.
>
> This patch replaces the CC_FOR_BUILD with CC so the tools are built with
> the target compiler. This means the binaries no longer need to be
> deleted.
>
> I stumbled upon this by trying to globally add "--ffile-prefix-map", which
> is not supported by my host GCC, to get rid of some "buildpaths" QA Warnings.
>
> Cc: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  .../0001-Don-t-build-tools-with-CC_FOR_BUILD.patch | 40 +++++++++++++++++++++
>  ...-Do-not-pass-CFLAGS-to-gcc-while-building.patch | 42 ----------------------
>  .../nfs-utils/nfs-utils_2.3.3.bb                   |  7 +---
>  3 files changed, 41 insertions(+), 48 deletions(-)
>  create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Don-t-build-tools-with-CC_FOR_BUILD.patch
>  delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Don-t-build-tools-with-CC_FOR_BUILD.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Don-t-build-tools-with-CC_FOR_BUILD.patch
> new file mode 100644
> index 0000000000..23bc3eaf72
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Don-t-build-tools-with-CC_FOR_BUILD.patch
> @@ -0,0 +1,40 @@
> +From 79019d976584c598f8d0a9d8de43c989946f974b Mon Sep 17 00:00:00 2001
> +From: Pascal Bach <pascal.bach@siemens.com>
> +Date: Wed, 13 Feb 2019 09:28:07 +0100
> +Subject: [PATCH] Don't build tools with CC_FOR_BUILD
> +
> +The tools are intended for the target not for the host.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> +---
> + tools/locktest/Makefile.am | 1 -
> + tools/rpcgen/Makefile.am   | 1 -
> + 2 files changed, 2 deletions(-)
> +
> +diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
> +index 3156815..87d0bac 100644
> +--- a/tools/locktest/Makefile.am
> ++++ b/tools/locktest/Makefile.am
> +@@ -1,6 +1,5 @@
> + ## Process this file with automake to produce Makefile.in
> +
> +-CC=$(CC_FOR_BUILD)
> + LIBTOOL = @LIBTOOL@ --tag=CC
> +
> + noinst_PROGRAMS = testlk
> +diff --git a/tools/rpcgen/Makefile.am b/tools/rpcgen/Makefile.am
> +index 8a9ec89..3e092c9 100644
> +--- a/tools/rpcgen/Makefile.am
> ++++ b/tools/rpcgen/Makefile.am
> +@@ -1,6 +1,5 @@
> + ## Process this file with automake to produce Makefile.in
> +
> +-CC=$(CC_FOR_BUILD)
> + LIBTOOL = @LIBTOOL@ --tag=CC
> +
> + noinst_PROGRAMS = rpcgen
> +--
> +2.11.0
> +
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch
> deleted file mode 100644
> index 993f1e5ea5..0000000000
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -nfs-utils: Do not pass CFLAGS to gcc while building
> -
> -Do not pass CFLAGS/LDFLAGS to gcc while building, The needed flags has
> -been passed by xxx_CFLAGS=$(CFLAGS_FOR_BUILD).
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ----
> - tools/locktest/Makefile.am |    2 ++
> - tools/rpcgen/Makefile.am   |    2 ++
> - 2 files changed, 4 insertions(+)
> -
> -diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
> -index 3156815..1729fd1 100644
> ---- a/tools/locktest/Makefile.am
> -+++ b/tools/locktest/Makefile.am
> -@@ -1,6 +1,8 @@
> - ## Process this file with automake to produce Makefile.in
> -
> - CC=$(CC_FOR_BUILD)
> -+CFLAGS=
> -+LDFLAGS=
> - LIBTOOL = @LIBTOOL@ --tag=CC
> -
> - noinst_PROGRAMS = testlk
> -diff --git a/tools/rpcgen/Makefile.am b/tools/rpcgen/Makefile.am
> -index 8a9ec89..8bacdaa 100644
> ---- a/tools/rpcgen/Makefile.am
> -+++ b/tools/rpcgen/Makefile.am
> -@@ -1,6 +1,8 @@
> - ## Process this file with automake to produce Makefile.in
> -
> - CC=$(CC_FOR_BUILD)
> -+CFLAGS=
> -+LDFLAGS=
> - LIBTOOL = @LIBTOOL@ --tag=CC
> -
> - noinst_PROGRAMS = rpcgen
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
> index 84530f698b..ac4437b925 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
> @@ -26,7 +26,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
>             file://nfs-mountd.service \
>             file://nfs-statd.service \
>             file://proc-fs-nfsd.mount \
> -           file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
>             file://nfs-utils-debianize-start-statd.patch \
>             file://bugfix-adjust-statd-service-name.patch \
>             file://nfs-utils-musl-limits.patch \
> @@ -35,6 +34,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
>             file://clang-format-string.patch \
>             file://0001-Makefile.am-update-the-path-of-libnfs.a.patch \
>             file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
> +           file://0001-Don-t-build-tools-with-CC_FOR_BUILD.patch \
>  "
>  SRC_URI_append_libc-glibc = " file://0001-configure.ac-Do-not-fatalize-Wmissing-prototypes.patch"
>  SRC_URI_append_libc-musl = " file://nfs-utils-musl-res_querydomain.patch"
> @@ -147,11 +147,6 @@ do_install_append () {
>         chown -R rpcuser:rpcuser ${D}${localstatedir}/lib/nfs/statd
>         chmod 0644 ${D}${localstatedir}/lib/nfs/statd/state
>
> -       # the following are built by CC_FOR_BUILD
> -       rm -f ${D}${sbindir}/rpcdebug
> -       rm -f ${D}${sbindir}/rpcgen
> -       rm -f ${D}${sbindir}/locktest
> -
>          # Make python tools use python 3
>          sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${sbindir}/mountstats ${D}${sbindir}/nfsiostat
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

