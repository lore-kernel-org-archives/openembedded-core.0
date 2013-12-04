Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BE6F06D915
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 10:51:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB4AooAr021327; Wed, 4 Dec 2013 10:50:50 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W6BTCyakqJko; Wed,  4 Dec 2013 10:50:50 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB4AolZa021314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 4 Dec 2013 10:50:49 GMT
Message-ID: <1386154242.4463.152.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tudor Florea <tudor.florea@enea.com>
Date: Wed, 04 Dec 2013 10:50:42 +0000
In-Reply-To: <1386110965-24404-1-git-send-email-tudor.florea@enea.com>
References: <1386110965-24404-1-git-send-email-tudor.florea@enea.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ethtool: use serial-tests to generate targets used by ptest.
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
X-List-Received-Date: Wed, 04 Dec 2013 10:51:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-12-03 at 23:49 +0100, Tudor Florea wrote:
> buildtest-TESTS and runtest-TESTS targets are required by ptest.
> In order to have those targets in automake 1.13.4 serial-tests
> should be specified since parallel-tests is assumed by default
> and serial-tests is optional.
> 
> 
> Signed-off-by: Tudor Florea <tudor.florea@enea.com>
> ---
>  .../ethtool/ethtool-3.12.1/use_serial_tests.patch  |   20 ++++++++++++++++++++
>  meta/recipes-extended/ethtool/ethtool_3.12.1.bb    |    6 ++++--
>  2 files changed, 24 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-extended/ethtool/ethtool-3.12.1/use_serial_tests.patch

This patch and the others imply we're going to have to patch every
autoconf recipe to add serial-tests?

Could we change the default in automake instead?

Cheers,

Richard

> diff --git a/meta/recipes-extended/ethtool/ethtool-3.12.1/use_serial_tests.patch b/meta/recipes-extended/ethtool/ethtool-3.12.1/use_serial_tests.patch
> new file mode 100644
> index 0000000..e036edc
> --- /dev/null
> +++ b/meta/recipes-extended/ethtool/ethtool-3.12.1/use_serial_tests.patch
> @@ -0,0 +1,20 @@
> +ptest needs buildtest-TESTS and runtest-TESTS targets.
> +serial-tests is required to generate those targets.
> +
> +Signed-off-by: Tudor Florea <tudor.florea@enea.com>
> +Upstream-Status: Inappropriate 
> +(default automake behavior incompatible with ptest) 
> +
> +diff -ruN a/configure.ac b/configure.ac
> +--- a/configure.ac	2013-12-03 10:37:40.773157142 +0100
> ++++ b/configure.ac	2013-12-03 10:37:21.521992831 +0100
> +@@ -2,7 +2,7 @@
> + AC_INIT(ethtool, 3.12.1, netdev@vger.kernel.org)
> + AC_PREREQ(2.52)
> + AC_CONFIG_SRCDIR([ethtool.c])
> +-AM_INIT_AUTOMAKE([gnu])
> ++AM_INIT_AUTOMAKE([gnu serial-tests])
> + AC_CONFIG_HEADERS([ethtool-config.h])
> + 
> + AM_MAINTAINER_MODE
> diff --git a/meta/recipes-extended/ethtool/ethtool_3.12.1.bb b/meta/recipes-extended/ethtool/ethtool_3.12.1.bb
> index 6615009..5e7559c 100644
> --- a/meta/recipes-extended/ethtool/ethtool_3.12.1.bb
> +++ b/meta/recipes-extended/ethtool/ethtool_3.12.1.bb
> @@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>                      file://ethtool.c;beginline=4;endline=17;md5=c19b30548c582577fc6b443626fc1216"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
> -           file://run-ptest"
> +           file://run-ptest \
> +           file://use_serial_tests.patch \
> +          "
>  
>  SRC_URI[md5sum] = "5a1058efe8eb4f3473f5028967729078"
>  SRC_URI[sha256sum] = "45190d70e5ce1b4d87def4f71fb5bf04f8a4f4dc5f9e0f38c49c16c462fb59d9"
> @@ -16,7 +18,7 @@ inherit autotools ptest
>  RDEPENDS_${PN}-ptest += "make"
>  
>  do_compile_ptest() {
> -   oe_runmake test-cmdline test-features
> +   oe_runmake buildtest-TESTS
>  }
>  
>  do_install_ptest () {



