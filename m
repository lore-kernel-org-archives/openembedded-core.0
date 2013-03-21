Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UIc7h-0007Nv-3A for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 10:49:25 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2L9fjRE016400; Thu, 21 Mar 2013 09:41:45 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KhDL8GTtrqlO; Thu, 21 Mar 2013 09:41:44 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2L9fbRe016388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 21 Mar 2013 09:41:40 GMT
Message-ID: <1363858329.16482.133.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zhenhua Luo <zhenhua.luo@freescale.com>
Date: Thu, 21 Mar 2013 09:32:09 +0000
In-Reply-To: <1363849246-9294-1-git-send-email-zhenhua.luo@freescale.com>
References: <1363849246-9294-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: B40290@freescale.com, openembedded-core@lists.openembedded.org
Subject: Re: rpm: fix probably redundant RPATH issue
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
X-List-Received-Date: Thu, 21 Mar 2013 09:49:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-03-21 at 15:00 +0800, Zhenhua Luo wrote:
> Clear the rpath define to fix below build issue:
> ERROR: QA Issue: rpm-build: /work/ppce500mc-fsl_networking-linux/rpm/5.4.9-r61/packages-split/rpm-build/usr/lib/rpm/bin/sqlite3 contains probably-redundant RPATH /usr/lib/../lib
> ERROR: QA Issue: rpm-build: /work/ppce500mc-fsl_networking-linux/rpm/5.4.9-r61/packages-split/rpm-build/usr/lib/rpm/bin/cp contains probably-redundant RPATH /usr/lib/../lib
> ...
> 
> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> ---
>  meta/recipes-devtools/rpm/rpm_5.4.9.bb |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> index cfdc390..12a1642 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> @@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>  
>  DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
> -PR = "r62"
> +PR = "r63"
>  
>  # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
>  # in order to extract the distribution SRPM into a format we can extract...
> @@ -368,6 +368,9 @@ do_configure() {
>  	sed -e 's/pkg-config --exists uuid/pkg-config --exists ossp-uuid/g' \
>  	    -e 's/pkg-config uuid/pkg-config ossp-uuid/g' -i ${S}/configure
>  
> +        # Clear hardcode_libdir_flag_spec to avoid redundant rpath definition
> +        sed -i 's/hardcode_libdir_flag_spec=$lt.*/hardcode_libdir_flag_spec=/g' ${S}/configure
> +
>  	export varprefix=${localstatedir}
>  	oe_runconf
>  }

We're seeing a few of these and we're going to end up adding this hack
to every recipe. I'd like to figure out what in libtool is doing this
and fix the libtool patches so it doesn't happen. There must be some
path normalisation issue in there somewhere.

Is there an easy way to reproduce this issue?

Cheers,

Richard



