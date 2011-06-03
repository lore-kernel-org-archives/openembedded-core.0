Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QSHvG-0007cL-8A
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 02:07:30 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jun 2011 17:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,312,1304319600"; d="scan'208";a="11156635"
Received: from swold-mobl.jf.intel.com (HELO [10.24.4.14]) ([10.24.4.14])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jun 2011 17:04:16 -0700
Message-ID: <4DE82501.5020105@linux.intel.com>
Date: Thu, 02 Jun 2011 17:04:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1306830479-6753-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1306830479-6753-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] dbus 1.4.1: disable sysv script properly when using systemd
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
X-List-Received-Date: Fri, 03 Jun 2011 00:07:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2011 01:27 AM, Koen Kooi wrote:
> OE-core uses 'dbus-1' as initscript name, which no other distribution(-buildsys) does, so we have to take special measures.
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-core/dbus/dbus.inc      |    4 ++++
>   meta/recipes-core/dbus/dbus_1.4.1.bb |    2 +-
>   2 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index 22514e9..fb2f6d4 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -89,6 +89,10 @@ do_install() {
>
>   	install -d ${D}${sysconfdir}/init.d
>   	install -m 0755 ${WORKDIR}/dbus-1.init ${D}${sysconfdir}/init.d/dbus-1
> +
> +	# disable dbus-1 sysv script on systemd installs
> +	# nearly all distros call the initscript plain 'dbus', but OE-core is different
> +	ln -sf /dev/null ${D}/${base_libdir}/systemd/system/dbus-1.service
>   }
>
>   do_install_virtclass-native() {
> diff --git a/meta/recipes-core/dbus/dbus_1.4.1.bb b/meta/recipes-core/dbus/dbus_1.4.1.bb
> index f65ef35..252d160 100644
> --- a/meta/recipes-core/dbus/dbus_1.4.1.bb
> +++ b/meta/recipes-core/dbus/dbus_1.4.1.bb
> @@ -1,6 +1,6 @@
>   include dbus.inc
>
> -PR = "r5"
> +PR = "r6"
>
>   SRC_URI[md5sum] = "99cb057700c0455fb68f8d57902f77ac"
>   SRC_URI[sha256sum] = "caa1a0ded2d0f2e95c1d4ec7e3c8bd44834928c5b0ed41a7189963f3593983bd"
Merged in oe-core

Thanks
	Sau!


