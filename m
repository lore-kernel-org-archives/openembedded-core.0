Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 30D3C6E608
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 18:36:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Jul 2014 11:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,686,1400050800"; d="scan'208";a="571968784"
Received: from unknown (HELO [10.255.13.17]) ([10.255.13.17])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jul 2014 11:36:26 -0700
Message-ID: <53C96929.1050504@linux.intel.com>
Date: Fri, 18 Jul 2014 11:36:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Valentin Popa <valentin.popa@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1405411250-10594-2-git-send-email-valentin.popa@intel.com>
	<1405692407-17792-1-git-send-email-valentin.popa@intel.com>
In-Reply-To: <1405692407-17792-1-git-send-email-valentin.popa@intel.com>
Subject: Re: [PATCH V2] user-session-units: added to oe-core
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
X-List-Received-Date: Fri, 18 Jul 2014 18:36:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/2014 07:06 AM, Valentin Popa wrote:
> systemd needs this to launch user sessions.
>
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> ---
>   ...temd-login-lib-was-merged-into-libsystemd.patch | 28 ++++++++++++++++++++++
>   .../user-session-units/user-session-units_9.bb     | 25 +++++++++++++++++++
>   2 files changed, 53 insertions(+)
>   create mode 100644 meta/recipes-support/user-session-units/user-session-units/0001-systemd-login-lib-was-merged-into-libsystemd.patch
>   create mode 100644 meta/recipes-support/user-session-units/user-session-units_9.bb
>
> diff --git a/meta/recipes-support/user-session-units/user-session-units/0001-systemd-login-lib-was-merged-into-libsystemd.patch b/meta/recipes-support/user-session-units/user-session-units/0001-systemd-login-lib-was-merged-into-libsystemd.patch
> new file mode 100644
> index 0000000..6fd194c
> --- /dev/null
> +++ b/meta/recipes-support/user-session-units/user-session-units/0001-systemd-login-lib-was-merged-into-libsystemd.patch
> @@ -0,0 +1,28 @@
> +From f80245dbdc5b29fe8dbe9b39482d41fbca044fe6 Mon Sep 17 00:00:00 2001
> +From: Valentin Popa <valentin.popa@intel.com>
> +Date: Mon, 26 May 2014 10:04:13 +0300
> +Subject: [PATCH] systemd-login lib was merged into libsystemd
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> +---
> + Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index a2f960c..7186b10 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -21,7 +21,7 @@ user_session_launch_SOURCES = \
> +
> + # FIXME: add pkgconfig checks for these instead
> + user_session_launch_LDADD = \
> +-	-lsystemd-login \
> ++	-lsystemd \
> + 	-lpam \
> + 	-lpam_misc
> +
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-support/user-session-units/user-session-units_9.bb b/meta/recipes-support/user-session-units/user-session-units_9.bb
> new file mode 100644
> index 0000000..ad2f683
> --- /dev/null
> +++ b/meta/recipes-support/user-session-units/user-session-units_9.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "systemd units to start a user session"
> +
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +
> +SRC_URI = "http://foo-projects.org/~sofar/${BPN}/${BPN}-${PV}.tar.gz \
> +           file://0001-systemd-login-lib-was-merged-into-libsystemd.patch "
> +
> +SRC_URI[md5sum] = "30d26fec6e3e221072c59554c93ecde0"
> +SRC_URI[sha256sum] = "edfc0df890981708e1a09e8488bb91384b6739d76867d3fe2417b03265361717"
> +
> +DEPENDS = "systemd dbus libpam"
> +

Will this project build without systemd?  When attempting to build world 
without systemd enabled in DISTRO_FEATURES I get the following errors:
> ERROR: Nothing PROVIDES 'systemd' (but /home/sgw/yocto/poky/meta/recipes-support/user-session-units/user-session-units_9.bb DEPENDS on or otherwise requires it)
> ERROR: systemd was skipped: 'systemd' not in DISTRO_FEATURES
> ERROR: Nothing RPROVIDES 'user-session-units-dev' (but /home/sgw/yocto/poky/meta/recipes-support/user-session-units/user-session-units_9.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'user-session-units-dev'
> NOTE: Runtime target 'user-session-units-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['user-session-units-dev']
> ERROR: Nothing RPROVIDES 'user-session-units' (but /home/sgw/yocto/poky/meta/recipes-support/user-session-units/user-session-units_9.bb RDEPENDS on or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'user-session-units'
> NOTE: Runtime target 'user-session-units' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['user-session-units']

Can you please look into this.

Sau!

> +inherit autotools pkgconfig
> +
> +# Seed configure so it doesn't look on the host host for gnome/xfce/etc.
> +EXTRA_OECONF = "ac_cv_prog_E_PROG= \
> + ac_cv_prog_XFCE_PROG= \
> + ac_cv_prog_XFWM_PROG= \
> + ac_cv_prog_XBMC_PROG= \
> + ac_cv_prog_GNOME_PROG= \
> + ac_cv_prog_KDE_PROG= \
> + ac_cv_prog_MYTH_PROG="
> +
> +FILES_${PN} = "${systemd_unitdir}/ ${libdir}/systemd/user/ ${bindir}/"
>

