Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RZ5yh-0006Qn-8D
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:19:27 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2011 11:12:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="84794712"
Received: from unknown (HELO envy.home) ([10.255.12.30])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2011 11:12:34 -0800
Message-ID: <4EE25DB2.3060803@linux.intel.com>
Date: Fri, 09 Dec 2011 11:12:50 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1323456842-16941-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1323456842-16941-1-git-send-email-otavio@ossystems.com.br>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH] connman: disable ntp support
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
X-List-Received-Date: Fri, 09 Dec 2011 19:19:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 12/09/2011 10:54 AM, Otavio Salvador wrote:
> OE-Core does not provide ntpd at this moment and as there's no known
> user of this plugin at this moment we are disabling it.
> 
> [YOCTO #1817]
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

| checking linux/if_alg.h usability... no
| checking linux/if_alg.h presence... no
| checking for linux/if_alg.h... no
| configure: error: User-space algorithm header files are required
| ERROR: oe_runconf failed
NOTE: package connman-0.78-r2: task do_configure: Failed

Not sure if it's related, but connman still doesn't build for me with
this patch applied.

--
Darren

> ---
>  meta/recipes-connectivity/connman/connman.inc     |    6 ++----
>  meta/recipes-connectivity/connman/connman_0.78.bb |    2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index e90aa4b..d695fee 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>                      file://src/main.c;beginline=1;endline=20;md5=4b55b550fa6b33cc2055ef30dd262b3e"
>  
>  # we need to define the depends here, the dynamic stuff is too late
> -DEPENDS  = "dbus glib-2.0 ppp iptables gnutls ntp \
> +DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
>              ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \
>              ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
>              "
> @@ -36,8 +36,7 @@ EXTRA_OECONF += "\
>      --disable-polkit \
>      --enable-client \
>      --enable-fake \
> -    --enable-ntpd \
> -    --with-ntpd=${bindir}/ntpd \
> +    --disable-ntpd \
>  "
>  
>  INITSCRIPT_NAME = "connman"
> @@ -72,7 +71,6 @@ python populate_packages_prepend() {
>  	               wifi="wpa-supplicant",
>  	               resolvconf="resolvconf",
>  	               bluetooth="bluez4",
> -	               ntpd="ntp",
>  	               ofono="ofono" )
>  	packages = []
>  	multilib_prefix = (d.getVar("MLPREFIX", True) or "")
> diff --git a/meta/recipes-connectivity/connman/connman_0.78.bb b/meta/recipes-connectivity/connman/connman_0.78.bb
> index cc23c28..5ea2bb7 100644
> --- a/meta/recipes-connectivity/connman/connman_0.78.bb
> +++ b/meta/recipes-connectivity/connman/connman_0.78.bb
> @@ -1,6 +1,6 @@
>  require connman.inc
>  
> -PR = "r1"
> +PR = "r2"
>  
>  # 0.78 tag
>  SRCREV = "02f5d5fe2d7c71514a6387ba2b772b42d8e8d297"

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


