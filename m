Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T3Uh0-00036a-VS
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 18:19:07 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Aug 2012 09:07:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,797,1336374000"; d="scan'208";a="182972568"
Received: from unknown (HELO [10.255.13.49]) ([10.255.13.49])
	by orsmga001.jf.intel.com with ESMTP; 20 Aug 2012 09:06:46 -0700
Message-ID: <50326095.7020209@linux.intel.com>
Date: Mon, 20 Aug 2012 09:06:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Marc Reilly <marc@cpdesign.com.au>
References: <1345248270-21796-1-git-send-email-marc@cpdesign.com.au>
In-Reply-To: <1345248270-21796-1-git-send-email-marc@cpdesign.com.au>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Patch V2] avahi: fix packaging of avahi-autoipd
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
X-List-Received-Date: Mon, 20 Aug 2012 16:19:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2012 05:04 PM, Marc Reilly wrote:
> - Avahi's "avahi-autoipd" file is in the dhcp/ folder, not dhcp3/
> - udhcpc files were being installed but not being shipped in avahi-autoipd
> - do_install override for avahi-autoipd was not being called and is not
>    required, so join it into regular do_install.
> - While at it, fixup string quoting in description.
>
> This makes avahi-autoipd work with simple ifup/down scripts.
>
> Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
> ---
>   meta/recipes-connectivity/avahi/avahi.inc |   11 +++++------
>   1 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> index 37ff70d..c08acb5 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -1,10 +1,10 @@
>   SUMMARY = "Avahi IPv4LL network address configuration daemon"
> -DESCRIPTION = "Avahi is a fully LGPL framework for Multicast DNS Service Discovery. It \
> +DESCRIPTION = 'Avahi is a fully LGPL framework for Multicast DNS Service Discovery. It \
>   allows programs to publish and discover services and hosts running on a local network \
>   with no specific configuration. This tool implements IPv4LL, "Dynamic Configuration of \
>   IPv4 Link-Local Addresses" (IETF RFC3927), a protocol for automatic IP address \
>   configuration from the link-local 169.254.0.0/16 range without the need for a central \
> -server."
> +server.'
>   AUTHOR = "Lennart Poettering <lennart@poettering.net>"
>   HOMEPAGE = "http://avahi.org"
>   BUGTRACKER = "http://avahi.org/report"
> @@ -63,7 +63,9 @@ PACKAGES =+ "avahi-systemd avahi-daemon libavahi-common libavahi-core libavahi-c
>   FILES_avahi-systemd = "${systemd_unitdir}"
>   FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
>                          ${sysconfdir}/avahi/avahi-autoipd.action \
> -                       ${sysconfdir}/dhcp3/*/avahi-autoipd"
> +                       ${sysconfdir}/dhcp/*/avahi-autoipd \
> +                       ${sysconfdir}/udhcpc.d/00avahi-autoipd \
> +                       ${sysconfdir}/udhcpc.d/99avahi-autoipd"
>   FILES_libavahi-common = "${libdir}/libavahi-common.so.*"
>   FILES_libavahi-core = "${libdir}/libavahi-core.so.*"
>   FILES_avahi-daemon = "${sbindir}/avahi-daemon \
> @@ -116,10 +118,7 @@ do_install() {
>   	rm -rf ${D}/var/run
>   	rm -rf ${D}${datadir}/dbus-1/interfaces
>   	rm -rf ${D}${libdir}/avahi
> -}
>
> -do_install_avahi-autoipd() {
> -	autotools_do_install
>   	install -d ${D}${sysconfdir}/udhcpc.d
>   	install ${WORKDIR}/00avahi-autoipd ${D}${sysconfdir}/udhcpc.d
>   	install ${WORKDIR}/99avahi-autoipd ${D}${sysconfdir}/udhcpc.d
>

Merged into OE-Core

Thanks
	Sau!



