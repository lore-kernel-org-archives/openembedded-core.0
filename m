Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UJ57R-0004CI-2k for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 17:47:09 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2MGdVUR011813; Fri, 22 Mar 2013 16:39:31 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4-drnk-vuLfj; Fri, 22 Mar 2013 16:39:30 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2MGdOD1011805
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 22 Mar 2013 16:39:27 GMT
Message-ID: <1363969789.3097.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zhenhua Luo <zhenhua.luo@freescale.com>
Date: Fri, 22 Mar 2013 16:29:49 +0000
In-Reply-To: <1363831511-800-1-git-send-email-zhenhua.luo@freescale.com>
References: <1363831511-800-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: B40290@freescale.com, openembedded-core@lists.openembedded.org
Subject: Re: [oe-core v2] rpm: split out run-postinsts
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
X-List-Received-Date: Fri, 22 Mar 2013 16:47:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-03-21 at 10:05 +0800, Zhenhua Luo wrote:
> Split out run-postinsts script into separated package, sometimes only the postinsts script is required to run all postinsts scripts in /etc/rpm-postinsts/ instead of the whole rpm package.
> 
> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> ---
>  meta/recipes-devtools/rpm/rpm_5.4.9.bb |    8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> index 6286771..cfdc390 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> @@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>  
>  DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
> -PR = "r61"
> +PR = "r62"
>  
>  # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
>  # in order to extract the distribution SRPM into a format we can extract...
> @@ -199,7 +199,7 @@ CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE"
>  
>  LDFLAGS_append_libc-uclibc = "-lrt -lpthread"
>  
> -PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
> +PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale ${PN}-postinsts"
>  
>  SOLIBS = "5.4.so"
>  
> @@ -223,9 +223,11 @@ FILES_${PN} =  "${bindir}/rpm \
>  		${libdir}/rpm/bin/wget \
>  		/var/lib/rpm \
>  		/var/cache/rpm \
> -		${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
>  		"
>  
> +FILES_${PN}-postinsts = "${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
> +                "
> +
>  FILES_${PN}-dbg += "${libdir}/rpm/.debug \
>  		${libdir}/rpm/bin/.debug \
>  		"

Don't we need to depend on this package somewhere so that it gets
installed?

Cheers,

Richard



