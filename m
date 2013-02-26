Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UA9le-0008Qf-AT
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 02:55:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q1dO6I001086
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 17:39:24 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 25 Feb 2013 17:39:22 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 09:39:32 +0800
Message-ID: <cdf763e0896938a5189aa1694b6769f5b6d7190b.1361783630.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1361783630.git.Qi.Chen@windriver.com>
References: <cover.1361783630.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] sysvinit: start .sh scripts correctly
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
X-List-Received-Date: Tue, 26 Feb 2013 01:55:49 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, scripts which end with '.sh' were sourced, so the arguments
like 'start' and 'stop' were just ignored.

This resulted in some init scripts not being able to start correctly.
For example, sourcing hwclock.sh in busybox actually does nothing.
It should be invoked as 'hwclock.sh start' or 'hwclock.sh stop'.

This patch fixes this issue.

[YOCTO #3612]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/sysvinit/sysvinit/rc |   16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index 44bc9bf..50951da 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -41,21 +41,7 @@ startup_progress() {
 startup() {
   # Handle verbosity
   [ "$VERBOSE" = very ] && echo "INIT: Running $@..."
-
-  case "$1" in
-	*.sh)
-		# Source shell script for speed.
-		(
-			trap - INT QUIT TSTP
-			scriptname=$1
-			shift
-			. $scriptname
-		)
-		;;
-	*)
-		"$@"
-		;;
-  esac
+  "$@"
   startup_progress
 }
 
-- 
1.7.9.5



