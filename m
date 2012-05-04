Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQRXQ-0003pX-Aj
	for openembedded-core@lists.openembedded.org;
	Sat, 05 May 2012 01:03:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 May 2012 15:54:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="137180837"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2012 15:54:00 -0700
Message-ID: <4FA45E08.2030102@linux.intel.com>
Date: Fri, 04 May 2012 15:54:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
	<2ac2c58e1ef661c5dcd5596a2e5342d5a47ef2fb.1336166919.git.nitin.a.kamble@intel.com>
In-Reply-To: <2ac2c58e1ef661c5dcd5596a2e5342d5a47ef2fb.1336166919.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 26/40] avahi: fix install issue
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
X-List-Received-Date: Fri, 04 May 2012 23:03:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2012 02:30 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> ---
>   meta/recipes-connectivity/avahi/avahi.inc          |    6 ++-
>   .../avahi/files/avahi_fix_install_issue.patch      |   32 ++++++++++++++++++++
>   2 files changed, 36 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-connectivity/avahi/files/avahi_fix_install_issue.patch
>
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> index c064e03..c118758 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -14,14 +14,16 @@ SECTION = "network"
>   # python scripts are under GPLv2+
>   LICENSE = "GPLv2+&  LGPLv2.1+"
>
> -INC_PR = "r3"
> +INC_PR = "r4"
>
>   DEPENDS = "expat libcap libdaemon dbus glib-2.0"
>
>   SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
>             file://00avahi-autoipd \
>             file://99avahi-autoipd \
> -          file://initscript.patch"
> +          file://initscript.patch \
> +          file://avahi_fix_install_issue.patch \
> +          "
>
>   USERADD_PACKAGES = "avahi-daemon"
>   USERADD_PARAM_avahi-daemon = "--system --home /var/run/avahi-daemon \
> diff --git a/meta/recipes-connectivity/avahi/files/avahi_fix_install_issue.patch b/meta/recipes-connectivity/avahi/files/avahi_fix_install_issue.patch
> new file mode 100644
> index 0000000..a9eb70e
> --- /dev/null
> +++ b/meta/recipes-connectivity/avahi/files/avahi_fix_install_issue.patch
> @@ -0,0 +1,32 @@
> +Upsteam-Status: Pending
> +
Miss-Spelled Upstream-Status
(my checker found this)

Sau!

> +Fixes this install issue
> +#| /bin/sh: line 0: cd: /srv/home/nitin/builds/build-gcc47/tmp/work/i586-poky-linux/avahi-0.6.31-r3.0/image//usr/bin: No such file or directory
> +
> +Signed-Off-By: Nitin A Kamble<nitin.a.kamble@intel.com>
> +2012/05/03
> +
> +Index: avahi-0.6.31/avahi-utils/Makefile.am
> +===================================================================
> +--- avahi-0.6.31.orig/avahi-utils/Makefile.am
> ++++ avahi-0.6.31/avahi-utils/Makefile.am
> +@@ -54,6 +54,7 @@ avahi_set_host_name_CFLAGS = $(AM_CFLAGS
> + avahi_set_host_name_LDADD = $(AM_LDADD) ../avahi-client/libavahi-client.la ../avahi-common/libavahi-common.la
> +
> + install-exec-local:
> ++	$(MKDIR_P) $(DESTDIR)/$(bindir)&&  \
> + 	cd $(DESTDIR)/$(bindir)&&  \
> + 		rm -f avahi-resolve-host-name avahi-resolve-address avahi-browse-domains avahi-publish-address avahi-publish-service&&  \
> + 		$(LN_S) avahi-resolve avahi-resolve-host-name&&  \
> +Index: avahi-0.6.31/avahi-utils/Makefile.in
> +===================================================================
> +--- avahi-0.6.31.orig/avahi-utils/Makefile.in
> ++++ avahi-0.6.31/avahi-utils/Makefile.in
> +@@ -906,6 +906,7 @@ uninstall-am: uninstall-binPROGRAMS
> +
> +
> + @HAVE_DBUS_TRUE@install-exec-local:
> ++@HAVE_DBUS_TRUE@	$(MKDIR_P) $(DESTDIR)/$(bindir)&&  \
> + @HAVE_DBUS_TRUE@	cd $(DESTDIR)/$(bindir)&&  \
> + @HAVE_DBUS_TRUE@		rm -f avahi-resolve-host-name avahi-resolve-address avahi-browse-domains avahi-publish-address avahi-publish-service&&  \
> + @HAVE_DBUS_TRUE@		$(LN_S) avahi-resolve avahi-resolve-host-name&&  \


