Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TJQTN-0007i3-UG
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 17:02:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Oct 2012 07:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,528,1344236400"; d="scan'208";a="229467355"
Received: from unknown (HELO envy.home) ([10.255.13.153])
	by fmsmga001.fm.intel.com with ESMTP; 03 Oct 2012 07:49:53 -0700
Message-ID: <506C5062.1050400@linux.intel.com>
Date: Wed, 03 Oct 2012 07:49:06 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1349266338-15222-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1349266338-15222-1-git-send-email-ross.burton@intel.com>
X-Enigmail-Version: 1.4.4
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wpa-supplicant: don't break the DBus service file
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
X-List-Received-Date: Wed, 03 Oct 2012 15:02:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/03/2012 05:12 AM, Ross Burton wrote:
> The recipe exports $BINDIR as ${sbindir} and the build system uses this when
> writing the DBus service file, so sedding it and replacing $base_sbindir with
> $sbindir (/sbin and /usr/sbin) isn't useful when it ends up as
> /usr/usr/sbin/wpa_supplicant.
> 
> [YOCTO: #3202]
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc |    1 -
>  meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb  |    2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
> index 873e923..485a2dd 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
> @@ -61,7 +61,6 @@ do_install () {
>  	install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
>  	install -d ${D}/${datadir}/dbus-1/system-services
>  	install -m 644 ${S}/dbus/*.service ${D}/${datadir}/dbus-1/system-services
> -	sed -i -e s:${base_sbindir}:${sbindir}:g ${D}/${datadir}/dbus-1/system-services/*.service

Huh... I didn't detect this as a difference from 0.7 to 1.0, so I wonder
why 0.7 worked.

But I don't wonder too much - thanks for the fix!

Building and testing now.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


