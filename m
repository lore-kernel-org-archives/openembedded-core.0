Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7B565E37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 09:53:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4N9reH9019264
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 02:53:40 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 23 May 2014 02:53:39 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 May 2014 17:54:16 +0800
Message-ID: <0b765ce48ce12f1b0222ef2e769c7644aa4df9eb.1400838768.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1400838768.git.Qi.Chen@windriver.com>
References: <cover.1400838768.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [dora][PATCH 1/1] populate-extfs.sh: keep file timestamps
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
X-List-Received-Date: Fri, 23 May 2014 09:53:41 -0000
Content-Type: text/plain

Fix populate-extfs.sh to keep file timestamps while generating the
ext file systems.

[YOCTO #6348]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh   |   10 +++++++++-
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
1.7.9.5


