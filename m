Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D05D477A2D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 08:04:24 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4C84L0o027514
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 12 May 2017 09:04:22 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1d95Yj-0001PZ-CH; Fri, 12 May 2017 09:04:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 May 2017 09:04:19 +0100
Message-Id: <1494576259-5387-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 12 May 2017 09:04:22 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] base: Simplify BASEDEPENDS construction
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
X-List-Received-Date: Fri, 12 May 2017 08:04:26 -0000

This code dates from distant times before we had class overrides.
The comments are also rather stale. Rewrite this code using class
overrides which makes it safer, more modern and more easily
understandable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass    | 21 +++++++--------------
 meta/classes/gettext.bbclass |  2 +-
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index d95afb7..7892665 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -61,22 +61,15 @@ oe_runmake() {
 
 
 def base_dep_prepend(d):
-    #
-    # Ideally this will check a flag so we will operate properly in
-    # the case where host == build == target, for now we don't work in
-    # that case though.
-    #
+    if d.getVar('INHIBIT_DEFAULT_DEPS', False):
+        return ""
+    return "${BASE_DEFAULT_DEPS}"
 
-    deps = ""
-    # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
-    # we need that built is the responsibility of the patch function / class, not
-    # the application.
-    if not d.getVar('INHIBIT_DEFAULT_DEPS', False):
-        if (d.getVar('HOST_SYS') != d.getVar('BUILD_SYS')):
-            deps += " virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/libc "
-    return deps
+BASE_DEFAULT_DEPS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
 
-BASEDEPENDS = "${@base_dep_prepend(d)}"
+BASEDEPENDS = ""
+BASEDEPENDS_class-target = "${@base_dep_prepend(d)}"
+BASEDEPENDS_class-nativesdk = "${@base_dep_prepend(d)}"
 
 DEPENDS_prepend="${BASEDEPENDS} "
 
diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index 0be1424..d60a0c1 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -15,5 +15,5 @@ def gettext_oeconf(d):
 
 DEPENDS_GETTEXT ??= "virtual/gettext gettext-native"
 
-BASEDEPENDS =+ "${@gettext_dependencies(d)}"
+BASEDEPENDS_append = " ${@gettext_dependencies(d)}"
 EXTRA_OECONF_append = " ${@gettext_oeconf(d)}"
-- 
2.7.4


