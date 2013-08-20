Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43D3F6B8A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 07:02:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7K72fur011434
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 00:02:41 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 20 Aug 2013 00:02:40 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2013 15:02:49 +0800
Message-ID: <5a34823481741abaf039545e0809fd8305b125b6.1376982051.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1376982051.git.rongqing.li@windriver.com>
References: <cover.1376982051.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] shadow: backport a patch to make newgrp work
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
X-List-Received-Date: Tue, 20 Aug 2013 07:02:41 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../shadow/files/fix-etc-gshadow-reading.patch     |   36 ++++++++++++++++++++
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch

diff --git a/meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch b/meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch
new file mode 100644
index 0000000..80ebdc2
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch
@@ -0,0 +1,36 @@
+shadow: Fix parsing of gshadow entries
+
+Upstream-Status: Backport [http://anonscm.debian.org/viewvc/pkg-shadow?view=revision&revision=3096]
+
+newgrp command does not function properly.
+Even with the valid password, it outputs: "'Invalid password'"
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+
+2010-02-14  Michael Bunk  <mb@computer-leipzig.com>
+
+	* NEWS, lib/gshadow.c: Fix parsing of gshadow entries.
+
+diff -urpN a/lib/gshadow.c b/lib/gshadow.c
+--- a/lib/gshadow.c	2013-07-11 10:18:15.745450428 +0800
++++ b/lib/gshadow.c	2013-07-11 10:17:30.465450280 +0800
+@@ -222,6 +222,7 @@ void endsgent (void)
+ 		if (NULL == buf) {
+ 			return NULL;
+ 		}
++		buflen = BUFSIZ;
+ 	}
+ 
+ 	if (NULL == fp) {
+@@ -229,9 +230,9 @@ void endsgent (void)
+ 	}
+ 
+ #ifdef	USE_NIS
+-	while (fgetsx (buf, (int) sizeof buf, fp) == buf)
++	while (fgetsx (buf, (int) buflen, fp) == buf)
+ #else
+-	if (fgetsx (buf, (int) sizeof buf, fp) == buf)
++	if (fgetsx (buf, (int) buflen, fp) == buf)
+ #endif
+ 	{
+ 		while (   ((cp = strrchr (buf, '\n')) == NULL)
diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index af67339..31cef20 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://shadow-update-pam-conf.patch \
            file://shadow_fix_for_automake-1.12.patch \
            file://slackware_fix_for_glib-2.17_crypt.patch \
+           file://fix-etc-gshadow-reading.patch \
            "
 
 SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
-- 
1.7.10.4


