Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BBE5E6B8F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 06:16:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7L6G65Y012645
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 23:16:06 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 20 Aug 2013 23:16:06 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Aug 2013 14:15:50 +0800
Message-ID: <00b70d017db692cbb7d5965de26726ae0a695f88.1377064624.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1377064624.git.jackie.huang@windriver.com>
References: <cover.1377064624.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] nfs-utils: add init.d/nfsserver status command for LSB compliance
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
X-List-Received-Date: Wed, 21 Aug 2013 06:16:06 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../nfs-utils/nfs-utils/nfsserver                  |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index e460e26..5b4f199 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -14,6 +14,8 @@
 #
 # Startup script for nfs-utils
 #
+# Source function library.
+. /etc/init.d/functions
 #
 # The environment variable NFS_SERVERS may be set in /etc/default/nfsd
 # Other control variables may be overridden here too
@@ -141,6 +143,13 @@ stop)	exportfs -ua
 	stop_statd
 	stop_mountd
 	stop_nfsd;;
+status)
+	status /usr/sbin/rpc.mountd
+	RETVAL=$?
+	status nfsd
+	rval=$?
+	[ $RETVAL -eq 0 ] && exit $rval
+	exit $RETVAL;;
 reload)	test -r /etc/exports && exportfs -r;;
 restart)exportfs -ua
 	stop_mountd
-- 
1.7.4.1


