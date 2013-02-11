Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <anders.roxell@gmail.com>) id 1U4tef-0008FR-2N
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 14:42:45 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Mon, 11 Feb 2013 14:26:46 +0100
Received: by sestofb10.enea.se (Postfix, from userid 3976)	id 821C9291D4B;
	Mon, 11 Feb 2013 14:26:46 +0100 (CET)
From: <anders.roxell@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Feb 2013 14:26:28 +0100
Message-ID: <1360589188-45401-1-git-send-email-anders.roxell@gmail.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: Neutral (SESTOEX08.enea.se: 172.21.3.145 is neither permitted
	nor denied by domain of anders.roxell@gmail.com)
Cc: Anders Roxell <anders.roxell@enea.com>
Subject: [PATCH] distro_check: Remove creation of empty Meego filelist.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Feb 2013 13:42:45 -0000
Content-Type: text/plain

From: Anders Roxell <anders.roxell@enea.com>

This fixes permissions errors when running distrodata.

Signed-off-by: Anders Roxell <anders.roxell@enea.com>
---
 meta/lib/oe/distro_check.py |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index ad13d5e..8ed5b0e 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -73,13 +73,12 @@ def clean_package_list(package_list):
 def get_latest_released_meego_source_package_list():
     "Returns list of all the name os packages in the latest meego distro"
 
-    if not os.path.isfile("/tmp/Meego-1.1"):
-        os.mknod("/tmp/Meego-1.1")
-    f = open("/tmp/Meego-1.1", "r")
     package_names = []
-    for line in f:
-        package_names.append(line[:-1] + ":" + "main") # Also strip the '\n' at the end
-     
+    try:
+        f = open("/tmp/Meego-1.1", "r")
+        for line in f:
+            package_names.append(line[:-1] + ":" + "main") # Also strip the '\n' at the end
+    except IOError: pass
     package_list=clean_package_list(package_names)
     return "1.0", package_list
 
-- 
1.7.5.4



