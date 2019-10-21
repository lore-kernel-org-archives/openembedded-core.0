Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 482717F382
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 10:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 880F8182BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:39 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id sgqS0s7bxeca
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9589F1832D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81B231A06D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75D181A06B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.130.9])
	by thoth.se.axis.com (Postfix) with ESMTP id 69DCB2DF4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 6430640AB1; Mon, 21 Oct 2019 12:30:34 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2019 12:30:28 +0200
Message-Id: <20191021103034.12200-3-olani@axis.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191021103034.12200-1-olani@axis.com>
References: <20191021103034.12200-1-olani@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 3/9] lib/oe/packagedata: Use with to control file handle lifetime
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
X-List-Received-Date: Mon, 21 Oct 2019 10:30:38 -0000

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/lib/oe/packagedata.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index cbde380b03..a82085a792 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -17,9 +17,8 @@ def read_pkgdatafile(fn):
 
     if os.access(fn, os.R_OK):
         import re
-        f = open(fn, 'r')
-        lines = f.readlines()
-        f.close()
+        with open(fn, 'r') as f:
+            lines = f.readlines()
         r = re.compile("([^:]+):\s*(.*)")
         for l in lines:
             m = r.match(l)
-- 
2.11.0


