Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q7D4k-00086u-UL
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 22:42:11 +0200
Received: by gyf1 with SMTP id 1so325754gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 13:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=DMC0eUZxN/bNCeHiJabtVUnF8i/EmxY4VP1OSi3wUmw=;
	b=aPMKZBk5iT+Kb/cE0RBYMf+WrTb3xCc7XtCJ/RAmPkmV1E2t7moN1QY3/UyCtRP2c1
	Ihy7Uu5Fv0YdkIEATaslE913TittNyyDFxMgX8ChuDG0SysIDbzq0wggVUlJfMZHSOfR
	yAQ+YBcv5HlQHVcLLnMS5ZKIImMrKP+A5Al0I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=hFVWMzGV7xCPJw4HfW+2hj70KF9vcvUxWcHsxzHq7J2EMKia91Xxv4gTa8pXXLR8mF
	ram6Y1/2yL9DIpCkhMuVBaPpNM873k27rimvI683OCu9V8IqaiuUM0LkJ1Z1a23yGkFD
	pHK2gg1+iDI559APYL/WkK5CKKF9nrXAtaM94=
Received: by 10.150.160.1 with SMTP id i1mr989640ybe.223.1302036004494;
	Tue, 05 Apr 2011 13:40:04 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id p28sm288105ybk.0.2011.04.05.13.40.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 13:40:04 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2011 13:39:56 -0700
Message-Id: <f77a7a4b4d9704141c2a66f3a1b48b8366f2c971.1302035800.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302035800.git.chris_larson@mentor.com>
References: <cover.1302035800.git.chris_larson@mentor.com>
In-Reply-To: <cover.1302035800.git.chris_larson@mentor.com>
References: <cover.1302035800.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] Clean up how we handle unpack/fetch deps from SRC_URI
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
X-List-Received-Date: Tue, 05 Apr 2011 20:42:11 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/base.bbclass |   56 +++++++++++++++++++++++---------------------
 1 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 9c9fc7c..0a1aebf 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -254,9 +254,37 @@ do_build () {
 	:
 }
 
+
+def set_uri_depends(d):
+    import oe.fetch
+
+    unpack_depends = set()
+    fetch_depends = set()
+    for uri in oe.fetch.src_uri(d):
+	if uri.scheme == 'git':
+	    fetch_depends.add('git-native')
+	elif uri.scheme == 'hg':
+	    fetch_depends.add('mercurial-native')
+	elif uri.scheme == 'osc':
+	    fetch_depends.add('osc-native')
+
+	root, ext = os.path.splitext(uri.path)
+	if ext == '.xz':
+	    unpack_depends.add('xz-native')
+
+    fdepends = d.getVarFlag('do_fetch', 'depends') or ''
+    fdepends += ' '.join('%s:do_populate_sysroot' % f for f in fetch_depends)
+    d.setVarFlag('do_fetch', 'depends', fdepends)
+
+    udepends = d.getVarFlag('do_unpack', 'depends') or ''
+    udepends += ' '.join('%s:do_populate_sysroot' % u for u in unpack_depends)
+    d.setVarFlag('do_unpack', 'depends', udepends)
+
 python () {
     import exceptions, string
 
+    set_uri_depends(d)
+
     # If PRINC is set, try and increase the PR value by the amount specified
     princ = bb.data.getVar('PRINC', d, True)
     if princ:
@@ -341,25 +369,6 @@ python () {
     if use_nls != None:
         bb.data.setVar('USE_NLS', use_nls, d)
 
-    # Git packages should DEPEND on git-native
-    srcuri = bb.data.getVar('SRC_URI', d, 1)
-    if "git://" in srcuri:
-        depends = bb.data.getVarFlag('do_fetch', 'depends', d) or ""
-        depends = depends + " git-native:do_populate_sysroot"
-        bb.data.setVarFlag('do_fetch', 'depends', depends, d)
-
-    # Mercurial packages should DEPEND on mercurial-native
-    elif "hg://" in srcuri:
-        depends = bb.data.getVarFlag('do_fetch', 'depends', d) or ""
-        depends = depends + " mercurial-native:do_populate_sysroot"
-        bb.data.setVarFlag('do_fetch', 'depends', depends, d)
-
-    # OSC packages should DEPEND on osc-native
-    elif "osc://" in srcuri:
-        depends = bb.data.getVarFlag('do_fetch', 'depends', d) or ""
-        depends = depends + " osc-native:do_populate_sysroot"
-        bb.data.setVarFlag('do_fetch', 'depends', depends, d)
-
     # bb.utils.sha256_file() will fail if hashlib isn't present, so we fallback
     # on shasum-native.  We need to ensure that it is staged before we fetch.
     if bb.data.getVar('PN', d, True) != "shasum-native":
@@ -370,13 +379,6 @@ python () {
             depends = depends + " shasum-native:do_populate_sysroot"
             bb.data.setVarFlag('do_fetch', 'depends', depends, d)
 
-    # *.xz should depends on xz-native for unpacking
-    # Not endswith because of "*.patch.xz;patch=1". Need bb.decodeurl in future
-    if '.xz' in srcuri:
-        depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
-        depends = depends + " xz-native:do_populate_sysroot"
-        bb.data.setVarFlag('do_unpack', 'depends', depends, d)
-
     # 'multimachine' handling
     mach_arch = bb.data.getVar('MACHINE_ARCH', d, 1)
     pkg_arch = bb.data.getVar('PACKAGE_ARCH', d, 1)
@@ -432,7 +434,7 @@ def check_gcc3(data):
 	for gcc3 in gcc3_versions.split():
 		if check_app_exists(gcc3, data):
 			return gcc3
-	
+
 	return False
 
 addtask cleanall after do_clean
-- 
1.7.4.1



