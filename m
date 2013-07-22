Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2839161EEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 18:01:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Jul 2013 10:58:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,720,1367996400"; d="scan'208";a="349715564"
Received: from unknown (HELO [10.255.14.5]) ([10.255.14.5])
	by orsmga001.jf.intel.com with ESMTP; 22 Jul 2013 11:01:06 -0700
Message-ID: <51ED7362.4080507@linux.intel.com>
Date: Mon, 22 Jul 2013 11:01:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: jackie.huang@windriver.com
References: <cover.1374480160.git.jackie.huang@windriver.com>
	<f3bb321c76f2ed9b0b09cb283e4fdd7b0b37847a.1374480160.git.jackie.huang@windriver.com>
In-Reply-To: <f3bb321c76f2ed9b0b09cb283e4fdd7b0b37847a.1374480160.git.jackie.huang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] dbus: remove build host test in configure script
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
X-List-Received-Date: Mon, 22 Jul 2013 18:01:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/22/2013 01:14 AM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> The dbus build tests the build host to detect what initscript
> environment it expects.  Remove the test and set it to "redhat"
> unconditionally as the oe-core initscript has a redhat-style pid file
> path.
>
> Signed-off-by: Andy Ross <andy.ross@windriver.com
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>   meta/recipes-core/dbus/dbus-1.6.8/os-test.patch |   35 +++++++++++++++++++++++

This file should be in dbus-1.6.10, please rebase against master.

Thanks
	Sau!

>   meta/recipes-core/dbus/dbus.inc                 |    4 ++-
>   2 files changed, 38 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-core/dbus/dbus-1.6.8/os-test.patch
>
> diff --git a/meta/recipes-core/dbus/dbus-1.6.8/os-test.patch b/meta/recipes-core/dbus/dbus-1.6.8/os-test.patch
> new file mode 100644
> index 0000000..79554b1
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus-1.6.8/os-test.patch
> @@ -0,0 +1,35 @@
> +dbus: remove build host test in configure script
> +
> +The dbus build tests the build host to detect what initscript
> +environment it expects.  Remove the test and set it to "redhat"
> +unconditionally as the oe-core initscript has a redhat-style pid file
> +path.
> +
> +Signed-off-by: Andy Ross <andy.ross@windriver.com>
> +Upstream-Status: innappropriate [embedded]
> +
> +diff -u a/configure.ac b/configure.ac
> +--- a/configure.ac	2012-08-28 11:23:43.040609874 -0700
> ++++ b/configure.ac	2012-08-28 11:54:25.602913945 -0700
> +@@ -1348,19 +1348,8 @@
> + AS_AC_EXPAND(EXPANDED_LIBEXECDIR, "$libexecdir")
> + AS_AC_EXPAND(EXPANDED_DATADIR, "$datadir")
> +
> +-#### Check our operating system
> +-operating_system=unknown
> +-if test -f /etc/redhat-release || test -f $EXPANDED_SYSCONFDIR/redhat-release ; then
> +-   operating_system=redhat
> +-fi
> +-
> +-if test -f /etc/slackware-version || test -f $EXPANDED_SYSCONFDIR/slackware-version ; then
> +-   operating_system=slackware
> +-fi
> +-
> +-if test -f /usr/bin/cygwin1.dll || test -f $EXPANDED_BINDIR/cygwin1.dll ; then
> +-   operating_system=cygwin
> +-fi
> ++#### Build host test removed from upstream code, openembedded initscript is redhat-like:
> ++operating_system=redhat
> +
> + #### Sort out init scripts
> +
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index b07aefa..580a936 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -16,7 +16,9 @@ INC_PR = "r6"
>
>   SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>              file://tmpdir.patch; \
> -           file://dbus-1.init"
> +           file://dbus-1.init \
> +           file://os-test.patch \
> +"
>
>   inherit useradd autotools pkgconfig gettext update-rc.d
>
>

