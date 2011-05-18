Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMbzo-0000cy-Gm
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:20:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 01:17:48 -0700
X-ExtLoop1: 1
Received: from unknown (HELO localhost) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 01:17:48 -0700
Message-Id: <feea593ad4ab29c853cda9b5a801570e5feb1024.1305702436.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305702436.git.sgw@linux.intel.com>
References: <cover.1305702436.git.sgw@linux.intel.com>
Old-Date: Fri, 13 May 2011 17:43:12 -0700
Date: Wed, 18 May 2011  1:17:48 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Robert Yang <liezhi.yang@windriver.com>
Subject: [PATCH 01/15] yaffs2: Remove yaffs2 from oe-core
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
X-List-Received-Date: Wed, 18 May 2011 08:20:45 -0000

From: Saul Wold <sgw@linux.intel.com>

Move to meta-extras
Also remove yaffs2 from image_types.bbclass

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass                   |    3 -
 .../yaffs2/files/mkyaffs2image.patch               |  351 --------------------
 .../yaffs2/files/yaffs2-unioob.patch               |  218 ------------
 meta/recipes-devtools/yaffs2/yaffs2-utils.inc      |   28 --
 meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb   |    4 -
 5 files changed, 0 insertions(+), 604 deletions(-)
 delete mode 100644 meta/recipes-devtools/yaffs2/files/mkyaffs2image.patch
 delete mode 100644 meta/recipes-devtools/yaffs2/files/yaffs2-unioob.patch
 delete mode 100644 meta/recipes-devtools/yaffs2/yaffs2-utils.inc
 delete mode 100644 meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index f23c1f5..ec0cafd 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -21,7 +21,6 @@ runimagecmd () {
 }
 
 IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
-IMAGE_CMD_yaffs2 = "mkyaffs2image ${EXTRA_IMAGECMD} ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.yaffs2"
 IMAGE_CMD_cramfs = "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
 IMAGE_CMD_ext2 = "genext2fs -b $ROOTFS_SIZE -d ${IMAGE_ROOTFS} ${EXTRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2"
 IMAGE_CMD_ext2.gz () {
@@ -64,7 +63,6 @@ IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_
 
 EXTRA_IMAGECMD = ""
 EXTRA_IMAGECMD_jffs2 ?= "--pad --little-endian --eraseblock=0x40000"
-EXTRA_IMAGECMD_yaffs2 = "1"
 # Change these if you want default genext2fs behavior (i.e. create minimal inode number)
 EXTRA_IMAGECMD_ext2 ?= "-i 8192"
 EXTRA_IMAGECMD_ext2.gz ?= "-i 8192"
@@ -73,7 +71,6 @@ EXTRA_IMAGECMD_ext3.gz ?= "-i 8192"
 
 IMAGE_DEPENDS = ""
 IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
-IMAGE_DEPENDS_yaffs2 = "yaffs2-utils-native"
 IMAGE_DEPENDS_cramfs = "cramfs-native"
 IMAGE_DEPENDS_ext2 = "genext2fs-native"
 IMAGE_DEPENDS_ext2.gz = "genext2fs-native"
diff --git a/meta/recipes-devtools/yaffs2/files/mkyaffs2image.patch b/meta/recipes-devtools/yaffs2/files/mkyaffs2image.patch
deleted file mode 100644
index e78b350..0000000
--- a/meta/recipes-devtools/yaffs2/files/mkyaffs2image.patch
+++ /dev/null
@@ -1,351 +0,0 @@
-Upstream-Status: Backport
-
- * 
- * mkyaffs2image hacks by NCB
- *
- * Changes by Sergey Kubushin flagged KSI
- *
- */
- 
-/* KSI:
- * All this nightmare should be rewritten from ground up. Why save return
- * values if nobody checks them? The read/write function returns only one
- * error, -1. Positive return value does NOT mean read/write operation has
- * been completed successfully. If somebody opens files, he MUST close them
- * when they are not longer needed. Only those brave enough can write 64
- * bytes from a yaffs_PackedTags2 structure. The list is too long, there is
- * enough bugs here to write a couple of thick books on how NOT to write
- * programs...
- *
- * And BTW, what was one supposed to do with that file that this horror
- * occasionally managed to generate?
- */
-Index: yaffs2/utils/mkyaffs2image.c
-===================================================================
---- yaffs2.orig/utils/mkyaffs2image.c	2010-01-11 13:43:18.000000000 -0800
-+++ yaffs2/utils/mkyaffs2image.c	2011-05-04 14:50:42.045984700 -0700
-@@ -29,10 +29,10 @@
- #include <dirent.h>
- #include <string.h>
- #include <unistd.h>
-+#include <mtd/mtd-user.h>
- #include "yaffs_ecc.h"
- #include "yaffs_guts.h"
- 
--#include "yaffs_tagsvalidity.h"
- #include "yaffs_packedtags2.h"
- 
- unsigned yaffs_traceMask=0;
-@@ -41,9 +41,47 @@
- 
- #define chunkSize 2048
- #define spareSize 64
-+#define PT2_BYTES 25
-+
- 
- const char * mkyaffsimage_c_version = "$Id: mkyaffs2image.c,v 1.5 2010-01-11 21:43:18 charles Exp $";
- 
-+static int     layout_no;
-+
-+static struct nand_oobinfo oob_layout[] = {
-+	/* KSI:
-+	 * Dummy "raw" layout - no ECC, all the bytes are free. Does NOT
-+	 * really work, only used for compatibility with CVS YAFFS2 that
-+	 * never ever worked with any stock MTD.
-+	 */
-+	{
-+		.useecc = MTD_NANDECC_AUTOPLACE,
-+		.eccbytes = 0,
-+		.eccpos = {},
-+		.oobfree = { {0, 64} }
-+	},
-+	/* KSI:
-+	 * Regular MTD AUTOPLACED ECC for large page NAND devices, the
-+	 * only one existing in stock MTD so far. It corresponds to layout# 1
-+	 * in command line arguments. Any other layouts could be added to
-+	 * the list when they made their way in kernel's MTD. The structure
-+	 * is simply copied from kernel's drivers/mtd/nand/nand_base.c as-is.
-+	 */
-+	{
-+		.useecc = MTD_NANDECC_AUTOPLACE,
-+		.eccbytes = 24,
-+		.eccpos = {
-+			40, 41, 42, 43, 44, 45, 46, 47,
-+			48, 49, 50, 51, 52, 53, 54, 55,
-+			56, 57, 58, 59, 60, 61, 62, 63},
-+		.oobfree = { {2, 38} }
-+	},
-+	/* End-of-list marker */
-+	{
-+		.useecc = -1,
-+	}
-+};
-+
- 
- typedef struct
- {
-@@ -57,7 +95,7 @@
- static int n_obj = 0;
- static int obj_id = YAFFS_NOBJECT_BUCKETS + 1;
- 
--static int nObjects, nDirectories, nPages;
-+static int nObjects = 0, nDirectories = 0, nPages = 0;
- 
- static int outFile;
- 
-@@ -121,6 +159,11 @@
- 	return -1;
- }
- 
-+/* KSI:
-+ * No big endian for now. This is left for a later time. The existing code
-+ * is FUBAR.
-+ */
-+#if 0
- /* This little function converts a little endian tag to a big endian tag.
-  * NOTE: The tag is not usable after this other than calculating the CRC
-  * with.
-@@ -153,11 +196,56 @@
-     tags->asBytes[7] = temp.asBytes[7];
- #endif
- }
-+#endif
-+
-+void nandmtd2_pt2buf(unsigned char *buf, yaffs_PackedTags2 *pt)
-+{
-+	int		i, j = 0, k, n;
-+	unsigned char	pt2_byte_buf[PT2_BYTES];
-+	
-+	*((unsigned int *) &pt2_byte_buf[0]) = pt->t.sequenceNumber;
-+	*((unsigned int *) &pt2_byte_buf[4]) = pt->t.objectId;
-+	*((unsigned int *) &pt2_byte_buf[8]) = pt->t.chunkId;
-+	*((unsigned int *) &pt2_byte_buf[12]) = pt->t.byteCount;
-+	pt2_byte_buf[16] = pt->ecc.colParity;
-+	pt2_byte_buf[17] = pt->ecc.lineParity & 0xff;
-+	pt2_byte_buf[18] = (pt->ecc.lineParity >> 8) & 0xff;
-+	pt2_byte_buf[19] = (pt->ecc.lineParity >> 16) & 0xff;
-+	pt2_byte_buf[20] = (pt->ecc.lineParity >> 24) & 0xff;
-+	pt2_byte_buf[21] = pt->ecc.lineParityPrime & 0xff;
-+	pt2_byte_buf[22] = (pt->ecc.lineParityPrime >> 8) & 0xff;
-+	pt2_byte_buf[23] = (pt->ecc.lineParityPrime >> 16) & 0xff;
-+	pt2_byte_buf[24] = (pt->ecc.lineParityPrime >> 24) & 0xff;
-+
-+	k = oob_layout[layout_no].oobfree[j][0];
-+	n = oob_layout[layout_no].oobfree[j][1];
-+		
-+	if (n == 0) {
-+		fprintf(stderr, "No OOB space for tags");
-+		exit(-1);
-+	}
-+                                
-+	for (i = 0; i < PT2_BYTES; i++) {
-+		if (n == 0) {
-+			j++;
-+			k = oob_layout[layout_no].oobfree[j][0];
-+			n = oob_layout[layout_no].oobfree[j][1];
-+			if (n == 0) {
-+				fprintf(stderr, "No OOB space for tags");
-+				exit(-1);
-+			}
-+		}
-+		buf[k++] = pt2_byte_buf[i];
-+		n--;
-+	}
-+}
- 
- static int write_chunk(__u8 *data, __u32 objId, __u32 chunkId, __u32 nBytes)
- {
- 	yaffs_ExtendedTags t;
- 	yaffs_PackedTags2 pt;
-+	unsigned char	spare_buf[spareSize];
-+
- 
- 	error = write(outFile,data,chunkSize);
- 	if(error < 0) return error;
-@@ -175,18 +263,28 @@
- // added NCB **CHECK**
- 	t.chunkUsed = 1;
- 
-+/* KSI: Broken anyway -- e.g. &t is pointer to a wrong type... */
-+#if 0
- 	if (convert_endian)
- 	{
-     	    little_to_big_endian(&t);
- 	}
-+#endif
- 
- 	nPages++;
- 
- 	yaffs_PackTags2(&pt,&t,1);
--	
--//	return write(outFile,&pt,sizeof(yaffs_PackedTags2));
--	return write(outFile,&pt,spareSize);
--	
-+
-+	memset(spare_buf, 0xff, sizeof(spare_buf));
-+
-+	if (layout_no == 0) {
-+		memcpy(spare_buf, &pt, sizeof(yaffs_PackedTags2));
-+	} else {
-+		nandmtd2_pt2buf(spare_buf, &pt);
-+	}      
-+
-+	return write(outFile,spare_buf,spareSize);
-+
- }
- 
- #define SWAP32(x)   ((((x) & 0x000000FF) << 24) | \
-@@ -197,6 +295,8 @@
- #define SWAP16(x)   ((((x) & 0x00FF) << 8) | \
-                      (((x) & 0xFF00) >> 8))
-         
-+/* KSI: Removed for now. TBD later when the proper util (from scratch) is written */
-+#if 0
- // This one is easier, since the types are more standard. No funky shifts here.
- static void object_header_little_to_big_endian(yaffs_ObjectHeader* oh)
- {
-@@ -254,6 +354,7 @@
-     oh->roomToGrow[11] = SWAP32(oh->roomToGrow[11]);
- #endif
- }
-+#endif
- 
- static int write_object_header(int objId, yaffs_ObjectType t, struct stat *s, int parent, const char *name, int equivalentObj, const char * alias)
- {
-@@ -298,10 +399,13 @@
- 		strncpy(oh->alias,alias,YAFFS_MAX_ALIAS_LENGTH);
- 	}
- 
-+/* KSI: FUBAR. Left for a leter time. */
-+#if 0
- 	if (convert_endian)
- 	{
-     		object_header_little_to_big_endian(oh);
- 	}
-+#endif
- 	
- 	return write_chunk(bytes,objId,0,0xffff);
- 	
-@@ -317,7 +421,7 @@
- 	nDirectories++;
- 	
- 	dir = opendir(path);
--	
-+
- 	if(dir)
- 	{
- 		while((entry = readdir(dir)) != NULL)
-@@ -401,12 +505,12 @@
- 									   error = nBytes;
- 									   
- 									printf("%d data chunks written\n",chunk);
-+        								close(h);
- 								}
- 								else
- 								{
- 									perror("Error opening file");
- 								}
--								close(h);
- 								
- 							}							
- 														
-@@ -446,58 +550,82 @@
- 				}
- 			}
- 		}
-+		/* KSI:
-+		 * Who is supposed to close those open directories in this
-+		 * recursive function, lord Byron? Stock "ulimit -n" is 1024
-+		 * and e.g. stock Fedora /etc directory has more that 1024
-+		 * directories...
-+		 */
-+		closedir(dir);
- 	}
- 	
- 	return 0;
- 
- }
- 
-+void usage(void)
-+{
-+	printf("usage: mkyaffs2image layout# dir image_file [convert]\n");
-+	printf("	layout#    NAND OOB layout # (0 - raw, 1 - nand_oob_64)\n");
-+	printf("	dir        the directory tree to be converted\n");
-+	printf("	image_file the output file to hold the image\n");
-+	printf("	'convert'  make a big-endian img on a little-endian machine. BROKEN !\n");
-+	exit(1);
-+}
- 
- int main(int argc, char *argv[])
- {
- 	struct stat stats;
-+	int	i;
- 	
- 	printf("mkyaffs2image: image building tool for YAFFS2 built "__DATE__"\n");
- 	
--	if(argc < 3)
-+	if ((argc < 4) || (sscanf(argv[1], "%u", &layout_no) != 1))
- 	{
--		printf("usage: mkyaffs2image dir image_file [convert]\n");
--		printf("           dir        the directory tree to be converted\n");
--		printf("           image_file the output file to hold the image\n");
--        printf("           'convert'  produce a big-endian image from a little-endian machine\n");
--		exit(1);
-+	        usage();
- 	}
- 
--    if ((argc == 4) && (!strncmp(argv[3], "convert", strlen("convert"))))
--    {
--        convert_endian = 1;
--    }
-+	i = 0;
-+	
-+	while (oob_layout[i].useecc != -1)
-+	        i++;
-+	        
-+        if (layout_no >= i)
-+                usage();
-+
-+	if ((argc == 5) && (!strncmp(argv[4], "convert", strlen("convert"))))
-+	{
-+	        /* KSI: Broken as of now. TBD. Fail. */
-+	        usage();
-+                convert_endian = 1;
-+        }
-     
--	if(stat(argv[1],&stats) < 0)
-+	if(stat(argv[2],&stats) < 0)
- 	{
--		printf("Could not stat %s\n",argv[1]);
-+		printf("Could not stat %s\n",argv[2]);
- 		exit(1);
- 	}
- 	
- 	if(!S_ISDIR(stats.st_mode))
- 	{
--		printf(" %s is not a directory\n",argv[1]);
-+		printf(" %s is not a directory\n",argv[2]);
- 		exit(1);
- 	}
- 	
--	outFile = open(argv[2],O_CREAT | O_TRUNC | O_WRONLY, S_IREAD | S_IWRITE);
-+	outFile = open(argv[3],O_CREAT | O_TRUNC | O_WRONLY, S_IREAD | S_IWRITE);
- 	
- 	
- 	if(outFile < 0)
- 	{
--		printf("Could not open output file %s\n",argv[2]);
-+		printf("Could not open output file %s\n",argv[3]);
- 		exit(1);
- 	}
- 	
--	printf("Processing directory %s into image file %s\n",argv[1],argv[2]);
-+	printf("Processing directory %s into image file %s\n",argv[2],argv[3]);
- 	error =  write_object_header(1, YAFFS_OBJECT_TYPE_DIRECTORY, &stats, 1,"", -1, NULL);
-+
- 	if(error)
--	error = process_directory(YAFFS_OBJECTID_ROOT,argv[1]);
-+	error = process_directory(YAFFS_OBJECTID_ROOT,argv[2]);
- 	
- 	close(outFile);
- 	
diff --git a/meta/recipes-devtools/yaffs2/files/yaffs2-unioob.patch b/meta/recipes-devtools/yaffs2/files/yaffs2-unioob.patch
deleted file mode 100644
index 8152dab..0000000
--- a/meta/recipes-devtools/yaffs2/files/yaffs2-unioob.patch
+++ /dev/null
@@ -1,218 +0,0 @@
-Upstream-Status: Backport
-
-diff -urN yaffs2.orig/yaffs_mtdif2.c yaffs2/yaffs_mtdif2.c
---- yaffs2.orig/yaffs_mtdif2.c	2005-12-07 14:00:38.000000000 -0800
-+++ yaffs2/yaffs_mtdif2.c	2006-02-10 17:13:58.000000000 -0800
-@@ -29,6 +29,130 @@
- 
- #include "yaffs_packedtags2.h"
- 
-+#define PT2_BYTES		25
-+
-+void nandmtd2_pt2buf(yaffs_Device *dev, yaffs_PackedTags2 *pt, int is_raw)
-+{
-+	struct mtd_info *mtd = (struct mtd_info *)(dev->genericDevice);
-+	int	i, j = 0, k, n;
-+	__u8	pt2_byte_buf[PT2_BYTES];
-+	
-+	/* Pack buffer with 0xff */
-+	for (i = 0; i < mtd->oobsize; i++)
-+		dev->spareBuffer[i] = 0xff;
-+		
-+	if (!is_raw) {
-+		*((unsigned int *) &dev->spareBuffer[0]) = pt->t.sequenceNumber;
-+		*((unsigned int *) &dev->spareBuffer[4]) = pt->t.objectId;
-+		*((unsigned int *) &dev->spareBuffer[8]) = pt->t.chunkId;
-+		*((unsigned int *) &dev->spareBuffer[12]) = pt->t.byteCount;
-+		dev->spareBuffer[16] = pt->ecc.colParity;
-+		dev->spareBuffer[17] = pt->ecc.lineParity & 0xff;
-+		dev->spareBuffer[18] = (pt->ecc.lineParity >> 8) & 0xff;
-+		dev->spareBuffer[19] = (pt->ecc.lineParity >> 16) & 0xff;
-+		dev->spareBuffer[20] = (pt->ecc.lineParity >> 24) & 0xff;
-+		dev->spareBuffer[21] = pt->ecc.lineParityPrime & 0xff;
-+		dev->spareBuffer[22] = (pt->ecc.lineParityPrime >> 8) & 0xff;
-+		dev->spareBuffer[23] = (pt->ecc.lineParityPrime >> 16) & 0xff;
-+		dev->spareBuffer[24] = (pt->ecc.lineParityPrime >> 24) & 0xff;
-+	} else {
-+		*((unsigned int *) &pt2_byte_buf[0]) = pt->t.sequenceNumber;
-+		*((unsigned int *) &pt2_byte_buf[4]) = pt->t.objectId;
-+		*((unsigned int *) &pt2_byte_buf[8]) = pt->t.chunkId;
-+		*((unsigned int *) &pt2_byte_buf[12]) = pt->t.byteCount;
-+		pt2_byte_buf[16] = pt->ecc.colParity;
-+		pt2_byte_buf[17] = pt->ecc.lineParity & 0xff;
-+		pt2_byte_buf[18] = (pt->ecc.lineParity >> 8) & 0xff;
-+		pt2_byte_buf[19] = (pt->ecc.lineParity >> 16) & 0xff;
-+		pt2_byte_buf[20] = (pt->ecc.lineParity >> 24) & 0xff;
-+		pt2_byte_buf[21] = pt->ecc.lineParityPrime & 0xff;
-+		pt2_byte_buf[22] = (pt->ecc.lineParityPrime >> 8) & 0xff;
-+		pt2_byte_buf[23] = (pt->ecc.lineParityPrime >> 16) & 0xff;
-+		pt2_byte_buf[24] = (pt->ecc.lineParityPrime >> 24) & 0xff;
-+
-+		k = mtd->oobinfo.oobfree[j][0];
-+		n = mtd->oobinfo.oobfree[j][1];
-+		
-+		if (n == 0) {
-+			T(YAFFS_TRACE_ERROR, (TSTR("No OOB space for tags" TENDSTR)));
-+			YBUG();
-+		}
-+                                
-+		for (i = 0; i < PT2_BYTES; i++) {
-+			if (n == 0) {
-+				j++;
-+				k = mtd->oobinfo.oobfree[j][0];
-+				n = mtd->oobinfo.oobfree[j][1];
-+				if (n == 0) {
-+					T(YAFFS_TRACE_ERROR, (TSTR("No OOB space for tags" TENDSTR)));
-+					YBUG();
-+				}
-+			}
-+			dev->spareBuffer[k++] = pt2_byte_buf[i];
-+			n--;
-+		}
-+	}
-+}
-+
-+void nandmtd2_buf2pt(yaffs_Device *dev, yaffs_PackedTags2 *pt, int is_raw)
-+{
-+	struct mtd_info *mtd = (struct mtd_info *)(dev->genericDevice);
-+	int	i, j = 0, k, n;
-+	__u8	pt2_byte_buf[PT2_BYTES];
-+	
-+
-+	if (!is_raw) {
-+		pt->t.sequenceNumber = *((unsigned int *) &dev->spareBuffer[0]);
-+		pt->t.objectId = *((unsigned int *) &dev->spareBuffer[4]);
-+		pt->t.chunkId = *((unsigned int *) &dev->spareBuffer[8]);
-+		pt->t.byteCount = *((unsigned int *) &dev->spareBuffer[12]);
-+		pt->ecc.colParity = dev->spareBuffer[16];
-+		pt->ecc.lineParity = (dev->spareBuffer[17] & 0x000000ff) |
-+	 		((dev->spareBuffer[18] << 8) & 0x0000ff00) |
-+	 		((dev->spareBuffer[19] << 16) & 0x00ff0000) |
-+	 		((dev->spareBuffer[20] << 24) & 0xff000000);
-+		pt->ecc.lineParityPrime = (dev->spareBuffer[21] & 0x000000ff) |
-+	 		((dev->spareBuffer[22] << 8) & 0x0000ff00) |
-+	 		((dev->spareBuffer[23] << 16) & 0x00ff0000) |
-+	 		((dev->spareBuffer[24] << 24) & 0xff000000);
-+	} else {
-+		k = mtd->oobinfo.oobfree[j][0];
-+		n = mtd->oobinfo.oobfree[j][1];
-+		
-+		if (n == 0) {
-+			T(YAFFS_TRACE_ERROR, (TSTR("No space in OOB for tags" TENDSTR)));
-+			YBUG();
-+		}
-+                                
-+		for (i = 0; i < PT2_BYTES; i++) {
-+			if (n == 0) {
-+				j++;
-+				k = mtd->oobinfo.oobfree[j][0];
-+				n = mtd->oobinfo.oobfree[j][1];
-+				if (n == 0) {
-+					T(YAFFS_TRACE_ERROR, (TSTR("No space in OOB for tags" TENDSTR)));
-+					YBUG();
-+				}
-+			}
-+			pt2_byte_buf[i] = dev->spareBuffer[k++];
-+			n--;
-+		}
-+		pt->t.sequenceNumber = *((unsigned int *) &pt2_byte_buf[0]);
-+		pt->t.objectId = *((unsigned int *) &pt2_byte_buf[4]);
-+		pt->t.chunkId = *((unsigned int *) &pt2_byte_buf[8]);
-+		pt->t.byteCount = *((unsigned int *) &pt2_byte_buf[12]);
-+		pt->ecc.colParity = pt2_byte_buf[16];
-+		pt->ecc.lineParity = (pt2_byte_buf[17] & 0x000000ff) |
-+	 		((pt2_byte_buf[18] << 8) & 0x0000ff00) |
-+	 		((pt2_byte_buf[19] << 16) & 0x00ff0000) |
-+	 		((pt2_byte_buf[20] << 24) & 0xff000000);
-+		pt->ecc.lineParityPrime = (pt2_byte_buf[21] & 0x000000ff) |
-+	 		((pt2_byte_buf[22] << 8) & 0x0000ff00) |
-+	 		((pt2_byte_buf[23] << 16) & 0x00ff0000) |
-+	 		((pt2_byte_buf[24] << 24) & 0xff000000);
-+	}
-+}
-+
- int nandmtd2_WriteChunkWithTagsToNAND(yaffs_Device * dev, int chunkInNAND,
- 				      const __u8 * data,
- 				      const yaffs_ExtendedTags * tags)
-@@ -51,24 +175,22 @@
- 	}
- 
- 	if (data && tags) {
--		if (dev->useNANDECC)
--			retval =
--			    mtd->write_ecc(mtd, addr, dev->nBytesPerChunk,
--					   &dummy, data, (__u8 *) & pt, NULL);
--		else
-+			nandmtd2_pt2buf(dev, &pt, 0);
- 			retval =
- 			    mtd->write_ecc(mtd, addr, dev->nBytesPerChunk,
--					   &dummy, data, (__u8 *) & pt, NULL);
-+					   &dummy, data, dev->spareBuffer,
-+					   NULL);
- 	} else {
- 		if (data)
- 			retval =
- 			    mtd->write(mtd, addr, dev->nBytesPerChunk, &dummy,
- 				       data);
--		if (tags)
-+		if (tags) {
-+			nandmtd2_pt2buf(dev, &pt, 1);
- 			retval =
- 			    mtd->write_oob(mtd, addr, mtd->oobsize, &dummy,
--					   (__u8 *) & pt);
--
-+			    dev->spareBuffer);
-+		}
- 	}
- 
- 	if (retval == 0)
-@@ -94,30 +216,24 @@
- 	    TENDSTR), chunkInNAND, data, tags));
- 
- 	if (data && tags) {
--		if (dev->useNANDECC) {
- 			retval =
- 			    mtd->read_ecc(mtd, addr, dev->nBytesPerChunk,
- 					  &dummy, data, dev->spareBuffer,
- 					  NULL);
--		} else {
--			retval =
--			    mtd->read_ecc(mtd, addr, dev->nBytesPerChunk,
--					  &dummy, data, dev->spareBuffer,
--					  NULL);
--		}
-+			nandmtd2_buf2pt(dev, &pt, 0);
- 	} else {
- 		if (data)
- 			retval =
- 			    mtd->read(mtd, addr, dev->nBytesPerChunk, &dummy,
- 				      data);
--		if (tags)
-+		if (tags) {
- 			retval =
- 			    mtd->read_oob(mtd, addr, mtd->oobsize, &dummy,
- 					  dev->spareBuffer);
-+			nandmtd2_buf2pt(dev, &pt, 1);
-+		}
- 	}
- 
--	memcpy(&pt, dev->spareBuffer, sizeof(pt));
--
- 	if (tags)
- 		yaffs_UnpackTags2(tags, &pt);
- 
-@@ -178,10 +294,11 @@
- 			*sequenceNumber = 0;
- 			*state = YAFFS_BLOCK_STATE_EMPTY;
- 		}
-+
-+		T(YAFFS_TRACE_MTD,
-+		  (TSTR("block is OK seq %d state %d" TENDSTR), *sequenceNumber,
-+		   *state));
- 	}
--	T(YAFFS_TRACE_MTD,
--	  (TSTR("block is bad seq %d state %d" TENDSTR), *sequenceNumber,
--	   *state));
- 
- 	if (retval == 0)
- 		return YAFFS_OK;
diff --git a/meta/recipes-devtools/yaffs2/yaffs2-utils.inc b/meta/recipes-devtools/yaffs2/yaffs2-utils.inc
deleted file mode 100644
index 23e202d..0000000
--- a/meta/recipes-devtools/yaffs2/yaffs2-utils.inc
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Tools for managing 'yaffs2' file systems."
-SECTION = "base"
-HOMEPAGE = "http://www.yaffs.net"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://yaffs_fs.c;beginline=1;endline=19;md5=9e87e2e9244febcc0dffb752cb7679e1"
-PV = "0.0.0+cvs${SRCDATE}"
-PR = "r0"
-DEPENDS = "mtd-utils"
-
-SRC_URI = "cvs://anonymous@cvs.aleph1.co.uk/home/aleph1/cvs;module=yaffs2 \
-           file://mkyaffs2image.patch;patch=1"
-S = "${WORKDIR}/yaffs2"
-
-CFLAGS += "-I.. -DCONFIG_YAFFS_UTIL"
-CFLAGS_append_virtclass-native = " -I.. -DCONFIG_YAFFS_UTIL"
-
-do_compile() {
-	cd utils && oe_runmake
-}
-
-do_install() {
-	install -d ${D}${sbindir}/
-	for i in mkyaffsimage mkyaffs2image; do
-		install -m 0755 utils/$i ${D}${sbindir}/
-	done
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb b/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb
deleted file mode 100644
index 6414bd2..0000000
--- a/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require yaffs2-utils.inc
-PR = "r1"
-
-SRCDATE = "20110505"
-- 
1.7.3.4



