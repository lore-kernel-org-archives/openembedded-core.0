Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A182D6F1A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 15:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D244B182E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 16:00:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Du-zrZyy2JYb
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 16:00:49 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id A9759181F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 16:00:49 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 8FE3BEA4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 16:00:49 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 84AAAEA0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 16:00:49 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 81F5234005
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 16:00:49 +0100 (CET)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.2.255.0; Fri, 28 Feb 2014
	16:00:49 +0100
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 4F3A89C29D; 
	Fri, 28 Feb 2014 16:00:49 +0100 (CET)
From: Olof Johansson <olof.johansson@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Feb 2014 16:00:49 +0100
Message-ID: <1393599649-10573-1-git-send-email-olof.johansson@axis.com>
X-Mailer: git-send-email 1.8.5.3
MIME-Version: 1.0
Subject: [RFC] sanity.bbclass: support wildcards in SANITY_TESTED_DISTROS
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
X-List-Received-Date: Fri, 28 Feb 2014 15:00:51 -0000
Content-Type: text/plain

With this change, you can use wildcards for entries in
SANITY_TESTED_DISTROS. This makes it possible to say that, e.g. "all
Debian 7 Wheezy releases are supported" with the entry "Debian-7.*".

[YOCTO #5265]

Signed-off-by: Olof Johansson <olof.johansson@axis.com>
---
 meta/classes/sanity.bbclass | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index bae010d..59f663b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -245,6 +245,15 @@ def check_connectivity(d):
 
     return retval
 
+def _distro_match_glob(distro, supported):
+    if not '*' in supported:
+        return distro == supported
+
+    bb.debug(2, "Glob matching found for %s. Trying to match against %s" % (
+        supported, distro))
+    prefix, sufix = supported.split('*', 1)
+    return distro.startswith(prefix) and distro.endswith(sufix)
+
 def check_supported_distro(sanity_data):
     tested_distros = sanity_data.getVar('SANITY_TESTED_DISTROS', True)
     if not tested_distros:
@@ -255,12 +264,15 @@ def check_supported_distro(sanity_data):
     except Exception:
         distro = None
 
-    if distro:
-        if distro not in [x.strip() for x in tested_distros.split('\\n')]:
-            bb.warn('Host distribution "%s" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.' % distro)
-    else:
+    if not distro:
         bb.warn('Host distribution could not be determined; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.')
 
+    for supported in [x.strip() for x in tested_distros.split('\\n')]:
+        if _distro_match_glob(distro, supported):
+            return
+
+    bb.warn('Host distribution "%s" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.' % distro)
+
 # Checks we should only make if MACHINE is set correctly
 def check_sanity_validmachine(sanity_data):
     messages = ""
-- 
1.8.5.3


