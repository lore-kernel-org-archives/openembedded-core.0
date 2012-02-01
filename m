Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RsdHj-0007oW-3F for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 17:43:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q11GZu6f024307
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Feb 2012 16:35:56 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24078-02 for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2012 16:35:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q11GZkZK024301
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Feb 2012 16:35:47 GMT
Message-ID: <1328114151.13744.95.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 01 Feb 2012 16:35:51 +0000
In-Reply-To: <ddaf0e6f05439011bf5f04950922d0a6d5cd60b6.1327975625.git.otavio@ossystems.com.br>
References: <cover.1327975625.git.otavio@ossystems.com.br>
	<ddaf0e6f05439011bf5f04950922d0a6d5cd60b6.1327975625.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] udev: improve udev-cache robustness
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
X-List-Received-Date: Wed, 01 Feb 2012 16:43:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-31 at 02:10 +0000, Otavio Salvador wrote:
> * allow udev-cache to be disabled at runtime (using
>    /etc/default/udev-cache);
> 
>  * make cache invalidated if kernel, bootparams or device list
>    changes;
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-core/udev/udev.inc                |    8 +++++++-
>  meta/recipes-core/udev/udev/init               |   15 ++++++++++++---
>  meta/recipes-core/udev/udev/udev-cache         |   14 +++++++++++---
>  meta/recipes-core/udev/udev/udev-cache.default |    4 ++++
>  4 files changed, 34 insertions(+), 7 deletions(-)
>  create mode 100644 meta/recipes-core/udev/udev/udev-cache.default
> 
> diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
> index 0e571d6..e5fbe40 100644
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
> @@ -58,7 +59,7 @@ FILES_libgudev = "${base_libdir}/libgudev*.so.* ${libdir}/libgudev*.so.*"
>  FILES_libgudev-dbg = "${base_libdir}/.debug/libgudev*.so.* ${libdir}/.debug/libgudev*.so.*"
>  FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libgudev*.la \
>                       ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
> -FILES_udev-cache = "${sysconfdir}/init.d/udev-cache"
> +FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
>  
>  FILES_udev-acl = "${base_libdir}/udev/udev-acl ${base_libdir}/udev/rules.d/70-acl.rules"
>  
> @@ -72,6 +73,11 @@ do_install_append () {
>  	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
>  	install -m 0755 ${WORKDIR}/udev-cache ${D}${sysconfdir}/init.d/udev-cache
>  
> +	install -d ${D}${sysconfdir}/default
> +	install -m 0755 ${WORKDIR}/udev-cache.default ${D}${sysconfdir}/default/udev-cache
> +
> +	touch ${D}${sysconfdir}/udev/cache.data
> +
>  	install -d ${D}${sysconfdir}/udev/rules.d/
>  
>  	install -m 0644 ${WORKDIR}/local.rules         ${D}${sysconfdir}/udev/rules.d/local.rules
> diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
> index 6a4464c..f2c7f87 100644
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
> @@ -35,9 +36,17 @@ LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") { exit 1 }' /pro
>  [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
>  
> 
> -if [ -e /etc/dev.tar ]; then
> -	(cd /; tar xf /etc/dev.tar 2>&1 | grep -v 'time stamp' || true)
> -	not_first_boot=1
> +if [ "$DEVCACHE" != "" ]; then
> +	# Ensure we are consistent to use the cache
> +	echo -n > /dev/shm/cache.data
> +	[ -x /bin/uname ] && /bin/uname -mrspv >> /dev/shm/cache.data
> +	[ -r /proc/cmdline ] && cat /proc/cmdline >> /dev/shm/cache.data
> +	[ -r /proc/devices ] && cat /proc/devices >> /dev/shm/cache.data
> +	[ -r /proc/atags ] && cat /proc/atags >> /dev/shm/cache.data
> +	if [ -e $DEVCACHE ] && cmp -s /dev/shm/cache.data /etc/udev/cache.data; then
> +		(cd /; tar xf $DEVCACHE > /dev/null 2>&1)
> +		not_first_boot=1
> +	fi
>  fi

This still forks much more than I'd like or than is necessary. In the
interests of getting this resolved, you could do something like my
example below which doesn't fork. It does mangle newlines in the data
but in this case I don't think that matters.

Could we get away with /proc/version instead of uname -mrpsv ?

Cheers,

Richard

#!/bin/sh
readfile () {
    filename=$1
    READDATA=""
    if [ -r $filename ]; then
        while read line; do    
            READDATA="$READDATA$line"
        done < $filename
    fi
}

readfile /proc/cmdline
CMDLINE="$READDATA"
readfile /proc/devices
DEVICES="$READDATA"
readfile /proc/atags
ATAGS="$READDATA"

if [ "$DEVCACHE" != "" ]; then
    if [ -e $DEVCACHE ]; then
        readfile /etc/udev/cache.data
        if [ "$READDATA" = "$CMDLINE $DEVICES $ATAGS" ]; then
            (cd /; tar xf $DEVCACHE > /dev/null 2>&1)
            not_first_boot=1
        fi
    fi
fi





