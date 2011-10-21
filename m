Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RHIb3-0002KD-3E
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 19:09:29 +0200
Received: from mail-qw0-f52.google.com ([209.85.216.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 21 Oct 2011 10:03:34 -0700
Received: by qaea17 with SMTP id a17so6660538qae.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 10:03:33 -0700 (PDT)
Received: by 10.68.38.228 with SMTP id j4mr22729942pbk.80.1319216613357;
	Fri, 21 Oct 2011 10:03:33 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id y4sm32265695pbe.4.2011.10.21.10.03.32
	(version=SSLv3 cipher=OTHER); Fri, 21 Oct 2011 10:03:32 -0700 (PDT)
Message-ID: <4EA1A5E1.8080508@intel.com>
Date: Fri, 21 Oct 2011 10:03:29 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319206126.git.otavio@ossystems.com.br>
	<889826463264f3a2aeb5062afb5b2f24b5dc75a0.1319206126.git.otavio@ossystems.com.br>
In-Reply-To: <889826463264f3a2aeb5062afb5b2f24b5dc75a0.1319206126.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 4/4] dbus: use useradd class to allow use in read-only filesystems
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
X-List-Received-Date: Fri, 21 Oct 2011 17:09:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/2011 07:10 AM, Otavio Salvador wrote:
> Move creation of required user/groups to useradd class thus allowing
> use with read-only filesystems and booting the initial boot.
>
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>   meta/recipes-core/dbus/dbus.inc |   48 +++++++++++++++++----------------------
>   1 files changed, 21 insertions(+), 27 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index a8ecda8..2a97c02 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -10,15 +10,22 @@ DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X
>   DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
>   DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk virtual/libx11"
>
> +PR = "r1"
> +
>   SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>              file://tmpdir.patch; \
>              file://dbus-1.init"
>
> -inherit autotools pkgconfig gettext update-rc.d
> +inherit useradd autotools pkgconfig gettext update-rc.d
>
>   INITSCRIPT_NAME = "dbus-1"
>   INITSCRIPT_PARAMS = "start 02 5 3 2 . stop 20 0 1 6 ."
>
> +USERADD_PACKAGES = "${PN}"
> +GROUPADD_PARAM_${PN} = "-r netdev"

I thought netdev was going to be removed from this recipe?

Sau!

> +USERADD_PARAM_${PN} = "--system --home ${localstatedir}/lib/dbus \
> +                       --no-create-home --user-group messagebus"
> +
>   CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session.conf"
>
>   DEBIANNAME_${PN} = "dbus-1"
> @@ -44,32 +51,7 @@ RRECOMMENDS_${PN}-lib = "${PN}"
>   FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
>
>   pkg_postinst_dbus() {
> -	# can't do adduser stuff offline
> -	if [ "x$D" != "x" ]; then
> -		exit 1
> -	fi
> -
> -	MESSAGEUSER=messagebus
> -	MESSAGEHOME=/var/run/dbus
> -	UUIDDIR=/var/lib/dbus
> -
> -	mkdir -p $MESSAGEHOME
> -	mkdir -p $UUIDDIR
> -	chgrp "$MESSAGEUSER" "$MESSAGEHOME" 2>/dev/null || addgroup "$MESSAGEUSER"
> -	chown "$MESSAGEUSER":"$MESSAGEUSER" "$MESSAGEHOME" 2>/dev/null || \
> -		adduser --system --home "$MESSAGEHOME" --no-create-home --disabled-password \
> -			--ingroup "$MESSAGEUSER" "$MESSAGEUSER"
> -
> -	chown "$MESSAGEUSER":"$MESSAGEUSER" "$UUIDDIR"
> -
> -	grep -q netdev: /etc/group || addgroup netdev
> -
> -	chown root:"$MESSAGEUSER" /usr/libexec/dbus-daemon-launch-helper
> -	chmod 4754 /usr/libexec/dbus-daemon-launch-helper
> -
> -	# add volatile after new user/grp are created
> -	echo "d messagebus messagebus 0755 /var/run/dbus none">  /etc/default/volatiles/99_dbus
> -	if [ -e /etc/init.d/populate-volatile.sh ] ; then
> +	if [ -z "${D}" ]&&  [ -e /etc/init.d/populate-volatile.sh ] ; then
>   		/etc/init.d/populate-volatile.sh update
>   	fi
>   }
> @@ -92,6 +74,18 @@ do_install() {
>   	install -d ${D}${sysconfdir}/init.d
>   	install -m 0755 ${WORKDIR}/dbus-1.init ${D}${sysconfdir}/init.d/dbus-1
>
> +	install -d ${D}${sysconfdir}/default/volatiles
> +	echo "d messagebus messagebus 0755 ${localstatedir}/run/dbus none" \
> +	>  ${D}${sysconfdir}/default/volatiles/99_dbus
> +
> +
> +	mkdir -p ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
> +
> +	chown messagebus:messagebus ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
> +
> +	chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
> +	chmod 4754 ${D}${libexecdir}/dbus-daemon-launch-helper
> +
>   	# disable dbus-1 sysv script on systemd installs
>   	# nearly all distros call the initscript plain 'dbus', but OE-core is different
>   	ln -sf /dev/null ${D}/${base_libdir}/systemd/system/dbus-1.service



