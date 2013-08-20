Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D125D6B8D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 03:25:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7K3Pw36024293
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 20:25:58 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 19 Aug 2013 20:25:58 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2013 11:25:45 +0800
Message-ID: <f7e4e6f405b910866847bb6037549824abb07815.1376968627.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1376968627.git.jackie.huang@windriver.com>
References: <cover.1376968627.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] sysklogd: add init.d/syslog status command for LSB compliance
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
X-List-Received-Date: Tue, 20 Aug 2013 03:25:58 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-extended/sysklogd/files/sysklogd |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/sysklogd/files/sysklogd b/meta/recipes-extended/sysklogd/files/sysklogd
index dcbc81e..c966725 100755
--- a/meta/recipes-extended/sysklogd/files/sysklogd
+++ b/meta/recipes-extended/sysklogd/files/sysklogd
@@ -12,6 +12,9 @@
 # Short-Description:    System logger
 ### END INIT INFO
 
+# Source function library.
+. /etc/init.d/functions
+
 PATH=/bin:/usr/bin:/sbin:/usr/sbin
 
 pidfile_syslogd=/var/run/syslogd.pid
@@ -132,8 +135,16 @@ case "$1" in
 	$0 start
     fi
     ;;
+  status)
+    status syslogd;
+    RETVAL=$?
+    status klogd;
+    rval=$?
+    [ $RETVAL -eq 0 ] && exit $rval
+    exit $RETVAL
+    ;;
   *)
-    log_success_msg "Usage: /etc/init.d/sysklogd {start|stop|reload|restart|force-reload|reload-or-restart}"
+    log_success_msg "Usage: /etc/init.d/sysklogd {start|stop|reload|restart|force-reload|reload-or-restart|status}"
     exit 1
 esac
 
-- 
1.7.4.1


