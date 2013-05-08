Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ua5iz-0000xw-LX
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 16:52:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 May 2013 07:34:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,635,1363158000"; d="scan'208";a="334426495"
Received: from unknown (HELO [10.255.13.9]) ([10.255.13.9])
	by fmsmga002.fm.intel.com with ESMTP; 08 May 2013 07:34:06 -0700
Message-ID: <518A625D.5060301@linux.intel.com>
Date: Wed, 08 May 2013 07:34:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
References: <1368019997-2015-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1368019997-2015-1-git-send-email-bogdan.a.marinescu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] btrfs-tools: upgraded to 0.20-rc1
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
X-List-Received-Date: Wed, 08 May 2013 14:52:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2013 06:33 AM, Bogdan Marinescu wrote:
> 'fix_use_of_gcc.patch' was integrated in the main repository.
>
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>   .../btrfs-tools/btrfs-tools/fix_use_of_gcc.patch   |   31 --------------------
>   .../btrfs-tools/btrfs-tools_git.bb                 |    9 ++----
>   2 files changed, 3 insertions(+), 37 deletions(-)
>   delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
>
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
> deleted file mode 100644
> index 7f6594a..0000000
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -Nitin A Kamble <nitin.a.kamble@intel.com> 2011/06/09
> -Upstream-Status: Pending
> -
> -Avoid these kinds of errors while doing cross build:
> -
> -| ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/build0/tmp/sysroots/qemux86 -Wp,-MMD,./.btrfsctl.o.d,-MT,btrfsctl.o -Wall -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2 -O2 -pipe -g -feliminate-unused-debug-types -c btrfsctl.c
> -| gcc -O2 -pipe -g -feliminate-unused-debug-types -o btrfsctl btrfsctl.o ctree.o disk-io.o radix-tree.o extent-tree.o print-tree.o root-tree.o dir-item.o file-item.o inode-item.o inode-map.o crc32c.o rbtree.o extent-cache.o extent_io.o volumes.o utils.o btrfs-list.o -Wl,-O1  -Wl,--as-needed -luuid
> -| /usr/bin/ld: i386 architecture of input file `btrfsctl.o' is incompatible with i386:x86-64 output
> -| /usr/bin/ld: i386 architecture of input file `ctree.o' is incompatible with i386:x86-64 output
> -
> -Index: git/Makefile
> -===================================================================
> ---- git.orig/Makefile
> -+++ git/Makefile
> -@@ -41,13 +41,13 @@ btrfs: $(objects) btrfs.o btrfs_cmds.o s
> - 		$(objects) $(LDFLAGS) $(LIBS)
> -
> - calc-size: $(objects) calc-size.o
> --	gcc $(CFLAGS) -o calc-size calc-size.o $(objects) $(LDFLAGS) $(LIBS)
> -+	$(CC) $(CFLAGS) -o calc-size calc-size.o $(objects) $(LDFLAGS) $(LIBS)
> -
> - find-root: $(objects) find-root.o
> --	gcc $(CFLAGS) -o find-root find-root.o $(objects) $(LDFLAGS) $(LIBS)
> -+	$(CC) $(CFLAGS) -o find-root find-root.o $(objects) $(LDFLAGS) $(LIBS)
> -
> - restore: $(objects) restore.o
> --	gcc $(CFLAGS) -o restore restore.o $(objects) $(LDFLAGS) $(LIBS) $(RESTORE_LIBS)
> -+	$(CC) $(CFLAGS) -o restore restore.o $(objects) $(LDFLAGS) $(LIBS) $(RESTORE_LIBS)
> -
> - btrfsctl: $(objects) btrfsctl.o
> - 	$(CC) $(CFLAGS) -o btrfsctl btrfsctl.o $(objects) $(LDFLAGS) $(LIBS)
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> index ef575ae..51c1b08 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
> @@ -12,17 +12,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
>   SECTION = "base"
>   DEPENDS = "util-linux attr"
>
> -SRCREV = "fdb6c0402337d9607c7a39155088eaf033742752"
> +SRCREV = "89fe5b5f666c247aa3173745fb87c710f3a71a4a"
>   SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git;protocol=git"
>
>   S = "${WORKDIR}/git"
>
> -PV = "0.19+git${SRCPV}"
> +PV = "0.20-rc1+git${SRCPV}"
>

Is there a reason we are moving to an "rc1" instead of waiting for the 
final version to be released?

Sau!

> -PR = "r6"
> -
> -SRC_URI += " file://fix_use_of_gcc.patch \
> -	 file://weak-defaults.patch \
> +SRC_URI += " file://weak-defaults.patch \
>   	 file://fix_race_condition_with_multithreaded_make.patch "
>
>   SRC_URI[md5sum] = "78b1700d318de8518abfaab71f99a885"
>


