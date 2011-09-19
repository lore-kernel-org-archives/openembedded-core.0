Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R5jEv-0002C9-58
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 21:10:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8JJ5Vnd028763
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 12:05:31 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 19 Sep 2011 12:05:30 -0700
Message-ID: <4E77927A.4020402@windriver.com>
Date: Mon, 19 Sep 2011 14:05:30 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1316454869.git.sgw@linux.intel.com>
	<c61c00e6f90ad71f8a111d502e228af7be0a7838.1316454869.git.sgw@linux.intel.com>
In-Reply-To: <c61c00e6f90ad71f8a111d502e228af7be0a7838.1316454869.git.sgw@linux.intel.com>
Subject: Re: [PATCH 1/1] avahi: Check for GPLv3 license and disable x11
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
X-List-Received-Date: Mon, 19 Sep 2011 19:10:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/19/11 12:55 PM, Saul Wold wrote:
> [YOCTO #1492]
> 
> Since the non-GPLv3 build does not want gnome, which this will pull in
> by the default DISTRO_FEATURE x11 being set and enabling gtk for avahi,
> we filter x11 out of DISTRO_FEATURES here when INCOMPATIBLE_LICENSE is
> set to GPLv3.

If the avahi GTK UI app is needed when X11 is enabled, this should be a decent
enough way to work around the condition.

However, I question if avahi should -ever- be producing the gtk component.

From the investigation I did, the gtk component is something that helps with
discovering mDNS servers (either prompting the user or simply displaying status,
I'm not sure).  Is this of use to anyone using oe-core?  Otherwise I'd be in
favor of simply removing the X11 option from the avahi package.

(I talked with Saul about this already on IRC.. he's concerned that we'd be
turning of required [by someone] functionality... I'm really not sure it is
required by anyone...)

--Mark

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-connectivity/avahi/avahi.inc       |    8 ++++++++
>  meta/recipes-connectivity/avahi/avahi_0.6.30.bb |    2 +-
>  2 files changed, 9 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> index 24ea458..c5c0c7c 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -14,6 +14,8 @@ SECTION = "network"
>  # python scripts are under GPLv2+
>  LICENSE = "GPLv2+ & LGPLv2.1+"
>  
> +INC_PR = "r5"
> +
>  X11DEPENDS = "gtk+ libglade"
>  DEPENDS = "expat libcap libdaemon dbus glib-2.0 ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
>  
> @@ -39,6 +41,12 @@ EXTRA_OECONF = "--with-distro=debian \
>               --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
>  "
>  
> +python() {
> +    if (d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1:
> +        d.setVar("DISTRO_FEATURES", oe_filter_out('x11', d.getVar("DISTRO_FEATURES", True), d))
> +
> +}
> +
>  PACKAGES =+ "avahi-systemd avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-gobject avahi-autoipd avahi-ui-utils avahi-utils libavahi-ui libavahi-ui-dev"
>  
>  FILES_avahi-systemd = "${base_libdir}/systemd"
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
> index 05716d0..5094961 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>                      file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
>                      file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
>  
> -PR = "r4"
> +PR = "${INC_PR}.0"
>  
>  SRC_URI[md5sum] = "e4db89a2a403ff4c47d66ac66fad1f43"
>  SRC_URI[sha256sum] = "f9e4316c2339d0020726edd846d01bee0c39980906db0c247479e5807457ff1f"



