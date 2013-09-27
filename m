Return-Path: <net147@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 52E876CA6B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 01:33:15 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id bj1so2086502pad.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 18:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NkSvfKApTNixBRjVdzf7KC8N/tig+4OodsbjMQu1Zwg=;
	b=LGa5nMb05vvXxnBND9UijI/Kq2bv/LMR4usWHD97PQlsRfjFQhbpW52sxtOfPkVtbn
	46FwGKaOA9a6CO2VXFblSEFhSCkxRwe8fyAgocb4Axbj9umYbLPsvNs6FZRZCjpm8GMW
	7pKz29TL/pM/kyC/ef/KjNCBo1rgQaK0uLb5x8zoD8J40GfKHvL6n6McXzbRO8HTTZ9y
	fRRUvbcC1el4Vdrh8/zCR0iiHSbjnr51IQPk65+WgLEN9p95eyVRDbKaCUKvOjmN3Q4E
	8T5zWbtzzrmd9vWdWkKIXb6WwCjIKskjJ8X1Si8/dhsW1x7fZAFG0Jxu295nzkbFOEOU
	STNA==
X-Received: by 10.66.164.136 with SMTP id yq8mr8441070pab.67.1380245597031;
	Thu, 26 Sep 2013 18:33:17 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id dw3sm5098493pbc.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 26 Sep 2013 18:33:16 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2013 11:30:10 +1000
Message-Id: <1380245410-11696-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [PATCH] boot-directdisk: ensure generated MBR disk signature is non-zero
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
X-List-Received-Date: Fri, 27 Sep 2013 01:33:16 -0000

A zero MBR disk signature is generally seen as no signature and
another partitioning program might install a new signature.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/boot-directdisk.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 4b9d7bd..8641e85 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -148,7 +148,11 @@ python do_bootdirectdisk() {
 def generate_disk_signature():
     import uuid
 
-    return str(uuid.uuid4())[:8]
+    while True:
+        signature = str(uuid.uuid4())[:8]
+
+        if signature != '00000000':
+            return signature
 
 def validate_disk_signature(d):
     import re
-- 
1.8.4


