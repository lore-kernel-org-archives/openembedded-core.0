Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9IyI-0007Ek-KX for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 17:56:26 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TFvIbr006167 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 16:57:19 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id furF7KOy6Ch5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 16:57:18 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TFvFIP006149
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 16:57:17 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 16:50:50 +0100
In-Reply-To: <1317270070-14250-7-git-send-email-msm@freescale.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
	<1317270070-14250-7-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317311457.12332.99.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 07/16] Fix lttng-ust for powerpc64
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
X-List-Received-Date: Thu, 29 Sep 2011 15:56:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-28 at 23:21 -0500, Matthew McClintock wrote:
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/recipes-kernel/lttng/fix-powerpc64.patch |   17 +++++++++++++++++
>  meta/recipes-kernel/lttng/lttng-ust_0.15.bb   |    3 ++-
>  2 files changed, 19 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-kernel/lttng/fix-powerpc64.patch
> 
> diff --git a/meta/recipes-kernel/lttng/fix-powerpc64.patch b/meta/recipes-kernel/lttng/fix-powerpc64.patch
> new file mode 100644
> index 0000000..d347979
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/fix-powerpc64.patch
> @@ -0,0 +1,17 @@
> +Upstream-Status: Inappropriate configuration

Is this really inappropriate for upstream? It looks reasonable to me...

> +
> +Add bit to detect if we are running on powerpc64 and treat it the
> +same as ppc64
> +
> +Index: ust-0.15/configure.ac
> +===================================================================
> +--- ust-0.15.orig/configure.ac
> ++++ ust-0.15/configure.ac
> +@@ -111,6 +111,7 @@ changequote([,])dnl
> + 	x86_64) LIBFORMAT="elf64-x86-64" ;;
> + 	powerpc) LIBFORMAT="elf32-powerpc" ;;
> + 	ppc64) LIBFORMAT="elf64-powerpc" ;;
> ++	powerpc64) LIBFORMAT="elf64-powerpc" ;;
> + 	s390) LIBFORMAT="elf32-s390" ;;
> + 	s390x) LIBFORMAT="elf64-s390" ;;
> +         armv5) LIBFORMAT="elf32-littlearm"; NO_UNALIGNED_ACCESS=1 ;;
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_0.15.bb b/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
> index 915e619..9dd4658 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
> @@ -10,9 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e647752e045a8c45b6f583771bd561ef \
>  
>  DEPENDS = "liburcu"
>  
> -PR = "r2"
> +PR = "r3"
>  
>  SRC_URI = "http://lttng.org/files/ust/releases/ust-${PV}.tar.gz"
> +SRC_URI_append_powerpc64 = " file://fix-powerpc64.patch"

Does this really need to be conditional on powerppc64? Looks like it can
be applied unconditionally...

Cheers,

Richard




