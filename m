Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UaR2Q-00024B-Or for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 15:37:41 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r49DLokK012974; Thu, 9 May 2013 14:21:50 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yclf-8O8Nanb; Thu,  9 May 2013 14:21:49 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r49DLikP012960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 9 May 2013 14:21:46 +0100
Message-ID: <1368105550.27116.97.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
Date: Thu, 09 May 2013 14:19:10 +0100
In-Reply-To: <1368104132-30116-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1368104132-30116-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: include libgcc when libpthread is enabled
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
X-List-Received-Date: Thu, 09 May 2013 13:37:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-09 at 15:55 +0300, Bogdan Marinescu wrote:
> libpthread needs libgcc to function properly. Without libgcc I get
> the following error:
> 
> root@qemux86:~# tclsh
> % exit 0
> libgcc_s.so.1 must be installed for pthread_cancel to work
> Aborted
> root@qemux86:~#
> 
> This patch fixes the above issue and similar ones by adding a
> runtime dependency of libgcc to eglibc when threads are enabled.
> 
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>  meta/recipes-core/eglibc/eglibc.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
> index 1e04197..24fb05b 100644
> --- a/meta/recipes-core/eglibc/eglibc.inc
> +++ b/meta/recipes-core/eglibc/eglibc.inc
> @@ -35,7 +35,7 @@ siteconfig_do_siteconfig_gencache_prepend = " \
>  # nptl needs unwind support in gcc, which can't be built without glibc.
>  DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers virtual/${TARGET_PREFIX}libc-initial"
>  # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
> -#RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
> +RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
>  PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
>  PROVIDES += "virtual/libintl virtual/libiconv"
>  inherit autotools

Why/when was that line commented out originally? Also, afaik glibc
doesn't support anything other than nptl these days so we can probably
drop the GLIBC_ADDONS check. Khem/Phil?

Cheers,

Richard



