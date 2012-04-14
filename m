Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SIvEU-0001cu-Av
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 07:09:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Apr 2012 21:59:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="153517549"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2012 21:59:46 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2012 21:59:44 -0700
Message-Id: <fbd5714f6522f556133f5f078bc7925f37f5c1e4.1334379293.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <faa747203f561dbd8c74f1797b7db3a6117661f3.1334379293.git.nitin.a.kamble@intel.com>
References: <faa747203f561dbd8c74f1797b7db3a6117661f3.1334379293.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1334379293.git.nitin.a.kamble@intel.com>
References: <cover.1334379293.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/3] grub-efi-native, grub: fix build with gcc 4.7
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
X-List-Received-Date: Sat, 14 Apr 2012 05:09:11 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This fixes bug [YOCTO #2293]

These build failure caused by gcc4.7 is fixed with a backport of a
grub-1.99 patch from fedora 17 alpha plus two more new patches

| gcc -DHAVE_CONFIG_H -I. -I..  -Wall -W -I../include -I../include
-DGRUB_MACHINE_EFI=1 -DGRUB_MACHINE=I386_EFI -nostdinc -isystem
/usr/lib/gcc/x86_64-redhat-linux/4.7.0/include
-DGRUB_FILE=\"commands/efi/acpi.c\" -I. -I. -I.. -I.. -I../include
-I../include
-isystem/home/nitin/builds/build0/tmp/sysroots/x86_64-linux/usr/include
-O2 -pipe -g -feliminate-unused-debug-types -Wall -W -Wshadow
-Wpointer-arith -Wmissing-prototypes -Wundef -Wstrict-prototypes -g
-falign-jumps=1 -falign-loops=1 -falign-functions=1 -mno-mmx -mno-sse
-mno-sse2 -mno-3dnow -fno-dwarf2-cfi-asm -m32 -fno-stack-protector
-mno-stack-arg-probe -Werror -Wno-trampolines          -ffreestanding
-isystem/home/nitin/builds/build0/tmp/sysroots/x86_64-linux/usr/include
-O2 -pipe -c -o commands/efi/acpi_module-acpi.o `test -f
'commands/efi/acpi.c' || echo './'`commands/efi/acpi.c
| gcc: error: unrecognized command line option '-melf_i386'
| make[3]: *** [trig.module] Error 1

| make[3]: Entering directory
`/home/nitin/builds/build0/tmp/work/x86_64-linux/grub-efi-i586-native-1.99-r7/grub-1.99/grub-core'
| gcc -DHAVE_CONFIG_H -I. -I..  -Wall -W -I../include -I../include
-DGRUB_MACHINE_EFI=1 -DGRUB_MACHINE=I386_EFI -nostdinc -isystem
/usr/lib/gcc/x86_64-redhat-linux/4.7.0/include
-DGRUB_FILE=\"fs/btrfs.c\" -I.
-I. -I.. -I.. -I../include -I../include
-isystem/home/nitin/builds/build0/tmp/sysroots/x86_64-linux/usr/include
-O2
-pipe -g -feliminate-unused-debug-types -Wall -W -Wshadow
-Wpointer-arith
-Wmissing-prototypes -Wundef -Wstrict-prototypes -g -falign-jumps=1
-falign-loops=1 -falign-functions=1 -mno-mmx -mno-sse -mno-sse2
-mno-3dnow
-fno-dwarf2-cfi-asm -m32 -fno-stack-protector -mno-stack-arg-probe
-Werror
-Wno-trampolines          -ffreestanding
-isystem/home/nitin/builds/build0/tmp/sysroots/x86_64-linux/usr/include
-O2
-pipe -c -o fs/btrfs_module-btrfs.o `test -f 'fs/btrfs.c' || echo
'./'`fs/btrfs.c
| fs/btrfs.c: In function 'grub_btrfs_read_logical':
| fs/btrfs.c:791:5: error: 'err' may be used uninitialized in this
function
[-Werror=maybe-uninitialized]
| fs/btrfs.c:592:18: note: 'err' was declared here
| cc1: all warnings being treated as errors
| make[3]: *** [fs/btrfs_module-btrfs.o] Error 1

| gcc -DHAVE_CONFIG_H -I. -I..  -Wall -W -I../include -I../include
-DGRUB_MACHINE_EFI=1 -DGRUB_MACHINE=I386_EFI -nostdinc -isystem
/usr/lib/gcc/x86_64-redhat-linux/4.7.0/include
-DGRUB_FILE=\"fs/zfs/zfs.c\" -I. -I. -I.. -I.. -I../include -I../include
-isystem/home/nitin/builds/build0/tmp/sysroots/x86_64-linux/usr/include
-O2 -pipe -g -feliminate-unused-debug-types -Wall -W -Wshadow
-Wpointer-arith -Wmissing-prototypes -Wundef -Wstrict-prototypes -g
-falign-jumps=1 -falign-loops=1 -falign-functions=1 -mno-mmx -mno-sse
-mno-sse2 -mno-3dnow -fno-dwarf2-cfi-asm -m32 -fno-stack-protector
-mno-stack-arg-probe -Werror -Wno-trampolines          -ffreestanding
-isystem/home/nitin/builds/build0/tmp/sysroots/x86_64-linux/usr/include
-O2 -pipe -c -o fs/zfs/zfs_module-zfs.o `test -f 'fs/zfs/zfs.c' || echo
'./'`fs/zfs/zfs.c
| fs/zfs/zfs.c: In function 'get_filesystem_dnode':
| fs/zfs/zfs.c:1449:7: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c:1449:7: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c: In function 'make_mdn':
| fs/zfs/zfs.c:1478:3: error: dereferencing type-punned pointer will
break strict-alERROR: Function failed: do_compile (see
/home/nitin/builds/build0/tmp/work/x86_64-linux/grub-efi-i586-native-1.99-r7/temp/log.do_compile.9293
for further information)
| iasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c: In function 'dnode_get_fullpath':
| fs/zfs/zfs.c:1554:3: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c:1554:3: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c:1571:7: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c:1571:7: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c: In function 'grub_zfs_open':
| fs/zfs/zfs.c:2234:7: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c:2234:7: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c: In function 'fill_fs_info':
| fs/zfs/zfs.c:2362:7: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c:2362:7: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c:2395:3: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c:2395:3: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c: In function 'iterate_zap':
| fs/zfs/zfs.c:2420:5: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c:2420:5: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c: In function 'grub_zfs_dir':
| fs/zfs/zfs.c:2483:7: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c:2483:7: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c:2484:7: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c:2484:7: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c:2502:7: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| fs/zfs/zfs.c:2502:7: error: dereferencing type-punned pointer will
break strict-aliasing rules [-Werror=strict-aliasing]
| cc1: all warnings being treated as errors
| make[3]: *** [fs/zfs/zfs_module-zfs.o] Error 1

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ...rub-1.99-gcc-4.7.0-strict-aliasing-errors.patch |  147 ++++++++++++++++++++
 ...b-1.99-gcc-4.7.0-uninitialized-var-errors.patch |   41 ++++++
 .../grub/files/grub-1.99-gcc-4.7.0.patch           |   34 +++++
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |    8 +-
 meta/recipes-bsp/grub/grub_1.99.bb                 |    3 +
 5 files changed, 231 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0.patch

diff --git a/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch b/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch
new file mode 100644
index 0000000..9d81050
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch
@@ -0,0 +1,147 @@
+Upstream-Status: Pending
+
+This patch fixes these strick-aliasing errors with gcc 4.7
+
+
+| gcc -DHAVE_CONFIG_H -I. -I..  -Wall -W -I../include -I../include  -DGRUB_MACHINE_EFI=1 -DGRUB_MACHINE=I386_EFI -nostdinc -isystem /usr/lib/gcc/x86_64-redhat-linux/4.7.0/include -DGRUB_FILE=\"fs/zfs/zfs.c\" -I. -I. -I.. -I.. -I../include -I../include    -isystem/home/nitin/builds/build0/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -g -feliminate-unused-debug-types -Wall -W -Wshadow -Wpointer-arith -Wmissing-prototypes -Wundef -Wstrict-prototypes -g -falign-jumps=1 -falign-loops=1 -falign-functions=1 -mno-mmx -mno-sse -mno-sse2 -mno-3dnow -fno-dwarf2-cfi-asm -m32 -fno-stack-protector -mno-stack-arg-probe -Werror -Wno-trampolines          -ffreestanding  -isystem/home/nitin/builds/build0/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c -o fs/zfs/zfs_module-zfs.o `test -f 'fs/zfs/zfs.c' || echo './'`fs/zfs/zfs.c
+| fs/zfs/zfs.c: In function 'get_filesystem_dnode':
+| fs/zfs/zfs.c:1449:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c:1449:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c: In function 'make_mdn':
+| fs/zfs/zfs.c:1478:3: error: dereferencing type-punned pointer will break strict-alERROR: Function failed: do_compile (see /home/nitin/builds/build0/tmp/work/x86_64-linux/grub-efi-i586-native-1.99-r7/temp/log.do_compile.9293 for further information)
+| iasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c: In function 'dnode_get_fullpath':
+| fs/zfs/zfs.c:1554:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c:1554:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c:1571:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c:1571:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c: In function 'grub_zfs_open':
+| fs/zfs/zfs.c:2234:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c:2234:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c: In function 'fill_fs_info':
+| fs/zfs/zfs.c:2362:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c:2362:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c:2395:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c:2395:3: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c: In function 'iterate_zap':
+| fs/zfs/zfs.c:2420:5: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c:2420:5: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c: In function 'grub_zfs_dir':
+| fs/zfs/zfs.c:2483:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c:2483:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c:2484:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c:2484:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c:2502:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| fs/zfs/zfs.c:2502:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasing]
+| cc1: all warnings being treated as errors
+| make[3]: *** [fs/zfs/zfs_module-zfs.o] Error 1
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/04/13
+
+Index: grub-1.99/grub-core/fs/zfs/zfs.c
+===================================================================
+--- grub-1.99.orig/grub-core/fs/zfs/zfs.c
++++ grub-1.99/grub-core/fs/zfs/zfs.c
+@@ -1446,7 +1446,8 @@ get_filesystem_dnode (dnode_end_t * mosm
+       ch = *fsname;
+       *fsname = 0;
+ 
+-      childobj = grub_zfs_to_cpu64 ((((dsl_dir_phys_t *) DN_BONUS (&mdn->dn)))->dd_child_dir_zapobj, mdn->endian);
++      dsl_dir_phys_t * tmp =  DN_BONUS (&mdn->dn);
++      childobj = grub_zfs_to_cpu64 (tmp->dd_child_dir_zapobj, mdn->endian);
+       err = dnode_get (mosmdn, childobj,
+ 		       DMU_OT_DSL_DIR_CHILD_MAP, mdn, data);
+       if (err)
+@@ -1475,7 +1476,8 @@ make_mdn (dnode_end_t * mdn, struct grub
+ 
+   grub_dprintf ("zfs", "endian = %d\n", mdn->endian);
+ 
+-  bp = &(((dsl_dataset_phys_t *) DN_BONUS (&mdn->dn))->ds_bp);
++  dsl_dataset_phys_t * tmp = DN_BONUS(&mdn->dn);
++  bp = &(tmp->ds_bp);
+   err = zio_read (bp, mdn->endian, &osp, &ospsize, data);
+   if (err)
+     return err;
+@@ -1551,7 +1553,8 @@ dnode_get_fullpath (const char *fullpath
+ 
+   grub_dprintf ("zfs", "alive\n");
+ 
+-  headobj = grub_zfs_to_cpu64 (((dsl_dir_phys_t *) DN_BONUS (&dn->dn))->dd_head_dataset_obj, dn->endian);
++  dsl_dir_phys_t * tmp1 = DN_BONUS (&dn->dn);
++  headobj = grub_zfs_to_cpu64 (tmp1->dd_head_dataset_obj, dn->endian);
+ 
+   grub_dprintf ("zfs", "endian = %d\n", mdn->endian);
+ 
+@@ -1568,7 +1571,8 @@ dnode_get_fullpath (const char *fullpath
+     {
+       grub_uint64_t snapobj;
+ 
+-      snapobj = grub_zfs_to_cpu64 (((dsl_dataset_phys_t *) DN_BONUS (&mdn->dn))->ds_snapnames_zapobj, mdn->endian);
++      dsl_dataset_phys_t * tmp2 = DN_BONUS (&mdn->dn);
++      snapobj = grub_zfs_to_cpu64 (tmp2->ds_snapnames_zapobj, mdn->endian);
+ 
+       err = dnode_get (&(data->mos), snapobj, 
+ 		       DMU_OT_DSL_DS_SNAP_MAP, mdn, data);
+@@ -2231,7 +2235,8 @@ grub_zfs_open (struct grub_file *file, c
+     }
+   else
+     {
+-      file->size = grub_zfs_to_cpu64 (((znode_phys_t *) DN_BONUS (&data->dnode.dn))->zp_size, data->dnode.endian);
++      znode_phys_t * tmp =  DN_BONUS (&data->dnode.dn);
++      file->size = grub_zfs_to_cpu64 (tmp->zp_size, data->dnode.endian);
+     }
+ 
+   file->data = data;
+@@ -2359,7 +2364,8 @@ fill_fs_info (struct grub_dirhook_info *
+   
+   if (mdn.dn.dn_type == DMU_OT_DSL_DIR)
+     {
+-      headobj = grub_zfs_to_cpu64 (((dsl_dir_phys_t *) DN_BONUS (&mdn.dn))->dd_head_dataset_obj, mdn.endian);
++      dsl_dir_phys_t * tmp1 = DN_BONUS (&mdn.dn);
++      headobj = grub_zfs_to_cpu64 (tmp1->dd_head_dataset_obj, mdn.endian);
+ 
+       err = dnode_get (&(data->mos), headobj, DMU_OT_DSL_DATASET, &mdn, data);
+       if (err)
+@@ -2392,7 +2398,8 @@ fill_fs_info (struct grub_dirhook_info *
+     }
+   
+   info->mtimeset = 1;
+-  info->mtime = grub_zfs_to_cpu64 (((znode_phys_t *) DN_BONUS (&dn.dn))->zp_mtime[0], dn.endian);
++  znode_phys_t * tmp2 = DN_BONUS (&dn.dn);
++  info->mtime = grub_zfs_to_cpu64 (tmp2->zp_mtime[0], dn.endian);
+   return;
+ }
+ 
+@@ -2417,7 +2424,8 @@ grub_zfs_dir (grub_device_t device, cons
+ 
+     dnode_get (&(data->mdn), val, 0, &dn, data);
+     info.mtimeset = 1;
+-    info.mtime = grub_zfs_to_cpu64 (((znode_phys_t *) DN_BONUS (&dn.dn))->zp_mtime[0], dn.endian);
++    znode_phys_t * tmp1 = DN_BONUS (&dn.dn);
++    info.mtime = grub_zfs_to_cpu64 (tmp1->zp_mtime[0], dn.endian);
+     info.dir = (dn.dn.dn_type == DMU_OT_DIRECTORY_CONTENTS);
+     grub_dprintf ("zfs", "type=%d, name=%s\n", 
+ 		  (int)dn.dn.dn_type, (char *)name);
+@@ -2480,8 +2488,9 @@ grub_zfs_dir (grub_device_t device, cons
+       fill_fs_info (&info, data->dnode, data);
+       hook ("@", &info);
+       
+-      childobj = grub_zfs_to_cpu64 (((dsl_dir_phys_t *) DN_BONUS (&data->dnode.dn))->dd_child_dir_zapobj, data->dnode.endian);
+-      headobj = grub_zfs_to_cpu64 (((dsl_dir_phys_t *) DN_BONUS (&data->dnode.dn))->dd_head_dataset_obj, data->dnode.endian);
++      dsl_dir_phys_t * tmp2 = DN_BONUS (&data->dnode.dn);
++      childobj = grub_zfs_to_cpu64 (tmp2->dd_child_dir_zapobj, data->dnode.endian);
++      headobj = grub_zfs_to_cpu64 (tmp2->dd_head_dataset_obj, data->dnode.endian);
+       err = dnode_get (&(data->mos), childobj,
+ 		       DMU_OT_DSL_DIR_CHILD_MAP, &dn, data);
+       if (err)
+@@ -2499,7 +2508,8 @@ grub_zfs_dir (grub_device_t device, cons
+ 	  return err;
+ 	}
+ 
+-      snapobj = grub_zfs_to_cpu64 (((dsl_dataset_phys_t *) DN_BONUS (&dn.dn))->ds_snapnames_zapobj, dn.endian);
++      dsl_dataset_phys_t * tmp3 = DN_BONUS (&dn.dn);
++      snapobj = grub_zfs_to_cpu64 (tmp3->ds_snapnames_zapobj, dn.endian);
+ 
+       err = dnode_get (&(data->mos), snapobj,
+ 		       DMU_OT_DSL_DS_SNAP_MAP, &dn, data);
diff --git a/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch b/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch
new file mode 100644
index 0000000..397d11f
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch
@@ -0,0 +1,41 @@
+UpstreamStatus: Pending
+
+This patch quitens this error:
+
+| make[3]: Entering directory
+`/home/nitin/builds/build0/tmp/work/x86_64-linux/grub-efi-i586-native-1.99-r7/grub-1.99/grub-core'
+| gcc -DHAVE_CONFIG_H -I. -I..  -Wall -W -I../include -I../include 
+-DGRUB_MACHINE_EFI=1 -DGRUB_MACHINE=I386_EFI -nostdinc -isystem
+/usr/lib/gcc/x86_64-redhat-linux/4.7.0/include -DGRUB_FILE=\"fs/btrfs.c\" -I.
+-I. -I.. -I.. -I../include -I../include   
+-isystem/home/nitin/builds/build0/tmp/sysroots/x86_64-linux/usr/include -O2
+-pipe -g -feliminate-unused-debug-types -Wall -W -Wshadow -Wpointer-arith
+-Wmissing-prototypes -Wundef -Wstrict-prototypes -g -falign-jumps=1
+-falign-loops=1 -falign-functions=1 -mno-mmx -mno-sse -mno-sse2 -mno-3dnow
+-fno-dwarf2-cfi-asm -m32 -fno-stack-protector -mno-stack-arg-probe -Werror
+-Wno-trampolines          -ffreestanding 
+-isystem/home/nitin/builds/build0/tmp/sysroots/x86_64-linux/usr/include -O2
+-pipe -c -o fs/btrfs_module-btrfs.o `test -f 'fs/btrfs.c' || echo
+'./'`fs/btrfs.c
+| fs/btrfs.c: In function 'grub_btrfs_read_logical':
+| fs/btrfs.c:791:5: error: 'err' may be used uninitialized in this function
+[-Werror=maybe-uninitialized]
+| fs/btrfs.c:592:18: note: 'err' was declared here
+| cc1: all warnings being treated as errors
+| make[3]: *** [fs/btrfs_module-btrfs.o] Error 1
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/04/13
+Index: grub-1.99/grub-core/fs/btrfs.c
+===================================================================
+--- grub-1.99.orig/grub-core/fs/btrfs.c
++++ grub-1.99/grub-core/fs/btrfs.c
+@@ -589,7 +589,7 @@ grub_btrfs_read_logical (struct grub_btr
+       struct grub_btrfs_key *key;
+       struct grub_btrfs_chunk_item *chunk;  
+       grub_uint64_t csize;
+-      grub_err_t err; 
++      grub_err_t err = 0; 
+       struct grub_btrfs_key key_out;
+       int challoc = 0;
+       grub_device_t dev;
diff --git a/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0.patch b/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0.patch
new file mode 100644
index 0000000..545954a
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0.patch
@@ -0,0 +1,34 @@
+Upstream-Status: backport from fedora 
+
+2012/04/13
+Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
+
+From b0f4ef523b69a497d69820c09bbb07484a6b09cc Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Wed, 7 Mar 2012 09:53:50 -0500
+Subject: [PATCH] Fix gcc error that kills build.
+
+---
+ conf/Makefile.common         |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/conf/Makefile.common b/conf/Makefile.common
+index 2040a2e..b3ba765 100644
+--- a/conf/Makefile.common
++++ b/conf/Makefile.common
+@@ -11,10 +11,10 @@ if COND_i386_pc
+   CFLAGS_PLATFORM += -mrtd -mregparm=3
+ endif
+ if COND_i386_efi
+-  LDFLAGS_PLATFORM = -melf_i386
++  LDFLAGS_PLATFORM = -m32
+ endif
+ if COND_x86_64_efi
+-  LDFLAGS_PLATFORM = -melf_x86_64
++  LDFLAGS_PLATFORM = -m64
+ endif
+ if COND_i386_qemu
+   CFLAGS_PLATFORM += -mrtd -mregparm=3
+-- 
+1.7.7.6
+
diff --git a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
index 93e9290..3c6fe90 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
@@ -16,14 +16,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 # FIXME: We should be able to optionally drop freetype as a dependency
 DEPENDS = "help2man-native autogen-native"
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r6"
+PR = "r7"
 
 # Native packages do not normally rebuild when the target changes.
 # Ensure this is built once per HOST-TARGET pair.
 PN := "grub-efi-${TRANSLATED_TARGET_ARCH}-native"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
-	file://grub-1.99_fix_for_automake_1.11.2.patch"
+	file://grub-1.99_fix_for_automake_1.11.2.patch \
+	file://grub-1.99-gcc-4.7.0.patch \
+	file://grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch \
+	file://grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch \
+	"
 
 SRC_URI[md5sum] = "ca9f2a2d571b57fc5c53212d1d22e2b5"
 SRC_URI[sha256sum] = "b91f420f2c51f6155e088e34ff99bea09cc1fb89585cf7c0179644e57abd28ff"
diff --git a/meta/recipes-bsp/grub/grub_1.99.bb b/meta/recipes-bsp/grub/grub_1.99.bb
index 07ee667..0706481 100644
--- a/meta/recipes-bsp/grub/grub_1.99.bb
+++ b/meta/recipes-bsp/grub/grub_1.99.bb
@@ -16,6 +16,9 @@ PR = "r4"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://grub-install.in.patch \
+          file://grub-1.99-gcc-4.7.0.patch \
+          file://grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch \
+          file://grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch \
           file://40_custom"
 
 SRC_URI[md5sum] = "ca9f2a2d571b57fc5c53212d1d22e2b5"
-- 
1.7.7



