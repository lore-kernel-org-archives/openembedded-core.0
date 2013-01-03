Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TqbV2-0004Ry-Bu
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 04:29:46 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jan 2013 19:14:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,400,1355126400"; d="scan'208";a="269377543"
Received: from unknown (HELO [10.255.14.135]) ([10.255.14.135])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jan 2013 19:14:38 -0800
Message-ID: <50E4F79D.3050105@linux.intel.com>
Date: Wed, 02 Jan 2013 19:14:37 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: koen@dominion.thruhere.net
References: <50df499d.02cb0e0a.2047.4ecf@mx.google.com>
In-Reply-To: <50df499d.02cb0e0a.2047.4ecf@mx.google.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] libnss-mdns: enable IPv6 as well as IPv4 mnds resolving
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
X-List-Received-Date: Thu, 03 Jan 2013 03:29:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/29/2012 11:50 AM, koen@dominion.thruhere.net wrote:
> From: Koen Kooi <koen@dominion.thruhere.net>
>
>>From the docs: "libnss_mdns.so.2 resolves both IPv6 and IPv4 addresses, libnss_mdns4.so.2 only IPv4 addresses and libnss_mdns6.so.2 only IPv6 addresses."
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>   .../libnss-mdns/libnss-mdns_0.10.bb                |   10 +++++-----
>   1 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> index a1f2f9a..ae11487 100644
> --- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> +++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
>
>   DEPENDS = "avahi"
>   RDEPENDS_${PN} = "avahi-daemon"
> -PR = "r5"
> +PR = "r6"
>
>   SRC_URI = "http://0pointer.de/lennart/projects/nss-mdns/nss-mdns-${PV}.tar.gz"
>
> @@ -24,13 +24,13 @@ DEBIANNAME_${PN} = "libnss-mdns"
>   EXTRA_OECONF = "--libdir=${base_libdir} --disable-lynx --enable-avahi"
>
>   pkg_postinst_${PN} () {
> -if ! grep -q '^hosts:.*\<mdns4\>' $D/etc/nsswitch.conf; then
> -	sed -e 's/^hosts:.*/& mdns4/' -i $D/etc/nsswitch.conf
> +if ! grep -q '^hosts:.*\<mdns\>' $D/etc/nsswitch.conf; then
> +	sed -e 's/^hosts:.*/& mdns/' -i $D/etc/nsswitch.conf
>   fi
>   }
>
>   pkg_prerm_${PN} () {
> -if grep -q '^hosts:.*\<mdns4\>' /etc/nsswitch.conf; then
> -	sed -e '/^hosts:/s/\s\<mdns4\>//' -i /etc/nsswitch.conf
> +if grep -q '^hosts:.*\<mdns\>' /etc/nsswitch.conf; then
> +	sed -e '/^hosts:/s/\s\<mdns\>//' -i /etc/nsswitch.conf
There were some other changes made to this recently, can you please have 
a look at the current version, it now uses the mdns4_minimal

Thanks
	Sau!


>   fi
>   }
>


