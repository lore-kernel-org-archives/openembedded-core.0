Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 106AB6E7DF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 14:02:08 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c41so2585685eek.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 06:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=w8yW57yatRsraJiaY9zOqs/8kWuGnEc8ww3+IVUHweo=;
	b=aKV/Dg2wZF28FSNOx5oUzjTqOdWlmcZ73jKAHkz9UqTo3RPCdnHbRwKmPur0Ow7DrV
	El32cSa20GPR0appf0zQpBeil8Ovl5LbJJ+h2QQhoshFfM4Prj2WJ4mcsPuOXyp+eUNs
	Ha9RcBoRV9kf7r3RNranZkkNKdivsImp78/qOZ3Q3i4jMo12n6CMD5KbgmSvwooavUYb
	2pQ0ig/ecNMnHAM3uyaJOVqsYjW+3p3YgOm/mPT1qz//4xOwLm1JhZXSJ0hmuFjFfRPR
	nwJyOO7lQdDzLcYMQwosUX0j7Jc3ar7hysTmM44O4KRtWKhvHIb+yq1fAKjZitINN7yL
	3AQQ==
X-Received: by 10.14.176.195 with SMTP id b43mr8123776eem.39.1390053729797;
	Sat, 18 Jan 2014 06:02:09 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h3sm35492621eem.15.2014.01.18.06.02.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 06:02:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2014 15:02:10 +0100
Message-Id: <bd5e3b51795595784a2dee9098b2552fb539cbb4.1390052636.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1390052636.git.Martin.Jansa@gmail.com>
References: <cover.1390052636.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390052636.git.Martin.Jansa@gmail.com>
References: <cover.1390052636.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/5] package.bbclass: Show which files require given dependency in debug output
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
X-List-Received-Date: Sat, 18 Jan 2014 14:02:09 -0000

* when log.do_package shows some unexpected dependency, people usually
  need to grep package directory to find which binary was creating that
  dependency, show it directly in the debug output

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7820955..854a120 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1403,6 +1403,9 @@ python package_do_shlibs() {
             if m:
                 if m.group(1) not in needed[pkg]:
                     needed[pkg].append(m.group(1))
+                if m.group(1) not in needed_from:
+                    needed_from[m.group(1)] = []
+                needed_from[m.group(1)].append(file)
             m = re.match("\s+SONAME\s+([^\s]*)", l)
             if m:
                 this_soname = m.group(1)
@@ -1478,6 +1481,10 @@ python package_do_shlibs() {
                                 needed[pkg] = []
                             if name and name not in needed[pkg]:
                                 needed[pkg].append(name)
+                            if name not in needed_from:
+                                needed_from[name] = []
+                            if lafile and lafile not in needed_from[name]:
+                                needed_from[name].append(lafile)
                                 #bb.note("Adding %s for %s" % (name, pkg))
 
     if d.getVar('PACKAGE_SNAP_LIB_SYMLINKS', True) == "1":
@@ -1491,6 +1498,7 @@ python package_do_shlibs() {
         use_ldconfig = False
 
     needed = {}
+    needed_from = {}
     shlib_provider = {}
     read_shlib_providers()
 
@@ -1578,7 +1586,7 @@ python package_do_shlibs() {
             if n in shlib_provider.keys():
                 (dep_pkg, ver_needed) = shlib_provider[n]
 
-                bb.debug(2, '%s: Dependency %s requires package %s' % (pkg, n, dep_pkg))
+                bb.debug(2, '%s: Dependency %s requires package %s (used by files: %s)' % (pkg, n, dep_pkg, needed_from[n]))
 
                 if dep_pkg == pkg:
                     continue
@@ -1590,7 +1598,7 @@ python package_do_shlibs() {
                 if not dep in deps:
                     deps.append(dep)
             else:
-                bb.note("Couldn't find shared library provider for %s" % n)
+                bb.note("Couldn't find shared library provider for %s, used by files: %s" % (n, needed_from[n]))
 
         deps_file = os.path.join(pkgdest, pkg + ".shlibdeps")
         if os.path.exists(deps_file):
-- 
1.8.5.2


