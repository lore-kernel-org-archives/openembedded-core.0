Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57B2C7504B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 15:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 30AA318409
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id G5_Fpj5QfJD3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:07 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7CD3618441
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:07 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 530B01E07D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:07 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46E581E078
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:07 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 17:06:07 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id 3A201FB6;
	Mon, 16 Jul 2018 17:06:07 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 2D35B9C0AD; Mon, 16 Jul 2018 17:06:07 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 17:05:54 +0200
Message-Id: <20180716150556.16415-3-olofjn@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180716150556.16415-1-olofjn@axis.com>
References: <20180716150556.16415-1-olofjn@axis.com>
X-TM-AS-GCONF: 00
Cc: Olof Johansson <olofjn@axis.com>
Subject: [PATCH 2/4] spdx.bbclass: Fix undefined variable error
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
X-List-Received-Date: Mon, 16 Jul 2018 15:06:07 -0000

The path variable is used in an error message a few lines later, but was
never defined.

Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 meta/classes/spdx.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/spdx.bbclass b/meta/classes/spdx.bbclass
index ab2eaa5c0c1..9e374d70a6c 100644
--- a/meta/classes/spdx.bbclass
+++ b/meta/classes/spdx.bbclass
@@ -289,7 +289,8 @@ def create_spdx_doc(file_info, scanned_files):
 def get_ver_code(dirname):
     chksums = []
     for f_dir, f in list_files(dirname):
-        hash = hash_file(os.path.join(dirname, f_dir, f))
+        path = os.path.join(dirname, f_dir, f)
+        hash = hash_file(path)
         if not hash is None:
             chksums.append(hash)
         else:
-- 
2.11.0


