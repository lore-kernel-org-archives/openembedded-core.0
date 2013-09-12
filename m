Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 09A776BE11
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 17:13:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Sep 2013 10:13:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,891,1371106800"; d="scan'208";a="402445093"
Received: from unknown (HELO [10.255.14.99]) ([10.255.14.99])
	by orsmga002.jf.intel.com with ESMTP; 12 Sep 2013 10:13:02 -0700
Message-ID: <5231F61D.1040200@linux.intel.com>
Date: Thu, 12 Sep 2013 10:13:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Stefan Seefeld <stefan@seefeld.name>
References: <1378948190-16620-1-git-send-email-stefan_seefeld@mentor.com>
	<1378948190-16620-2-git-send-email-stefan_seefeld@mentor.com>
In-Reply-To: <1378948190-16620-2-git-send-email-stefan_seefeld@mentor.com>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Enable ptest support for lttng.
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
X-List-Received-Date: Thu, 12 Sep 2013 17:13:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


The usual format for the commit summary is as follows:

lttng: Enable ptest support

Please see the Commit/Patch message guideline for details: 
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks
	Sau!

On 09/11/2013 06:09 PM, Stefan Seefeld wrote:
> Signed-off-by: Stefan Seefeld <stefan_seefeld@mentor.com>
> ---
>   meta/recipes-kernel/lttng/lttng-tools/run-ptest    |  4 ++
>   .../recipes-kernel/lttng/lttng-tools/runtest.patch | 52 ++++++++++++++++++++++
>   meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb     |  8 +++-
>   3 files changed, 62 insertions(+), 2 deletions(-)
>   create mode 100755 meta/recipes-kernel/lttng/lttng-tools/run-ptest
>   create mode 100644 meta/recipes-kernel/lttng/lttng-tools/runtest.patch
>
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/run-ptest b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
> new file mode 100755
> index 0000000..e758815
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +make -C tests installcheck
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/runtest.patch b/meta/recipes-kernel/lttng/lttng-tools/runtest.patch
> new file mode 100644
> index 0000000..545a5dc
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-tools/runtest.patch
> @@ -0,0 +1,52 @@
> +diff --git a/Makefile.am b/Makefile.am
> +index 584f59b..c2bcabd 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -12,3 +12,9 @@ dist_doc_DATA = LICENSE \
> + dist_noinst_DATA = CodingStyle
> +
> + EXTRA_DIST = extras/lttng-bash_completion gpl-2.0.txt lgpl-2.1.txt
> ++
> ++install-ptest:
> ++	cp -r $(srcdir)/tests $(DESTDIR)
> ++	for m in $$(find $(DESTDIR)/tests -name Makefile); do \
> ++          sed -i -e 's|^Makefile:|_Makefile:|' $$m; \
> ++        done
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index 6d5b00d..3774f9d 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -1,14 +1,17 @@
> + SUBDIRS = utils regression unit stress
> +
> +-if USE_PYTHON
> +-check-am:
> ++installcheck-am:
> + 	./run.sh unit_tests
> + 	./run.sh fast_regression
> ++if USE_PYTHON
> + 	./run.sh with_bindings_regression
> +-else
> ++endif
> ++
> + check-am:
> + 	./run.sh unit_tests
> + 	./run.sh fast_regression
> ++if USE_PYTHON
> ++	./run.sh with_bindings_regression
> + endif
> +
> + dist_noinst_SCRIPTS = run.sh unit_tests fast_regression long_regression root_regression with_bindings_regression
> +diff --git a/tests/run.sh b/tests/run.sh
> +index c6c50fd..6455359 100755
> +--- a/tests/run.sh
> ++++ b/tests/run.sh
> +@@ -19,4 +19,7 @@
> +
> + [ -z "$1" ] && echo "Error: No testlist. Please specify a testlist to run." && exit 1
> +
> +-prove --merge --exec '' - < $1
> ++prove --merge -v --exec '' - < $1 | sed \
> ++  -e 's|^ok \(.*\)|PASS: \1|' \
> ++  -e 's|^not ok \(.*\)|FAIL: \1|' \
> ++  | egrep -h 'PASS|FAIL'
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
> index 2e0ee15..4322027 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
> @@ -10,15 +10,19 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
>                       file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
>
>   DEPENDS = "liburcu popt lttng-ust"
> +RDEPENDS_${PN}-ptest += "make"
>
>   SRCREV = "c9dc1289e040c542f96fbfd558267786816d5703"
>   PV = "v2.3.0"
>
> -SRC_URI = "git://git.lttng.org/lttng-tools.git"
> +SRC_URI = "git://git.lttng.org/lttng-tools.git \
> +           file://runtest.patch \
> +           file://run-ptest \
> +	  "
>
>   S = "${WORKDIR}/git"
>
> -inherit autotools
> +inherit autotools ptest
>
>   export KERNELDIR="${STAGING_KERNEL_DIR}"
>
>

