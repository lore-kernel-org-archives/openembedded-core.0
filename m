Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1TG6pX-0000Ca-Oa
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 13:28:03 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TG6d9-002Yxh-BH>; Mon, 24 Sep 2012 13:15:15 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TG6d9-001O5j-9u>; Mon, 24 Sep 2012 13:15:15 +0200
Received: from heinold by andorra.imp.fu-berlin.de with local (internal Exim
	4.72) id 1TG6d8-0001PR-70; Mon, 24 Sep 2012 13:15:14 +0200
Date: Mon, 24 Sep 2012 13:15:14 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org
Message-ID: <20120924111513.GA3763@mail.familie-heinold.de>
References: <1348484687-8019-1-git-send-email-andrei.adrianx.dinu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1348484687-8019-1-git-send-email-andrei.adrianx.dinu@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [PATCH] fix for bug 2577
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
X-List-Received-Date: Mon, 24 Sep 2012 11:28:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 24, 2012 at 02:04:47PM +0300, Andrei Dinu wrote:
> Upstream status : pending
> 
> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> ---
>  .../eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch      |   25 ++++++++++++++++++++
>  meta/recipes-core/eglibc/eglibc_2.16.bb            |    1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch
> 
> diff --git a/meta/recipes-core/eglibc/eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch b/meta/recipes-core/eglibc/eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch
> new file mode 100644
> index 0000000..f2480e5
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch
> @@ -0,0 +1,25 @@
> +From 73890569c5048aef34d9a6f08907895a53211d72 Mon Sep 17 00:00:00 2001
> +From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> +Date: Mon, 24 Sep 2012 10:21:49 +0300
> +Subject: [PATCH] updated version
> +
> +Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> +---
> + .../libc/ports/sysdeps/arm/dl-machine.h            |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +ndex 8d905e8..dcfa71e 100644
> +--- libc.orig/ports/sysdeps/arm/dl-machine.h
> ++++ libc/ports/sysdeps/arm/dl-machine.h
> +@@ -503,7 +503,7 @@ elf_machine_rel (struct link_map *map, const Elf32_Rel *reloc,
> + 
> + 	case R_ARM_TLS_DTPOFF32:
> + 	  if (sym != NULL)
> +-	    *reloc_addr += sym->st_value;
> ++	    *reloc_addr = sym->st_value;
> + 	  break;
> + 
> + 	case R_ARM_TLS_TPOFF32:
> +-- 
> +1.7.9.5
> +
> diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
> index 78dc44a..68da385 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.16.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
> @@ -29,6 +29,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=h
>             file://0001-eglibc-menuconfig-support.patch \
>             file://0002-eglibc-menuconfig-hex-string-options.patch \
>             file://0003-eglibc-menuconfig-build-instructions.patch \
> +           file://0001-R_ARM_TLS_DTPOFF32.patch \
>            "
>  LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
>        file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
> -- 
> 1.7.9.5

Please resend the patch, with a better/correct commit msg.

Bye Henning


