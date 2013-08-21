Return-Path: <Jackie.Huang@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 80AF36B0CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 06:16:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7L6Fx6G008846
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 02:16:00 -0400 (EDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 20 Aug 2013 23:15:58 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Aug 2013 14:15:47 +0800
Message-ID: <01b2b57ac5681d245df899bde2308156d9e26c47.1377064624.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1377064624.git.jackie.huang@windriver.com>
References: <cover.1377064624.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] at: add init.d/atd status command for LSB compliance
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
X-List-Received-Date: Wed, 21 Aug 2013 06:16:00 -0000
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


