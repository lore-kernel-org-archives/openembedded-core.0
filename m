Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QhqsJ-0006aI-AR
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 00:28:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Jul 2011 15:24:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,210,1309762800"; d="scan'208";a="28248083"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 15 Jul 2011 15:24:44 -0700
Message-ID: <4E20BE2C.3060103@linux.intel.com>
Date: Fri, 15 Jul 2011 15:24:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1310758615.git.tom_rini@mentor.com>
	<c7276dd332ad9e38935443d679c0296a032a511c.1310758615.git.tom_rini@mentor.com>
In-Reply-To: <c7276dd332ad9e38935443d679c0296a032a511c.1310758615.git.tom_rini@mentor.com>
Subject: Re: [PATCH 3/5] help2man-native: Add 1.36.4 (GPLv2) and 1.38.2 (GPLv3)
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
X-List-Received-Date: Fri, 15 Jul 2011 22:28:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2011 03:03 PM, Tom Rini wrote:
> These are 'side ports' of current oe.dev versions.  PR is kept in sync
> but we drop out the target recipes in order to punt on potential perl
> problems.
>
> Signed-off-by: Tom Rini<tom_rini@mentor.com>
> ---
>   .../help2man/help2man-native_1.36.4.bb             |   26 ++++++++++++++++++++
>   .../help2man/help2man-native_1.38.2.bb             |   24 ++++++++++++++++++
>   2 files changed, 50 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-devtools/help2man/help2man-native_1.36.4.bb
>   create mode 100644 meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
>

Why do we need both versions?  Can't we just use the most current?

Sau!

> diff --git a/meta/recipes-devtools/help2man/help2man-native_1.36.4.bb b/meta/recipes-devtools/help2man/help2man-native_1.36.4.bb
> new file mode 100644
> index 0000000..b2c6608
> --- /dev/null
> +++ b/meta/recipes-devtools/help2man/help2man-native_1.36.4.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "GNU utility to convert program --help output to a man page"
> +HOMEPAGE    = "http://www.gnu.org/software/help2man"
> +SECTION     = "console/utils"
> +LICENSE     = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +DEPENDS     = "autoconf-native automake-native"
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
> +SRC_URI[md5sum] = "d31a0a38c2ec71faa06723f6b8bd3076"
> +SRC_URI[sha256sum] = "a4adadf76b496a6bc50795702253ecfcb6f0d159b68038f31a5362009340bca2"
> +
> +inherit autotools native
> +
> +PR = "r5"
> +
> +# We don't want to reconfigure things
> +do_configure() {
> +	oe_runconf
> +}
> +
> +do_install_append () {
> +	# Make sure we use /usr/bin/env perl
> +	sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${D}${bindir}/help2man
> +}
> diff --git a/meta/recipes-devtools/help2man/help2man-native_1.38.2.bb b/meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
> new file mode 100644
> index 0000000..5612eda
> --- /dev/null
> +++ b/meta/recipes-devtools/help2man/help2man-native_1.38.2.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "Program to create simple man pages"
> +SECTION = "devel"
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +DEPENDS = "autoconf-native automake-native"
> +PR = "r2"
> +
> +SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
> +SRC_URI[md5sum] = "426671c6fe79e5ef2233303367eab5a6"
> +SRC_URI[sha256sum] = "952c29561bce8b233aa10af7f0e0c79c8243712810bf8ddf01e6efd82ce250d1"
> +
> +inherit autotools native
> +
> +EXTRA_OECONF = "--disable-nls"
> +
> +# We don't want to reconfigure things
> +do_configure() {
> +	oe_runconf
> +}
> +
> +do_install_append () {
> +	# Make sure we use /usr/bin/env perl
> +	sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${D}${bindir}/help2man
> +}


