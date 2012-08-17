Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2PYy-00024z-1H
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 18:38:21 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Aug 2012 09:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="182285877"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by azsmga001.ch.intel.com with ESMTP; 17 Aug 2012 09:26:18 -0700
Message-ID: <502E70A9.5070506@linux.intel.com>
Date: Fri, 17 Aug 2012 09:26:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344498612-23079-1-git-send-email-radu.moisan@intel.com>
In-Reply-To: <1344498612-23079-1-git-send-email-radu.moisan@intel.com>
Subject: Re: [PATCH] grub: Update to upstream stable 2.00
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
X-List-Received-Date: Fri, 17 Aug 2012 16:38:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2012 12:50 AM, Radu Moisan wrote:

You need to add details about why you are removing the patches, where 
they added to the upstream? Obsoleted?

When removing patch files, please explain why.

Thanks
	Sau!

> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>   ...rub-1.99-gcc-4.7.0-strict-aliasing-errors.patch |  147 ----------------
>   ...b-1.99-gcc-4.7.0-uninitialized-var-errors.patch |   41 -----
>   .../grub/files/grub-1.99-gcc-4.7.0.patch           |   34 ----
>   .../files/grub-1.99_fix_for_automake_1.11.2.patch  |  179 --------------------
>   .../grub/grub-1.99/grub-1.99-lazy_stat.patch       |   64 -------
>   .../grub/{grub-1.99 => grub-2.00}/40_custom        |    0
>   .../{grub-1.99 => grub-2.00}/grub-install.in.patch |    0
>   .../{grub-1.99 => grub-2.00}/remove-gets.patch     |    0
>   .../grub/{grub_1.99.bb => grub_2.00.bb}            |   16 +-
>   9 files changed, 7 insertions(+), 474 deletions(-)
>   delete mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch
>   delete mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch
>   delete mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0.patch
>   delete mode 100644 meta/recipes-bsp/grub/files/grub-1.99_fix_for_automake_1.11.2.patch
>   delete mode 100644 meta/recipes-bsp/grub/grub-1.99/grub-1.99-lazy_stat.patch
>   rename meta/recipes-bsp/grub/{grub-1.99 => grub-2.00}/40_custom (100%)
>   rename meta/recipes-bsp/grub/{grub-1.99 => grub-2.00}/grub-install.in.patch (100%)
>   rename meta/recipes-bsp/grub/{grub-1.99 => grub-2.00}/remove-gets.patch (100%)
>   rename meta/recipes-bsp/grub/{grub_1.99.bb => grub_2.00.bb} (69%)
>
> diff --git a/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch b/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch
> deleted file mode 100644
> index 9d81050..0000000
> --- a/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch
> +++ /dev/null
> @@ -1,147 +0,0 @@
> -Upstream-Status: Pending
> -
> -This patch fixes these strick-aliasing errors with gcc 4.7
> -
> -
> -| gcc -DHAVE_CONFIG_H -I. -I..  -Wall -W -I../include -I../include  -DGRUB_MACHINE_EFI=1 -DGRUB_MACHINE=I386_EFI -nostdinc -isystem /usr/lib/gcc/x86_64-redhat-linux/4.7.0/include -DGRUB_FILE=\"fs/zfs/zfs.c\" -I. -I. -I.. -I.. -I../include -I../include    -isystem/home/nitin/builds/build0/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -g -feliminate-unused-debug-types -Wall -W -Wshadow -Wpointer-arith -Wmissing-prototypes -Wundef -Wstrict-prototypes -g -falign-jumps=1 -falign-loops=1 -falign-functions=1 -mno-mmx -mno-sse -mno-sse2 -mno-3dnow -fno-dwarf2-cfi-asm -m32 -fno-stack-protector -mno-stack-arg-probe -Werror -Wno-trampolines          -ffreestanding  -isystem/home/nitin/builds/build0/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c -o fs/zfs/zfs_module-zfs.o `test -f 'fs/zfs/zfs.c' || echo './'`fs/zfs/zfs.c
> -| fs/zfs/zfs.c: In function 'get_filesystem_dnode':
> -| fs/zfs/zfs.c:1449:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c:1449:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c: In function 'make_mdn':
> -| fs/zfs/zfs.c:1478:3: error: dereferencing type-punned pointer will break strict-alERROR: Function failed: do_compile (see /home/nitin/builds/build0/tmp/work/x86_64-linux/grub-efi-i586-native-1.99-r7/temp/log.do_compile.9293 for further information)
> -| iasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c: In function 'dnode_get_fullpath':
> -| fs/zfs/zfs.c:1554:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c:1554:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c:1571:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c:1571:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c: In function 'grub_zfs_open':
> -| fs/zfs/zfs.c:2234:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c:2234:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c: In function 'fill_fs_info':
> -| fs/zfs/zfs.c:2362:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c:2362:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c:2395:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c:2395:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c: In function 'iterate_zap':
> -| fs/zfs/zfs.c:2420:5: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c:2420:5: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c: In function 'grub_zfs_dir':
> -| fs/zfs/zfs.c:2483:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c:2483:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c:2484:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c:2484:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c:2502:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| fs/zfs/zfs.c:2502:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
> -| cc1: all warnings being treated as errors
> -| make[3]: *** [fs/zfs/zfs_module-zfs.o] Error 1
> -
> -Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> -2012/04/13
> -
> -Index: grub-1.99/grub-core/fs/zfs/zfs.c
> -===================================================================
> ---- grub-1.99.orig/grub-core/fs/zfs/zfs.c
> -+++ grub-1.99/grub-core/fs/zfs/zfs.c
> -@@ -1446,7 +1446,8 @@ get_filesystem_dnode (dnode_end_t * mosm
> -       ch = *fsname;
> -       *fsname = 0;
> -
> --      childobj = grub_zfs_to_cpu64 ((((dsl_dir_phys_t *) DN_BONUS (&mdn->dn)))->dd_child_dir_zapobj, mdn->endian);
> -+      dsl_dir_phys_t * tmp =  DN_BONUS (&mdn->dn);
> -+      childobj = grub_zfs_to_cpu64 (tmp->dd_child_dir_zapobj, mdn->endian);
> -       err = dnode_get (mosmdn, childobj,
> - 		       DMU_OT_DSL_DIR_CHILD_MAP, mdn, data);
> -       if (err)
> -@@ -1475,7 +1476,8 @@ make_mdn (dnode_end_t * mdn, struct grub
> -
> -   grub_dprintf ("zfs", "endian = %d\n", mdn->endian);
> -
> --  bp = &(((dsl_dataset_phys_t *) DN_BONUS (&mdn->dn))->ds_bp);
> -+  dsl_dataset_phys_t * tmp = DN_BONUS(&mdn->dn);
> -+  bp = &(tmp->ds_bp);
> -   err = zio_read (bp, mdn->endian, &osp, &ospsize, data);
> -   if (err)
> -     return err;
> -@@ -1551,7 +1553,8 @@ dnode_get_fullpath (const char *fullpath
> -
> -   grub_dprintf ("zfs", "alive\n");
> -
> --  headobj = grub_zfs_to_cpu64 (((dsl_dir_phys_t *) DN_BONUS (&dn->dn))->dd_head_dataset_obj, dn->endian);
> -+  dsl_dir_phys_t * tmp1 = DN_BONUS (&dn->dn);
> -+  headobj = grub_zfs_to_cpu64 (tmp1->dd_head_dataset_obj, dn->endian);
> -
> -   grub_dprintf ("zfs", "endian = %d\n", mdn->endian);
> -
> -@@ -1568,7 +1571,8 @@ dnode_get_fullpath (const char *fullpath
> -     {
> -       grub_uint64_t snapobj;
> -
> --      snapobj = grub_zfs_to_cpu64 (((dsl_dataset_phys_t *) DN_BONUS (&mdn->dn))->ds_snapnames_zapobj, mdn->endian);
> -+      dsl_dataset_phys_t * tmp2 = DN_BONUS (&mdn->dn);
> -+      snapobj = grub_zfs_to_cpu64 (tmp2->ds_snapnames_zapobj, mdn->endian);
> -
> -       err = dnode_get (&(data->mos), snapobj,
> - 		       DMU_OT_DSL_DS_SNAP_MAP, mdn, data);
> -@@ -2231,7 +2235,8 @@ grub_zfs_open (struct grub_file *file, c
> -     }
> -   else
> -     {
> --      file->size = grub_zfs_to_cpu64 (((znode_phys_t *) DN_BONUS (&data->dnode.dn))->zp_size, data->dnode.endian);
> -+      znode_phys_t * tmp =  DN_BONUS (&data->dnode.dn);
> -+      file->size = grub_zfs_to_cpu64 (tmp->zp_size, data->dnode.endian);
> -     }
> -
> -   file->data = data;
> -@@ -2359,7 +2364,8 @@ fill_fs_info (struct grub_dirhook_info *
> -
> -   if (mdn.dn.dn_type == DMU_OT_DSL_DIR)
> -     {
> --      headobj = grub_zfs_to_cpu64 (((dsl_dir_phys_t *) DN_BONUS (&mdn.dn))->dd_head_dataset_obj, mdn.endian);
> -+      dsl_dir_phys_t * tmp1 = DN_BONUS (&mdn.dn);
> -+      headobj = grub_zfs_to_cpu64 (tmp1->dd_head_dataset_obj, mdn.endian);
> -
> -       err = dnode_get (&(data->mos), headobj, DMU_OT_DSL_DATASET, &mdn, data);
> -       if (err)
> -@@ -2392,7 +2398,8 @@ fill_fs_info (struct grub_dirhook_info *
> -     }
> -
> -   info->mtimeset = 1;
> --  info->mtime = grub_zfs_to_cpu64 (((znode_phys_t *) DN_BONUS (&dn.dn))->zp_mtime[0], dn.endian);
> -+  znode_phys_t * tmp2 = DN_BONUS (&dn.dn);
> -+  info->mtime = grub_zfs_to_cpu64 (tmp2->zp_mtime[0], dn.endian);
> -   return;
> - }
> -
> -@@ -2417,7 +2424,8 @@ grub_zfs_dir (grub_device_t device, cons
> -
> -     dnode_get (&(data->mdn), val, 0, &dn, data);
> -     info.mtimeset = 1;
> --    info.mtime = grub_zfs_to_cpu64 (((znode_phys_t *) DN_BONUS (&dn.dn))->zp_mtime[0], dn.endian);
> -+    znode_phys_t * tmp1 = DN_BONUS (&dn.dn);
> -+    info.mtime = grub_zfs_to_cpu64 (tmp1->zp_mtime[0], dn.endian);
> -     info.dir = (dn.dn.dn_type == DMU_OT_DIRECTORY_CONTENTS);
> -     grub_dprintf ("zfs", "type=%d, name=%s\n",
> - 		  (int)dn.dn.dn_type, (char *)name);
> -@@ -2480,8 +2488,9 @@ grub_zfs_dir (grub_device_t device, cons
> -       fill_fs_info (&info, data->dnode, data);
> -       hook ("@", &info);
> -
> --      childobj = grub_zfs_to_cpu64 (((dsl_dir_phys_t *) DN_BONUS (&data->dnode.dn))->dd_child_dir_zapobj, data->dnode.endian);
> --      headobj = grub_zfs_to_cpu64 (((dsl_dir_phys_t *) DN_BONUS (&data->dnode.dn))->dd_head_dataset_obj, data->dnode.endian);
> -+      dsl_dir_phys_t * tmp2 = DN_BONUS (&data->dnode.dn);
> -+      childobj = grub_zfs_to_cpu64 (tmp2->dd_child_dir_zapobj, data->dnode.endian);
> -+      headobj = grub_zfs_to_cpu64 (tmp2->dd_head_dataset_obj, data->dnode.endian);
> -       err = dnode_get (&(data->mos), childobj,
> - 		       DMU_OT_DSL_DIR_CHILD_MAP, &dn, data);
> -       if (err)
> -@@ -2499,7 +2508,8 @@ grub_zfs_dir (grub_device_t device, cons
> - 	  return err;
> - 	}
> -
> --      snapobj = grub_zfs_to_cpu64 (((dsl_dataset_phys_t *) DN_BONUS (&dn.dn))->ds_snapnames_zapobj, dn.endian);
> -+      dsl_dataset_phys_t * tmp3 = DN_BONUS (&dn.dn);
> -+      snapobj = grub_zfs_to_cpu64 (tmp3->ds_snapnames_zapobj, dn.endian);
> -
> -       err = dnode_get (&(data->mos), snapobj,
> - 		       DMU_OT_DSL_DS_SNAP_MAP, &dn, data);
> diff --git a/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch b/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch
> deleted file mode 100644
> index f812147..0000000
> --- a/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -Upstream-Status: Pending
> -
> -This patch quitens this error:
> -
> -| make[3]: Entering directory
> -`/home/nitin/builds/build0/tmp/work/x86_64-linux/grub-efi-i586-native-1.99-r7/grub-1.99/grub-core'
> -| gcc -DHAVE_CONFIG_H -I. -I..  -Wall -W -I../include -I../include
> --DGRUB_MACHINE_EFI=1 -DGRUB_MACHINE=I386_EFI -nostdinc -isystem
> -/usr/lib/gcc/x86_64-redhat-linux/4.7.0/include -DGRUB_FILE=\"fs/btrfs.c\" -I.
> --I. -I.. -I.. -I../include -I../include
> --isystem/home/nitin/builds/build0/tmp/sysroots/x86_64-linux/usr/include -O2
> --pipe -g -feliminate-unused-debug-types -Wall -W -Wshadow -Wpointer-arith
> --Wmissing-prototypes -Wundef -Wstrict-prototypes -g -falign-jumps=1
> --falign-loops=1 -falign-functions=1 -mno-mmx -mno-sse -mno-sse2 -mno-3dnow
> --fno-dwarf2-cfi-asm -m32 -fno-stack-protector -mno-stack-arg-probe -Werror
> --Wno-trampolines          -ffreestanding
> --isystem/home/nitin/builds/build0/tmp/sysroots/x86_64-linux/usr/include -O2
> --pipe -c -o fs/btrfs_module-btrfs.o `test -f 'fs/btrfs.c' || echo
> -'./'`fs/btrfs.c
> -| fs/btrfs.c: In function 'grub_btrfs_read_logical':
> -| fs/btrfs.c:791:5: error: 'err' may be used uninitialized in this function
> -[-Werror=maybe-uninitialized]
> -| fs/btrfs.c:592:18: note: 'err' was declared here
> -| cc1: all warnings being treated as errors
> -| make[3]: *** [fs/btrfs_module-btrfs.o] Error 1
> -
> -Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> -2012/04/13
> -Index: grub-1.99/grub-core/fs/btrfs.c
> -===================================================================
> ---- grub-1.99.orig/grub-core/fs/btrfs.c
> -+++ grub-1.99/grub-core/fs/btrfs.c
> -@@ -589,7 +589,7 @@ grub_btrfs_read_logical (struct grub_btr
> -       struct grub_btrfs_key *key;
> -       struct grub_btrfs_chunk_item *chunk;
> -       grub_uint64_t csize;
> --      grub_err_t err;
> -+      grub_err_t err = 0;
> -       struct grub_btrfs_key key_out;
> -       int challoc = 0;
> -       grub_device_t dev;
> diff --git a/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0.patch b/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0.patch
> deleted file mode 100644
> index 545954a..0000000
> --- a/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -Upstream-Status: backport from fedora
> -
> -2012/04/13
> -Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> -
> -From b0f4ef523b69a497d69820c09bbb07484a6b09cc Mon Sep 17 00:00:00 2001
> -From: Peter Jones <pjones@redhat.com>
> -Date: Wed, 7 Mar 2012 09:53:50 -0500
> -Subject: [PATCH] Fix gcc error that kills build.
> -
> ----
> - conf/Makefile.common         |    4 ++--
> - 1 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/conf/Makefile.common b/conf/Makefile.common
> -index 2040a2e..b3ba765 100644
> ---- a/conf/Makefile.common
> -+++ b/conf/Makefile.common
> -@@ -11,10 +11,10 @@ if COND_i386_pc
> -   CFLAGS_PLATFORM += -mrtd -mregparm=3
> - endif
> - if COND_i386_efi
> --  LDFLAGS_PLATFORM = -melf_i386
> -+  LDFLAGS_PLATFORM = -m32
> - endif
> - if COND_x86_64_efi
> --  LDFLAGS_PLATFORM = -melf_x86_64
> -+  LDFLAGS_PLATFORM = -m64
> - endif
> - if COND_i386_qemu
> -   CFLAGS_PLATFORM += -mrtd -mregparm=3
> ---
> -1.7.7.6
> -
> diff --git a/meta/recipes-bsp/grub/files/grub-1.99_fix_for_automake_1.11.2.patch b/meta/recipes-bsp/grub/files/grub-1.99_fix_for_automake_1.11.2.patch
> deleted file mode 100644
> index 459b4fc..0000000
> --- a/meta/recipes-bsp/grub/files/grub-1.99_fix_for_automake_1.11.2.patch
> +++ /dev/null
> @@ -1,179 +0,0 @@
> -Upstream-Status: Backport
> -
> -http://bzr.savannah.gnu.org/lh/grub/trunk/grub/revision/3766
> -    Handle newer autotools. Add some missing quotes while on it.
> -
> -http://bzr.savannah.gnu.org/lh/grub/trunk/grub/revision/3983
> -    gentpl.py: Remove obsolete pkglib_DATA handling.
> -
> -Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index 9301c91..d706968 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -101,8 +101,8 @@ CLEANFILES += widthspec.h
> - # Install config.h into platformdir
> - platform_HEADERS = config.h
> -
> --pkglib_DATA += grub-mkconfig_lib
> --pkglib_DATA += update-grub_lib
> -+pkgdata_DATA += grub-mkconfig_lib
> -+pkgdata_DATA += update-grub_lib
> -
> -
> - if COND_i386_coreboot
> -diff --git a/conf/Makefile.common b/conf/Makefile.common
> -index 5aa13cd..2040a2e 100644
> ---- a/conf/Makefile.common
> -+++ b/conf/Makefile.common
> -@@ -137,7 +137,7 @@ KERNEL_HEADER_FILES =
> -
> - man_MANS =
> - noinst_DATA =
> --pkglib_DATA =
> -+pkgdata_DATA =
> - bin_SCRIPTS =
> - sbin_SCRIPTS =
> - bin_PROGRAMS =
> -@@ -147,7 +147,6 @@ check_SCRIPTS =
> - grubconf_DATA =
> - check_PROGRAMS =
> - noinst_SCRIPTS =
> --pkglib_SCRIPTS =
> - noinst_PROGRAMS =
> - grubconf_SCRIPTS =
> - noinst_LIBRARIES =
> -diff --git a/gentpl.py b/gentpl.py
> -index a42a606..7992376 100644
> ---- a/gentpl.py
> -+++ b/gentpl.py
> -@@ -440,7 +440,7 @@ def script(platform):
> -     r += "[+ ENDIF +]"
> -
> -     r += rule("[+ name +]", platform_sources(platform) + " $(top_builddir)/config.status", """
> --$(top_builddir)/config.status --file=-:$< | sed -e 's,@pkglib_DATA@,$(pkglib_DATA),g' > $@
> -+$(top_builddir)/config.status --file=$@:$<
> - chmod a+x [+ name +]
> - """)
> -
> -diff --git a/util/grub-mkconfig.in b/util/grub-mkconfig.in
> -index afc66f8..0c81084 100644
> ---- a/util/grub-mkconfig.in
> -+++ b/util/grub-mkconfig.in
> -@@ -95,7 +95,7 @@ do
> -     esac
> - done
> -
> --. ${libdir}/grub/grub-mkconfig_lib
> -+. ${datadir}/grub/grub-mkconfig_lib
> -
> - if [ "x$EUID" = "x" ] ; then
> -   EUID=`id -u`
> -diff --git a/util/grub.d/00_header.in b/util/grub.d/00_header.in
> -index 9da1511..30d61f1 100644
> ---- a/util/grub.d/00_header.in
> -+++ b/util/grub.d/00_header.in
> -@@ -25,7 +25,7 @@ libdir=@libdir@
> - locale_dir=`echo ${GRUB_PREFIX}/locale | sed ${transform}`
> - grub_lang=`echo $LANG | cut -d . -f 1`
> -
> --. ${libdir}/grub/grub-mkconfig_lib
> -+. @datadir@/grub/grub-mkconfig_lib
> -
> - # Do this as early as possible, since other commands might depend on it.
> - # (e.g. the `loadfont' command might need lvm or raid modules)
> -diff --git a/util/grub.d/10_hurd.in b/util/grub.d/10_hurd.in
> -index 8c54eab..d823ba3 100644
> ---- a/util/grub.d/10_hurd.in
> -+++ b/util/grub.d/10_hurd.in
> -@@ -20,7 +20,7 @@ set -e
> - prefix=@prefix@
> - exec_prefix=@exec_prefix@
> - libdir=@libdir@
> --. ${libdir}/grub/grub-mkconfig_lib
> -+. @datadir@/grub/grub-mkconfig_lib
> -
> - CLASS="--class gnu --class os"
> -
> -diff --git a/util/grub.d/10_kfreebsd.in b/util/grub.d/10_kfreebsd.in
> -index 3600c74..fd8399b 100644
> ---- a/util/grub.d/10_kfreebsd.in
> -+++ b/util/grub.d/10_kfreebsd.in
> -@@ -21,7 +21,7 @@ prefix=@prefix@
> - exec_prefix=@exec_prefix@
> - bindir=@bindir@
> - libdir=@libdir@
> --. ${libdir}/grub/grub-mkconfig_lib
> -+. @datadir@/grub/grub-mkconfig_lib
> -
> - export TEXTDOMAIN=@PACKAGE@
> - export TEXTDOMAINDIR=@localedir@
> -diff --git a/util/grub.d/10_linux.in b/util/grub.d/10_linux.in
> -index 1d1eb40..0977700 100644
> ---- a/util/grub.d/10_linux.in
> -+++ b/util/grub.d/10_linux.in
> -@@ -21,7 +21,7 @@ prefix=@prefix@
> - exec_prefix=@exec_prefix@
> - bindir=@bindir@
> - libdir=@libdir@
> --. ${libdir}/grub/grub-mkconfig_lib
> -+. @datadir@/grub/grub-mkconfig_lib
> -
> - export TEXTDOMAIN=@PACKAGE@
> - export TEXTDOMAINDIR=@localedir@
> -diff --git a/util/grub.d/10_netbsd.in b/util/grub.d/10_netbsd.in
> -index ffd31ad..ce77096 100644
> ---- a/util/grub.d/10_netbsd.in
> -+++ b/util/grub.d/10_netbsd.in
> -@@ -21,7 +21,7 @@ prefix=@prefix@
> - exec_prefix=@exec_prefix@
> - bindir=@bindir@
> - libdir=@libdir@
> --. ${libdir}/grub/grub-mkconfig_lib
> -+. @datadir@/grub/grub-mkconfig_lib
> -
> - export TEXTDOMAIN=@PACKAGE@
> - export TEXTDOMAINDIR=@localedir@
> -diff --git a/util/grub.d/10_windows.in b/util/grub.d/10_windows.in
> -index fd068dd..9b73dc6 100644
> ---- a/util/grub.d/10_windows.in
> -+++ b/util/grub.d/10_windows.in
> -@@ -20,7 +20,7 @@ set -e
> - prefix=@prefix@
> - exec_prefix=@exec_prefix@
> - libdir=@libdir@
> --. ${libdir}/grub/grub-mkconfig_lib
> -+. @datadir@/grub/grub-mkconfig_lib
> -
> - case "`uname 2>/dev/null`" in
> -   CYGWIN*)  ;;
> -diff --git a/util/grub.d/20_linux_xen.in b/util/grub.d/20_linux_xen.in
> -index a900760..aef5bea 100644
> ---- a/util/grub.d/20_linux_xen.in
> -+++ b/util/grub.d/20_linux_xen.in
> -@@ -21,7 +21,7 @@ prefix=@prefix@
> - exec_prefix=@exec_prefix@
> - bindir=@bindir@
> - libdir=@libdir@
> --. ${libdir}/grub/grub-mkconfig_lib
> -+. @datadir@/grub/grub-mkconfig_lib
> -
> - export TEXTDOMAIN=@PACKAGE@
> - export TEXTDOMAINDIR=@localedir@
> -diff --git a/util/grub.d/30_os-prober.in b/util/grub.d/30_os-prober.in
> -index d9d4b0a..485b224 100644
> ---- a/util/grub.d/30_os-prober.in
> -+++ b/util/grub.d/30_os-prober.in
> -@@ -21,7 +21,7 @@ prefix=@prefix@
> - exec_prefix=@exec_prefix@
> - libdir=@libdir@
> -
> --. ${libdir}/grub/grub-mkconfig_lib
> -+. @datadir@/grub/grub-mkconfig_lib
> -
> - if [ "x${GRUB_DISABLE_OS_PROBER}" = "xtrue" ]; then
> -   exit 0
> ---
> -1.7.7
> -
> diff --git a/meta/recipes-bsp/grub/grub-1.99/grub-1.99-lazy_stat.patch b/meta/recipes-bsp/grub/grub-1.99/grub-1.99-lazy_stat.patch
> deleted file mode 100644
> index cde8b87..0000000
> --- a/meta/recipes-bsp/grub/grub-1.99/grub-1.99-lazy_stat.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -Upstream-Status: Backport
> -
> -Patch is a slightly edited version from debian. Upstream link is:
> -http://bzr.savannah.gnu.org/lh/grub/trunk/grub/revision/3318
> -
> -Description: Don't stat devices unless we have to
> -Author: Vladimir Serbinenko <phcoder@gmail.com>
> -Author: Colin Watson <cjwatson@ubuntu.com>
> -Bug-Debian: http://bugs.debian.org/627587
> -Forwarded: yes
> -Applied-Upstream: http://bazaar.launchpad.net/~vcs-imports/grub/grub2-bzr/revision/3318
> -Last-Update: 2011-05-31
> -
> -Index: b/grub-core/kern/emu/getroot.c
> -===================================================================
> ---- a/grub-core/kern/emu/getroot.c
> -+++ b/grub-core/kern/emu/getroot.c
> -@@ -358,7 +358,7 @@
> -
> -       if (S_ISLNK (st.st_mode)) {
> - #ifdef __linux__
> --	if (strcmp (dir, "mapper") == 0) {
> -+	if (strcmp (dir, "mapper") == 0 || strcmp (dir, "/dev/mapper") == 0) {
> - 	  /* Follow symbolic links under /dev/mapper/; the canonical name
> - 	     may be something like /dev/dm-0, but the names under
> - 	     /dev/mapper/ are more human-readable and so we prefer them if
> -@@ -609,20 +609,27 @@
> -
> -   if (os_dev)
> -     {
> --      if (stat (os_dev, &st) >= 0)
> --	dev = st.st_rdev;
> --      else
> --	grub_util_error ("cannot stat `%s'", os_dev);
> --      free (os_dev);
> -+      char *tmp = os_dev;
> -+      os_dev = canonicalize_file_name (os_dev);
> -+      free (tmp);
> -     }
> --  else
> -+
> -+  if (os_dev)
> -     {
> --      if (stat (dir, &st) >= 0)
> --	dev = st.st_dev;
> --      else
> --	grub_util_error ("cannot stat `%s'", dir);
> -+      if (strncmp (os_dev, "/dev/dm-", sizeof ("/dev/dm-") - 1) != 0)
> -+	return os_dev;
> -+      if (stat (os_dev, &st) < 0)
> -+	grub_util_error ("cannot stat `%s'", os_dev);
> -+      free (os_dev);
> -+      dev = st.st_rdev;
> -+      return grub_find_device ("/dev/mapper", dev);
> -     }
> -
> -+  if (stat (dir, &st) < 0)
> -+    grub_util_error ("cannot stat `%s'", dir);
> -+
> -+  dev = st.st_dev;
> -+
> - #ifdef __CYGWIN__
> -   /* Cygwin specific function.  */
> -   os_dev = grub_find_device (dir, dev);
> diff --git a/meta/recipes-bsp/grub/grub-1.99/40_custom b/meta/recipes-bsp/grub/grub-2.00/40_custom
> similarity index 100%
> rename from meta/recipes-bsp/grub/grub-1.99/40_custom
> rename to meta/recipes-bsp/grub/grub-2.00/40_custom
> diff --git a/meta/recipes-bsp/grub/grub-1.99/grub-install.in.patch b/meta/recipes-bsp/grub/grub-2.00/grub-install.in.patch
> similarity index 100%
> rename from meta/recipes-bsp/grub/grub-1.99/grub-install.in.patch
> rename to meta/recipes-bsp/grub/grub-2.00/grub-install.in.patch
> diff --git a/meta/recipes-bsp/grub/grub-1.99/remove-gets.patch b/meta/recipes-bsp/grub/grub-2.00/remove-gets.patch
> similarity index 100%
> rename from meta/recipes-bsp/grub/grub-1.99/remove-gets.patch
> rename to meta/recipes-bsp/grub/grub-2.00/remove-gets.patch
> diff --git a/meta/recipes-bsp/grub/grub_1.99.bb b/meta/recipes-bsp/grub/grub_2.00.bb
> similarity index 69%
> rename from meta/recipes-bsp/grub/grub_1.99.bb
> rename to meta/recipes-bsp/grub/grub_2.00.bb
> index 9879651..73004d2 100644
> --- a/meta/recipes-bsp/grub/grub_1.99.bb
> +++ b/meta/recipes-bsp/grub/grub_2.00.bb
> @@ -13,25 +13,22 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>   DEPENDS = "autogen-native"
>   RDEPENDS_${PN} = "diffutils freetype"
> -PR = "r11"
> +PR = "r0"
>
>   SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>             file://grub-install.in.patch \
> -          file://grub-1.99_fix_for_automake_1.11.2.patch \
>             file://grub-1.99-fpmath-sse-387-fix.patch \
> -          file://grub-1.99-gcc-4.7.0.patch \
> -          file://grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch \
> -          file://grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch \
> -          file://grub-1.99-fix-enable_execute_stack-check.patch \
>             file://remove-gets.patch \
> -          file://grub-1.99-lazy_stat.patch \
>             file://40_custom"
>
> -SRC_URI[md5sum] = "ca9f2a2d571b57fc5c53212d1d22e2b5"
> -SRC_URI[sha256sum] = "b91f420f2c51f6155e088e34ff99bea09cc1fb89585cf7c0179644e57abd28ff"
> +SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
> +SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
>
>   COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
>
> +FILES_${PN}-dbg += "${libdir}/${BPN}/i386-pc/.debug"
> +
> +
>   inherit autotools
>   inherit gettext
>
> @@ -43,3 +40,4 @@ do_install_append () {
>   }
>
>   INSANE_SKIP_${PN} = "arch"
> +INSANE_SKIP_${PN}-dbg = "arch"
>


