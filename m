Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UIOO8-00044h-78
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 20:09:28 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Mar 2013 11:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,880,1355126400"; d="scan'208";a="309601836"
Received: from unknown (HELO [10.255.13.175]) ([10.255.13.175])
	by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2013 11:52:35 -0700
Message-ID: <514A0573.2060809@linux.intel.com>
Date: Wed, 20 Mar 2013 11:52:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Zhenhua Luo <zhenhua.luo@freescale.com>, 
	Mark Hatle <mark.hatle@windriver.com>
References: <1363772395-25682-1-git-send-email-zhenhua.luo@freescale.com>
In-Reply-To: <1363772395-25682-1-git-send-email-zhenhua.luo@freescale.com>
Cc: B40290@freescale.com, openembedded-core@lists.openembedded.org
Subject: Re: rpm: split out run-postinsts
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
X-List-Received-Date: Wed, 20 Mar 2013 19:09:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/20/2013 02:39 AM, Zhenhua Luo wrote:
> Split out run-postinsts script into separated package, sometimes only the
> postinsts script is required to run all postinsts scripts in /etc/rpm-postinsts/
> instead of the whole rpm package
>
So are you trying to build a system that uses RPM to install the initial 
rootfs, but you don't want RPM actually installed?


> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> ---
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb |    6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> index 6286771..896e3a4 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> @@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>
>   DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
> -PR = "r61"
> +PR = "r62"
>
>   # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
>   # in order to extract the distribution SRPM into a format we can extract...
> @@ -223,9 +223,11 @@ FILES_${PN} =  "${bindir}/rpm \
>   		${libdir}/rpm/bin/wget \
>   		/var/lib/rpm \
>   		/var/cache/rpm \
> -		${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
>   		"
>
> +FILES_${PN}-postinsts = "${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
> +                "
> +

This does not look right to me, you seem to be missing a PACKAGES entry 
for the postinsts package. So this really won't do anything.

Sau!


>   FILES_${PN}-dbg += "${libdir}/rpm/.debug \
>   		${libdir}/rpm/bin/.debug \
>   		"
>


