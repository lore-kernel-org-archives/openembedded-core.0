Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UK4CT-0008Jk-BO
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 11:00:38 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Mar 2013 02:41:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,904,1355126400"; d="scan'208";a="307007445"
Received: from unknown (HELO helios.localnet) ([10.255.13.190])
	by orsmga002.jf.intel.com with ESMTP; 25 Mar 2013 02:43:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Mon, 25 Mar 2013 09:43:20 +0000
Message-ID: <104941556.xik0AZR0dJ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <1364203928-32746-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1364203928-32746-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] powertop: add 2.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Mar 2013 10:00:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 25 March 2013 10:32:08 Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  .../stub_out_the_ncurses_calls_in_dump_mode.patch  | 33 -----------------
>  meta/recipes-kernel/powertop/powertop_1.13.bb      | 41
> ---------------------- meta/recipes-kernel/powertop/powertop_2.3.bb       |
> 12 +++++++
>  3 files changed, 12 insertions(+), 74 deletions(-)
>  delete mode 100644
> meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_du
> mp_mode.patch delete mode 100644
> meta/recipes-kernel/powertop/powertop_1.13.bb
>  create mode 100644 meta/recipes-kernel/powertop/powertop_2.3.bb
> 
> diff --git
> a/meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_
> dump_mode.patch
> b/meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_
> dump_mode.patch deleted file mode 100644
> index ae4cf5d..0000000
> ---
> a/meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_
> dump_mode.patch +++ /dev/null
> @@ -1,33 +0,0 @@
> -Upstream-Status: Inappropriate [this patch is 1.13 specific and 2.0 will be
> coming.] -
> -Running PowerTop in Poky in dump mode (with --dump) always ends with a
> -segmentation fault.
> -
> -The cause is: in dump mode, setup_windows() is not invoked so the
> -*_window variables, like cstate_window, are still NULL; later in
> -main() -> show_cstates(), the functions, like wrefresh(), will trigger
> -segfault.
> -
> -After discussing in PowerTop mailling list, I think the right solution is
> -we should stub out the ncurses calls in dump mode.
> -
> -(The patch was also sent to upstream PowerTop mailling list.)
> -
> -Signed-off-by Dexuan Cui <dexuan.cui@intel.com>, 2010-08-20
> -(this patch is licensed under GPLv2)
> -
> ---- a/display.c
> -+++ b/display.c
> -@@ -44,6 +44,12 @@
> - static WINDOW *status_bar_window;
> -
> - #define print(win, y, x, fmt, args...) do { if (dump) printf(fmt, ##
> args); else mvwprintw(win, y, x, fmt, ## args); } while (0) -+#define
> wattrset(win, c) do { if (!dump ) wattrset(win, c); } while (0) -+#define
> wbkgd(win, c) do { if (!dump ) wbkgd(win, c); } while (0) -+#define
> werase(win) do { if (!dump ) werase(win); } while (0)
> -+#define wrefresh(win) do { if (!dump ) wrefresh(win); } while (0)
> -+#define wattron(win, a) do { if (!dump ) wattron(win, a); } while (0)
> -+#define wattroff(win, a) do { if (!dump ) wattroff(win, a); } while (0)
> -
> - char status_bar_slots[10][40];
> -
> diff --git a/meta/recipes-kernel/powertop/powertop_1.13.bb
> b/meta/recipes-kernel/powertop/powertop_1.13.bb deleted file mode 100644
> index db54ed0..0000000
> --- a/meta/recipes-kernel/powertop/powertop_1.13.bb
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -SUMMARY = "Power usage tool"
> -DESCRIPTION = "PowerTOP, a tool that helps you find what software is using
> the most power." -HOMEPAGE = "http://www.lesswatts.org/"
> -BUGTRACKER = "http://bugzilla.lesswatts.org/"
> -
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> -
> -DEPENDS = "virtual/libintl ncurses"
> -
> -# powertop 1.13 needs lspci
> -RDEPENDS_${PN} = "pciutils"
> -
> -PR = "r4"
> -
> -SRC_URI =
> "http://www.lesswatts.org/projects/powertop/download/powertop-${PV}.tar.gz
> \ -           file://stub_out_the_ncurses_calls_in_dump_mode.patch \ -     
>     "
> -
> -SRC_URI[md5sum] = "78aa17c8f55178004223bf236654298e"
> -SRC_URI[sha256sum] =
> "2bc866089496877dd26d2d316ad5763ab8ecb5e28aefba44bc5d355dcdc58d98" -
> -CFLAGS += "${LDFLAGS}"
> -EXTRA_OEMAKE = "VERSION=\"${PV}\" EXTRA_LIBS=${EXTRA_LIBS}"
> -
> -EXTRA_LIBS_libc-uclibc = "-lintl"
> -
> -do_configure() {
> -	# We do not build ncurses with wide char support
> -	sed -i -e 's:lncursesw:lncurses ${EXTRA_LIBS}:g' ${S}/Makefile
> -}
> -
> -do_install() {
> -	oe_runmake install DESTDIR=${D}
> -}
> -
> -inherit update-alternatives
> -ALTERNATIVE_${PN} = "powertop"
> -ALTERNATIVE_TARGET[powertop] = "${bindir}/powertop"
> -ALTERNATIVE_LINK_NAME[powertop] = "${base_bindir}/powertop"
> -ALTERNATIVE_PRIORITY = "100"
> diff --git a/meta/recipes-kernel/powertop/powertop_2.3.bb
> b/meta/recipes-kernel/powertop/powertop_2.3.bb new file mode 100644
> index 0000000..c289ac6
> --- /dev/null
> +++ b/meta/recipes-kernel/powertop/powertop_2.3.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Linux tool to diagnose issues with power consumption and
> power management." +HOMEPAGE = "http://01.org/powertop/"
> +DEPENDS = "ncurses virtual/gettext libnl pciutils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
> +
> +SRC_URI =
> "http://01.org/powertop/sites/default/files/downloads/powertop-${PV}.tar.gz
> " +
> +SRC_URI[md5sum] = "dc03608f20e56cdc99d121a6191556f6"
> +SRC_URI[sha256sum] =
> "b8c1add69afee28c77dca56fdcedb4a46820f3a71c86aae7891b0c5c595cd744" +
> +inherit autotools

Ah, your version misses out quite a few things from the older recipe 
(alternatives, uclibc compatibility, etc.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


