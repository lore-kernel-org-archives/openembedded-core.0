Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53D5A6F582
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 14:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 987121807F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 15:37:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id nopAlzoNXWui
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 15:37:36 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 736F918078
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 15:37:36 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 5CC35C00
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 15:37:36 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 5192938D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 15:37:36 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 4FB7E34005
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 15:37:36 +0100 (CET)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0;
	Mon, 3 Mar 2014 15:37:36 +0100
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 1A4639C29D; 
	Mon,  3 Mar 2014 15:37:36 +0100 (CET)
From: Olof Johansson <olof.johansson@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Mar 2014 15:37:36 +0100
Message-ID: <1393857456-18343-1-git-send-email-olof.johansson@axis.com>
X-Mailer: git-send-email 1.8.5.3
MIME-Version: 1.0
Subject: [PATCH v2] sanity.bbclass: support wildcards in SANITY_TESTED_DISTROS
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
X-List-Received-Date: Mon, 03 Mar 2014 14:37:40 -0000
Content-Type: text/plain

With this change, you can use shell like globbing expressions (as
supported by Python's fnmatch) for entries in SANITY_TESTED_DISTROS.
This makes it possible to say that, e.g. "all Debian 7 Wheezy releases
are supported" with the entry "Debian-7.*".

[YOCTO #5265]

Signed-off-by: Olof Johansson <olof.johansson@axis.com>
---
 meta/classes/sanity.bbclass | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index bae010d..d79db8f 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -246,6 +246,8 @@ def check_connectivity(d):
     return retval
 
 def check_supported_distro(sanity_data):
+    from fnmatch import fnmatch
+
     tested_distros = sanity_data.getVar('SANITY_TESTED_DISTROS', True)
     if not tested_distros:
         return
@@ -255,12 +257,15 @@ def check_supported_distro(sanity_data):
     except Exception:
         distro = None
 
-    if distro:
-        if distro not in [x.strip() for x in tested_distros.split('\\n')]:
-            bb.warn('Host distribution "%s" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.' % distro)
-    else:
+    if not distro:
         bb.warn('Host distribution could not be determined; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.')
 
+    for supported in [x.strip() for x in tested_distros.split('\\n')]:
+        if fnmatch(distro, supported):
+            return
+
+    bb.warn('Host distribution "%s" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.' % distro)
+
 # Checks we should only make if MACHINE is set correctly
 def check_sanity_validmachine(sanity_data):
     messages = ""
-- 
1.8.5.3


