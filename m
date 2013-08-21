Return-Path: <Jackie.Huang@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 8C4326B0CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 06:16:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7L6G41e008858
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 02:16:04 -0400 (EDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 20 Aug 2013 23:16:03 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Aug 2013 14:15:49 +0800
Message-ID: <f99eee6519014a56540f0e25f1a118ffb681b1dc.1377064624.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1377064624.git.jackie.huang@windriver.com>
References: <cover.1377064624.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] sysvinit: add init.d/bootlogd status command for LSB compliance
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
X-List-Received-Date: Wed, 21 Aug 2013 06:16:05 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/sysvinit/sysvinit/bootlogd.init |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
index f8f07a0..7b87827 100755
--- a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
+++ b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
@@ -13,6 +13,9 @@ DAEMON=/sbin/bootlogd
 NAME=bootlogd
 DESC="Bootlog daemon"
 
+# source function library
+. /etc/init.d/functions
+
 test -f $DAEMON || exit 0
 
 [ -r /etc/default/bootlogd ] && . /etc/default/bootlogd
@@ -73,10 +76,14 @@ case "$ACTION" in
 		start-stop-daemon --start --quiet --exec $DAEMON
 		echo "$NAME."
 		;;
+	status)
+		status $DAEMON
+		exit $?
+		;;
 	*)
 		N=${0##*/}
 		N=${N#[SK]??}
-		echo "Usage: $N {start|stop|restart|force-reload}" >&2
+		echo "Usage: $N {start|stop|status|restart|force-reload}" >&2
 		exit 1
 		;;
 esac
-- 
1.7.4.1


