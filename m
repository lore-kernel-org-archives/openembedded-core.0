Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6BAAA6B8A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 03:25:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7K3Q0lC006891
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 20:26:01 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 19 Aug 2013 20:25:59 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2013 11:25:46 +0800
Message-ID: <a1ff23db8b1205cf7f51bd24776c94b3ac0dff9a.1376968627.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1376968627.git.jackie.huang@windriver.com>
References: <cover.1376968627.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] at: add init.d/atd status command for LSB compliance
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
X-List-Received-Date: Tue, 20 Aug 2013 03:25:59 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-extended/at/files/S99at |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/at/files/S99at b/meta/recipes-extended/at/files/S99at
index 386f8a4..d2ba34b 100644
--- a/meta/recipes-extended/at/files/S99at
+++ b/meta/recipes-extended/at/files/S99at
@@ -5,6 +5,9 @@
 
 umask 077
 
+# Source function library.
+. /etc/init.d/functions
+
 start() {
 	echo -n "Starting atd: "
 	start-stop-daemon --start --quiet --pidfile /var/run/atd.pid --background --exec /usr/sbin/atd -- -f
@@ -20,6 +23,11 @@ restart() {
 	start
 }
 
+rh_status() {
+    # run checks to determine if the service is running or use generic status
+    status /usr/sbin/atd
+}
+
 case "$1" in
   start)
 	start
@@ -30,8 +38,11 @@ case "$1" in
   restart|reload)
 	restart
 	;;
+  status)
+	rh_status
+	;;
   *)
-	echo $"Usage: $0 {start|stop|restart}"
+	echo $"Usage: $0 {start|stop|restart|status}"
 	exit 1
 esac
 
-- 
1.7.4.1


