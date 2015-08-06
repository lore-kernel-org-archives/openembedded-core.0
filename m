Return-Path: <amarnath.valluri@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A90D5734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 12:14:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 06 Aug 2015 05:14:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,622,1432623600"; d="scan'208";a="743399916"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 06 Aug 2015 05:14:35 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 15:15:55 +0300
Message-Id: <1438863355-18553-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH v2] dosfstools-2.11: Fix memory leak in mkdosfs
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
X-List-Received-Date: Thu, 06 Aug 2015 12:14:40 -0000

Fix memory leak that was introduced in mkdosfs-dir.patch.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 .../dosfstools/dosfstools/mkdosfs-dir.patch        | 53 ++++++++++++++--------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-dir.patch b/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-dir.patch
index 3ba4711..58b64e1 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-dir.patch
+++ b/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-dir.patch
@@ -1,14 +1,24 @@
-Add -d <directory> support to populate the image.
+From e746addea175a802717f5e23e14e9dc3b772a53a Mon Sep 17 00:00:00 2001
+From: Scott Garman <scott.a.garman@intel.com>
+Date: Thu, 6 Aug 2015 14:29:15 +0300
+Subject: [PATCH 1/8] Add -d <directory> support to populate the image.
 
 Upstream-Status: Inappropriate [licensing]
 We're tracking an old release of dosfstools due to licensing issues.
 
+v2:
+  - Fix memory leak.
+
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+---
+ mkdosfs/mkdosfs.c | 508 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 499 insertions(+), 9 deletions(-)
 
-Index: dosfstools-2.11/mkdosfs/mkdosfs.c
-===================================================================
---- dosfstools-2.11.orig/mkdosfs/mkdosfs.c	2011-12-06 12:27:55.000000000 +0000
-+++ dosfstools-2.11/mkdosfs/mkdosfs.c	2011-12-06 12:37:13.445950703 +0000
+diff --git a/mkdosfs/mkdosfs.c b/mkdosfs/mkdosfs.c
+index 258ca5b..5f23272 100644
+--- a/mkdosfs/mkdosfs.c
++++ b/mkdosfs/mkdosfs.c
 @@ -18,6 +18,10 @@
     as a rule), and not the block.  For example the boot block does not
     occupy a full cluster.
@@ -38,7 +48,7 @@ Index: dosfstools-2.11/mkdosfs/mkdosfs.c
  /* Constant definitions */
  
  #define TRUE 1			/* Boolean constants */
-@@ -149,7 +157,6 @@
+@@ -149,7 +157,6 @@ cdiv (int a, int b)
  #define ATTR_VOLUME  8		/* volume label */
  #define ATTR_DIR     16		/* directory */
  #define ATTR_ARCH    32		/* archived */
@@ -46,7 +56,7 @@ Index: dosfstools-2.11/mkdosfs/mkdosfs.c
  #define ATTR_NONE    0		/* no attribute bits */
  #define ATTR_UNUSED  (ATTR_VOLUME | ATTR_ARCH | ATTR_SYS | ATTR_HIDDEN)
  	/* attribute bits that are copied "as is" */
-@@ -245,6 +252,19 @@
+@@ -245,6 +252,19 @@ struct fat32_fsinfo {
    __u32		reserved2[4];
  };
  
@@ -66,7 +76,7 @@ Index: dosfstools-2.11/mkdosfs/mkdosfs.c
  struct msdos_dir_entry
    {
      char	name[8], ext[3];	/* name and extension */
-@@ -293,6 +313,15 @@
+@@ -293,6 +313,15 @@ char dummy_boot_code[BOOTCODE_SIZE] =
  
  #define MESSAGE_OFFSET 29	/* Offset of message in above code */
  
@@ -82,7 +92,7 @@ Index: dosfstools-2.11/mkdosfs/mkdosfs.c
  /* Global variables - the root of all evil :-) - see these and weep! */
  
  static char *template_boot_code;	/* Variable to store a full template boot sector in */
-@@ -326,6 +355,9 @@
+@@ -326,6 +355,9 @@ static struct msdos_dir_entry *root_dir;	/* Root directory */
  static int size_root_dir;	/* Size of the root directory in bytes */
  static int sectors_per_cluster = 0;	/* Number of sectors per disk cluster */
  static int root_dir_entries = 0;	/* Number of root directory entries */
@@ -92,7 +102,7 @@ Index: dosfstools-2.11/mkdosfs/mkdosfs.c
  static char *blank_sector;		/* Blank sector - all zeros */
  static int hidden_sectors = 0;		/* Number of hidden sectors */
  
-@@ -399,7 +431,6 @@
+@@ -399,7 +431,6 @@ mark_FAT_cluster (int cluster, unsigned int value)
    }
  }
  
@@ -100,7 +110,7 @@ Index: dosfstools-2.11/mkdosfs/mkdosfs.c
  /* Mark a specified sector as having a particular value in it's FAT entry */
  
  static void
-@@ -1266,6 +1297,9 @@
+@@ -1266,6 +1297,9 @@ setup_tables (void)
        die ("unable to allocate space for root directory in memory");
      }
  
@@ -110,7 +120,7 @@ Index: dosfstools-2.11/mkdosfs/mkdosfs.c
    memset(root_dir, 0, size_root_dir);
    if ( memcmp(volume_name, "           ", 11) )
      {
-@@ -1314,11 +1348,11 @@
+@@ -1314,11 +1348,11 @@ setup_tables (void)
    }
    
    if (!(blank_sector = malloc( sector_size )))
@@ -125,7 +135,7 @@ Index: dosfstools-2.11/mkdosfs/mkdosfs.c
  /* Write the new filesystem's data tables to wherever they're going to end up! */
  
  #define error(str)				\
-@@ -1340,7 +1374,7 @@
+@@ -1340,7 +1374,7 @@ setup_tables (void)
    do {							\
      int __size = (size);				\
      if (write (dev, buf, __size) != __size)		\
@@ -134,7 +144,7 @@ Index: dosfstools-2.11/mkdosfs/mkdosfs.c
    } while(0)
  
  
-@@ -1412,6 +1446,452 @@
+@@ -1412,6 +1446,454 @@ write_tables (void)
    free (fat);  /* Free up the fat table space reserved during setup_tables */
  }
  
@@ -398,6 +408,8 @@ Index: dosfstools-2.11/mkdosfs/mkdosfs.c
 +    writebuf(buffer, size, "data");    
 +  }
 +
++  free(buffer);
++
 + exit_add:
 +  if (infile) close(infile);
 +}
@@ -587,7 +599,7 @@ Index: dosfstools-2.11/mkdosfs/mkdosfs.c
  
  /* Report the command usage and return a failure error code */
  
-@@ -1423,7 +1903,7 @@
+@@ -1423,7 +1905,7 @@ Usage: mkdosfs [-A] [-c] [-C] [-v] [-I] [-l bad-block-file] [-b backup-boot-sect
         [-m boot-msg-file] [-n volume-name] [-i volume-id] [-B bootcode]\n\
         [-s sectors-per-cluster] [-S logical-sector-size] [-f number-of-FATs]\n\
         [-h hidden-sectors] [-F fat-size] [-r root-dir-entries] [-R reserved-sectors]\n\
@@ -596,7 +608,7 @@ Index: dosfstools-2.11/mkdosfs/mkdosfs.c
  }
  
  /*
-@@ -1463,6 +1943,8 @@
+@@ -1463,6 +1945,8 @@ main (int argc, char **argv)
    int c;
    char *tmp;
    char *listfile = NULL;
@@ -605,7 +617,7 @@ Index: dosfstools-2.11/mkdosfs/mkdosfs.c
    FILE *msgfile;
    struct stat statbuf;
    int i = 0, pos, ch;
-@@ -1483,7 +1965,7 @@
+@@ -1483,7 +1967,7 @@ main (int argc, char **argv)
    printf ("%s " VERSION " (" VERSION_DATE ")\n",
  	   program_name);
  
@@ -614,7 +626,7 @@ Index: dosfstools-2.11/mkdosfs/mkdosfs.c
      /* Scan the command line for options */
      switch (c)
        {
-@@ -1508,6 +1990,10 @@
+@@ -1508,6 +1992,10 @@ main (int argc, char **argv)
  	create = TRUE;
  	break;
  
@@ -625,7 +637,7 @@ Index: dosfstools-2.11/mkdosfs/mkdosfs.c
        case 'f':		/* f : Choose number of FATs */
  	nr_fats = (int) strtol (optarg, &tmp, 0);
  	if (*tmp || nr_fats < 1 || nr_fats > 4)
-@@ -1811,8 +2297,10 @@
+@@ -1811,8 +2299,10 @@ main (int argc, char **argv)
    else if (listfile)
      get_list_blocks (listfile);
  
@@ -637,3 +649,6 @@ Index: dosfstools-2.11/mkdosfs/mkdosfs.c
    exit (0);			/* Terminate with no errors! */
  }
  
+-- 
+2.1.4
+
-- 
2.1.4

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


