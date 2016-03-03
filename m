Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3B6AB731E1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 11:07:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Mar 2016 03:07:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,532,1449561600"; d="scan'208";a="928710171"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.14.114])
	by fmsmga002.fm.intel.com with ESMTP; 03 Mar 2016 03:07:48 -0800
Message-ID: <1457003268.3025.9.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Javier Viguera <javier.viguera@digi.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 03 Mar 2016 11:07:48 +0000
In-Reply-To: <1456337679-4602-1-git-send-email-javier.viguera@digi.com>
References: <1456337679-4602-1-git-send-email-javier.viguera@digi.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Subject: Re: [jethro][PATCH] bluez5: allow D-Bus to spawn obexd in systems without systemd
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
X-List-Received-Date: Thu, 03 Mar 2016 11:07:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Javier,

On Wed, 2016-02-24 at 19:14 +0100, Javier Viguera wrote:
> This includes a proper D-Bus service file for obexd in systems that
> do
> not support systemd.
> 

This looks like a valid patch for the master branch too?

The development process we try to follow is for patches to go into the
master branch first, then be backported into the release branches.

Regards,

Joshua

> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
>  ...-obexd-without-systemd-in-the-user-sessio.patch | 63
> ++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-
> Allow-using-obexd-without-systemd-in-the-user-sessio.patch
> 
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
> b/meta/recipes-connectivity/bluez5/bluez5.inc
> index df42c88b9da3..d1af31ea45cd 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -18,6 +18,7 @@ PACKAGECONFIG[experimental] = "--enable-
> experimental,--disable-experimental,"
>  
>  SRC_URI = "\
>      ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0
> 001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)}
> \
>  "
>  S = "${WORKDIR}/bluez-${PV}"
>  
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-
> using-obexd-without-systemd-in-the-user-sessio.patch b/meta/recipes-
> connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-
> the-user-sessio.patch
> new file mode 100644
> index 000000000000..2fde7bc06923
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-
> without-systemd-in-the-user-sessio.patch
> @@ -0,0 +1,63 @@
> +From: Giovanni Campagna <gcampagna-cNUdlRotFMnNLxjTenLetw@public.gma
> ne.org>
> +Date: Sat, 12 Oct 2013 17:45:25 +0200
> +Subject: [PATCH] Allow using obexd without systemd in the user
> session
> +
> +Not all sessions run systemd --user (actually, the majority
> +doesn't), so the dbus daemon must be able to spawn obexd
> +directly, and to do so it needs the full path of the daemon.
> +
> +Upstream-Status: Denied
> +
> +Not accepted by upstream maintainer for being a distro specific
> +configuration. See thread:
> +
> +http://thread.gmane.org/gmane.linux.bluez.kernel/38725/focus=38843
> +
> +Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> +---
> + Makefile.obexd                      | 4 ++--
> + obexd/src/org.bluez.obex.service    | 4 ----
> + obexd/src/org.bluez.obex.service.in | 4 ++++
> + 3 files changed, 6 insertions(+), 6 deletions(-)
> + delete mode 100644 obexd/src/org.bluez.obex.service
> + create mode 100644 obexd/src/org.bluez.obex.service.in
> +
> +diff --git a/Makefile.obexd b/Makefile.obexd
> +index 2e33cbc72f2b..d5d858c857b4 100644
> +--- a/Makefile.obexd
> ++++ b/Makefile.obexd
> +@@ -2,12 +2,12 @@
> + if SYSTEMD
> + systemduserunitdir = @SYSTEMD_USERUNITDIR@
> + systemduserunit_DATA = obexd/src/obex.service
> ++endif
> + 
> + dbussessionbusdir = @DBUS_SESSIONBUSDIR@
> + dbussessionbus_DATA = obexd/src/org.bluez.obex.service
> +-endif
> + 
> +-EXTRA_DIST += obexd/src/obex.service.in
> obexd/src/org.bluez.obex.service
> ++EXTRA_DIST += obexd/src/obex.service.in
> obexd/src/org.bluez.obex.service.in
> + 
> + obex_plugindir = $(libdir)/obex/plugins
> + 
> +diff --git a/obexd/src/org.bluez.obex.service
> b/obexd/src/org.bluez.obex.service
> +deleted file mode 100644
> +index a53808884554..000000000000
> +--- a/obexd/src/org.bluez.obex.service
> ++++ /dev/null
> +@@ -1,4 +0,0 @@
> +-[D-BUS Service]
> +-Name=org.bluez.obex
> +-Exec=/bin/false
> +-SystemdService=dbus-org.bluez.obex.service
> +diff --git a/obexd/src/org.bluez.obex.service.in
> b/obexd/src/org.bluez.obex.service.in
> +new file mode 100644
> +index 000000000000..9c815f246b77
> +--- /dev/null
> ++++ b/obexd/src/org.bluez.obex.service.in
> +@@ -0,0 +1,4 @@
> ++[D-BUS Service]
> ++Name=org.bluez.obex
> ++Exec=@libexecdir@/obexd
> ++SystemdService=dbus-org.bluez.obex.service

