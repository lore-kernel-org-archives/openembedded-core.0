Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RJAjK-0004cK-DN for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 23:09:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9QL3eFl022704;
	Wed, 26 Oct 2011 22:03:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21433-05; Wed, 26 Oct 2011 22:03:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9QL3Ve4022698
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 26 Oct 2011 22:03:32 +0100
Message-ID: <1319663011.12054.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 26 Oct 2011 22:03:31 +0100
In-Reply-To: <a81c9b800aa70db49fcf4c677a832988ce291481.1319662382.git.bruce.ashfield@windriver.com>
References: <cover.1319662382.git.bruce.ashfield@windriver.com>
	<a81c9b800aa70db49fcf4c677a832988ce291481.1319662382.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 2/2] linux-libc-headers: provide 3.0.x and 3.1 headers
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
X-List-Received-Date: Wed, 26 Oct 2011 21:09:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-26 at 16:56 -0400, Bruce Ashfield wrote:
> Provide both a 3.0.x and a 3.1 set of headers to the toolchain.
> Compatibility is maintained with older 2.6 headers by creating a
> new variable that changes the SRC_URI based on the major version
> number of the kernel.
> 
> Built and booted with 2.6.37.2, 3.0.8 and 3.1 linux-libc-headers.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>  .../linux-libc-headers/linux-libc-headers.inc      |   17 ++++++++++++++---
>  .../linux-libc-headers/linux-libc-headers_3.0.8.bb |    9 +++++++++
>  .../linux-libc-headers/linux-libc-headers_3.1.bb   |    9 +++++++++
>  4 files changed, 33 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 2bf1beb..ed722be 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -21,7 +21,7 @@ SDKGCCVERSION ?= "4.6%"
>  BINUVERSION ?= "2.21.1a"
>  EGLIBCVERSION ?= "2.13"
>  UCLIBCVERSION ?= "0.9.32"
> -LINUXLIBCVERSION ?= "2.6.37.2"
> +LINUXLIBCVERSION ?= "3.1"
>  
>  # Temporary preferred version overrides for PPC
>  PREFERRED_VERSION_u-boot-mkimage-native_powerpc ?= "2009.08"
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> index e83a92b..5fcb181 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> @@ -1,9 +1,20 @@
> -DESCRIPTION = "Sanitized set of 2.6 kernel headers for the C library's use."
> +DESCRIPTION = "Sanitized set of kernel headers for the C library's use."
>  SECTION = "devel"
>  LICENSE = "GPLv2"
>  
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7" 
> -SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v2.6/linux-${PV}.tar.bz2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> +
> +python __anonymous () {
> +    import bb, re, string
> +
> +    major = bb.data.getVar("PV",d,1).split('.')[0]
> +    if major == "3":
> +	bb.data.setVar("HEADER_FETCH_VER", "3.0", d)
> +    else:
> +	bb.data.setVar("HEADER_FETCH_VER", "2.6", d)
> +}
> +
> +SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v${HEADER_FETCH_VER}/linux-${PV}.tar.bz2"
>  
>  S = "${WORKDIR}/linux-${PV}"
>  
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
> new file mode 100644
> index 0000000..e3bad82
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
> @@ -0,0 +1,9 @@
> +require linux-libc-headers.inc
> +
> +INHIBIT_DEFAULT_DEPS = "1"
> +DEPENDS += "unifdef-native"

I think the above two lines can go into the common .inc file too at this
point :)

Cheers,

Richard



