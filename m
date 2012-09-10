Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TB6TL-0002Y4-Et
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 18:04:27 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Sep 2012 08:51:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,398,1344236400"; d="scan'208";a="191199283"
Received: from unknown (HELO [10.255.13.123]) ([10.255.13.123])
	by orsmga001.jf.intel.com with ESMTP; 10 Sep 2012 08:51:56 -0700
Message-ID: <504E0C9C.9090106@linux.intel.com>
Date: Mon, 10 Sep 2012 08:51:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1346947769-12659-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1346947769-12659-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gssdp: build examples which require GTK+ only if we have X11
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
X-List-Received-Date: Mon, 10 Sep 2012 16:04:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2012 09:09 AM, Ross Burton wrote:
> They just need GTK+ not libglade, so fix the depends.
>
> The recipe also had multple checksums, so remove the old ones.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb |   16 +++++++---------
>   1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb b/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
> index f3494e7..b87c755 100644
> --- a/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
> +++ b/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
> @@ -2,12 +2,14 @@ SUMMARY = "Resource discovery and announcement over SSDP"
>   DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP (Simpe Service Discovery Protocol)."
>   LICENSE = "LGPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
> -DEPENDS = "glib-2.0 libsoup-2.4 libglade gobject-introspection-stub"
> +DEPENDS = "glib-2.0 libsoup-2.4 gobject-introspection-stub"
> +
> +PR = "r2"
>
>   SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "725c32e8f92a072cc34f0e091937df2a"
> -SRC_URI[sha256sum] = "8eaab799f699836770ec2fcc08abfef2f824a82ae959c6af7b39ffb6968b9fd7"
> +SRC_URI[md5sum] = "aec6a56ac1d4f8a4837da83f2d152556"
> +SRC_URI[sha256sum] = "94de92bb4f7906ed2f047b0146a3b21d53d09908fe1f0149484f61c6afc598ea"
>
>   inherit autotools pkgconfig
>
> @@ -17,9 +19,5 @@ FILES_gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
>
>   EXTRA_OECONF = "--disable-introspection"
>
> -PR = "r1"
> -
> -SRC_URI[md5sum] = "aec6a56ac1d4f8a4837da83f2d152556"
> -SRC_URI[sha256sum] = "94de92bb4f7906ed2f047b0146a3b21d53d09908fe1f0149484f61c6afc598ea"
> -
> -
> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)}"
> +PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk,gtk+"
>

Merged into OE-Core

Thanks	
	Sau!


