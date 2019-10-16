Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D6687F35C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 16:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 586D318149
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:46 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id YPRaUMEaDHPI
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:44 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7312D1844B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 289941A097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D6EB1A08E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:42 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:42 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by seth.se.axis.com (Postfix) with ESMTP id 119BA2CE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:42 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x9GGUgZ1018453
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:42 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x9GGUgBC018452
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Oct 2019 18:30:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2019 18:30:32 +0200
Message-Id: <12218799220f1a0ca0879c5a4ea6226559a244b3.1571243326.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1571243326.git.pkj@axis.com>
References: <cover.1571243326.git.pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [warrior][PATCH 8/8] lib/oe/lsb: Make sure the distro ID is always lowercased
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
X-List-Received-Date: Wed, 16 Oct 2019 16:30:45 -0000
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

In commit 8689e561 (lib/oe/lsb: attempt to ensure consistent distro id
regardless of source), the distro ID returned by
oe.lsb.distro_identifier() was lowercased, but only if a release
version is also present.

This changes the code to always lowercase the distro ID, including the
default distro ID "unknown", which is used if no other ID can be
identified.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


