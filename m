Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiUX1-0006Fp-8o for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 18:21:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04HEIwK022201
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 17:14:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21957-04 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 17:14:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04HEBa5022195
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 17:14:12 GMT
Message-ID: <1325697252.20759.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 17:14:12 +0000
In-Reply-To: <434061cd08c919cbabd78bf875d5f3e24233ef84.1325101674.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
	<434061cd08c919cbabd78bf875d5f3e24233ef84.1325101674.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 12/16] udev: improve udev-cache robustness
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
X-List-Received-Date: Wed, 04 Jan 2012 17:21:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-28 at 19:55 +0000, Otavio Salvador wrote:
> * allow udev-cache to be disabled at runtime (using
>    /etc/default/udev-cache);
> 
>  * make cache invalidated if kernel, bootparams or device list
>    changes;
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-core/udev/udev.inc                |   11 ++++++++++-
>  meta/recipes-core/udev/udev/init               |   18 +++++++++++++++---
>  meta/recipes-core/udev/udev/udev-cache         |   20 +++++++++++++++++---
>  meta/recipes-core/udev/udev/udev-cache.default |    4 ++++
>  meta/recipes-core/udev/udev_164.bb             |    2 +-
>  5 files changed, 47 insertions(+), 8 deletions(-)
>  create mode 100644 meta/recipes-core/udev/udev/udev-cache.default
> 
> diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
> index 198336b..a228e5f 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -25,6 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
>             file://network.sh \
>             file://local.rules \
>             file://udev-cache \
> +           file://udev-cache.default \
>             file://init"
>  
>  inherit autotools pkgconfig update-rc.d
> @@ -56,7 +57,7 @@ FILES_libgudev = "${base_libdir}/libgudev*.so.* ${libdir}/libgudev*.so.*"
>  FILES_libgudev-dbg = "${base_libdir}/.debug/libgudev*.so.* ${libdir}/.debug/libgudev*.so.*"
>  FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libgudev*.la \
>                       ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
> -FILES_udev-cache = "${sysconfdir}/init.d/udev-cache"
> +FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
>  
>  FILES_udev-acl = "${base_libdir}/udev/udev-acl ${base_libdir}/udev/rules.d/70-acl.rules"
>  
> @@ -68,6 +69,14 @@ do_install_append () {
>  	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
>  	install -m 0755 ${WORKDIR}/udev-cache ${D}${sysconfdir}/init.d/udev-cache
>  
> +	install -d ${D}${sysconfdir}/default
> +	install -m 0755 ${WORKDIR}/udev-cache.default ${D}${sysconfdir}/default/udev-cache
> +
> +	touch ${D}${sysconfdir}/udev/saved.uname
> +	touch ${D}${sysconfdir}/udev/saved.cmdline
> +	touch ${D}${sysconfdir}/udev/saved.devices
> +	touch ${D}${sysconfdir}/udev/saved.atags
> +
>  	install -d ${D}${sysconfdir}/udev/rules.d/
>  
>  	install -m 0644 ${WORKDIR}/local.rules         ${D}${sysconfdir}/udev/rules.d/local.rules
> diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
> index c2b491e..5468bd9 100644
> --- a/meta/recipes-core/udev/udev/init
> +++ b/meta/recipes-core/udev/udev/init
> @@ -14,6 +14,7 @@ export TZ=/etc/localtime
>  [ -d /sys/class ] || exit 1
>  [ -r /proc/mounts ] || exit 1
>  [ -x /sbin/udevd ] || exit 1
> +[ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
>  [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
>  
>  kill_udevd() {
> @@ -35,9 +36,20 @@ mkdir -p -m 0755 /dev/pts
>  mkdir -p -m 1777 /dev/shm
>  
> 
> -if [ -e /etc/dev.tar ]; then
> -	(cd /; tar xf /etc/dev.tar 2>&1 | grep -v 'time stamp' || true)
> -	not_first_boot=1
> +if [ "$DEVCACHE" != "" ]; then
> +	# Invalidate udev cache if the kernel or its bootargs/cmdline have changed
> +	[ -x /bin/uname ] && /bin/uname -mrspv > /dev/shm/uname || touch /dev/shm/uname
> +	[ -r /proc/cmdline ] && cat /proc/cmdline > /dev/shm/cmdline || touch /dev/shm/cmdline
> +	[ -r /proc/devices ] && cat /proc/devices > /dev/shm/devices || touch /dev/shm/devices
> +	[ -r /proc/atags ] && cat /proc/atags > /dev/shm/atags || touch /dev/shm/atags
> +	if [ -e $DEVCACHE ] && \
> +		cmp -s /dev/shm/uname /etc/udev/saved.uname && \
> +		cmp -s /dev/shm/cmdline /etc/udev/saved.cmdline && \
> +		cmp -s /dev/shm/devices /etc/udev/saved.devices && \
> +		cmp -s /dev/shm/atags /etc/udev/saved.atags; then
> +		(cd /; tar xf $DEVCACHE > /dev/null 2>&1)
> +		not_first_boot=1
> +	fi
>  fi

You're adding a ton of exec calls into the boot process here :(

Please can we find some better way to do this without all the exec()
calls?

Cheers,

Richard

 





