Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 80E0876E4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 15:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4767B18409
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id QY9XEnnx9CvD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:08 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id C760D18346
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:08 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B1C021E07D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:08 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A61951E078
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:08 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:08 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id 99EF4FB6;
	Mon, 16 Jul 2018 17:06:08 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 934739C0AD; Mon, 16 Jul 2018 17:06:08 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 17:05:56 +0200
Message-Id: <20180716150556.16415-5-olofjn@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180716150556.16415-1-olofjn@axis.com>
References: <20180716150556.16415-1-olofjn@axis.com>
X-TM-AS-GCONF: 00
Cc: Olof Johansson <olofjn@axis.com>
Subject: [PATCH 4/4] spdx.bbclass: Encode strings before passing to hashlib
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
X-List-Received-Date: Mon, 16 Jul 2018 15:06:08 -0000

In python3, passing a unicode object to hashlib will result in an
exception that encourages you to encode it first.

Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 meta/classes/spdx.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
index a3e22afc33d..fb78e274a8e 100644
--- a/meta/classes/spdx.bbclass
+++ b/meta/classes/spdx.bbclass
@@ -208,7 +208,7 @@ def hash_file(file_name):
 def hash_string(data):
     import hashlib
     sha1 = hashlib.sha1()
-    sha1.update(data)
+    sha1.update(data.encode('utf-8'))
     return sha1.hexdigest()
 
 def run_fossology(foss_command, full_spdx):
-- 
2.11.0


