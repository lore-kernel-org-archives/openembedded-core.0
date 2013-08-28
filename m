Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 783256B180
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 15:24:39 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Aug 2013 08:24:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,976,1367996400"; d="scan'208";a="287895029"
Received: from unknown (HELO [10.255.14.210]) ([10.255.14.210])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Aug 2013 08:24:34 -0700
Message-ID: <521E1632.1070905@linux.intel.com>
Date: Wed, 28 Aug 2013 08:24:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: rongqing.li@windriver.com
References: <1377682094-2565-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1377682094-2565-1-git-send-email-rongqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: add ptest
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
X-List-Received-Date: Wed, 28 Aug 2013 15:24:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/28/2013 02:28 AM, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-core/systemd/systemd/run-ptest |    2 ++
>   meta/recipes-core/systemd/systemd_204.bb    |   16 +++++++++++++++-

We are at 206 in master now, so this will need to be rebased!  Please 
verify against master before sending patches.

Thanks
	Sau!

>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-core/systemd/systemd/run-ptest
>
> diff --git a/meta/recipes-core/systemd/systemd/run-ptest b/meta/recipes-core/systemd/systemd/run-ptest
> new file mode 100644
> index 0000000..0418bc9
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/run-ptest
> @@ -0,0 +1,2 @@
> +make test/rules-test.sh.log
> +make test/udev-test.pl.log
> diff --git a/meta/recipes-core/systemd/systemd_204.bb b/meta/recipes-core/systemd/systemd_204.bb
> index 6261367..6563c3e 100644
> --- a/meta/recipes-core/systemd/systemd_204.bb
> +++ b/meta/recipes-core/systemd/systemd_204.bb
> @@ -15,7 +15,7 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
>   SECTION = "base/shell"
>
> -inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu
> +inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu ptest
>
>   SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
>              file://touchscreen.rules \
> @@ -24,6 +24,7 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
>              file://install-quotaon-once.patch \
>              file://00-create-volatile.conf \
>              file://init \
> +           file://run-ptest \
>             "
>   SRC_URI[md5sum] = "a07619bb19f48164fbf0761d12fd39a8"
>   SRC_URI[sha256sum] = "072c393503c7c1e55ca7acf3db659cbd28c7fe5fa94fab3db95360bafd96731b"
> @@ -114,6 +115,19 @@ do_install() {
>   	fi
>   }
>
> +do_install_ptest () {
> +	install -d ${D}${PTEST_PATH}/test
> +	install -d ${D}${libdir}/udev/rules.d
> +	install ${B}/test/* ${D}${PTEST_PATH}/test
> +	install -m 0755  ${B}/test-udev ${D}${PTEST_PATH}/
> +	install -d ${D}${PTEST_PATH}/build-aux
> +	cp -rf ${B}/rules ${D}${PTEST_PATH}/
> +	cp ${B}/Makefile ${D}${PTEST_PATH}/
> +	cp ${B}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
> +	tar -C ${D}${PTEST_PATH}/test -xJf ${B}/test/sys.tar.xz
> +	sed -i 's/"tree"/"ls"/' ${D}${PTEST_PATH}/test/udev-test.pl
> +}
> +
>   python populate_packages_prepend (){
>       systemdlibdir = d.getVar("rootlibdir", True)
>       do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
>

