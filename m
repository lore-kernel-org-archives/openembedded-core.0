Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 12CA876FF2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 04:03:12 +0000 (UTC)
Received: by pasz6 with SMTP id z6so7527842pas.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 21:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=D21VeEj+KbvSAIFkDPbo2hKC+O/J+eyaVPIfQ8kc8k8=;
	b=F6x2t/4XohtZtPeW4Xmt/qzhKcRgLiLS2xb1xTdiDs5ewG8YIfBAb9e9yaUC5zg53z
	mfyHKobZMwSD7t+fmhaI+NvVtsEl2aZPKSLRxCuvnKuxB1eGCyo4mj9mOsLp+CfFeSNV
	edKjPDFBKOnH7/wBMYIZUfVaPzMFnwk+cDBunpKEJokLJfFIKIXXEddY1NVa5V4sPzSU
	mseeeJA0QItOkAR+7xTHzzFhnA8oKbo2iVMYL8pnmVq5Sij+MkroTmaYSvTm2+eItC6m
	qzM4IkNvirJXWxhoUCVxwHOr1SIBO5evtgI4+9bbIt5zeVKGQYNFPa4S8hGqGexe0oRt
	rWPg==
X-Received: by 10.66.231.103 with SMTP id tf7mr1285771pac.85.1445313792732;
	Mon, 19 Oct 2015 21:03:12 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:c43a:7500:299d:6c4e?
	([2601:646:8601:4580:c43a:7500:299d:6c4e])
	by smtp.gmail.com with ESMTPSA id sz9sm832992pab.13.2015.10.19.21.03.11
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 21:03:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.4\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1445268589-104714-2-git-send-email-mark.hatle@windriver.com>
Date: Mon, 19 Oct 2015 21:03:03 -0700
Message-Id: <9DDEC8CD-9064-4CAC-9B89-A2B3037BD559@gmail.com>
References: <1445268589-104714-1-git-send-email-mark.hatle@windriver.com>
	<1445268589-104714-2-git-send-email-mark.hatle@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.3096.4)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-5.2: Fix various _FOR_BUILD and related variables
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
X-List-Received-Date: Tue, 20 Oct 2015 04:03:13 -0000
X-Groupsio-MsgNum: 72387
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5D90E05C-ECE4-46F1-B55C-EFE4A9E72367";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5D90E05C-ECE4-46F1-B55C-EFE4A9E72367
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 19, 2015, at 8:29 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>=20
> When doing a FOR_BUILD thing, you have to override CFLAGS with
> CFLAGS_FOR_BUILD. And if you use C++, you also have to override
> CXXFLAGS with CXXFLAGS_FOR_BUILD.
> Without this, when building for mingw, you end up trying to use
> the mingw headers for a host build.
>=20
> The same goes for other variables as well, such as CPPFLAGS,
> CPP, and GMPINC.

this is ok to install.

>=20
> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
> meta/recipes-devtools/gcc/gcc-5.2.inc              |   1 +
> .../gcc/gcc-5.2/0042-cxxflags-for-build.patch      | 123 =
+++++++++++++++++++++
> 2 files changed, 124 insertions(+)
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-5.2/0042-cxxflags-for-build.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-5.2.inc =
b/meta/recipes-devtools/gcc/gcc-5.2.inc
> index f6673e6..a6b385a 100644
> --- a/meta/recipes-devtools/gcc/gcc-5.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-5.2.inc
> @@ -73,6 +73,7 @@ SRC_URI =3D "\
>            =
file://0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
>            file://0040-nativesdk-gcc-support.patch \
>            file://0041-handle-target-sysroot-multilib.patch \
> +           file://0042-cxxflags-for-build.patch \
>           "
>=20
> BACKPORTS =3D ""
> diff --git =
a/meta/recipes-devtools/gcc/gcc-5.2/0042-cxxflags-for-build.patch =
b/meta/recipes-devtools/gcc/gcc-5.2/0042-cxxflags-for-build.patch
> new file mode 100644
> index 0000000..1105e29
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-5.2/0042-cxxflags-for-build.patch
> @@ -0,0 +1,123 @@
> +Fix various _FOR_BUILD and related variables
> +
> +When doing a FOR_BUILD thing, you have to override CFLAGS with
> +CFLAGS_FOR_BUILD. And if you use C++, you also have to override
> +CXXFLAGS with CXXFLAGS_FOR_BUILD.
> +Without this, when building for mingw, you end up trying to use
> +the mingw headers for a host build.
> +
> +The same goes for other variables as well, such as CPPFLAGS,
> +CPP, and GMPINC.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 9370174..011c29a 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -152,6 +152,7 @@ BUILD_EXPORTS =3D \
> + 	CPP=3D"$(CC_FOR_BUILD) -E"; export CPP; \
> + 	CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> + 	CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> ++	CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> + 	CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> + 	CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> + 	GCJ=3D"$(GCJ_FOR_BUILD)"; export GCJ; \
> +@@ -170,6 +171,9 @@ BUILD_EXPORTS =3D \
> + # built for the build system to override those in =
BASE_FLAGS_TO_PASS.
> + EXTRA_BUILD_FLAGS =3D \
> + 	CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> ++	CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> ++	CPP=3D"$(CC_FOR_BUILD) -E" \
> ++	CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)" \
> + 	LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> +
> + # This is the list of directories to built for the host system.
> +@@ -187,6 +191,7 @@ HOST_SUBDIR =3D @host_subdir@
> + HOST_EXPORTS =3D \
> + 	$(BASE_EXPORTS) \
> + 	CC=3D"$(CC)"; export CC; \
> ++	CPP=3D"$(CC) -E"; export CPP; \
> + 	ADA_CFLAGS=3D"$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> + 	CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
> + 	CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> +@@ -711,6 +715,7 @@ BASE_FLAGS_TO_PASS =3D \
> + 	"CC_FOR_BUILD=3D$(CC_FOR_BUILD)" \
> + 	"CFLAGS_FOR_BUILD=3D$(CFLAGS_FOR_BUILD)" \
> + 	"CXX_FOR_BUILD=3D$(CXX_FOR_BUILD)" \
> ++	"CXXFLAGS_FOR_BUILD=3D$(CXXFLAGS_FOR_BUILD)" \
> + 	"EXPECT=3D$(EXPECT)" \
> + 	"FLEX=3D$(FLEX)" \
> + 	"INSTALL=3D$(INSTALL)" \
> +diff --git a/Makefile.tpl b/Makefile.tpl
> +index 1ea1954..78a59c3 100644
> +--- a/Makefile.tpl
> ++++ b/Makefile.tpl
> +@@ -154,6 +154,7 @@ BUILD_EXPORTS =3D \
> + 	CC=3D"$(CC_FOR_BUILD)"; export CC; \
> + 	CFLAGS=3D"$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> + 	CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> ++	CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
> + 	CXX=3D"$(CXX_FOR_BUILD)"; export CXX; \
> + 	CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> + 	GCJ=3D"$(GCJ_FOR_BUILD)"; export GCJ; \
> +@@ -172,6 +173,9 @@ BUILD_EXPORTS =3D \
> + # built for the build system to override those in =
BASE_FLAGS_TO_PASS.
> + EXTRA_BUILD_FLAGS =3D \
> + 	CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
> ++	CXXFLAGS=3D"$(CXXFLAGS_FOR_BUILD)" \
> ++	CPP=3D"$(CC_FOR_BUILD) -E" \
> ++	CPPFLAGS=3D"$(CPPFLAGS_FOR_BUILD)" \
> + 	LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
> +
> + # This is the list of directories to built for the host system.
> +@@ -189,6 +193,7 @@ HOST_SUBDIR =3D @host_subdir@
> + HOST_EXPORTS =3D \
> + 	$(BASE_EXPORTS) \
> + 	CC=3D"$(CC)"; export CC; \
> ++	CPP=3D"$(CC) -E"; export CPP; \
> + 	ADA_CFLAGS=3D"$(ADA_CFLAGS)"; export ADA_CFLAGS; \
> + 	CFLAGS=3D"$(CFLAGS)"; export CFLAGS; \
> + 	CONFIG_SHELL=3D"$(SHELL)"; export CONFIG_SHELL; \
> +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> +index cd5bc4a..98ae4f4 100644
> +--- a/gcc/Makefile.in
> ++++ b/gcc/Makefile.in
> +@@ -762,7 +762,7 @@ BUILD_LINKERFLAGS =3D $(BUILD_CXXFLAGS)
> + # Native linker and preprocessor flags.  For x-fragment overrides.
> + BUILD_LDFLAGS=3D@BUILD_LDFLAGS@
> + BUILD_CPPFLAGS=3D -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
> +-		-I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS)
> ++		-I$(srcdir)/../include @INCINTL@ $(CPPINC) =
$(CPPFLAGS_FOR_BUILD)
> +
> + # Actual name to use when installing a native compiler.
> + GCC_INSTALL_NAME :=3D $(shell echo gcc|sed =
'$(program_transform_name)')
> +diff --git a/gcc/configure b/gcc/configure
> +index c7ac14b..5ac63e4 100755
> +--- a/gcc/configure
> ++++ b/gcc/configure
> +@@ -11521,7 +11521,7 @@ else
> + 	CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> + 	CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> + 	LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> +-	GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> ++	GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" =
\
> + 	${realsrcdir}/configure \
> + 		--enable-languages=3D${enable_languages-all} \
> + 		--target=3D$target_alias --host=3D$build_alias =
--build=3D$build_alias
> +diff --git a/gcc/configure.ac b/gcc/configure.ac
> +index 50856e6..17a4dfd 100644
> +--- a/gcc/configure.ac
> ++++ b/gcc/configure.ac
> +@@ -1633,7 +1633,7 @@ else
> + 	CC=3D"${CC_FOR_BUILD}" CFLAGS=3D"${CFLAGS_FOR_BUILD}" \
> + 	CXX=3D"${CXX_FOR_BUILD}" CXXFLAGS=3D"${CXXFLAGS_FOR_BUILD}" \
> + 	LD=3D"${LD_FOR_BUILD}" LDFLAGS=3D"${LDFLAGS_FOR_BUILD}" \
> +-	GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS} -DGENERATOR_FILE" \
> ++	GMPINC=3D"" CPPFLAGS=3D"${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" =
\
> + 	${realsrcdir}/configure \
> + 		--enable-languages=3D${enable_languages-all} \
> + 		--target=3D$target_alias --host=3D$build_alias =
--build=3D$build_alias
> --
> 1.9.3
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_5D90E05C-ECE4-46F1-B55C-EFE4A9E72367
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYlvP8ACgkQuwUzVZGdMxTaRQCdFGz05OXmHwCu20a/ojUKmcYs
HzgAnRNCHHG2lDFyAVR3D+I7xgpbhG0T
=pH94
-----END PGP SIGNATURE-----

--Apple-Mail=_5D90E05C-ECE4-46F1-B55C-EFE4A9E72367--
