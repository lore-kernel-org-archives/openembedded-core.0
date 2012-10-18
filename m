Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOwZN-0005ZL-Je
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:19:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Oct 2012 13:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,608,1344236400"; d="scan'208";a="207811716"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by orsmga001.jf.intel.com with ESMTP; 18 Oct 2012 13:06:32 -0700
Message-ID: <50806148.9000209@linux.intel.com>
Date: Thu, 18 Oct 2012 13:06:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1348845192-28857-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1348845192-28857-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] libnss-mdns: fix mDNS resolving speed
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
X-List-Received-Date: Thu, 18 Oct 2012 20:19:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/28/2012 08:13 AM, Constantin Musca wrote:
> We need to fix the "hosts: files dns mdns4" nsswitch.conf line
> because for a .local lookup it does a DNS lookup first which will fail.
> The recommended solution is:
> hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4
>
> [YOCTO #2502]
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   .../libnss-mdns/libnss-mdns_0.10.bb                |   14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> index a1f2f9a..f7356e4 100644
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
> -fi
> +	sed -e '/^hosts:/s/\s*\<mdns4\>//' \
> +		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 mdns4_minimal [NOTFOUND=return]\3\4 mdns4\5/' \
> +		-i $D/etc/nsswitch.conf
>   }
>
>   pkg_prerm_${PN} () {
> -if grep -q '^hosts:.*\<mdns4\>' /etc/nsswitch.conf; then
> -	sed -e '/^hosts:/s/\s\<mdns4\>//' -i /etc/nsswitch.conf
> -fi
> +	sed -e '/^hosts:/s/\s*\<mdns4\>//' \
> +		-e '/^hosts:/s/\s*mdns4_minimal\s\+\[NOTFOUND=return\]//' \
> +		-i /etc/nsswitch.conf
>   }
>

Merged into OE-Core

Thanks
	Sau!



