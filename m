Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E835B7504B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 15:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A1D2F1843F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id sGBciXMpGLsv
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:08 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2539A18346
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:08 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F33DA1A088
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:07 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7EF61A082
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:07 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:07 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id DBB92386;
	Mon, 16 Jul 2018 17:06:07 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id D457B9C0AD; Mon, 16 Jul 2018 17:06:07 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 17:05:55 +0200
Message-Id: <20180716150556.16415-4-olofjn@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180716150556.16415-1-olofjn@axis.com>
References: <20180716150556.16415-1-olofjn@axis.com>
X-TM-AS-GCONF: 00
Cc: Olof Johansson <olofjn@axis.com>
Subject: [PATCH 3/4] spdx.bbclass: Make use of bb.utils' sha1_file()
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

The same functionality already exists within bitbake, so avoid
duplicating.

Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 meta/classes/spdx.bbclass | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
index 9e374d70a6c..a3e22afc33d 100644
--- a/meta/classes/spdx.bbclass
+++ b/meta/classes/spdx.bbclass
@@ -202,13 +202,8 @@ def list_files(dir):
     return
 
 def hash_file(file_name):
-    try:
-        with open(file_name, 'rb') as f:
-            data_string = f.read()
-            sha1 = hash_string(data_string)
-            return sha1
-    except:
-        return None
+    from bb.utils import sha1_file
+    return sha1_file(file_name)
 
 def hash_string(data):
     import hashlib
-- 
2.11.0


