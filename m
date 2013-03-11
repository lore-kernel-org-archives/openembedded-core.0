Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UFBlv-0003fh-6v
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 00:04:49 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Mar 2013 15:48:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,825,1355126400"; d="scan'208";a="304244373"
Received: from unknown (HELO [10.255.13.68]) ([10.255.13.68])
	by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2013 15:48:05 -0700
Message-ID: <513E5F20.2020004@linux.intel.com>
Date: Mon, 11 Mar 2013 15:48:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Olivier Guiter <olivier.guiter@linux.intel.com>
References: <CAJTo0LbfS1ghZ3wDcmoAQC-Kvm-J9m2neDa86Ekhj3ckraUZHw@mail.gmail.com>
	<1362743153-29094-1-git-send-email-olivier.guiter@linux.intel.com>
In-Reply-To: <1362743153-29094-1-git-send-email-olivier.guiter@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] neard:Update reference commit sha1 and install script
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
X-List-Received-Date: Mon, 11 Mar 2013 23:04:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2013 03:45 AM, Olivier Guiter wrote:
> This patch installs neard daemon in /usr/lib/neard.

Please add a Signed-off: line

Thanks
	Sau!

> ---
>   meta/recipes-connectivity/neard/neard/neard    |   42 ------------------------
>   meta/recipes-connectivity/neard/neard/neard.in |   42 ++++++++++++++++++++++++
>   meta/recipes-connectivity/neard/neard_0.9.bb   |   27 ++++++++++-----
>   3 files changed, 61 insertions(+), 50 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/neard/neard/neard
>   create mode 100644 meta/recipes-connectivity/neard/neard/neard.in
>
> diff --git a/meta/recipes-connectivity/neard/neard/neard b/meta/recipes-connectivity/neard/neard/neard
> deleted file mode 100644
> index 5f36174..0000000
> --- a/meta/recipes-connectivity/neard/neard/neard
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -#!/bin/sh
> -
> -DAEMON=/usr/sbin/neard
> -PIDFILE=/var/run/neard.pid
> -DESC="Linux NFC daemon"
> -
> -if [ -f /etc/default/neard ] ; then
> -	. /etc/default/neard
> -fi
> -
> -set -e
> -
> -do_start() {
> -	$DAEMON
> -}
> -
> -do_stop() {
> -	start-stop-daemon --stop --name neard --quiet
> -}
> -
> -case "$1" in
> -  start)
> -	echo "Starting $DESC"
> -	do_start
> -	;;
> -  stop)
> -	echo "Stopping $DESC"
> -	do_stop
> -	;;
> -  restart|force-reload)
> -	echo "Restarting $DESC"
> -	do_stop
> -	sleep 1
> -	do_start
> -	;;
> -  *)
> -	echo "Usage: $0 {start|stop|restart|force-reload}" >&2
> -	exit 1
> -	;;
> -esac
> -
> -exit 0
> diff --git a/meta/recipes-connectivity/neard/neard/neard.in b/meta/recipes-connectivity/neard/neard/neard.in
> new file mode 100644
> index 0000000..38361c8
> --- /dev/null
> +++ b/meta/recipes-connectivity/neard/neard/neard.in
> @@ -0,0 +1,42 @@
> +#!/bin/sh
> +
> +DAEMON=@installpath@/neard
> +PIDFILE=/var/run/neard.pid
> +DESC="Linux NFC daemon"
> +
> +if [ -f /etc/default/neard ] ; then
> +	. /etc/default/neard
> +fi
> +
> +set -e
> +
> +do_start() {
> +	$DAEMON
> +}
> +
> +do_stop() {
> +	start-stop-daemon --stop --name neard --quiet
> +}
> +
> +case "$1" in
> +  start)
> +	echo "Starting $DESC"
> +	do_start
> +	;;
> +  stop)
> +	echo "Stopping $DESC"
> +	do_stop
> +	;;
> +  restart|force-reload)
> +	echo "Restarting $DESC"
> +	do_stop
> +	sleep 1
> +	do_start
> +	;;
> +  *)
> +	echo "Usage: $0 {start|stop|restart|force-reload}" >&2
> +	exit 1
> +	;;
> +esac
> +
> +exit 0
> diff --git a/meta/recipes-connectivity/neard/neard_0.9.bb b/meta/recipes-connectivity/neard/neard_0.9.bb
> index 61ea58c..afd6597 100644
> --- a/meta/recipes-connectivity/neard/neard_0.9.bb
> +++ b/meta/recipes-connectivity/neard/neard_0.9.bb
> @@ -11,14 +11,25 @@ inherit autotools pkgconfig update-rc.d
>   INITSCRIPT_NAME = "neard"
>   INITSCRIPT_PARAMS = "defaults 64"
>
> +do_install() {
> +	oe_runmake DESTDIR=${D} libexecdir=${libexecdir} install
> +}
> +
>   # This would copy neard start-stop shell and test scripts
>   do_install_append() {
> +
> +  # start/stop
>     install -d ${D}${sysconfdir}/init.d/
> -  install -m 0755 ${WORKDIR}/neard ${D}${sysconfdir}/init.d/neard
>
> + sed "s:@installpath@:${libexecdir}:" ${WORKDIR}/neard.in \
> +		> ${D}${sysconfdir}/init.d/neard
> +
> +  chmod 0755 ${D}${sysconfdir}/init.d/neard
> +
> +  #test files
>     install -d ${D}${libdir}/neard
> -  install -m 0755 ${S}/test/* ${D}${libdir}/neard/
> -  install -m 0755 ${S}/tools/nfctool/nfctool ${D}${libdir}/neard/
> +  install -m 0755 ${S}/test/* ${D}${libdir}/${BPN}/
> +  install -m 0755 ${S}/tools/nfctool/nfctool ${D}${libdir}/${BPN}/
>   }
>
>   RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
> @@ -32,10 +43,10 @@ RRECOMMENDS_${PN} = "\
>   #Additional
>   PACKAGES =+ "${PN}-tests"
>
> -FILES_${PN}-tests = "${libdir}/neard/*-test"
> -RDEPENDS_${PN}-tests = "python python-dbus python-pygobject"
> +FILES_${PN}-tests = "${libdir}/${BPN}/*-test"
> +FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
>
> -FILES_${PN}-dbg += "${bindir}/neard/*/.debug"
> +RDEPENDS_${PN}-tests = "python python-dbus python-pygobject"
>
>   ##=============================
>   # This is valid for 0.9+
> @@ -43,12 +54,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>    file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
>    "
>   S	= "${WORKDIR}/git"
> -SRCREV	= "7abdb13d106d496e1115fab49e6448a249dfb3c8"
> +SRCREV	= "1e20e396cb837017b7e5ef822bfdab6ce060d2cf"
>   PV	= "0.9-git${SRCPV}"
>   PR	= "r1"
>
>   SRC_URI  = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=git \
> -	file://neard \
> +	file://neard.in \
>   	"
>
>   EXTRA_OECONF += "--enable-tools \
>


