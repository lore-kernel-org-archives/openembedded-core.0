Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 830B072F83
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:48:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 06:48:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875769"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:48:50 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:39 +0200
Message-Id: <a104d7bf038f18fbe715f475ec4404207d36e1a9.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 22/39] scripts/rpm2cpio.sh: replace 5.x version with 4.x version
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
X-List-Received-Date: Tue, 21 Feb 2017 14:48:56 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 scripts/rpm2cpio.sh | 108 ++++++++++++++++++++++++++--------------------------
 1 file changed, 55 insertions(+), 53 deletions(-)

diff --git a/scripts/rpm2cpio.sh b/scripts/rpm2cpio.sh
index 5df8c0f7054..cf23472ba95 100755
--- a/scripts/rpm2cpio.sh
+++ b/scripts/rpm2cpio.sh
@@ -1,53 +1,55 @@
-#!/bin/sh
-
-# This comes from the RPM5 5.4.0 distribution.
-
-pkg=$1
-if [ "$pkg" = "" -o ! -e "$pkg" ]; then
-    echo "no package supplied" 1>&2
-   exit 1
-fi
-
-leadsize=96
-o=`expr $leadsize + 8`
-set `od -j $o -N 8 -t u1 $pkg`
-il=`expr 256 \* \( 256 \* \( 256 \* $2 + $3 \) + $4 \) + $5`
-dl=`expr 256 \* \( 256 \* \( 256 \* $6 + $7 \) + $8 \) + $9`
-# echo "sig il: $il dl: $dl"
-
-sigsize=`expr 8 + 16 \* $il + $dl`
-o=`expr $o + $sigsize + \( 8 - \( $sigsize \% 8 \) \) \% 8 + 8`
-set `od -j $o -N 8 -t u1 $pkg`
-il=`expr 256 \* \( 256 \* \( 256 \* $2 + $3 \) + $4 \) + $5`
-dl=`expr 256 \* \( 256 \* \( 256 \* $6 + $7 \) + $8 \) + $9`
-# echo "hdr il: $il dl: $dl"
-
-hdrsize=`expr 8 + 16 \* $il + $dl`
-o=`expr $o + $hdrsize`
-EXTRACTOR="dd if=$pkg ibs=$o skip=1"
-
-COMPRESSION=`($EXTRACTOR |file -) 2>/dev/null`
-if echo $COMPRESSION |grep -iq gzip; then
-	DECOMPRESSOR=gunzip
-elif echo $COMPRESSION |grep -iq bzip2; then
-	DECOMPRESSOR=bunzip2
-elif echo $COMPRESSION |grep -iq xz; then
-	DECOMPRESSOR=unxz
-elif echo $COMPRESSION |grep -iq cpio; then
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
-
-$EXTRACTOR 2>/dev/null | $DECOMPRESSOR
+#!/bin/sh -efu
+
+# This file comes from rpm 4.x distribution
+
+fatal() {
+	echo "$*" >&2
+	exit 1
+}
+
+pkg="$1"
+[ -n "$pkg" -a -e "$pkg" ] ||
+	fatal "No package supplied"
+
+_dd() {
+	local o="$1"; shift
+	dd if="$pkg" skip="$o" iflag=skip_bytes status=none $*
+}
+
+calcsize() {
+	offset=$(($1 + 8))
+
+	local i b b0 b1 b2 b3 b4 b5 b6 b7
+
+	i=0
+	while [ $i -lt 8 ]; do
+		b="$(_dd $(($offset + $i)) bs=1 count=1)"
+		[ -z "$b" ] &&
+			b="0" ||
+			b="$(exec printf '%u\n' "'$b")"
+		eval "b$i=\$b"
+		i=$(($i + 1))
+	done
+
+	rsize=$((8 + ((($b0 << 24) + ($b1 << 16) + ($b2 << 8) + $b3) << 4) + ($b4 << 24) + ($b5 << 16) + ($b6 << 8) + $b7))
+	offset=$(($offset + $rsize))
+}
+
+case "$(_dd 0 bs=8 count=1)" in
+	"$(printf '\355\253\356\333')"*) ;; # '\xed\xab\xee\xdb'
+	*) fatal "File doesn't look like rpm: $pkg" ;;
+esac
+
+calcsize 96
+sigsize=$rsize
+
+calcsize $(($offset + (8 - ($sigsize % 8)) % 8))
+hdrsize=$rsize
+
+case "$(_dd $offset bs=3 count=1)" in
+	"$(printf '\102\132')"*) _dd $offset | bunzip2 ;; # '\x42\x5a'
+	"$(printf '\037\213')"*) _dd $offset | gunzip  ;; # '\x1f\x8b'
+	"$(printf '\375\067')"*) _dd $offset | xzcat   ;; # '\xfd\x37'
+	"$(printf '\135\000')"*) _dd $offset | unlzma  ;; # '\x5d\x00'
+	*) fatal "Unrecognized rpm file: $pkg" ;;
+esac
-- 
2.11.0


