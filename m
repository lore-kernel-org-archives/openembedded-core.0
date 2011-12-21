Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RdCqy-0002fR-Rg
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 04:28:29 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Dec 2011 19:21:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104479200"
Received: from unknown (HELO envy.home) ([10.255.12.104])
	by fmsmga002.fm.intel.com with ESMTP; 20 Dec 2011 19:21:22 -0800
Message-ID: <4EF150A1.60404@linux.intel.com>
Date: Tue, 20 Dec 2011 19:21:05 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324121806.git.otavio@ossystems.com.br>
	<20d7007632dde53f3a868e8374a45619319213c2.1324121807.git.otavio@ossystems.com.br>
In-Reply-To: <20d7007632dde53f3a868e8374a45619319213c2.1324121807.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH 1/1] connman: disable 'alg-test' building
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Dec 2011 03:28:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I just refreshed poky master with this patch included and now see the
following building core-image-sato:

| checking for dbus_connection_can_send_type in -ldbus-1... yes
| checking for XTABLES... yes
| checking for GNUTLS... yes
| checking linux/if_alg.h usability... no
| checking linux/if_alg.h presence... no
| checking for linux/if_alg.h... no
| configure: error: User-space algorithm header files are required
| ERROR: oe_runconf failed
NOTE: package connman-0.78-r6: task do_configure: Failed

Reverting this patch allows the build to complete.

(I understand this is poky related and not oe-core, but as the context
for this patch is here, I opted to continue the discussion here.)

--
Darren

On 12/17/2011 03:36 AM, Otavio Salvador wrote:
> 'alg-test' requires 'linux/if_alg.h' header enforcing a dependency on
> linux-libc-headers 2.6.39 or newer.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-connectivity/connman/connman.inc      |    8 ---
>  .../connman/connman/disable_alg-test.patch         |   46 ++++++++++++++++++++
>  meta/recipes-connectivity/connman/connman_0.78.bb  |    3 +-
>  3 files changed, 48 insertions(+), 9 deletions(-)
>  create mode 100644 meta/recipes-connectivity/connman/connman/disable_alg-test.patch
> 
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index bb1b279..d1bf7cd 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -49,14 +49,6 @@ USERADD_PARAM_${PN} = "--system --no-create-home \
>  
>  inherit autotools pkgconfig update-rc.d useradd
>  
> -# alg-test doesn't build, so disable that and test
> -# for if_alg.h as this header is only in 2.6.39
> -do_configure_prepend() {
> -	sed -i 's:tools/alg-test ::g' Makefile.am
> -	sed -i 's:AC_CHECK_HEADERS(linux/if_alg.h, dummy=yes,::g;
> -	        s:AC_MSG_ERROR(User-space algorithm header files are required))::g' configure.ac
> -}
> -
>  do_compile_append() {
>  	sed -i -e s:deny:allow:g src/connman-dbus.conf
>  }
> diff --git a/meta/recipes-connectivity/connman/connman/disable_alg-test.patch b/meta/recipes-connectivity/connman/connman/disable_alg-test.patch
> new file mode 100644
> index 0000000..c231d75
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/disable_alg-test.patch
> @@ -0,0 +1,46 @@
> +From b9a20c8eb61b600ced284646a1bea588fdd8a5ea Mon Sep 17 00:00:00 2001
> +From: Otavio Salvador <otavio@ossystems.com.br>
> +Date: Fri, 16 Dec 2011 19:31:59 -0200
> +Subject: [PATCH] Disable building of alg-test
> +
> +alg-test utility depends on linux/if_alg.h header that is only
> +available on kernels >= 2.6.39.
> +
> +Upstream Status: Inappropriate [configuration]
> +
> +Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> +---
> + Makefile.am  |    2 +-
> + configure.ac |    3 ---
> + 2 files changed, 1 insertions(+), 4 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index d5a76f9..d42a766 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -144,7 +144,7 @@ noinst_PROGRAMS += tools/wispr tools/supplicant-test \
> + 			tools/dbus-test tools/polkit-test \
> + 			tools/iptables-test tools/tap-test tools/wpad-test \
> + 			tools/stats-tool tools/private-network-test \
> +-			tools/alg-test unit/test-session
> ++			unit/test-session
> + 
> + tools_wispr_SOURCES = $(gweb_sources) tools/wispr.c
> + tools_wispr_LDADD = @GLIB_LIBS@ @GNUTLS_LIBS@ -lresolv
> +diff --git a/configure.ac b/configure.ac
> +index f63fea8..67bfe85 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -437,9 +437,6 @@ if (test "${enable_tools}" = "yes"); then
> + 				AC_MSG_ERROR(GnuTLS library is required))
> + 	AC_SUBST(GNUTLS_CFLAGS)
> + 	AC_SUBST(GNUTLS_LIBS)
> +-
> +-	AC_CHECK_HEADERS(linux/if_alg.h, dummy=yes,
> +-		AC_MSG_ERROR(User-space algorithm header files are required))
> + fi
> + AM_CONDITIONAL(TOOLS, test "${enable_tools}" = "yes")
> + 
> +-- 
> +1.7.7.3
> +
> diff --git a/meta/recipes-connectivity/connman/connman_0.78.bb b/meta/recipes-connectivity/connman/connman_0.78.bb
> index 74c102b..c73cad9 100644
> --- a/meta/recipes-connectivity/connman/connman_0.78.bb
> +++ b/meta/recipes-connectivity/connman/connman_0.78.bb
> @@ -1,11 +1,12 @@
>  require connman.inc
>  
> -PR = "r5"
> +PR = "r6"
>  
>  # 0.78 tag
>  SRCREV = "02f5d5fe2d7c71514a6387ba2b772b42d8e8d297"
>  SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
>              file://add_xuser_dbus_permission.patch \
>              file://ethernet_default.patch \
> +            file://disable_alg-test.patch \
>              file://connman"
>  S = "${WORKDIR}/git"

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


