Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 32C076BA7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 09:15:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7S9FKCB008936
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 02:15:20 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 28 Aug 2013 02:15:18 -0700
Message-ID: <521DBFBB.1040807@windriver.com>
Date: Wed, 28 Aug 2013 17:15:39 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1377679158-29124-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1377679158-29124-1-git-send-email-rongqing.li@windriver.com>
X-Originating-IP: [128.224.162.233]
Subject: Re: [PATCH] systemd: add ptest
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
X-List-Received-Date: Wed, 28 Aug 2013 09:15:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/28/2013 04:39 PM, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-core/systemd/systemd/run-ptest |    2 ++
>   meta/recipes-core/systemd/systemd_204.bb    |   18 +++++++++++++++++-
>   2 files changed, 19 insertions(+), 1 deletion(-)
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
> index 6261367..0242a0d 100644
> --- a/meta/recipes-core/systemd/systemd_204.bb
> +++ b/meta/recipes-core/systemd/systemd_204.bb
> @@ -13,9 +13,11 @@ PE = "1"
>   DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
>   DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>   
> +DISTRO_FEATURES += " ptest"
> +
I think the above two lines are not needed.

Cheers,
Chen Qi

>   SECTION = "base/shell"
>   
> -inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu
> +inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu ptest
>   
>   SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
>              file://touchscreen.rules \
> @@ -24,6 +26,7 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
>              file://install-quotaon-once.patch \
>              file://00-create-volatile.conf \
>              file://init \
> +           file://run-ptest \
>             "
>   SRC_URI[md5sum] = "a07619bb19f48164fbf0761d12fd39a8"
>   SRC_URI[sha256sum] = "072c393503c7c1e55ca7acf3db659cbd28c7fe5fa94fab3db95360bafd96731b"
> @@ -114,6 +117,19 @@ do_install() {
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


