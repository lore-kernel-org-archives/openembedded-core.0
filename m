Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A97C66FA75
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 02:39:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4R2dUJU029831
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 19:39:30 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 26 May 2014 19:39:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 May 2014 22:15:16 -0400
Message-ID: <a733d18ae7ffaed565b0e4e1f53232013301355f.1401154976.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1401154976.git.liezhi.yang@windriver.com>
References: <cover.1401154976.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] populate-extfs.sh: keep file timestamps
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
X-List-Received-Date: Tue, 27 May 2014 02:39:29 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Fix populate-extfs.sh to keep file timestamps while generating the
ext file systems.

[YOCTO #6348]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh             |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
index 7de720b..76c4d6f 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
@@ -35,7 +35,7 @@ DEBUGFS="debugfs"
 		fi
 
 		# Only stat once since stat is a time consuming command
-		STAT=$(stat -c "TYPE=\"%F\";DEVNO=\"0x%t 0x%T\";MODE=\"%f\";U=\"%u\";G=\"%g\"" "$FILE")
+		STAT=$(stat -c "TYPE=\"%F\";DEVNO=\"0x%t 0x%T\";MODE=\"%f\";U=\"%u\";G=\"%g\";AT=\"%x\";MT=\"%y\";CT=\"%z\"" "$FILE")
 		eval $STAT
 
 		case $TYPE in
@@ -69,6 +69,14 @@ DEBUGFS="debugfs"
 		# Set uid and gid
 		echo "sif \"$TGT\" uid $U"
 		echo "sif \"$TGT\" gid $G"
+
+		# Set atime, mtime and ctime
+		AT=`echo $AT | cut -d'.' -f1 | sed -e 's#[- :]##g'`
+		MT=`echo $MT | cut -d'.' -f1 | sed -e 's#[- :]##g'`
+		CT=`echo $CT | cut -d'.' -f1 | sed -e 's#[- :]##g'`
+		echo "sif \"$TGT\" atime $AT"
+		echo "sif \"$TGT\" mtime $MT"
+		echo "sif \"$TGT\" ctime $CT"
 	done
 
 	# Handle the hard links.
-- 
1.7.10.4


