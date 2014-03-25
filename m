Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id F307C6F8BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 10:56:14 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2PAu0Rm029188; Tue, 25 Mar 2014 10:56:00 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id USbCNVZczRux; Tue, 25 Mar 2014 10:56:00 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2PAtv9e029156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 25 Mar 2014 10:55:59 GMT
Message-ID: <1395744951.24890.25.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chunrong Guo <B40290@freescale.com>, Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Mar 2014 10:55:51 +0000
In-Reply-To: <1395743836-17276-1-git-send-email-B40290@freescale.com>
References: <1395743836-17276-1-git-send-email-B40290@freescale.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: fix search paths for libstdbuf.so
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Mar 2014 10:56:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-03-25 at 18:37 +0800, Chunrong Guo wrote:
>         *fix the following error:
>         |stdbuf: failed to find 'libstdbuf.so'
>         *PKGLIBEXECDIR is the search paths for libstdbuf.so
>         |PKGLIBEXECDIR='$(pkglibexecdir)'
>         |pkglibexecdir='${libexecdir}/${PACKAGE}'
> 
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta/recipes-core/coreutils/coreutils_8.22.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/coreutils/coreutils_8.22.bb b/meta/recipes-core/coreutils/coreutils_8.22.bb
> index a26aa02..ed5fc84 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.22.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.22.bb
> @@ -71,8 +71,6 @@ do_install_append() {
>  	# in update-alternatives to fail, therefore use lbracket - the name used
>  	# for the actual source file.
>  	mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${BPN}
> -	install -d ${D}${libdir}/coreutils
> -	mv ${D}${libexecdir}/coreutils/libstdbuf.so ${D}${libdir}/coreutils
>  }
>  
>  inherit update-alternatives
> @@ -101,3 +99,4 @@ python __anonymous() {
>  }
>  
>  BBCLASSEXTEND = "native"
> +FILES_${PN}-dbg += "${libexecdir}/coreutils/.debug/*"

Khem added this back in 2011:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/meta/recipes-core/coreutils?h=rpurdie/t2&id=eee0b5aadba34130080df8aebc7e8dd57c7d5ccb

Khem: Any idea what this was for?

Cheers,

Richard



