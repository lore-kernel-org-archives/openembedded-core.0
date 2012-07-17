Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrBvv-000434-6S
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 19:51:39 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Jul 2012 10:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="173285148"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2012 10:40:18 -0700
Message-ID: <5005A382.3090003@linux.intel.com>
Date: Tue, 17 Jul 2012 10:40:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
	<0413ecda2ffd71f9deaf296591b8744d29a30099.1341498745.git.raj.khem@gmail.com>
In-Reply-To: <0413ecda2ffd71f9deaf296591b8744d29a30099.1341498745.git.raj.khem@gmail.com>
Subject: Re: [PATCH 13/14] libpam: Fix build with eglibc 2.16
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
X-List-Received-Date: Tue, 17 Jul 2012 17:51:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2012 07:35 AM, Khem Raj wrote:
> pam_unix_acct.c: In function '_unix_run_verify_binary':
> pam_unix_acct.c:97:19: error: storage size of 'rlim' isn't known
> pam_unix_acct.c:106:19: error: 'RLIMIT_NOFILE' undeclared (first use in
> this function)
> pam_unix_acct.c:106:19: note: each undeclared identifier is reported
> only once for each function it appears in
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../pam/libpam/include-sys-resource.patch          |   12 ++++++++++++
>   meta/recipes-extended/pam/libpam_1.1.5.bb          |    6 ++++--
>   2 files changed, 16 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-extended/pam/libpam/include-sys-resource.patch
>
> diff --git a/meta/recipes-extended/pam/libpam/include-sys-resource.patch b/meta/recipes-extended/pam/libpam/include-sys-resource.patch
> new file mode 100644
> index 0000000..0108a88
> --- /dev/null
> +++ b/meta/recipes-extended/pam/libpam/include-sys-resource.patch
> @@ -0,0 +1,12 @@

Missed that this needs an Upstream-Status and Signed-off-by along with 
any more describive info needed

Please fix

Thanks
	Sau!

> +Index: Linux-PAM-1.1.5/modules/pam_unix/pam_unix_acct.c
> +===================================================================
> +--- Linux-PAM-1.1.5.orig/modules/pam_unix/pam_unix_acct.c	2012-07-04 12:37:44.881136025 -0700
> ++++ Linux-PAM-1.1.5/modules/pam_unix/pam_unix_acct.c	2012-07-04 12:38:00.601136785 -0700
> +@@ -47,6 +47,7 @@
> + #include <time.h>		/* for time() */
> + #include <errno.h>
> + #include <sys/wait.h>
> ++#include <sys/resource.h>
> +
> + #include <security/_pam_macros.h>
> +
> diff --git a/meta/recipes-extended/pam/libpam_1.1.5.bb b/meta/recipes-extended/pam/libpam_1.1.5.bb
> index 08ce1d1..275e5d8 100644
> --- a/meta/recipes-extended/pam/libpam_1.1.5.bb
> +++ b/meta/recipes-extended/pam/libpam_1.1.5.bb
> @@ -9,12 +9,14 @@ SECTION = "base"
>   LICENSE = "GPLv2+ | BSD"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=ca0395de9a86191a078b8b79302e3083"
>
> -PR = "r3"
> +PR = "r4"
>
>   SRC_URI = "https://fedorahosted.org/releases/l/i/linux-pam/Linux-PAM-${PV}.tar.bz2 \
>              file://99_pam \
>              file://pam.d/* \
> -           file://libpam-xtests.patch"
> +           file://libpam-xtests.patch \
> +           file://include-sys-resource.patch \
> +          "
>
>   SRC_URI_append_libc-uclibc = " file://pam-no-innetgr.patch"
>
>



