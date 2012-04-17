Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SK9R4-0000xG-6d
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 16:31:14 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Apr 2012 07:21:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="154672510"
Received: from unknown (HELO [10.255.12.25]) ([10.255.12.25])
	by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2012 07:21:46 -0700
Message-ID: <4F8D7C7A.70905@linux.intel.com>
Date: Tue, 17 Apr 2012 07:21:46 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1334659037-5186-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1334659037-5186-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH] avahi-daemon: fix missing init script links
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
X-List-Received-Date: Tue, 17 Apr 2012 14:31:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/17/2012 03:37 AM, Andreas Oberritter wrote:
> * update-rc.d wasn't executed when the rootfs was built, because
>    pkg_postinst_avahi-daemon exited early. It wasn't run either
>    on first boot, because the exit code was 0.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   meta/recipes-connectivity/avahi/avahi.inc |    9 ++++-----
>   1 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> index 731ad9a..61ca25f 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -14,7 +14,7 @@ SECTION = "network"
>   # python scripts are under GPLv2+
>   LICENSE = "GPLv2+&  LGPLv2.1+"
>
> -INC_PR = "r1"
> +INC_PR = "r2"
>
>   DEPENDS = "expat libcap libdaemon dbus glib-2.0"
>
> @@ -123,17 +123,16 @@ do_install_avahi-autoipd() {
>   }
>
>   # At the time the postinst runs, dbus might not be setup so only restart if running
> +# Don't exit early, because update-rc.d needs to run subsequently.
>
>   pkg_postinst_avahi-daemon () {
> -	if [ "x$D" != "x" ]; then
> -		exit 0
> -	fi
> -
> +if [ -z "$D" ]; then
>   	DBUSPID=`pidof dbus-daemon`
>
>   	if [ "x$DBUSPID" != "x" ]; then
>   		/etc/init.d/dbus-1 force-reload
>   	fi
> +fi
>   }
>
>   pkg_postinst_avahi-autoipd () {

Merged into OE-Core

Thanks
	Sau!


