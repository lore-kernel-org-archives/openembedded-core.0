Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UAGz3-0000yW-79
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 10:38:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q9Lf6X007874
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 01:21:41 -0800 (PST)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Tue, 26 Feb 2013 01:21:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 17:24:36 +0800
Message-ID: <f16ee0ba2991c2c533010996e4eb6cabd24f4798.1361862860.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1361862860.git.liezhi.yang@windriver.com>
References: <cover.1361862860.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 3/7] e2fsprogs: add the original mkdebugfs.sh
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
X-List-Received-Date: Tue, 26 Feb 2013 09:38:04 -0000
Content-Type: text/plain

This script is from Darren Hart, it will be used for creating the extX
filesystem from a given directory, which will replace the genext2fs in
image_types.bbclass.

It isn't shipp in e2fsprogs package at the moment, just add it intact,
and will do more work on it in the following commits.

[YOCTO #3848]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs/e2fsprogs/mkdebugfs.sh               | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdebugfs.sh

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdebugfs.sh b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdebugfs.sh
new file mode 100644
index 0000000..5dfa380
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdebugfs.sh
@@ -0,0 +1,49 @@
+#!/bin/sh
+SRCDIR=$1
+DEVICE=$2
+DEBUGFS="debugfs/debugfs"
+
+yes | mkfs.ext4 test.img
+
+{
+	CWD="/"
+	find $SRCDIR | while read FILE; do
+		#TGT=${FILE#$SRCDIR}
+		TGT=$(basename "${FILE#$SRCDIR}")
+		DIR=$(dirname "${FILE#$SRCDIR}")
+
+		# Skip the root dir
+		if [ -z "$TGT" ]; then
+			continue
+		fi
+
+		if [ "$DIR" != "$CWD" ]; then
+			echo "cd $DIR"
+			CWD="$DIR"
+		fi
+
+		case $(stat -c "%F" $FILE) in
+		"directory")
+			echo "mkdir $TGT"
+			;;
+		"regular file")
+			echo "write $FILE $TGT"
+			;;
+		"symbolic link")
+			LINK_TGT=$(ls -l $FILE | sed -e 's/.*-> //')
+			echo "symlink $TGT $LINK_TGT"
+			;;
+		"block special file")
+			DEVNO=$(stat -c "%t %T" $FILE)
+			echo "mknod $TGT b $DEVNO"
+			;;
+		"character special file")
+			DEVNO=$(stat -c "%t %T" $FILE)
+			echo "mknod $TGT c $DEVNO"
+			;;
+		*)
+			echo "Unknown file $FILE" 1>&2
+			;;
+		esac
+	done
+} | $DEBUGFS -w -f /dev/stdin $DEVICE
-- 
1.7.11.2



