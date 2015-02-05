Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3C36372E78
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:40 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id kq14so10919974pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=IqZAcFY1dnawqIimYA6jAdEp7yIzme7lqPzLC+WvWKg=;
	b=UyoLS5cInRbsNnGAZhrDvM1SzFRZA0QDNWvsjuaGX44sFgAqOzAJg3XXEAGLK0aqsQ
	JxXcPx2w1ar3LSU7iWEPzLMpA6Yjy5dA30hT4uRFRXAHZzJhUsNJDeHADOZ8bUqNxnb3
	0zJfp96ntOfTJKbHJiBmJdYlxDGUMLBVNApZjiZvKzMTXe9EPKB8X5kIfmwzgnY9aeua
	0MHIs4daeJQfKHbmNlnpd4UZvWTXP2WV/fO8/1jqUV2M+kFBbLee4YE/jvhTOC1ySW6/
	C3cqpO6VYo7KLKTSbY9KXQEAYCPq1BX/tojl33WHolBLCzi54lm/SuZEg4y+sVAvbzS0
	7skg==
X-Received: by 10.66.55.41 with SMTP id o9mr6799350pap.80.1423152342172;
	Thu, 05 Feb 2015 08:05:42 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:52 -0800
Message-Id: <e803a8fa9a88c0d97e4fa2204158dea7c45cd378.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 44/61] package/prserv: Merge two similar functions into one
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:41 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Having these two separate functions handling PR values seems pointless,
and worse, there are impossible code branches mixed within them.

Merge them into one function and tweak comments so at least you
don't have to read both functions to figure out what is going on.

This does restructure the conditionals to try and aid readability.

(From OE-Core rev: 865d001de168915a5796e5c760f96bdd04cebd61)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/package.bbclass | 52 ++++++++++++++++++++++++++++++++------------
 meta/classes/prserv.bbclass  | 31 --------------------------
 2 files changed, 38 insertions(+), 45 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4685cd2..320ec0e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -394,28 +394,52 @@ def runtime_mapping_rename (varname, pkg, d):
 #
 
 python package_get_auto_pr() {
-    # per recipe PRSERV_HOST
+    import oe.prservice
+    import re
+
+    # Support per recipe PRSERV_HOST
     pn = d.getVar('PN', True)
     host = d.getVar("PRSERV_HOST_" + pn, True)
     if not (host is None):
         d.setVar("PRSERV_HOST", host)
 
-    if d.getVar('PRSERV_HOST', True):
-        try:
-            auto_pr=prserv_get_pr_auto(d)
-        except Exception as e:
-            bb.fatal("Can NOT get PRAUTO, exception %s" %  str(e))
-        if auto_pr is None:
-            if d.getVar('PRSERV_LOCKDOWN', True):
-                bb.fatal("Can NOT get PRAUTO from lockdown exported file")
-            else:
-                bb.fatal("Can NOT get PRAUTO from remote PR service")
-            return
-        d.setVar('PRAUTO',str(auto_pr))
-    else:
+    # PR Server not active, handle AUTOINC
+    if not d.getVar('PRSERV_HOST', True):
         pkgv = d.getVar("PKGV", True)
         if 'AUTOINC' in pkgv:
             d.setVar("PKGV", pkgv.replace("AUTOINC", "0"))
+        return
+
+    auto_pr = None
+    pv = d.getVar("PV", True)
+    version = d.getVar("PRAUTOINX", True)
+    pkgarch = d.getVar("PACKAGE_ARCH", True)
+    checksum = d.getVar("BB_TASKHASH", True)
+
+    if d.getVar('PRSERV_LOCKDOWN', True):
+        auto_pr = d.getVar('PRAUTO_' + version + '_' + pkgarch, True) or d.getVar('PRAUTO_' + version, True) or None
+        if auto_pr is None:
+            bb.fatal("Can NOT get PRAUTO from lockdown exported file")
+        d.setVar('PRAUTO',str(auto_pr))
+        return
+
+    try:
+        conn = d.getVar("__PRSERV_CONN", True)
+        if conn is None:
+            conn = oe.prservice.prserv_make_conn(d)
+        if conn is not None:
+            if "AUTOINC" in pv:
+                srcpv = bb.fetch2.get_srcrev(d)
+                base_ver = "AUTOINC-%s" % version[:version.find(srcpv)]
+                value = conn.getPR(base_ver, pkgarch, srcpv)
+                d.setVar("PKGV", pv.replace("AUTOINC", str(value)))
+
+            auto_pr = conn.getPR(version, pkgarch, checksum)
+    except Exception as e:
+        bb.fatal("Can NOT get PRAUTO, exception %s" %  str(e))
+    if auto_pr is None:
+        bb.fatal("Can NOT get PRAUTO from remote PR service")
+    d.setVar('PRAUTO',str(auto_pr))
 }
 
 LOCALEBASEPN ??= "${PN}"
diff --git a/meta/classes/prserv.bbclass b/meta/classes/prserv.bbclass
index b440d86..139597f 100644
--- a/meta/classes/prserv.bbclass
+++ b/meta/classes/prserv.bbclass
@@ -1,33 +1,2 @@
-def prserv_get_pr_auto(d):
-    import oe.prservice
-    import re
 
-    pv = d.getVar("PV", True)
-    if not d.getVar('PRSERV_HOST', True):
-        if 'AUTOINC' in pv:
-            d.setVar("PKGV", pv.replace("AUTOINC", "0"))
-        bb.warn("Not using network based PR service")
-        return None
 
-    version = d.getVar("PRAUTOINX", True)
-    pkgarch = d.getVar("PACKAGE_ARCH", True)
-    checksum = d.getVar("BB_TASKHASH", True)
-
-    conn = d.getVar("__PRSERV_CONN", True)
-    if conn is None:
-        conn = oe.prservice.prserv_make_conn(d)
-        if conn is None:
-            return None
-
-    if "AUTOINC" in pv:
-        srcpv = bb.fetch2.get_srcrev(d)
-        base_ver = "AUTOINC-%s" % version[:version.find(srcpv)]
-        value = conn.getPR(base_ver, pkgarch, srcpv)
-        d.setVar("PKGV", pv.replace("AUTOINC", str(value)))
-
-    if d.getVar('PRSERV_LOCKDOWN', True):
-        auto_rev = d.getVar('PRAUTO_' + version + '_' + pkgarch, True) or d.getVar('PRAUTO_' + version, True) or None
-    else:
-        auto_rev = conn.getPR(version, pkgarch, checksum)
-
-    return auto_rev
-- 
1.9.1


