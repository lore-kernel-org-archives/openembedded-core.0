Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UA89I-0005Q8-S0
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 01:12:01 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Feb 2013 15:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,736,1355126400"; d="scan'208";a="291703652"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2013 15:55:41 -0800
Message-ID: <512BF9FD.7030702@linux.intel.com>
Date: Mon, 25 Feb 2013 15:55:41 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Ming Liu <ming.liu@windriver.com>
References: <1361768629-6911-1-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1361768629-6911-1-git-send-email-ming.liu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] parted: fix several integer overflows
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
X-List-Received-Date: Tue, 26 Feb 2013 00:12:04 -0000
X-List-Received-Date: Tue, 26 Feb 2013 00:12:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2013 09:03 PM, Ming Liu wrote:
> Integer overflows was found in libparted/labels/dvh.c, while attemptting
> assign unsigned int values to int types in some places. These overflows
> only can be observed on BE platforms like MIPS, when the "WORDS_BIGENDIAN"
> macro is defined in parted.
>
> Defined by unsigned int instead.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>   .../parted/parted-3.1/fix-dvh-overflows.patch      | 34 ++++++++++++++++++++++
>   meta/recipes-extended/parted/parted_3.1.bb         |  5 ++--
>   2 files changed, 37 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-extended/parted/parted-3.1/fix-dvh-overflows.patch
>
> diff --git a/meta/recipes-extended/parted/parted-3.1/fix-dvh-overflows.patch b/meta/recipes-extended/parted/parted-3.1/fix-dvh-overflows.patch
> new file mode 100644
> index 0000000..0768642
> --- /dev/null
> +++ b/meta/recipes-extended/parted/parted-3.1/fix-dvh-overflows.patch
> @@ -0,0 +1,34 @@
> +Upstream-Status: Pending
> +
Please add Signed-off-by: to the patch also.

Thanks
	Sau!

> +---
> + dvh.h |   10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +Index: parted-3.1/libparted/labels/dvh.h
> +===================================================================
> +--- parted-3.1.orig/libparted/labels/dvh.h	2013-02-25 10:46:13.204477586 +0800
> ++++ parted-3.1/libparted/labels/dvh.h	2013-02-25 10:47:20.954477065 +0800
> +@@ -112,8 +112,8 @@ struct device_parameters {
> +
> + struct volume_directory {
> + 	char	vd_name[VDNAMESIZE];	/* name */
> +-	int	vd_lbn;			/* logical block number */
> +-	int	vd_nbytes;		/* file length in bytes */
> ++	unsigned int	vd_lbn;		/* logical block number */
> ++	unsigned int	vd_nbytes;	/* file length in bytes */
> + };
> +
> + /*
> +@@ -125,9 +125,9 @@ struct volume_directory {
> +  * NOTE: pt_firstlbn SHOULD BE CYLINDER ALIGNED
> +  */
> + struct partition_table {		/* one per logical partition */
> +-	int	pt_nblks;		/* # of logical blks in partition */
> +-	int	pt_firstlbn;		/* first lbn of partition */
> +-	int	pt_type;		/* use of partition */
> ++	unsigned int	pt_nblks;	/* # of logical blks in partition */
> ++	unsigned int	pt_firstlbn;	/* first lbn of partition */
> ++	int		pt_type;	/* use of partition */
> + };
> +
> + #define	PTYPE_VOLHDR	0		/* partition is volume header */
> diff --git a/meta/recipes-extended/parted/parted_3.1.bb b/meta/recipes-extended/parted/parted_3.1.bb
> index 21d3a66..079b295 100644
> --- a/meta/recipes-extended/parted/parted_3.1.bb
> +++ b/meta/recipes-extended/parted/parted_3.1.bb
> @@ -4,13 +4,14 @@ LICENSE = "GPLv3+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
>   SECTION = "console/tools"
>   DEPENDS = "ncurses readline util-linux"
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
>              file://no_check.patch \
>              file://syscalls.patch \
>              file://fix-git-version-gen.patch \
> -           file://fix-doc-mandir.patch"
> +           file://fix-doc-mandir.patch \
> +           file://fix-dvh-overflows.patch"
>
>   SRC_URI[md5sum] = "5d89d64d94bcfefa9ce8f59f4b81bdcb"
>   SRC_URI[sha256sum] = "5e9cc1f91eaf016e5033d85b9b893fd6d3ffaca532a48de1082df9b94225ca15"
>


