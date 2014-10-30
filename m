Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8E98070A84
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 17:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9UHnl8l026398; Thu, 30 Oct 2014 17:49:47 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZGFCJ-BI6Ab2; Thu, 30 Oct 2014 17:49:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9UHnfOQ026392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 30 Oct 2014 17:49:43 GMT
Message-ID: <1414691416.7649.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandra Safta <alexandra.safta@enea.com>
Date: Thu, 30 Oct 2014 17:50:16 +0000
In-Reply-To: <1414687599-36822-1-git-send-email-alexandra.safta@enea.com>
References: <1414687599-36822-1-git-send-email-alexandra.safta@enea.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Valgrind: Remove test apps not building with ppc64 and PTEST
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
X-List-Received-Date: Thu, 30 Oct 2014 17:50:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-10-30 at 17:46 +0100, Alexandra Safta wrote:
> Signed-off-by: Alexandra Safta <alexandra.safta@enea.com>

This removes the tests for all architectures? Why is that a good idea?
At the very least this needs more explanation.

Cheers,

Richard




>  .../valgrind/remove-ppc64-tests-failing-build.patch      | 16 ++++++++++++++++
>  meta/recipes-devtools/valgrind/valgrind_3.9.0.bb         |  3 ++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-ppc64-tests-failing-build.patch
> 
> diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-ppc64-tests-failing-build.patch b/meta/recipes-devtools/valgrind/valgrind/remove-ppc64-tests-failing-build.patch
> new file mode 100644
> index 0000000..7bf3a21
> --- /dev/null
> +++ b/meta/recipes-devtools/valgrind/valgrind/remove-ppc64-tests-failing-build.patch
> @@ -0,0 +1,16 @@
> +--- a/none/tests/ppc64/Makefile.am	2014-10-22 16:33:20.686773392 +0200
> ++++ b/none/tests/ppc64/Makefile.am	2014-10-23 10:31:38.948654523 +0200
> +@@ -35,11 +35,10 @@
> +
> + check_PROGRAMS = \
> + 	allexec \
> +-	jm-insns lsw round std_reg_imm twi_tdi tw_td power6_bcmp \
> ++	lsw round std_reg_imm twi_tdi tw_td power6_bcmp \
> + 	power6_mf_gpr test_isa_2_06_part1 test_isa_2_06_part2 \
> + 	test_isa_2_06_part3 test_dfp1 test_dfp2 test_dfp3 test_dfp4 \
> +-	test_dfp5 test_isa_2_07_part1 test_isa_2_07_part2 \
> +-	test_tm test_touch_tm
> ++	test_dfp5
> +
> + AM_CFLAGS    += @FLAG_M64@
> + AM_CXXFLAGS  += @FLAG_M64@
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
> index c415e77..f642856 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
> @@ -19,6 +19,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>             file://force-nostabs.patch \
>             file://remove-arm-variant-specific.patch \
>             file://remove-ppc-tests-failing-build.patch \
> +           file://remove-ppc64-tests-failing-build.patch \
>             file://add-ptest.patch \
>             file://run-ptest \
>            "
> @@ -63,7 +64,7 @@ do_install_ptest() {
>      #
>      # The regression tests require scripts and data files that are not
>      # copied to the build directory.  They must be copied from the
> -    # source directory.
> +    # source directory.
>      saved_dir=$PWD
>      for parent_dir in ${S} ${B} ; do
>          cd $parent_dir
> --
> 1.9.1
> 



