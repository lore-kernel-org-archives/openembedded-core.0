Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UUlIi-0005Ad-4Q for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 00:03:02 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3NLkJdt031104; Tue, 23 Apr 2013 22:46:19 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KtH5LyDRth32; Tue, 23 Apr 2013 22:46:19 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3NLkBkT031087
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 23 Apr 2013 22:46:13 +0100
Message-ID: <1366753502.23738.69.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
Date: Tue, 23 Apr 2013 22:45:02 +0100
In-Reply-To: <1366735483.5732.18.camel@phil-desktop.brightsign>
References: <1366735483.5732.18.camel@phil-desktop.brightsign>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc: Add gettext-native to DEPENDS
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
X-List-Received-Date: Tue, 23 Apr 2013 22:03:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-23 at 17:44 +0100, Phil Blundell wrote:
> Otherwise you get:
> 
> | msgfmt -o be.mo be.po
> | msgfmt -o bg.mo bg.po
> | msgfmt -o ca.mo ca.po
> | /bin/bash: msgfmt: command not found
> | make[2]: *** [be.mo] Error 127
> | make[2]: *** Waiting for unfinished jobs....
> | /bin/bash: msgfmt: command not found
> | make[2]: *** [ca.mo] Error 127
> | /bin/bash: msgfmt: command not found
> | make[2]: *** [bg.mo] Error 127
> 
> if msgfmt isn't available in the host environment.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-core/eglibc/eglibc.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
> index 1e04197..38d8c44 100644
> --- a/meta/recipes-core/eglibc/eglibc.inc
> +++ b/meta/recipes-core/eglibc/eglibc.inc
> @@ -33,7 +33,7 @@ siteconfig_do_siteconfig_gencache_prepend = " \
>  "
>  
>  # nptl needs unwind support in gcc, which can't be built without glibc.
> -DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers virtual/${TARGET_PREFIX}libc-initial"
> +DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers virtual/${TARGET_PREFIX}libc-initial gettext-native"
>  # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
>  #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
>  PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"

This will have a significant adverse affect on build speed due to build
dependency bottlenecks :(

Are there any good options for avoiding this?

Cheers,

Richard





