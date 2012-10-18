Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOwop-00068w-2I
	for openembedded-core@openembedded.org; Thu, 18 Oct 2012 22:35:51 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Oct 2012 13:22:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,609,1344236400"; d="scan'208";a="237147007"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2012 13:22:29 -0700
Message-ID: <50806505.1000103@linux.intel.com>
Date: Thu, 18 Oct 2012 13:22:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Andy Ross <andy.ross@windriver.com>
References: <1349972575-2738-1-git-send-email-andy.ross@windriver.com>
In-Reply-To: <1349972575-2738-1-git-send-email-andy.ross@windriver.com>
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH] sysklogd: fix update-rc.d handling
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
X-List-Received-Date: Thu, 18 Oct 2012 20:35:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2012 09:22 AM, Andy Ross wrote:
> The sysklogd recipe had a cut-n-paste version of the
> update-rc.d.bbclass code which didn't work, but this was hidden
> because all images contain the busybox version which does.  Building a
> busybox-free image unmasked the issue and syslogd wouldn't start on
> first boot.
>
> The comments seem to be wrong/stale.  AFAICT update-rc.d and
> update-alternatives work fine with each other, though there is an
> ordering constraint (alternatives must be specified last, so it
> "wraps" update-rc.d).  This version builds and works both with and
> without busybox.
>
> Signed-off-by: Andy Ross <andy.ross@windriver.com>
> ---
>   meta/recipes-extended/sysklogd/sysklogd.inc | 43 +----------------------------
>   1 file changed, 1 insertion(+), 42 deletions(-)
>
> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
> index 151babb..1167328 100644
> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
> @@ -11,10 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
>                       file://klogd.c;beginline=2;endline=19;md5=7e87ed0ae6142de079bce738c10c899d \
>                      "
>
> -# syslog initscript is handled explicitly because order of
> -# update-rc.d and update-alternatives is important (see below)
> -DEPENDS_append = " update-rc.d update-rc.d-native"
> -RDEPENDS_${PN}_append = " update-rc.d"
> +inherit update-rc.d update-alternatives
>
>   SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar.gz \
>              file://no-strip-install.patch \
> @@ -41,22 +38,6 @@ do_install () {
>   	install -m 755 ${WORKDIR}/sysklogd ${D}${sysconfdir}/init.d/syslog
>   }
>
> -pkg_preinst_${PN} () {
> -	# all this is needed to avoid sysmlink errors,
> -	# because update-rc.d runs before pkg_postinst
> -	ETC=$D${sysconfdir}
> -
> -	if [ -e $ETC/init.d/syslog -a ! -L $ETC/init.d/syslog ]; then
> -		echo "WARNING:" "non symlink ${sysconfdir}/init.d/syslog exist -> backup to ${sysconfdir}/init.d/syslog.old"
> -		mv $ETC/init.d/syslog $ETC/init.d/syslog.old
> -	fi
> -	if [ ! -e $ETC/init.d/syslog ]; then
> -		ln -s dummy $ETC/init.d/syslog
> -	fi
> -}
> -
> -inherit update-alternatives
> -
>   ALTERNATIVE_PRIORITY = "100"
>
>   ALTERNATIVE_${PN} = "syslogd klogd syslog-init syslog-conf"
> @@ -66,15 +47,6 @@ ALTERNATIVE_LINK_NAME[klogd] = "${base_sbindir}/klogd"
>   ALTERNATIVE_LINK_NAME[syslog-init] = "${sysconfdir}/init.d/syslog"
>   ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
>
> -pkg_postinst_${PN} () {
> -	if test "x$D" != "x"; then
> -	OPT="-r $D"
> -	else
> -	OPT="-s"
> -	fi
> -	update-rc.d $OPT syslog defaults
> -}
> -
>   pkg_prerm_${PN} () {
>   	if test "x$D" = "x"; then
>   	if test "$1" = "upgrade" -o "$1" = "remove"; then
> @@ -82,16 +54,3 @@ pkg_prerm_${PN} () {
>   	fi
>   	fiOn 10/11/2012 09:22 AM, Andy Ross wrote:> The sysklogd recipe had a cut-n-paste version of the
> update-rc.d.bbclass code which didn't work, but this was hidden
> because all images contain the busybox version which does.  Building a
> busybox-free image unmasked the issue and syslogd wouldn't start on
> first boot.
>
> The comments seem to be wrong/stale.  AFAICT update-rc.d and
> update-alternatives work fine with each other, though there is an
> ordering constraint (alternatives must be specified last, so it
> "wraps" update-rc.d).  This version builds and works both with and
> without busybox.
>
> Signed-off-by: Andy Ross <andy.ross@windriver.com>
> ---
>   meta/recipes-extended/sysklogd/sysklogd.inc | 43 +----------------------------
>   1 file changed, 1 insertion(+), 42 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!

> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
> index 151babb..1167328 100644
> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
> @@ -11,10 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
>                       file://klogd.c;beginline=2;endline=19;md5=7e87ed0ae6142de079bce738c10c899d \
>                      "
>
> -# syslog initscript is handled explicitly because order of
> -# update-rc.d and update-alternatives is important (see below)
> -DEPENDS_append = " update-rc.d update-rc.d-native"
> -RDEPENDS_${PN}_append = " update-rc.d"
> +inherit update-rc.d update-alternatives
>
>   SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar.gz \
>              file://no-strip-install.patch \
> @@ -41,22 +38,6 @@ do_install () {
>   	install -m 755 ${WORKDIR}/sysklogd ${D}${sysconfdir}/init.d/syslog
>   }
>
> -pkg_preinst_${PN} () {
> -	# all this is needed to avoid sysmlink errors,
> -	# because update-rc.d runs before pkg_postinst
> -	ETC=$D${sysconfdir}
> -
> -	if [ -e $ETC/init.d/syslog -a ! -L $ETC/init.d/syslog ]; then
> -		echo "WARNING:" "non symlink ${sysconfdir}/init.d/syslog exist -> backup to ${sysconfdir}/init.d/syslog.old"
> -		mv $ETC/init.d/syslog $ETC/init.d/syslog.old
> -	fi
> -	if [ ! -e $ETC/init.d/syslog ]; then
> -		ln -s dummy $ETC/init.d/syslog
> -	fi
> -}
> -
> -inherit update-alternatives
> -
>   ALTERNATIVE_PRIORITY = "100"
>
>   ALTERNATIVE_${PN} = "syslogd klogd syslog-init syslog-conf"
> @@ -66,15 +47,6 @@ ALTERNATIVE_LINK_NAME[klogd] = "${base_sbindir}/klogd"
>   ALTERNATIVE_LINK_NAME[syslog-init] = "${sysconfdir}/init.d/syslog"
>   ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
>
> -pkg_postinst_${PN} () {
> -	if test "x$D" != "x"; then
> -	OPT="-r $D"
> -	else
> -	OPT="-s"
> -	fi
> -	update-rc.d $OPT syslog defaults
> -}
> -
>   pkg_prerm_${PN} () {
>   	if test "x$D" = "x"; then
>   	if test "$1" = "upgrade" -o "$1" = "remove"; then
> @@ -82,16 +54,3 @@ pkg_prerm_${PN} () {
>   	fi
>   	fi
>   }
> -
> -pkg_postrm_${PN} () {
> -	if test "x$D" != "x"; then
> -	OPT="-r $D"
> -	else
> -	OPT=""
> -	fi
> -	if test "$1" = "remove" -o "$1" = "purge"; then
> -	if ! test -e "/etc/init.d/syslog"; then
> -	    update-rc.d $OPT syslog remove
> -	fi
> -	fi
> -}
>
>   }
> -
> -pkg_postrm_${PN} () {
> -	if test "x$D" != "x"; then
> -	OPT="-r $D"
> -	else
> -	OPT=""
> -	fi
> -	if test "$1" = "remove" -o "$1" = "purge"; then
> -	if ! test -e "/etc/init.d/syslog"; then
> -	    update-rc.d $OPT syslog remove
> -	fi
> -	fi
> -}
>


