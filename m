Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1Vn6-0001hx-Qw
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 06:00:45 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Sep 2011 20:55:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,348,1312182000"; d="scan'208";a="15066283"
Received: from unknown (HELO [10.255.14.148]) ([10.255.14.148])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Sep 2011 20:55:36 -0700
Message-ID: <4E683CB8.6000000@linux.intel.com>
Date: Wed, 07 Sep 2011 20:55:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110816 Thunderbird/6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1315427028.4368.2.camel@lenovo.internal.reciva.com>
In-Reply-To: <1315427028.4368.2.camel@lenovo.internal.reciva.com>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] avahi: only use gtk if DISTRO_FEATURES includes x11
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
X-List-Received-Date: Thu, 08 Sep 2011 04:00:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2011 01:23 PM, Phil Blundell wrote:
> Otherwise avahi isn't buildable for an x11-less DISTRO.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/recipes-connectivity/avahi/avahi.inc |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> index dc7a5ae..24ea458 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -14,7 +14,8 @@ SECTION = "network"
>   # python scripts are under GPLv2+
>   LICENSE = "GPLv2+&  LGPLv2.1+"
>
> -DEPENDS = "expat libcap libdaemon dbus glib-2.0 gtk+ libglade"
> +X11DEPENDS = "gtk+ libglade"
> +DEPENDS = "expat libcap libdaemon dbus glib-2.0 ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
>
>   SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
>             file://00avahi-autoipd \
> @@ -30,6 +31,7 @@ EXTRA_OECONF = "--with-distro=debian \
>                --disable-mono \
>                --disable-monodoc \
>                --disable-gtk3 \
> +	     ${@base_contains('DISTRO_FEATURES', 'x11', '--enable-gtk', '--disable-gtk', d)} \
>                --disable-qt3 \
>                --disable-qt4 \
>                --disable-python \

Merged into OE-Core

Thanks
	Sau!


