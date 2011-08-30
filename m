Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QyR8y-00035a-Uu for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 18:26:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7UGLdbd019934
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 17:21:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18530-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 17:21:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7UGLXi4019928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 17:21:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Aug 2011 17:21:23 +0100
Message-ID: <1314721283.5939.364.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sanity.bbclass: Clean up various MACHINE checks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Aug 2011 16:26:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

[YOCTO #1398]

Firstly we should start checking if MACHINE is set. It if isn't lets
make this a sanity warning since its very hard to successfully build
without setting one (and anyone wanting to do that can disable the
sanity checks easily enough anyway).

Some of the checks depend on a MACHINE being specified. This change
moves those checks to a separate function so they only run if MACHINE
has been set correctly.

Both these issues combine to ensure the user sees a sane message
and avoids the nasty tracebacks in the bug report referenced above.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 7fc3343..37b9028 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -154,6 +154,48 @@ def check_supported_distro(e):
     else:
         bb.warn('Host distribution could not be determined; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.')
 
+# Checks we should only make if MACHINE is set correctly
+def check_sanity_validmachine(e):
+    from bb import data
+
+    messages = ""
+
+    # Check TUNE_ARCH is set
+    if data.getVar('TUNE_ARCH', e.data, True) == 'INVALID':
+        messages = messages + 'TUNE_ARCH is unset. Please ensure your MACHINE configuration includes a valid tune configuration file which will set this correctly.\n'
+
+    # Check TARGET_ARCH is set correctly
+    if data.getVar('TARGE_ARCH', e.data, False) == '${TUNE_ARCH}':
+        messages = messages + 'TARGET_ARCH is being overwritten, likely by your MACHINE configuration files.\nPlease use a valid tune configuration file which should set this correctly automatically\nand avoid setting this in the machine configuration. See the OE-Core mailing list for more information.\n'
+    
+    # Check TARGET_OS is set
+    if data.getVar('TARGET_OS', e.data, True) == 'INVALID':
+        messages = messages + 'Please set TARGET_OS directly, or choose a MACHINE or DISTRO that does so.\n'
+
+    # Check that we don't have duplicate entries in PACKAGE_ARCHS & that TUNE_PKGARCH is in PACKAGE_ARCHS
+    pkgarchs = data.getVar('PACKAGE_ARCHS', e.data, True)
+    tunepkg = data.getVar('TUNE_PKGARCH', e.data, True)
+    tunefound = False
+    seen = {}
+    dups = []
+
+    for pa in pkgarchs.split():
+        if seen.get(pa, 0) == 1:
+            dups.append(pa)
+        else:
+            seen[pa] = 1
+        if pa == tunepkg:
+            tunefound = True
+
+    if len(dups):
+       messages = messages + "Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: %s" % " ".join(dups)
+
+    if tunefound == False:
+       messages = messages + "Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (%s)." % tunepkg
+
+    return messages
+
+
 def check_sanity(e):
     from bb import note, error, data, __version__
 
@@ -185,17 +227,14 @@ def check_sanity(e):
     if (LooseVersion(__version__) < LooseVersion(minversion)):
         messages = messages + 'Bitbake version %s is required and version %s was found\n' % (minversion, __version__)
 
-    # Check TUNE_ARCH is set
-    if data.getVar('TUNE_ARCH', e.data, True) == 'INVALID':
-        messages = messages + 'TUNE_ARCH is unset. Please ensure your MACHINE configuration includes a valid tune configuration file which will set this correctly.\n'
-
-    # Check TARGET_ARCH is set correctly
-    if data.getVar('TARGE_ARCH', e.data, False) == '${TUNE_ARCH}':
-        messages = messages + 'TARGET_ARCH is being overwritten, likely by your MACHINE configuration files.\nPlease use a valid tune configuration file which should set this correctly automatically\nand avoid setting this in the machine configuration. See the OE-Core mailing list for more information.\n'
-    
-    # Check TARGET_OS is set
-    if data.getVar('TARGET_OS', e.data, True) == 'INVALID':
-        messages = messages + 'Please set TARGET_OS directly, or choose a MACHINE or DISTRO that does so.\n'
+    # Check that the MACHINE is valid, if it is set
+    if data.getVar('MACHINE', e.data, True):
+        if not check_conf_exists("conf/machine/${MACHINE}.conf", e.data):
+            messages = messages + 'Please set a valid MACHINE in your local.conf or environment\n'
+        else:
+            messages = messages + check_sanity_validmachine(e)
+    else:
+        messages = messages + 'Please set a MACHINE in your local.conf or environment\n'
 
     # Check we are using a valid lacal.conf
     current_conf  = data.getVar('CONF_VERSION', e.data, True)
@@ -221,11 +260,6 @@ def check_sanity(e):
     # Check user doesn't have ASSUME_PROVIDED = instead of += in local.conf
     if "diffstat-native" not in assume_provided:
         messages = messages + 'Please use ASSUME_PROVIDED +=, not ASSUME_PROVIDED = in your local.conf\n'
-    
-    # Check that the MACHINE is valid, if it is set
-    if data.getVar('MACHINE', e.data, True):
-        if not check_conf_exists("conf/machine/${MACHINE}.conf", e.data):
-            messages = messages + 'Please set a valid MACHINE in your local.conf\n'
 
     # Check that DL_DIR is set, exists and is writable. In theory, we should never even hit the check if DL_DIR isn't 
     # set, since so much relies on it being set.
@@ -415,27 +449,6 @@ def check_sanity(e):
     elif oeroot.find (' ') != -1:
         messages = messages + "Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space."
 
-    # Check that we don't have duplicate entries in PACKAGE_ARCHS & that TUNE_PKGARCH is in PACKAGE_ARCHS
-    pkgarchs = data.getVar('PACKAGE_ARCHS', e.data, True)
-    tunepkg = data.getVar('TUNE_PKGARCH', e.data, True)
-    tunefound = False
-    seen = {}
-    dups = []
-
-    for pa in pkgarchs.split():
-        if seen.get(pa, 0) == 1:
-            dups.append(pa)
-        else:
-            seen[pa] = 1
-        if pa == tunepkg:
-            tunefound = True
-
-    if len(dups):
-       messages = messages + "Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: %s" % " ".join(dups)
-
-    if tunefound == False:
-       messages = messages + "Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (%s)." % tunepkg
-
     if messages != "":
         raise_sanity_error(messages)
 




