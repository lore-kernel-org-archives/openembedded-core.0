Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBUEN-0005PZ-4h
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 18:59:05 +0100
Received: by mail-da0-f41.google.com with SMTP id j17so1511057dan.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 09:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=GT7fpNm/dckoTPf/ULVvAEv9h6o1t6w2y8OZgmkHIVg=;
	b=gh0OZ5NpCiK47t4JCimkeiNjmSgfsnUS1HqoFV5GdM6y5GHEWXx10itcFg1YIl8vvL
	+T6UgfkPRaJkwVaBLmkV2NAC2Hk0lpwXyAibsHRKro4MRxZ9AaoD5tu8MMi6shkr7CXy
	+k2LChHg/YvnhxImpopoWrYMC6AYO8j5cj6YgKJucNfGx2yJ/FUn1MbqIc4fHTMoRDXA
	PGX3uzya/dATQeja8qK9A94NAMxFVGnT6iHbPGeJdYCFrxU27Q322iERf0ZRahpMzm7/
	x/06/pM30Rsoq5VdTRzGb6D49OpvfNI26Vc81mkmMBd7DiVMWqFVTMp0i5YM+8MdUYuC
	wsZw==
X-Received: by 10.68.209.134 with SMTP id mm6mr15578062pbc.3.1362159746740;
	Fri, 01 Mar 2013 09:42:26 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id eg1sm1717554pbb.33.2013.03.01.09.42.23
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Mar 2013 09:42:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2013 18:42:22 +0100
Message-Id: <1362159742-20602-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] sanity.bbclass: always use oe.lsb.distro_identifier method
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
X-List-Received-Date: Fri, 01 Mar 2013 17:59:09 -0000

* even when /etc/redhat-release or /etc/SuSE-release exists
* don't read /etc/lsb-release manually, NATIVELSBSTRING is not
  reading it too

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sanity.bbclass | 36 ++++--------------------------------
 1 file changed, 4 insertions(+), 32 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 94c6ce3..06e95e3 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -263,39 +263,11 @@ def check_supported_distro(sanity_data):
     if not tested_distros:
         return
 
-    if os.path.exists("/etc/redhat-release"):
-        f = open("/etc/redhat-release", "r")
-        try:
-            distro = f.readline().strip()
-        finally:
-            f.close()
-    elif os.path.exists("/etc/SuSE-release"):
-        import re
-        f = open("/etc/SuSE-release", "r")
-        try:
-            distro = f.readline()
-            # Remove the architecture suffix e.g. (i586)
-            distro = re.sub(r' \([a-zA-Z0-9\-_]*\)$', '', distro).strip()
-        finally:
-            f.close()
-    else:
-        # Use LSB method
-        try:
-            distro = oe.lsb.distro_identifier()
-        except Exception:
-            distro = None
+    try:
+        distro = oe.lsb.distro_identifier()
+    except Exception:
+        distro = None
 
-        if not distro:
-            if os.path.exists("/etc/lsb-release"):
-                f = open("/etc/lsb-release", "r")
-                try:
-                    for line in f:
-                        lns = line.split('=')
-                        if lns[0] == "DISTRIB_DESCRIPTION":
-                            distro = lns[1].strip('"\n')
-                            break
-                finally:
-                    f.close()
     if distro:
         if distro not in [x.strip() for x in tested_distros.split('\\n')]:
             bb.warn('Host distribution "%s" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.' % distro)
-- 
1.8.1.4



