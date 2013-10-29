Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6516D383
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 15:58:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Oct 2013 08:55:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="426543456"
Received: from unknown (HELO [10.255.12.29]) ([10.255.12.29])
	by orsmga002.jf.intel.com with ESMTP; 29 Oct 2013 08:58:50 -0700
Message-ID: <526FDB3A.8010107@linux.intel.com>
Date: Tue, 29 Oct 2013 08:58:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Cristiana Voicu <cristiana.voicu@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1382601179.git.cristiana.voicu@intel.com>
	<76cd2b0bab287a7e6d97dafddff8939eb9214793.1382601179.git.cristiana.voicu@intel.com>
In-Reply-To: <76cd2b0bab287a7e6d97dafddff8939eb9214793.1382601179.git.cristiana.voicu@intel.com>
Subject: Re: [PATCH 1/4] liburcu: upgrade to 0.8.0
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
X-List-Received-Date: Tue, 29 Oct 2013 15:58:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/2013 01:01 AM, Cristiana Voicu wrote:
> Fix case where ${B} != ${S}; add patch to allow out
> of tree doc exemples build to work
> Add patch to remove CC=gcc when CC is defined, in order to
> use the cross compiler.
>
> Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
> ---
>   meta/recipes-support/liburcu/files/fixCCflag.patch |   18 ++++++++++++++++++
>   .../liburcu/files/fixsepbuild.patch                |   18 ++++++++++++++++++
>   .../liburcu/{liburcu_0.7.7.bb => liburcu_0.8.0.bb} |    8 +++++---
>   3 files changed, 41 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-support/liburcu/files/fixCCflag.patch
>   create mode 100644 meta/recipes-support/liburcu/files/fixsepbuild.patch
>   rename meta/recipes-support/liburcu/{liburcu_0.7.7.bb => liburcu_0.8.0.bb} (74%)
>
> diff --git a/meta/recipes-support/liburcu/files/fixCCflag.patch b/meta/recipes-support/liburcu/files/fixCCflag.patch
> new file mode 100644
> index 0000000..d6928c6
> --- /dev/null
> +++ b/meta/recipes-support/liburcu/files/fixCCflag.patch
> @@ -0,0 +1,18 @@
> +Use cross compiler for doc exemples too
> +
> +10/23/2013 -  created by Cristiana Voicu <cristiana.voicu@intel.com>
> +
This is kind of OK, but really should be Signed-off-by: instead

No Upstream-Status in this patch

> +Index: userspace-rcu-0.8.0/doc/examples/Makefile.examples.template
> +===================================================================
> +--- userspace-rcu-0.8.0.orig/doc/examples/Makefile.examples.template	2013-08-30 21:25:20.000000000 +0300
> ++++ userspace-rcu-0.8.0/doc/examples/Makefile.examples.template	2013-10-23 13:34:30.405550556 +0300
> +@@ -11,7 +11,9 @@
> + #
> + # This makefile is purposefully kept simple to support GNU and BSD make.
> +
> ++ifndef CC
> + CC = gcc
> ++endif
> + CFLAGS = -g -O2 -Wall
> +
> + all: $(BINARY)
> diff --git a/meta/recipes-support/liburcu/files/fixsepbuild.patch b/meta/recipes-support/liburcu/files/fixsepbuild.patch
> new file mode 100644
> index 0000000..0e2fee9
> --- /dev/null
> +++ b/meta/recipes-support/liburcu/files/fixsepbuild.patch
> @@ -0,0 +1,18 @@
> +Upstream-Status: Pending
> +
> +Fix out of tree build for doc examples
> +10/22/2013 - created by Cristiana Voicu <cristiana.voicu@intel.com>
> +
Same here really should be Signed-off-by

> +Index: userspace-rcu-0.8.0/doc/examples/Makefile.am
> +===================================================================
> +--- userspace-rcu-0.8.0.orig/doc/examples/Makefile.am	2013-08-30 21:25:20.000000000 +0300
> ++++ userspace-rcu-0.8.0/doc/examples/Makefile.am	2013-10-21 17:52:34.774597179 +0300
> +@@ -128,7 +128,7 @@
> + 			cp -fR $(srcdir)/$$subdir $(builddir); \
> + 		done; \
> + 	fi
> +-	$(MAKE) -f dist-files/Makefile AM_CPPFLAGS="$(CPPFLAGS) -I../../../urcu/ -I../../../" AM_CFLAGS='$(CFLAGS)' AM_LDFLAGS='$(LDFLAGS) -L../../../.libs/ -Wl,-rpath="$(PWD)/../../.libs/"' $(AM_MAKEFLAGS) all
> ++	$(MAKE) -f dist-files/Makefile AM_CPPFLAGS="$(CPPFLAGS) -I$(top_srcdir) -I../../../urcu/ -I../../../" AM_CFLAGS='$(CFLAGS)' AM_LDFLAGS='$(LDFLAGS) -L../../../.libs/ -Wl,-rpath="$(PWD)/../../.libs/"' $(AM_MAKEFLAGS) all
> +
> + clean-local:
> + 	$(MAKE) -f dist-files/Makefile $(AM_MAKEFLAGS) clean
> diff --git a/meta/recipes-support/liburcu/liburcu_0.7.7.bb b/meta/recipes-support/liburcu/liburcu_0.8.0.bb
> similarity index 74%
> rename from meta/recipes-support/liburcu/liburcu_0.7.7.bb
> rename to meta/recipes-support/liburcu/liburcu_0.8.0.bb
> index a75e92e..0bb4545 100644
> --- a/meta/recipes-support/liburcu/liburcu_0.7.7.bb
> +++ b/meta/recipes-support/liburcu/liburcu_0.8.0.bb
> @@ -7,10 +7,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3 \
>                       file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
>                       file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
>
> -SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
> +SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
> +           file://fixsepbuild.patch \
> +           file://fixCCflag.patch"
>
> -SRC_URI[md5sum] = "d14de3ff32eb1ab9424b258599c8a6f3"
> -SRC_URI[sha256sum] = "8ab8a7d8fea47c09ceac24c9277f00da626bbd9426c973eb325b1baf33b4bdfb"
> +SRC_URI[md5sum] = "ddf193131b9f172c8f540b60d9d339f4"
> +SRC_URI[sha256sum] = "49fbe70af47945037f437931c9539bfb9cb03ba28b813649ea7394dbdca70658"
>
>   S = "${WORKDIR}/userspace-rcu-${PV}"
>   CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
>

