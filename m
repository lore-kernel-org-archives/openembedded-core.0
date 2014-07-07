Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E80DD70356
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 04:40:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s674ecEw021131
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 6 Jul 2014 21:40:38 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Sun, 6 Jul 2014 21:40:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 6 Jul 2014 21:40:37 -0700
Message-ID: <33bebf0c7911a1d338265cc73c9f4c321a2d26e4.1404707988.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1404707988.git.liezhi.yang@windriver.com>
References: <cover.1404707988.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] base-passwd: install passwd and group atomically
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
X-List-Received-Date: Mon, 07 Jul 2014 04:40:43 -0000
Content-Type: text/plain

Fixed the race issue:
util-macros.do_package failed: 'getpwnam(): name not found: root'

The error happens when there is a half etc/passwd, fixed by:
$ install usr/share/base-passwd/passwd.master etc/passwd.master
$ mv etc/passwd.master etc/passwd

The "mv" is atomic which will fix this problem.

[YOCTO #6124]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-core/base-passwd/base-passwd_3.5.29.bb |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index 59bd413..ec8f2af 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -47,9 +47,14 @@ base_passwd_sstate_postinst() {
 		# put these files in the target sysroot so they can
 		# be used by recipes which use custom user/group
 		# permissions.
+		# Install passwd.master and group.master to sysconfdir and mv
+		# them to make sure they are atomically install.
 		install -d -m 755 ${STAGING_DIR_TARGET}${sysconfdir}
-		install -p -m 644 ${STAGING_DIR_TARGET}${datadir}/base-passwd/passwd.master ${STAGING_DIR_TARGET}${sysconfdir}/passwd
-		install -p -m 644 ${STAGING_DIR_TARGET}${datadir}/base-passwd/group.master ${STAGING_DIR_TARGET}${sysconfdir}/group
+		for i in passwd group; do
+			install -p -m 644 ${STAGING_DIR_TARGET}${datadir}/base-passwd/$i.master \
+				${STAGING_DIR_TARGET}${sysconfdir}/
+			mv ${STAGING_DIR_TARGET}${sysconfdir}/$i.master ${STAGING_DIR_TARGET}${sysconfdir}/$i
+		done
 	fi
 }
 
-- 
1.7.9.5


