Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 172E262252
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jun 2014 21:57:35 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1X10cq-0007DT-Jb from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jun 2014 14:57:36 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sat, 28 Jun 2014 14:57:36 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-02.mgc.mentorg.com (147.34.96.168) with Microsoft SMTP
	Server id 14.2.247.3; Sat, 28 Jun 2014 14:56:53 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 28 Jun 2014 17:57:34 -0400
Message-ID: <1403992654-7672-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-OriginalArrivalTime: 28 Jun 2014 21:57:36.0387 (UTC)
	FILETIME=[F8C19530:01CF931B]
Subject: [PATCH] initrdscripts: Try to boot if boot label is unknown
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
X-List-Received-Date: Sat, 28 Jun 2014 21:57:43 -0000
Content-Type: text/plain

The init-live.sh scripts assumes that the boot label set by
the LABELS variable is either "boot", "install", or
"install-efi".  If that variable is overridden to something else
we fall off the end of the case statement and the system locks
up.  If the boot label is unknown, at least attempt to boot.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 0be9b6f..2821964 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -220,4 +220,8 @@ case $label in
 	# If we're getting here, we failed...
 	fatal "Installation image failed"
 	;;
+    *)
+	# Not sure what boot label is provided.  Try to boot to avoid locking up.
+	mount_and_boot
+	;;
 esac
-- 
1.9.1


