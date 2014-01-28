Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7E2526E7EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 14:26:15 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id e49so274659eek.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 06:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=UVmBReo/lUNCX8GLYnpkU8Dp7yKTcOVoQyA3r3xO6PA=;
	b=RcGamV1vUcT0EFzi2n1lrcUHO2l12rCYYsB1GRGCc/XT/5WRDQkbfz0KtEPXtsKpYg
	tWytTRDbkpe2Rq1t63VJjhBq2s9jxeXEtet44pPqPApXSRUnkLQRcccLS++HP4oE2/zh
	u2AzuGB1QZ/9kNrnhRTkvJ34l4oRbKdSlNPSxnmDv1GIb29haNlAbAjYIIsMbxuMyJRx
	uj05o8pjSL7G7x8/PuUEbk8F1v/VaKaH+eW1gVH9wkfEL2SFR3jstAbHrmsWEymXCHdt
	dHWhdNRNqWYOEQflMtpCYr3qh9W7Xg1FudBvNodqN6A1Ku+W2Np17M9MNLTY6nuRUnR0
	Y2xg==
X-Received: by 10.14.201.68 with SMTP id a44mr2224551eeo.46.1390919176170;
	Tue, 28 Jan 2014 06:26:16 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v1sm56282382eef.9.2014.01.28.06.26.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jan 2014 06:26:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 15:26:11 +0100
Message-Id: <babc108caee7b3e004a3e64781bee46633125128.1390919033.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1390919033.git.Martin.Jansa@gmail.com>
References: <cover.1390919033.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390919033.git.Martin.Jansa@gmail.com>
References: <cover.1390919033.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 2/3] package.bbclass: Show which files require given dependency in debug output
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
X-List-Received-Date: Tue, 28 Jan 2014 14:26:15 -0000

* when log.do_package shows some unexpected dependency, people usually
  need to grep package directory to find which binary was creating that
  dependency, show it directly in the debug output

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index ed88daf..1f73ad6 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1397,6 +1397,9 @@ python package_do_shlibs() {
             if m:
                 if m.group(1) not in needed[pkg]:
                     needed[pkg].append(m.group(1))
+                if m.group(1) not in needed_from:
+                    needed_from[m.group(1)] = []
+                needed_from[m.group(1)].append(file)
             m = re.match("\s+SONAME\s+([^\s]*)", l)
             if m:
                 this_soname = m.group(1)
@@ -1469,6 +1472,10 @@ python package_do_shlibs() {
                                 needed[pkg] = []
                             if name and name not in needed[pkg]:
                                 needed[pkg].append(name)
+                            if name not in needed_from:
+                                needed_from[name] = []
+                            if lafile and lafile not in needed_from[name]:
+                                needed_from[name].append(lafile)
                                 #bb.note("Adding %s for %s" % (name, pkg))
 
     if d.getVar('PACKAGE_SNAP_LIB_SYMLINKS', True) == "1":
@@ -1482,6 +1489,7 @@ python package_do_shlibs() {
         use_ldconfig = False
 
     needed = {}
+    needed_from = {}
     shlib_provider = {}
     read_shlib_providers()
 
@@ -1568,7 +1576,7 @@ python package_do_shlibs() {
             if n in shlib_provider.keys():
                 (dep_pkg, ver_needed) = shlib_provider[n]
 
-                bb.debug(2, '%s: Dependency %s requires package %s' % (pkg, n, dep_pkg))
+                bb.debug(2, '%s: Dependency %s requires package %s (used by files: %s)' % (pkg, n, dep_pkg, needed_from[n]))
 
                 if dep_pkg == pkg:
                     continue
@@ -1580,7 +1588,7 @@ python package_do_shlibs() {
                 if not dep in deps:
                     deps.append(dep)
             else:
-                bb.note("Couldn't find shared library provider for %s" % n)
+                bb.note("Couldn't find shared library provider for %s, used by files: %s" % (n, needed_from[n]))
 
         deps_file = os.path.join(pkgdest, pkg + ".shlibdeps")
         if os.path.exists(deps_file):
-- 
1.8.5.3


