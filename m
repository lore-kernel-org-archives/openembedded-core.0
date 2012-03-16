Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1S8Z8S-0007Kj-Jh
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 16:32:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2GFNKlH005031
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 08:23:20 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 16 Mar 2012 08:23:20 -0700
Message-ID: <4F635AE7.50602@windriver.com>
Date: Fri, 16 Mar 2012 10:23:19 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1331905468.18586.182.camel@ted>
In-Reply-To: <1331905468.18586.182.camel@ted>
Subject: Re: [PATCH] directfb: Fix RPATH warnings
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
X-List-Received-Date: Fri, 16 Mar 2012 15:32:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/12 8:44 AM, Richard Purdie wrote:
> Fix configure not to remove variables which trigger the unneccessary rpaths to get
> encoded. Also take the opportunity to clean up the patches directory.

...

Was the dont-use-linux-config.patch not being used or something?  I'm a bit 
confused as to why it was removed.  It appears from the contents that it is 
still relevant for 8xx and 403GCX processors.  (Mind you, we don't actually 
support either of these in oe-core currently.. the 403GCX is likely completely 
dead, from a historical perspective, but I still see the occasionaly 8xx part.)

--Mark

> diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
> index 9061ac1..515d19f 100644
> --- a/meta/recipes-graphics/directfb/directfb.inc
> +++ b/meta/recipes-graphics/directfb/directfb.inc
> @@ -11,11 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
>   HOMEPAGE = "http://directfb.org"
>   DEPENDS = "jpeg libpng freetype zlib tslib"
>
> -SRC_URI = " \
> -    http://directfb.org/downloads/Core/DirectFB-1.4/DirectFB-${PV}.tar.gz \
> -    file://directfb-1.2.x-fix-pkgconfig-cflags.patch \
> -    file://dont-use-linux-config.patch \
> -    "
> +SRC_URI = "http://directfb.org/downloads/Core/DirectFB-1.4/DirectFB-${PV}.tar.gz \
> +           file://directfb-1.2.x-fix-pkgconfig-cflags.patch \
> +           file://configurefix.patch"

...

> diff --git a/meta/recipes-graphics/directfb/files/dont-use-linux-config.patch b/meta/recipes-graphics/directfb/files/dont-use-linux-config.patch
> deleted file mode 100644
> index ba8ead8..0000000
> --- a/meta/recipes-graphics/directfb/files/dont-use-linux-config.patch
> +++ b/dev/null
> @@ -1,23 +0,0 @@
> -
> -directfb: don't use linux/config.h in powerpc assembly
> -
> -Author: jeremy_laine at openembedded.org
> -Branch: org.openembedded.dev
> -Revision: 73964f8e6912f066c224fed54daeeb44836d9cdf
> -ViewMTN: http://monotone.openembedded.org/revision/info/73964f8e6912f066c224fed54daeeb44836d9cdf
> -
> -Upstream-Status: Inappropriate [configuration]
> -Signed-off-by: Saul Wold<sgw@linux.intel.com>
> -
> -diff -urN DirectFB-1.1.0.orig/lib/direct/ppcasm_memcpy_cachable.S DirectFB-1.1.0/lib/direct/ppcasm_memcpy_cachable.S
> ---- DirectFB-1.1.0.orig/lib/direct/ppcasm_memcpy_cachable.S	2007-08-07 21:43:00.000000000 +0200
> -+++ DirectFB-1.1.0/lib/direct/ppcasm_memcpy_cachable.S	2008-06-07 04:14:26.000000000 +0200
> -@@ -34,8 +34,6 @@
> -
> - #define __ASSEMBLY__
> -
> --#include<linux/config.h>
> --
> - #if defined(CONFIG_8xx) || defined(CONFIG_403GCX)
> - #define L1_CACHE_LINE_SIZE       16
> - #define LG_L1_CACHE_LINE_SIZE     4
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



