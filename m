Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B4FDE73206
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 14:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12EAmjm004695 for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Feb 2016 14:10:48 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7O_lhbatcJYE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 14:10:48 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12EAk5e004692
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Feb 2016 14:10:47 GMT
Message-ID: <1454422246.27087.78.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 02 Feb 2016 14:10:46 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] bitbake.conf/base: Improve handling of SRCPV
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
X-List-Received-Date: Tue, 02 Feb 2016 14:10:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If SRCPV is set, it can be expanded when SRC_URI doesn't support it
leading to errors. Avoid doing this by setting it only when it makes
sense.

This patch depends on the bitbake python expansion patch series.

[YCOTO #7772]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index d68ffbe..75c9acc 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -549,20 +549,24 @@ python () {
                 elif pn in htincompatwl:
                     bb.note("INCLUDING " + pn + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted for HOSTTOOLS")
 
+    needsrcrev = False
     srcuri = d.getVar('SRC_URI', True)
     for uri in srcuri.split():
         (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]
 
         # Svn packages should DEPEND on subversion-native
         if scheme == "svn":
+            needsrcrev = True
             d.appendVarFlag('do_fetch', 'depends', ' subversion-native:do_populate_sysroot')
 
         # Git packages should DEPEND on git-native
         elif scheme == "git":
+            needsrcrev = True
             d.appendVarFlag('do_fetch', 'depends', ' git-native:do_populate_sysroot')
 
         # Mercurial packages should DEPEND on mercurial-native
         elif scheme == "hg":
+            needsrcrev = True
             d.appendVarFlag('do_fetch', 'depends', ' mercurial-native:do_populate_sysroot')
 
         # OSC packages should DEPEND on osc-native
@@ -589,6 +593,9 @@ python () {
         elif path.endswith('.src.rpm'):
             d.appendVarFlag('do_unpack', 'depends', ' file-native:do_populate_sysroot')
 
+    if needsrcrev:
+        d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}")
+
     set_packagetriplet(d)
 
     # 'multimachine' handling
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fbd4c69..361fe32 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -616,7 +616,8 @@ FETCHCMD_hg = "/usr/bin/env hg"
 SRCDATE = "${DATE}"
 SRCREV ??= "INVALID"
 AUTOREV = "${@bb.fetch2.get_autorev(d)}"
-SRCPV = "${@bb.fetch2.get_srcrev(d)}"
+# Set Dynamically in base.bbclass
+# SRCPV = "${@bb.fetch2.get_srcrev(d)}"
 SRCPV[vardepvalue] = "${SRCPV}"
 
 SRC_URI = ""



