Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QSIML-0008Br-H9
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 02:35:29 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jun 2011 17:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,312,1304319600"; 
   d="scan'208";a="6261636"
Received: from swold-mobl.jf.intel.com (HELO [10.24.4.14]) ([10.24.4.14])
	by azsmga001.ch.intel.com with ESMTP; 02 Jun 2011 17:14:12 -0700
Message-ID: <4DE82754.1070105@linux.intel.com>
Date: Thu, 02 Jun 2011 17:14:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1306938451-29445-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1306938451-29445-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH v2] avahi: enable service when using systemd
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
X-List-Received-Date: Fri, 03 Jun 2011 00:35:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2011 07:27 AM, Koen Kooi wrote:
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-connectivity/avahi/avahi.inc       |   18 ++++++++++++++++++
>   meta/recipes-connectivity/avahi/avahi_0.6.30.bb |    2 +-
>   2 files changed, 19 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> index 099c5a4..9e26a20 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -46,6 +46,24 @@ PACKAGES =+ "avahi-systemd avahi-daemon libavahi-common libavahi-core libavahi-c
>   FILES_avahi-systemd = "${base_libdir}/systemd"
>   RDEPENDS_avahi-systemd = "avahi-daemon"
>
> +pkg_postinst_avahi-systemd() {
> +	# can't do this offline
> +	if [ "x$D" != "x" ]; then
> +		exit 1
> +	fi
> +	
> +	systemctl enable avahi-daemon.service
> +}
> +
> +pkg_postrm_avahi-systemd() {
> +	# can't do this offline
> +	if [ "x$D" != "x" ]; then
> +		exit 1
> +	fi
> +
> +	systemctl disable avahi-daemon.service
> +}
> +
>   FILES_libavahi-common = "${libdir}/libavahi-common.so.*"
>   FILES_libavahi-core = "${libdir}/libavahi-core.so.*"
>   FILES_libavahi-ui = "${libdir}/libavahi-ui.so.*"
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
> index e63f406..23c0fa0 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>                       file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
>
>   RDEPENDS_avahi-daemon = "sysvinit-pidof"
> -PR = "r1"
> +PR = "r3"
>
>   EXTRA_OECONF += "--disable-gtk3"
>

Really merged this version, not the first one!

Sorry for the confusion.

Sau!


