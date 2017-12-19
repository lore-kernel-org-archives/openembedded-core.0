Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2C0700F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 11:08:46 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vBJB8jWF006474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 19 Dec 2017 11:08:46 GMT
Message-ID: <1513681725.16507.62.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org,
	Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 19 Dec 2017 11:08:45 +0000
In-Reply-To: <20171212172317.601-8-raj.khem@gmail.com>
References: <20171212172317.601-1-raj.khem@gmail.com>
	<20171212172317.601-8-raj.khem@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 8/9] gcc-7.2: Fix libgfortran build
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
X-List-Received-Date: Tue, 19 Dec 2017 11:08:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-12-12 at 09:23 -0800, Khem Raj wrote:
> From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> 
> Without this patch libbacktrace cannot be included/link during
> libgfortran build.
> 
> libbtool: link: cannot find the library
> `../libbacktrace/libbacktrace.la'
> or unhandled argument `../libbacktrace/libbacktrace.la
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
>  .../gcc/gcc-7.2/0051-Fix-gfortran-build.patch      | 53
> ++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-
> gfortran-build.patch
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-7.2.inc b/meta/recipes-
> devtools/gcc/gcc-7.2.inc
> index 1d40cba731..baf98aeba8 100644
> --- a/meta/recipes-devtools/gcc/gcc-7.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-7.2.inc
> @@ -75,6 +75,7 @@ SRC_URI = "\
>             file://0048-gcc-Enable-static-PIE.patch \
>             file://fix-segmentation-fault-precompiled-hdr.patch \
>             file://0050-RISC-V-Handle-non-legitimate-address-in-
> riscv_legiti.patch \
> +           file://0051-Fix-gfortran-build.patch \
>             ${BACKPORTS} \
>  "
>  BACKPORTS = "\
> diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-
> build.patch b/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-
> build.patch
> new file mode 100644
> index 0000000000..a71b6b0bee
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-7.2/0051-Fix-gfortran-build.patch
> @@ -0,0 +1,53 @@
> +Without this patch libbacktrace cannot be included/link during
> +libgfortran build.
> +
> +libbtool: link: cannot find the library
> `../libbacktrace/libbacktrace.la'
> +or unhandled argument `../libbacktrace/libbacktrace.la'
> +
> +Upstream-Status: Inappropriate [OE specific]
> +Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +
> +diff --git a/libgfortran/Makefile.am b/libgfortran/Makefile.am
> +index 2857af5943f9..e07760069a3c 100644
> +--- a/libgfortran/Makefile.am
> ++++ b/libgfortran/Makefile.am
> +@@ -37,7 +37,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
> + toolexeclib_DATA = libgfortran.spec
> + libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
> + libgfortran_la_LDFLAGS = -version-info `grep -v '^\#'
> $(srcdir)/libtool-version` \
> +-	$(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la
> \
> ++	$(LTLDFLAGS) $(LIBQUADLIB)
> ../../libbacktrace/libbacktrace.la \
> + 	$(HWCAP_LDFLAGS) \
> + 	-lm $(extra_ldflags_libgfortran) \
> + 	$(version_arg) -Wc,-shared-libgcc
> +@@ -64,7 +64,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io
> -I$(srcdir)/$(MULTISRCTOP)../gcc \
> + 	      -I$(MULTIBUILDTOP)../libgcc \
> + 	      -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
> + 	      -I$(MULTIBUILDTOP)../libbacktrace \
> +-	      -I../libbacktrace
> ++	      -I../../libbacktrace
> + 
> + # Fortran rules for complex multiplication and division
> + AM_CFLAGS += -fcx-fortran-rules
> +diff --git a/libgfortran/Makefile.in b/libgfortran/Makefile.in
> +index 05b183dcadb0..c9e0280e412c 100644
> +--- a/libgfortran/Makefile.in
> ++++ b/libgfortran/Makefile.in
> +@@ -581,7 +581,7 @@ toolexeclib_LTLIBRARIES = libgfortran.la
> + toolexeclib_DATA = libgfortran.spec
> + libgfortran_la_LINK = $(LINK) $(libgfortran_la_LDFLAGS)
> + libgfortran_la_LDFLAGS = -version-info `grep -v '^\#'
> $(srcdir)/libtool-version` \
> +-	$(LTLDFLAGS) $(LIBQUADLIB) ../libbacktrace/libbacktrace.la
> \
> ++	$(LTLDFLAGS) $(LIBQUADLIB)
> ../../libbacktrace/libbacktrace.la \
> + 	$(HWCAP_LDFLAGS) \
> + 	-lm $(extra_ldflags_libgfortran) \
> + 	$(version_arg) -Wc,-shared-libgcc
> +@@ -602,7 +602,7 @@ AM_CPPFLAGS = -iquote$(srcdir)/io
> -I$(srcdir)/$(MULTISRCTOP)../gcc \
> + 	      -I$(MULTIBUILDTOP)../libgcc \
> + 	      -I$(srcdir)/$(MULTISRCTOP)../libbacktrace \
> + 	      -I$(MULTIBUILDTOP)../libbacktrace \
> +-	      -I../libbacktrace
> ++	      -I../../libbacktrace
> + 
> + gfor_io_src = io/size_from_kind.c $(am__append_2)
> + gfor_io_headers = \

Did you try this for something other than x86_64? I think this won't
work when cross compiling and host != target.

I do have a better fix which might work in mind...

Cheers,

Richard


