Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4476B6D815
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 02:04:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Dec 2013 18:04:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,868,1378882800"; d="scan'208";a="448029403"
Received: from unknown (HELO [10.255.15.207]) ([10.255.15.207])
	by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2013 18:04:21 -0800
Message-ID: <52A7C825.8030209@linux.intel.com>
Date: Tue, 10 Dec 2013 18:04:21 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: hongbo zhong <hongbo.zhong@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1384852740-28508-1-git-send-email-hongbo.zhong@windriver.com>
In-Reply-To: <1384852740-28508-1-git-send-email-hongbo.zhong@windriver.com>
Subject: Re: [V3 1/2] bluez4: Install the test script
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
X-List-Received-Date: Wed, 11 Dec 2013 02:04:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/2013 01:18 AM, hongbo zhong wrote:
> From: Zhong Hongbo <hongbo.zhong@windriver.com>
>
> Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
> ---
>   .../bluez/bluez4-4.101/install-test-script.patch   |   26 ++++++++++++++++++++
>   meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    6 ++++-
>   2 files changed, 31 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
>
> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
> new file mode 100644
> index 0000000..23f7d99
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.patch
> @@ -0,0 +1,26 @@
> +Upstream-Status: Inappropriate
> +
> +Install the bluez's test scripts
> +
> +Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
> +diff -Nurd bluez-4.101.orig/Makefile.tools bluez-4.101/Makefile.tools
> +--- bluez-4.101.orig/Makefile.tools	2013-11-19 15:49:07.688838000 +0800
> ++++ bluez-4.101/Makefile.tools	2013-11-19 15:50:09.256837848 +0800
> +@@ -227,6 +227,17 @@
> + 		test/service-spp.xml test/service-opp.xml test/service-ftp.xml \
> + 		test/simple-player test/test-nap
> +
> ++bluez4_testdir = $(libdir)/bluez4/test/
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
> index d6c3e26..7127619 100644
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
> @@ -23,9 +24,10 @@ do_install_append() {
>   }
>
>   RDEPENDS_${PN}-dev = "bluez-hcidump"
> +RDEPENDS_${PN}-testtools += "python python-dbus python-pygobject"
>
>   ALLOW_EMPTY_libasound-module-bluez = "1"
> -PACKAGES =+ "libasound-module-bluez"
> +PACKAGES =+ "libasound-module-bluez ${PN}-testtools"
>

I am not sure this will do the right thing, have you verified that the 
testtools packages actually gets populated?  I ask since this line will 
add ${PN}-testtools after ${PN} and unless you excplictly override 
FILES_${PN}, it will greedily grab the ${libdir}/${BPN}/* files which in 
this case includes the test directory listed below.

Sau!

>   FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
>   FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
> @@ -34,6 +36,8 @@ FILES_${PN}-dev += "\
>     ${libdir}/alsa-lib/*.la \
>   "
>
> +FILES_${PN}-testtools = "${libdir}/bluez4/test/*"
> +
>   FILES_${PN}-dbg += "\
>     ${libdir}/bluetooth/plugins/.debug \
>     ${libdir}/*/.debug \
>

