Return-Path: <Jackie.Huang@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 8957C6B8CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 03:25:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7K3PuZF001312
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 23:25:57 -0400 (EDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 19 Aug 2013 20:25:55 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2013 11:25:44 +0800
Message-ID: <6f2bc301767250c371bb8d927e54425bdeda6f37.1376968627.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1376968627.git.jackie.huang@windriver.com>
References: <cover.1376968627.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] openssh: add init.d/sshd status command for LSB compliance
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
X-List-Received-Date: Tue, 20 Aug 2013 03:25:56 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../openssh/openssh-6.2p2/init                     |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/init b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
index 6beec84..6bbc573 100644
--- a/meta/recipes-connectivity/openssh/openssh-6.2p2/init
+++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
@@ -1,6 +1,9 @@
 #! /bin/sh
 set -e
 
+# source function library
+. /etc/init.d/functions
+
 # /etc/init.d/ssh: start and stop the OpenBSD "secure shell" daemon
 
 test -x /usr/sbin/sshd || exit 0
@@ -46,6 +49,11 @@ check_keys() {
 	fi
 }
 
+rh_status() {
+	status /usr/sbin/sshd;
+	return $?
+}
+
 export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
 
 case "$1" in
@@ -84,8 +92,13 @@ case "$1" in
 	echo "."
 	;;
 
+  status)
+	rh_status;
+	exit $?
+  ;;
+
   *)
-	echo "Usage: /etc/init.d/ssh {start|stop|reload|force-reload|restart}"
+	echo "Usage: /etc/init.d/ssh {start|stop|status|reload|force-reload|restart}"
 	exit 1
 esac
 
-- 
1.7.4.1


