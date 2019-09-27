Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A43C17D3EF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 10:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 71E8A185F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 12:33:58 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ZhBgk4b5DHOD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 12:33:57 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id ACC6418521
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 12:33:57 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 938331E0AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 12:33:57 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 889531E0AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 12:33:57 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 12:33:57 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by seth.se.axis.com (Postfix) with ESMTP id 7C76422DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 12:33:57 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x8RAXvlv017774
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 12:33:57 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x8RAXvH5017773
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Sep 2019 12:33:57 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2019 12:33:52 +0200
Message-Id: <20190927103352.17725-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH] lib/oe/lsb: Make sure the distro ID is always lowercased
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
X-List-Received-Date: Fri, 27 Sep 2019 10:33:59 -0000
Content-Transfer-Encoding: 8bit

In commit 8689e561 (lib/oe/lsb: attempt to ensure consistent distro id
regardless of source), the distro ID returned by
oe.lsb.distro_identifier() was lowercased, but only if a release
version is also present.

This changes the code to always lowercase the distro ID, including the
default distro ID "unknown", which is used if no other ID can be
identified.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oe/lsb.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 4f2b419edc..43e46380d7 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -110,12 +110,12 @@ def distro_identifier(adjust_hook=None):
     if adjust_hook:
         distro_id, release = adjust_hook(distro_id, release)
     if not distro_id:
-        return "Unknown"
-    # Filter out any non-alphanumerics
-    distro_id = re.sub(r'\W', '', distro_id)
+        return "unknown"
+    # Filter out any non-alphanumerics and convert to lowercase
+    distro_id = re.sub(r'\W', '', distro_id).lower()
 
     if release:
-        id_str = '{0}-{1}'.format(distro_id.lower(), release)
+        id_str = '{0}-{1}'.format(distro_id, release)
     else:
         id_str = distro_id
     return id_str.replace(' ','-').replace('/','-')
-- 
2.21.0


