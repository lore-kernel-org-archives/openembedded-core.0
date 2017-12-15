Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB556787ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 01:20:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBF1KYDQ012383
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 17:20:34 -0800
Received: from localhost (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 14 Dec 2017 17:20:33 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <qi.chen@windriver.com>
Date: Fri, 15 Dec 2017 09:18:37 +0800
Message-ID: <1513300719-10186-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513300719-10186-1-git-send-email-yi.zhao@windriver.com>
References: <1513300719-10186-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.134]
Subject: [PATCH 1/3] hdparm: replace stat with coreutils as runtime dependency
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
X-List-Received-Date: Fri, 15 Dec 2017 01:20:33 -0000
Content-Type: text/plain

Currently only hdparm specifies stat as runtime dependency in oe-core.
But the stat hasn't any update since 2002. Replace it with coreutils as
runtime dependency since coreutils also provides stat program. Then we
can drop the stat recipe totally.

Also add a patch to fix stat path in wiper.sh.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../hdparm/hdparm/wiper.sh-fix-stat-path.patch     | 38 ++++++++++++++++++++++
 meta/recipes-extended/hdparm/hdparm_9.52.bb        |  6 ++--
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/hdparm/hdparm/wiper.sh-fix-stat-path.patch

diff --git a/meta/recipes-extended/hdparm/hdparm/wiper.sh-fix-stat-path.patch b/meta/recipes-extended/hdparm/hdparm/wiper.sh-fix-stat-path.patch
new file mode 100644
index 0000000..4af1b61
--- /dev/null
+++ b/meta/recipes-extended/hdparm/hdparm/wiper.sh-fix-stat-path.patch
@@ -0,0 +1,38 @@
+From e233006ee212109d2a1401dac37a9a851cc493d8 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 14 Dec 2017 15:23:47 +0800
+Subject: [PATCH] wiper.sh: fix stat path
+
+Fix the stat path for OE.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ wiper/wiper.sh | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/wiper/wiper.sh b/wiper/wiper.sh
+index 79eddc8..9ef2840 100755
+--- a/wiper/wiper.sh
++++ b/wiper/wiper.sh
+@@ -97,7 +97,6 @@ function find_prog(){
+ hash -r  ## Refresh bash's cached PATH entries
+ HDPARM=`find_prog /sbin/hdparm`	|| exit 1
+ FIND=`find_prog /usr/bin/find`	|| exit 1
+-STAT=`find_prog /usr/bin/stat`	|| exit 1
+ GAWK=`find_prog /usr/bin/gawk`	|| exit 1
+ BLKID=`find_prog /sbin/blkid`	|| exit 1
+ GREP=`find_prog /bin/grep`	|| exit 1
+@@ -105,7 +104,7 @@ ID=`find_prog /usr/bin/id`	|| exit 1
+ LS=`find_prog /bin/ls`		|| exit 1
+ DF=`find_prog /bin/df`		|| exit 1
+ RM=`find_prog /bin/rm`		|| exit 1
+-STAT=`find_prog /usr/bin/stat`	|| exit 1
++STAT=`find_prog /bin/stat`	|| exit 1
+ 
+ [ $verbose -gt 1 ] && HDPARM="$HDPARM --verbose"
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/hdparm/hdparm_9.52.bb b/meta/recipes-extended/hdparm/hdparm_9.52.bb
index 49fdc94..13cfb3f 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.52.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.52.bb
@@ -19,9 +19,11 @@ PACKAGES =+ "wiper"
 
 FILES_wiper = "${bindir}/wiper.sh"
 
-RDEPENDS_wiper = "bash gawk stat"
+RDEPENDS_wiper = "bash gawk coreutils"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
+           file://wiper.sh-fix-stat-path.patch \
+          "
 
 SRC_URI[md5sum] = "410539d0bf3cc247181594581edbfb53"
 SRC_URI[sha256sum] = "c3429cd423e271fa565bf584598fd751dd2e773bb7199a592b06b5a61cec4fb6"
-- 
2.7.4


