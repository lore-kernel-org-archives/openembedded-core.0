Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id C0C4E79BBE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 00:14:58 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id b22-v6so19276051qtr.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 17:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nbNKApfld7c2+xlA0KmOwRSAkOY3l/gur8aqtsn0vx8=;
	b=oCtdNG/NK2CizSXRR3jYMQ1/wgxUNmfnT8HiS59FtLEB5Wt5nWLSw1Wx/OCKHP/Pij
	6EDQWbtQfCCOmvcoP2s+BNMAm578hp+0o/ay95R1E2chQXOjv4nkiCYpz/OP3R8RwkXV
	fIHxBDiI9nSyl81dhyPBc07b1g0m92G/BMuEpVcH4EIH3xUnQm1ZmBxuMjFg1gtb8sBR
	wopl3BNt+c8w8YwsC4d6T8jV+j4NTV7EsUoBoM4RWzUE2XhsaoqaIYQ67ehtmhVW5en+
	KbdIMOtw4O0yMmI3+zE7jfE6dcEUZIwZrRkZjuDQxUYB+zI/qZUoK2xH9tuXJx1VRi89
	ixPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nbNKApfld7c2+xlA0KmOwRSAkOY3l/gur8aqtsn0vx8=;
	b=AcBS6wZ4QAErIHicdTrBoiJTBAo2Qxr2YGyug8oW2Jm+AGfXyxRnXrVAXaFmXon50s
	47rlKqohX396uPEq1HN1uauzKVMVF662G1S5xygf/drv7hrFeHVKwi5AhasLA4Wy0Ion
	ZX5IQlqG/UH3Ab49Cldxdn/nnDXoOsst0TyeLSyFsB1x9dDxgH/7n3cAOHLlzrMXXZnV
	ZJ/vHF4U5Do8jykCcs5I/aob3ijfsuKNJw1MdKihizD2UmeUZKPRkNV27ATCL7i6k7bp
	KgDB2XZtpObBZC4L8aawm7GKTTTs+IFTPunPuyHVuLjmYapPsyWaqIVSpU/mGOnVe2z5
	IkGA==
X-Gm-Message-State: AGRZ1gLDldK66QO/trvFp+W6Qj3sRVMImGcldOoUszCLw0fSUrZN2ska
	34onEJD3bvd7vJciDZYfMndSC+npEXwvi8uSKOI=
X-Google-Smtp-Source: AJdET5f1Uw6+/uK3bAsWJDJgSvXK+pn6p04QxefP9y1i79RTJeE0HJzvvAQTRKP2IMLMA3IZefC/+coIw9dbiJtJoaY=
X-Received: by 2002:a0c:ad47:: with SMTP id v7mr4834272qvc.228.1541031299140; 
	Wed, 31 Oct 2018 17:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <1540997747-6079-1-git-send-email-serhe.popovych@gmail.com>
In-Reply-To: <1540997747-6079-1-git-send-email-serhe.popovych@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 Oct 2018 17:14:32 -0700
Message-ID: <CAMKF1sqiXxwb4rkJX_Uix5V6LWrOjFMwsNFK-rSL+j43Oq7vrQ@mail.gmail.com>
To: serhe.popovych@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] v86d: Make cross compilation working on more architectures
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
X-List-Received-Date: Thu, 01 Nov 2018 00:14:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 31, 2018 at 7:56 AM Serhey Popovych
<serhe.popovych@gmail.com> wrote:
>
> Since commit 709c603dec19 ("v86d: Accept aarch64 as build host") we
> support cross compilation on aarch64 host in addition to x86 host.
> However building on hosts different than two above will fail.
>
> Make cross compilation support more generic by checking for TARGET_ARCH
> in v86d configure script with fallback to `uname -m` when not present in
> environment and pass TARGET_ARCH explicitly in do_configure().
>
> Cross build for x86 tested on IBM Power 8 machine with RHEL7. Should
> work on aarch64 and rest too.
>

this is a good change, thanks for doing it

> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> ---
>  .../v86d/v86d/Support-for-cross-compilation.patch  | 34 ++++++++++++++++++++++
>  meta/recipes-bsp/v86d/v86d/aarch64-host.patch      | 18 ------------
>  meta/recipes-bsp/v86d/v86d_0.1.10.bb               |  4 +--
>  3 files changed, 36 insertions(+), 20 deletions(-)
>  create mode 100644 meta/recipes-bsp/v86d/v86d/Support-for-cross-compilation.patch
>  delete mode 100644 meta/recipes-bsp/v86d/v86d/aarch64-host.patch
>
> diff --git a/meta/recipes-bsp/v86d/v86d/Support-for-cross-compilation.patch b/meta/recipes-bsp/v86d/v86d/Support-for-cross-compilation.patch
> new file mode 100644
> index 0000000..15f70a5
> --- /dev/null
> +++ b/meta/recipes-bsp/v86d/v86d/Support-for-cross-compilation.patch
> @@ -0,0 +1,34 @@
> +From 8eda59654fd31416164c78f6068715b01767ed4e Mon Sep 17 00:00:00 2001
> +From: Serhey Popovych <serhe.popovych@gmail.com>
> +Date: Wed, 31 Oct 2018 07:31:47 -0400
> +Subject: v86d: Support for cross compilation
> +
> +It is common to build on one system for another (e.g. on IBM Power
> +machine for Intel x86) where HOST_ARCH (uname -m) != TARGET_ARCH.
> +
> +Take TARGET_ARCH from environment if it is given, otherwise fall back
> +to `uname -m`.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> +---
> + configure | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure b/configure
> +index cbbd6b3..046aa99 100755
> +--- a/configure
> ++++ b/configure
> +@@ -23,7 +23,8 @@ copt_x86emu_type="bool"
> + copt_x86emu_def=auto
> + copt_x86emu_test()
> + {
> +-      local m=`uname -m`
> ++      local m="${TARGET_ARCH:-$(uname -m)}"
> ++
> +       if [ "$m" = "i686" -o "$m" = "i586" -o "$m" = "i486" -o "$m" = "i386" ]; then
> +               echo "n";
> +       elif [ "$m" = "x86_64" ]; then
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-bsp/v86d/v86d/aarch64-host.patch b/meta/recipes-bsp/v86d/v86d/aarch64-host.patch
> deleted file mode 100644
> index 701fed7..0000000
> --- a/meta/recipes-bsp/v86d/v86d/aarch64-host.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Accept aarch64 as valid build host
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: v86d-0.1.10/configure
> -===================================================================
> ---- v86d-0.1.10.orig/configure
> -+++ v86d-0.1.10/configure
> -@@ -26,7 +26,7 @@ copt_x86emu_test()
> -       local m=`uname -m`
> -       if [ "$m" = "i686" -o "$m" = "i586" -o "$m" = "i486" -o "$m" = "i386" ]; then
> -               echo "n";
> --      elif [ "$m" = "x86_64" ]; then
> -+      elif [ "$m" = "x86_64" -o "$m" = "aarch64" ]; then
> -               echo "y";
> -       else
> -               echo "It looks like your architecture '$m' isn't supported by this version of v86d." >&2
> diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
> index f97b80d..84e27d2 100644
> --- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
> +++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
> @@ -12,7 +12,7 @@ PR = "r2"
>  SRC_URI = "http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/v/${BPN}/${BPN}_${PV}.orig.tar.gz \
>             file://Update-x86emu-from-X.org.patch \
>             file://ar-from-env.patch \
> -           file://aarch64-host.patch \
> +           file://Support-for-cross-compilation.patch \
>  "
>
>  SRC_URI[md5sum] = "889686ec8424468fe0d205742e77a4c2"
> @@ -22,7 +22,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
>
>  do_configure () {
> -       ./configure --with-x86emu
> +       TARGET_ARCH="${TARGET_ARCH}" ./configure --with-x86emu
>  }
>
>  do_compile () {
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

