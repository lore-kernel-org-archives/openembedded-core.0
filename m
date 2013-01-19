Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TwQb2-0007bo-Oa
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Jan 2013 06:04:16 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Jan 2013 20:48:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,497,1355126400"; d="scan'208";a="245868657"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.56])
	by azsmga001.ch.intel.com with ESMTP; 18 Jan 2013 20:48:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2013 20:48:33 -0800
Message-Id: <1358570913-10128-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] rpm2cpio: Update to match rpm4 specs for decompression
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
X-List-Received-Date: Sat, 19 Jan 2013 05:04:17 -0000

[YOCTO #3753]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm/rpm2cpio | 40 ++++++++++++----------------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm/rpm2cpio b/meta/recipes-devtools/rpm/rpm/rpm2cpio
index 00c4ec5..6bcef6a 100755
--- a/meta/recipes-devtools/rpm/rpm/rpm2cpio
+++ b/meta/recipes-devtools/rpm/rpm/rpm2cpio
@@ -1,5 +1,8 @@
 #!/bin/sh
 
+# Prevent gawk >= 4.0.x from getting funny ideas wrt UTF in printf()
+LANG=C
+
 pkg=$1
 if [ "$pkg" = "" -o ! -e "$pkg" ]; then
     echo "no package supplied" 1>&2
@@ -22,30 +25,15 @@ dl=`expr 256 \* \( 256 \* \( 256 \* $6 + $7 \) + $8 \) + $9`
 
 hdrsize=`expr 8 + 16 \* $il + $dl`
 o=`expr $o + $hdrsize`
-EXTRACTOR="dd if=$pkg ibs=$o skip=1"
-
-COMPRESSION=`($EXTRACTOR |file -) 2>/dev/null`
-if echo $COMPRESSION |grep -q gzip; then
-	DECOMPRESSOR=gunzip
-elif echo $COMPRESSION |grep -q bzip2; then
-	DECOMPRESSOR=bunzip2
-elif echo $COMPRESSION |grep -q xz; then
-	DECOMPRESSOR=unxz
-elif echo $COMPRESSION |grep -q cpio; then
-	DECOMPRESSOR=cat
-else
-	# Most versions of file don't support LZMA, therefore we assume
-	# anything not detected is LZMA
-	DECOMPRESSOR=`which unlzma 2>/dev/null`
-	case "$DECOMPRESSOR" in
-	    /* ) ;;
-	    *  ) DECOMPRESSOR=`which lzmash 2>/dev/null`
-	         case "$DECOMPRESSOR" in
-	             /* ) DECOMPRESSOR="lzmash -d -c" ;;
-	             *  ) DECOMPRESSOR=cat ;;
-	         esac
-	         ;;
-	esac
-fi
+comp=`dd if=$pkg ibs=$o skip=1 count=1 2>/dev/null | dd bs=3 count=1 2> /dev/null`
 
-$EXTRACTOR 2>/dev/null | $DECOMPRESSOR
+gz="`echo . | awk '{ printf("%c%c", 0x1f, 0x8b); }'`"
+lzma="`echo . | awk '{ printf("%cLZ", 0xff); }'`"
+xz="`echo . | awk '{ printf("%c7z", 0xfd); }'`"
+case "$comp" in
+    BZh)      dd if="$pkg" ibs=$o skip=1 2>/dev/null | bunzip2 ;;
+    "$gz"*)   dd if="$pkg" ibs=$o skip=1 2>/dev/null | gunzip ;;
+    "$xz"*)   dd if="$pkg" ibs=$o skip=1 2>/dev/null | xzcat ;;
+    "$lzma"*) dd if="$pkg" ibs=$o skip=1 2>/dev/null | unlzma ;;
+    *)        echo "Unrecognized rpm file: $pkg"; exit 1 ;;
+esac
-- 
1.8.0.2



