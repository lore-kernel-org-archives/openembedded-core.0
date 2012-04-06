Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFzm0-00077F-OW
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 05:23:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Apr 2012 20:14:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125862050"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga001.jf.intel.com with ESMTP; 05 Apr 2012 20:14:27 -0700
Message-ID: <4F7E5F93.7020207@linux.intel.com>
Date: Thu, 05 Apr 2012 20:14:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <0e25605bf5ef290a098abc577c99607a99493df5.1333626413.git.lianhao.lu@intel.com>
	<f00fe78b88d2be6d6f02ecfb8a619b84d4ea35a0.1333626413.git.lianhao.lu@intel.com>
In-Reply-To: <f00fe78b88d2be6d6f02ecfb8a619b84d4ea35a0.1333626413.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 2/2] connman: Fixed multilib support.
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
X-List-Received-Date: Fri, 06 Apr 2012 03:23:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/05/2012 04:49 AM, Lianhao Lu wrote:
> 1. Added static depends to ofono.
> 2. Corrected the package content of connman-test.
>
> This is part of the bug fixing [YOCTO #2216].
>
> Signed-off-by: Lianhao Lu<lianhao.lu@intel.com>
> ---
>   meta/recipes-connectivity/connman/connman.inc     |    3 ++-
>   meta/recipes-connectivity/connman/connman_0.79.bb |    1 +
>   2 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index d9d663c..bfe6620 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -17,6 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>   DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
>               ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \
>               ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
> +            ofono \
>               "
>
Why is this needed here?

>   EXTRA_OECONF += "\
> @@ -90,7 +91,7 @@ PACKAGES =+ "${PN}-tools ${PN}-tests"
>
>   FILES_${PN}-tools = "${bindir}/wispr"
>
> -FILES_${PN}-tests = "${bindir}/*-test ${libdir}/${PN}/test/*"
> +FILES_${PN}-tests = "${bindir}/*-test ${libdir}/${BPN}/test/*"
>   RDEPENDS_${PN}-tests = "python-dbus"
>
I tweaked your patch to just take this multilib bits.

Sau!


>   FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
> diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb b/meta/recipes-connectivity/connman/connman_0.79.bb
> index 0c3a6fe..f87c4dd 100644
> --- a/meta/recipes-connectivity/connman/connman_0.79.bb
> +++ b/meta/recipes-connectivity/connman/connman_0.79.bb
> @@ -8,3 +8,4 @@ SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
>               file://disable_alg-test.patch \
>               file://connman"
>   S = "${WORKDIR}/git"
> +PR = "r1"


