Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 916026B90C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 06:16:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7L6GAIl024009
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 23:16:10 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 20 Aug 2013 23:16:08 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Aug 2013 14:15:51 +0800
Message-ID: <0b8b0b9d30aa7677a5c23e4d03d4ce6e21678ad7.1377064624.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1377064624.git.jackie.huang@windriver.com>
References: <cover.1377064624.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] openssh: add init.d/sshd status command for LSB compliance
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
X-List-Received-Date: Wed, 21 Aug 2013 06:16:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../openssh/openssh-6.2p2/init                     |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/init b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
index 12fb79b..72c5822 100644
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
@@ -54,6 +57,11 @@ check_keys() {
 	fi
 }
 
+rh_status() {
+	status /usr/sbin/sshd
+	return $?
+}
+
 export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
 
 case "$1" in
@@ -92,8 +100,12 @@ case "$1" in
 	echo "."
 	;;
 
+  status)
+	rh_status
+  ;;
+
   *)
-	echo "Usage: /etc/init.d/ssh {start|stop|reload|force-reload|restart}"
+	echo "Usage: /etc/init.d/ssh {start|stop|status|reload|force-reload|restart}"
 	exit 1
 esac
 
-- 
1.7.4.1


