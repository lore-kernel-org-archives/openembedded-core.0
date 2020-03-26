Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.31385.1585199904858913479
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 22:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 02Q5IK2F009928
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2020 22:18:20 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Mar 2020 22:18:19 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] vala.bbclass: add libdir to XDG_DATA_DIRS
Date: Thu, 26 Mar 2020 13:18:18 +0800
Message-ID: <1585199898-87195-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Otherwise .gir files installed in the sysroot will not be found when
multilib is in use.

for vapigen, it need to find .vapi and .gir files under XDG_DATA_DIRS,
for gobject-introspection, multilib configurations use libdir rather
than datadir

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/vala.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/vala.bbclass b/meta/classes/vala.bbclass
index 615eb37..bcaf68c 100644
--- a/meta/classes/vala.bbclass
+++ b/meta/classes/vala.bbclass
@@ -8,7 +8,7 @@ DEPENDS_append = " vala-native ${VALADEPENDS}"
 # Our patched version of Vala looks in STAGING_DATADIR for .vapi files
 export STAGING_DATADIR
 # Upstream Vala >= 0.11 looks in XDG_DATA_DIRS for .vapi files
-export XDG_DATA_DIRS = "${STAGING_DATADIR}"
+export XDG_DATA_DIRS = "${STAGING_DATADIR}:${STAGING_LIBDIR}"
 
 # Package additional files
 FILES_${PN}-dev += "\
-- 
2.7.4

