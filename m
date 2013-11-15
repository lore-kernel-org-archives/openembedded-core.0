Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4981B6DA81
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 17:03:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Nov 2013 09:03:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="435923440"
Received: from unknown (HELO [10.255.15.61]) ([10.255.15.61])
	by orsmga002.jf.intel.com with ESMTP; 15 Nov 2013 09:03:28 -0800
Message-ID: <528653E0.4090908@linux.intel.com>
Date: Fri, 15 Nov 2013 09:03:28 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Zhong Hongbo <hongbo.zhong@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1384498379-30017-1-git-send-email-hongbo.zhong@windriver.com>
In-Reply-To: <1384498379-30017-1-git-send-email-hongbo.zhong@windriver.com>
Subject: Re: [V2 1/2] bluez4: Install the test script
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
X-List-Received-Date: Fri, 15 Nov 2013 17:03:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2013 10:52 PM, Zhong Hongbo wrote:
> From: Zhong Hongbo <hongbo.zhong@windriver.com>
>
> In defalut, the bluez-test script do not be installed in the rootfs.
> After the user enable ptest feature, it will be install.
>
I think these tests are not the same as ptest, I think these are more 
like testapps, so I am not sure using ptest as a PACKAGECONFIG is correct.

They could be packaged as testtools similar to bluez5 and installed with 
packagegroup-core-tools-testapps,

Sau!

> Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
> ---
>   .../bluez/bluez4-4.101/install-test-script.patch   |   42 ++++++++++++++++++++
>   meta/recipes-connectivity/bluez/bluez4_4.101.bb    |   13 +++++-
>   2 files changed, 54 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
>
> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
> new file mode 100644
> index 0000000..bd7f31d
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
> @@ -0,0 +1,42 @@
> +Upstream-Status: Inappropriate
> +
> +Install the test scripts to /usr/bin directory
> +
> +Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
> +---
> +diff -Nurd bluez-4.101.orig/configure.ac bluez-4.101/configure.ac
> +--- bluez-4.101.orig/configure.ac	2013-11-14 17:11:28.249903077 +0800
> ++++ bluez-4.101/configure.ac	2013-11-14 17:17:18.089902204 +0800
> +@@ -61,6 +61,11 @@
> + fi
> + AM_CONDITIONAL(SYSTEMD, test -n "${path_systemdunit}")
> +
> ++AC_ARG_WITH([bluez4testdir],
> ++    AS_HELP_STRING([--with-bluez4testdir=DIR], [bluez4 script test directory]),
> ++    [], [with_bluez4testdir=/usr/bin/])
> ++AC_SUBST([BLUEZ4_TEST_DIR], [$with_bluez4testdir])
> ++
> + AC_ARG_WITH([udevdir],
> +     AS_HELP_STRING([--with-udevdir=DIR], [udev directory]),
> +     [], [with_udevdir=/lib/udev/])
> +diff -Nurd bluez-4.101.orig/Makefile.tools bluez-4.101/Makefile.tools
> +--- bluez-4.101.orig/Makefile.tools	2013-11-14 17:11:28.237903079 +0800
> ++++ bluez-4.101/Makefile.tools	2013-11-14 17:18:11.577902071 +0800
> +@@ -227,6 +227,17 @@
> + 		test/service-spp.xml test/service-opp.xml test/service-ftp.xml \
> + 		test/simple-player test/test-nap
> +
> ++bluez4_testdir = @BLUEZ4_TEST_DIR@
> ++dist_bluez4_test_SCRIPTS = test/sap-client test/hsplay test/hsmicro \
> ++		test/monitor-bluetooth test/list-devices \
> ++		test/test-discovery test/test-manager test/test-adapter \
> ++		test/test-device test/test-service test/test-serial \
> ++		test/test-telephony test/test-network test/simple-agent \
> ++		test/simple-service test/simple-endpoint test/test-audio \
> ++		test/test-input test/test-sap-server test/test-oob \
> ++		test/test-attrib test/test-proximity test/test-thermometer \
> ++		test/test-serial-proxy test/test-health test/test-health-sink \
> ++		test/simple-player test/test-nap
> + if HIDD
> + bin_PROGRAMS += compat/hidd
> +
> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
> index d6c3e26..e61ba02 100644
> --- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
> +++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
> @@ -7,6 +7,7 @@ SRC_URI += "file://bluetooth.conf \
>               file://fix-udev-paths.patch \
>               file://obsolete_automake_macros.patch \
>               file://network-fix-network-Connect-method-parameters.patch \
> +            file://install-test-script.patch \
>   "
>
>   SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
> @@ -25,7 +26,7 @@ do_install_append() {
>   RDEPENDS_${PN}-dev = "bluez-hcidump"
>
>   ALLOW_EMPTY_libasound-module-bluez = "1"
> -PACKAGES =+ "libasound-module-bluez"
> +PACKAGES =+ "libasound-module-bluez ${PN}-test"
>
>   FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
>   FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
> @@ -34,6 +35,16 @@ FILES_${PN}-dev += "\
>     ${libdir}/alsa-lib/*.la \
>   "
>
> +RDEPENDS_${PN} += "${@base_contains('DISTRO_FEATURES', 'ptest', '${PN}-test', '', d)}"
> +FILES_${PN}-test += "\
> +  ${bindir}/test-* \
> +  ${bindir}/simple-* \
> +  ${bindir}/hsmicro \
> +  ${bindir}/hsplay \
> +  ${bindir}/list-devices \
> +  ${bindir}/monitor-bluetooth \
> +"
> +
>   FILES_${PN}-dbg += "\
>     ${libdir}/bluetooth/plugins/.debug \
>     ${libdir}/*/.debug \
>

