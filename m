Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B5F7571B58
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:18:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0GEIIeO018426
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 16 Jan 2017 06:18:18 -0800
Received: from server.local (128.224.21.24) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 16 Jan 2017 06:18:17 -0800
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1484574253-30817-1-git-send-email-ross.burton@intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <1d205c53-b69b-bfc7-19bf-bded349c4463@windriver.com>
Date: Mon, 16 Jan 2017 09:18:16 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1484574253-30817-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH 1/2] perf: use PACKAGECONFIG instead of hand-rolled logic
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
X-List-Received-Date: Mon, 16 Jan 2017 14:18:19 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-01-16 8:44 AM, Ross Burton wrote:
> PERF_FEATURES_ENABLE and perf_feature_enabled() was basically a poor man's clone
> of PACKAGECONFIG, without the automatic handling of dependencies and configure
> options.

I think some of the parts pre-dated packageconfig capabilities, but
yah, something that needed to get tossed in the bin.

>
> As part of the port to PACKAGECONFIG the options have been changed to remove the
> perf- prefix, but are otherwise unchanged.
>
> Also remove BUILDPERF_libc_uclibc assignment as nothing in the metadata uses a
> BUILDPERF variable.

I applied the patches here, and was able to build a perf in my standard
config.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Bruce

>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-kernel/perf/perf-features.inc | 22 ----------------------
>  meta/recipes-kernel/perf/perf.bb           | 26 +++++++++-----------------
>  2 files changed, 9 insertions(+), 39 deletions(-)
>  delete mode 100644 meta/recipes-kernel/perf/perf-features.inc
>
> diff --git a/meta/recipes-kernel/perf/perf-features.inc b/meta/recipes-kernel/perf/perf-features.inc
> deleted file mode 100644
> index a4402cc..0000000
> --- a/meta/recipes-kernel/perf/perf-features.inc
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
> -
> -def perf_feature_enabled(feature, trueval, falseval, d):
> -    """
> -    Check which perf features are enabled.
> -
> -    The PERF_FEATURES_ENABLE variable lists the perf features to
> -    enable.  Override it if you want something different from what's
> -    listed above, which is the default.  If empty, the build won't
> -    enable any features (which may be exactly what you want, just a
> -    barebones perf without any extra baggage, what you get if you
> -    specify an empty feature list).
> -
> -    Available perf features:
> -      perf-scripting: enable support for Perl and Python bindings
> -      perf-tui: enable support for the perf TUI (via libnewt)
> -
> -    """
> -    enabled_features = d.getVar("PERF_FEATURES_ENABLE") or ""
> -    if feature in enabled_features:
> -        return trueval
> -    return falseval
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index cfbe628..8b5028e 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -10,24 +10,21 @@ LICENSE = "GPLv2"
>
>  PR = "r9"
>
> -require perf-features.inc
> -
>  BUILDPERF_libc-uclibc = "no"
>
> +PACKAGECONFIG ??= "scripting tui"
> +PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python"
>  # gui support was added with kernel 3.6.35
>  # since 3.10 libnewt was replaced by slang
>  # to cover a wide range of kernel we add both dependencies
> -TUI_DEPENDS = "${@perf_feature_enabled('perf-tui', 'libnewt slang', '',d)}"
> -SCRIPTING_DEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl python', '',d)}"
> -LIBUNWIND_DEPENDS = "${@perf_feature_enabled('perf-libunwind', 'libunwind', '',d)}"
> +PACKAGECONFIG[tui] = ",NO_NEWT=1,libnewt slang"
> +PACKAGECONFIG[libunwind] = ",NO_LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1,libunwind"
> +PACKAGECONFIG[libnuma] = ",NO_LIBNUMA=1"
>
>  DEPENDS = " \
>      virtual/${MLPREFIX}libc \
>      ${MLPREFIX}elfutils \
>      ${MLPREFIX}binutils \
> -    ${TUI_DEPENDS} \
> -    ${SCRIPTING_DEPENDS} \
> -    ${LIBUNWIND_DEPENDS} \
>      bison flex xz \
>      xmlto-native \
>      asciidoc-native \
> @@ -61,11 +58,6 @@ inherit kernelsrc
>  B = "${WORKDIR}/${BPN}-${PV}"
>  SPDX_S = "${S}/tools/perf"
>
> -SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
> -TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
> -LIBUNWIND_DEFINES = "${@perf_feature_enabled('perf-libunwind', '', 'NO_LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1',d)}"
> -LIBNUMA_DEFINES = "${@perf_feature_enabled('perf-libnuma', '', 'NO_LIBNUMA=1',d)}"
> -
>  # The LDFLAGS is required or some old kernels fails due missing
>  # symbols and this is preferred than requiring patches to every old
>  # supported kernel.
> @@ -82,8 +74,8 @@ EXTRA_OEMAKE = '\
>      EXTRA_CFLAGS="-ldw" \
>      EXTRA_LDFLAGS="${PERF_EXTRA_LDFLAGS}" \
>      perfexecdir=${libexecdir} \
> -    NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${LIBUNWIND_DEFINES} \
> -    ${SCRIPTING_DEFINES} ${LIBNUMA_DEFINES} \
> +    NO_GTK2=1 NO_DWARF=1 \
> +    ${PACKAGECONFIG_CONFARGS} \
>  '
>
>  EXTRA_OEMAKE += "\
> @@ -116,7 +108,7 @@ do_install() {
>  	unset CFLAGS
>  	oe_runmake install
>  	# we are checking for this make target to be compatible with older perf versions
> -	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" ] && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'true', 'false', d)} && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
>  		oe_runmake DESTDIR=${D} install-python_ext
>  	fi
>  }
> @@ -225,7 +217,7 @@ RDEPENDS_${PN}-python =+ "bash python python-modules"
>  RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
>  RDEPENDS_${PN}-tests =+ "python"
>
> -RSUGGESTS_SCRIPTING = "${@perf_feature_enabled('perf-scripting', '${PN}-perl ${PN}-python', '',d)}"
> +RSUGGESTS_SCRIPTING = "${@bb.utils.contains('PACKAGECONFIG', 'scripting', '${PN}-perl ${PN}-python', '',d)}"
>  RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
>
>  #FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core /usr/lib64/traceevent ${libdir}/traceevent"
>


