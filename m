Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA056CA8D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 10:02:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8QA24N3012407
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 03:02:04 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 26 Sep 2013 03:02:04 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Sep 2013 18:02:07 +0800
Message-ID: <936abdfba1f8b3edf2f5dbfc6be803354798c4d2.1380189657.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1380189657.git.Qi.Chen@windriver.com>
References: <cover.1380189657.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] sysvinit: fix missing of boot log
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
X-List-Received-Date: Thu, 26 Sep 2013 10:02:03 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, our system had no boot log even if the bootlogd daemon was
started correctly. The root cause is that the log file doesn't exist
when starting the bootlogd.

Add '-c' option to bootlogd so that it will create the boot log if
it doesn't exist.

Besides, we need to make sure that tmpfs has been mounted. Otherwise,
the boot log will still be missing.

[YOCTO #5273]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/sysvinit/sysvinit/bootlogd.init |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
index 7b87827..3a10a3c 100755
--- a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
+++ b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
@@ -42,14 +42,15 @@ esac
 
 case "$ACTION" in
 	start)
+		mount -a -t tmpfs 2>/dev/null
 		echo -n "Starting $DESC: "
 		if [ -d /proc/1/. ]
 		then
 			umask 027
 			start-stop-daemon --start --quiet \
-				--exec $DAEMON -- -r
+				--exec $DAEMON -- -r -c
 		else
-			$DAEMON -r
+			$DAEMON -r -c
 		fi
 		echo "$NAME."
 		;;
-- 
1.7.9.5


