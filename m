Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHtTf-0002t0-EC
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 10:00:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 May 2011 00:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="638340028"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by orsmga002.jf.intel.com with ESMTP; 05 May 2011 00:57:22 -0700
Message-Id: <89ad58928522adf83d5e25b5ed43eed7b2825984.1304581770.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304581769.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
Old-Date: Wed, 4 May 2011 16:39:44 -0700
Date: Thu, 05 May 2011  0:57:21 -0700
To: openembedded-core@lists.openembedded.org,bruce.ashfield@windriver.com
From: Saul Wold <sgw@linux.intel.com>
Cc: Kyle McMartin <kyle@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 16/26] yaffs2: Update patch and checksums
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
X-List-Received-Date: Thu, 05 May 2011 08:00:04 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../yaffs2/files/mkyaffs2image.patch               |  116 ++++++++++----------
 meta/recipes-devtools/yaffs2/yaffs2-utils.inc      |    2 +-
 2 files changed, 61 insertions(+), 57 deletions(-)

diff --git a/meta/recipes-devtools/yaffs2/files/mkyaffs2image.patch b/meta/recipes-devtools/yaffs2/files/mkyaffs2image.patch
index 521f1ba..e55d58b 100644
--- a/meta/recipes-devtools/yaffs2/files/mkyaffs2image.patch
+++ b/meta/recipes-devtools/yaffs2/files/mkyaffs2image.patch
@@ -18,10 +18,11 @@
  * And BTW, what was one supposed to do with that file that this horror
  * occasionally managed to generate?
  */
-diff -urN yaffs2.orig/utils/mkyaffs2image.c yaffs2/utils/mkyaffs2image.c
---- yaffs2.orig/utils/mkyaffs2image.c   2005-12-12 16:34:58.000000000 -0800
-+++ yaffs2/utils/mkyaffs2image.c    2006-02-10 16:56:13.000000000 -0800
-@@ -31,10 +47,10 @@
+Index: yaffs2/utils/mkyaffs2image.c
+===================================================================
+--- yaffs2.orig/utils/mkyaffs2image.c	2010-01-11 13:43:18.000000000 -0800
++++ yaffs2/utils/mkyaffs2image.c	2011-05-04 14:50:42.045984700 -0700
+@@ -29,10 +29,10 @@
  #include <dirent.h>
  #include <string.h>
  #include <unistd.h>
@@ -33,53 +34,55 @@ diff -urN yaffs2.orig/utils/mkyaffs2image.c yaffs2/utils/mkyaffs2image.c
  #include "yaffs_packedtags2.h"
  
  unsigned yaffs_traceMask=0;
-@@ -43,9 +59,45 @@
+@@ -41,9 +41,47 @@
  
  #define chunkSize 2048
  #define spareSize 64
 +#define PT2_BYTES 25
++
  
- const char * mkyaffsimage_c_version = "$Id: mkyaffs2image.c,v 1.4 2007-02-14 01:09:06 wookey Exp $";
+ const char * mkyaffsimage_c_version = "$Id: mkyaffs2image.c,v 1.5 2010-01-11 21:43:18 charles Exp $";
  
-+static int	layout_no;
++static int     layout_no;
 +
 +static struct nand_oobinfo oob_layout[] = {
-+        /* KSI:
-+         * Dummy "raw" layout - no ECC, all the bytes are free. Does NOT
-+         * really work, only used for compatibility with CVS YAFFS2 that
-+         * never ever worked with any stock MTD.
-+         */
-+        {
-+        	.useecc = MTD_NANDECC_AUTOPLACE,
-+        	.eccbytes = 0,
-+        	.eccpos = {},
-+        	.oobfree = { {0, 64} }
-+        },
-+        /* KSI:
-+         * Regular MTD AUTOPLACED ECC for large page NAND devices, the
-+         * only one existing in stock MTD so far. It corresponds to layout# 1
-+         * in command line arguments. Any other layouts could be added to
-+         * the list when they made their way in kernel's MTD. The structure
-+         * is simply copied from kernel's drivers/mtd/nand/nand_base.c as-is.
-+         */
-+        {
-+        	.useecc = MTD_NANDECC_AUTOPLACE,
-+        	.eccbytes = 24,
-+        	.eccpos = {
-+	        	40, 41, 42, 43, 44, 45, 46, 47,
-+	        	48, 49, 50, 51, 52, 53, 54, 55,
-+	        	56, 57, 58, 59, 60, 61, 62, 63},
-+        	.oobfree = { {2, 38} }
-+        },
-+        /* End-of-list marker */
-+        {
-+                .useecc = -1,
-+        }
++	/* KSI:
++	 * Dummy "raw" layout - no ECC, all the bytes are free. Does NOT
++	 * really work, only used for compatibility with CVS YAFFS2 that
++	 * never ever worked with any stock MTD.
++	 */
++	{
++		.useecc = MTD_NANDECC_AUTOPLACE,
++		.eccbytes = 0,
++		.eccpos = {},
++		.oobfree = { {0, 64} }
++	},
++	/* KSI:
++	 * Regular MTD AUTOPLACED ECC for large page NAND devices, the
++	 * only one existing in stock MTD so far. It corresponds to layout# 1
++	 * in command line arguments. Any other layouts could be added to
++	 * the list when they made their way in kernel's MTD. The structure
++	 * is simply copied from kernel's drivers/mtd/nand/nand_base.c as-is.
++	 */
++	{
++		.useecc = MTD_NANDECC_AUTOPLACE,
++		.eccbytes = 24,
++		.eccpos = {
++			40, 41, 42, 43, 44, 45, 46, 47,
++			48, 49, 50, 51, 52, 53, 54, 55,
++			56, 57, 58, 59, 60, 61, 62, 63},
++		.oobfree = { {2, 38} }
++	},
++	/* End-of-list marker */
++	{
++		.useecc = -1,
++	}
 +};
++
  
  typedef struct
  {
-@@ -59,7 +111,7 @@
+@@ -57,7 +95,7 @@
  static int n_obj = 0;
  static int obj_id = YAFFS_NOBJECT_BUCKETS + 1;
  
@@ -88,7 +91,7 @@ diff -urN yaffs2.orig/utils/mkyaffs2image.c yaffs2/utils/mkyaffs2image.c
  
  static int outFile;
  
-@@ -123,6 +175,11 @@
+@@ -121,6 +159,11 @@
  	return -1;
  }
  
@@ -100,7 +103,7 @@ diff -urN yaffs2.orig/utils/mkyaffs2image.c yaffs2/utils/mkyaffs2image.c
  /* This little function converts a little endian tag to a big endian tag.
   * NOTE: The tag is not usable after this other than calculating the CRC
   * with.
-@@ -155,11 +212,56 @@
+@@ -153,11 +196,56 @@
      tags->asBytes[7] = temp.asBytes[7];
  #endif
  }
@@ -157,7 +160,7 @@ diff -urN yaffs2.orig/utils/mkyaffs2image.c yaffs2/utils/mkyaffs2image.c
  
  	error = write(outFile,data,chunkSize);
  	if(error < 0) return error;
-@@ -177,18 +279,27 @@
+@@ -175,18 +263,28 @@
  // added NCB **CHECK**
  	t.chunkUsed = 1;
  
@@ -171,25 +174,26 @@ diff -urN yaffs2.orig/utils/mkyaffs2image.c yaffs2/utils/mkyaffs2image.c
  
  	nPages++;
  
- 	yaffs_PackTags2(&pt,&t);
+ 	yaffs_PackTags2(&pt,&t,1);
 -	
 -//	return write(outFile,&pt,sizeof(yaffs_PackedTags2));
 -	return write(outFile,&pt,spareSize);
 -	
 +
-+        memset(spare_buf, 0xff, sizeof(spare_buf));
-+        
-+        if (layout_no == 0) {
-+                memcpy(spare_buf, &pt, sizeof(yaffs_PackedTags2));
-+        } else {
-+                nandmtd2_pt2buf(spare_buf, &pt);
-+        }	
++	memset(spare_buf, 0xff, sizeof(spare_buf));
++
++	if (layout_no == 0) {
++		memcpy(spare_buf, &pt, sizeof(yaffs_PackedTags2));
++	} else {
++		nandmtd2_pt2buf(spare_buf, &pt);
++	}      
 +
 +	return write(outFile,spare_buf,spareSize);
++
  }
  
  #define SWAP32(x)   ((((x) & 0x000000FF) << 24) | \
-@@ -199,6 +310,8 @@
+@@ -197,6 +295,8 @@
  #define SWAP16(x)   ((((x) & 0x00FF) << 8) | \
                       (((x) & 0xFF00) >> 8))
          
@@ -198,7 +202,7 @@ diff -urN yaffs2.orig/utils/mkyaffs2image.c yaffs2/utils/mkyaffs2image.c
  // This one is easier, since the types are more standard. No funky shifts here.
  static void object_header_little_to_big_endian(yaffs_ObjectHeader* oh)
  {
-@@ -256,6 +369,7 @@
+@@ -254,6 +354,7 @@
      oh->roomToGrow[11] = SWAP32(oh->roomToGrow[11]);
  #endif
  }
@@ -206,7 +210,7 @@ diff -urN yaffs2.orig/utils/mkyaffs2image.c yaffs2/utils/mkyaffs2image.c
  
  static int write_object_header(int objId, yaffs_ObjectType t, struct stat *s, int parent, const char *name, int equivalentObj, const char * alias)
  {
-@@ -300,10 +414,13 @@
+@@ -298,10 +399,13 @@
  		strncpy(oh->alias,alias,YAFFS_MAX_ALIAS_LENGTH);
  	}
  
@@ -220,7 +224,7 @@ diff -urN yaffs2.orig/utils/mkyaffs2image.c yaffs2/utils/mkyaffs2image.c
  	
  	return write_chunk(bytes,objId,0,0xffff);
  	
-@@ -319,7 +436,7 @@
+@@ -317,7 +421,7 @@
  	nDirectories++;
  	
  	dir = opendir(path);
@@ -229,7 +233,7 @@ diff -urN yaffs2.orig/utils/mkyaffs2image.c yaffs2/utils/mkyaffs2image.c
  	if(dir)
  	{
  		while((entry = readdir(dir)) != NULL)
-@@ -403,12 +520,12 @@
+@@ -401,12 +505,12 @@
  									   error = nBytes;
  									   
  									printf("%d data chunks written\n",chunk);
@@ -243,7 +247,7 @@ diff -urN yaffs2.orig/utils/mkyaffs2image.c yaffs2/utils/mkyaffs2image.c
  								
  							}							
  														
-@@ -448,58 +565,82 @@
+@@ -446,58 +550,82 @@
  				}
  			}
  		}
diff --git a/meta/recipes-devtools/yaffs2/yaffs2-utils.inc b/meta/recipes-devtools/yaffs2/yaffs2-utils.inc
index 0863fee..23e202d 100644
--- a/meta/recipes-devtools/yaffs2/yaffs2-utils.inc
+++ b/meta/recipes-devtools/yaffs2/yaffs2-utils.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Tools for managing 'yaffs2' file systems."
 SECTION = "base"
 HOMEPAGE = "http://www.yaffs.net"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://yaffs_fs.c;beginline=1;endline=19;md5=353dca22c3100881669871c4bd5cbf73"
+LIC_FILES_CHKSUM = "file://yaffs_fs.c;beginline=1;endline=19;md5=9e87e2e9244febcc0dffb752cb7679e1"
 PV = "0.0.0+cvs${SRCDATE}"
 PR = "r0"
 DEPENDS = "mtd-utils"
-- 
1.7.1.1



