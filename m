Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U0YcD-0002FG-HR
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 15:26:30 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE6CjI007260; Wed, 30 Jan 2013 14:06:12 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mV98zAgZNooT; Wed, 30 Jan 2013 14:06:11 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE64i1007192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Jan 2013 14:06:05 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U0YE0-00083i-K0; Wed, 30 Jan 2013 14:01:16 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 14:01:06 +0000
Message-Id: <9d8e396e13c8b203a48d79c9282046535bb0b8fe.1359554291.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
References: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
References: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 13/17] package.bbclass: Improve package_fixsymlinks
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
X-List-Received-Date: Wed, 30 Jan 2013 14:41:41 -0000

Improve package_fixsymlinks so we don't handle RDEPENDS for every single package
in PACKAGES.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |   19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2f1695b..1ccac9c 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1064,24 +1064,29 @@ python package_fixsymlinks () {
                         target = os.path.join(root[len(inst_root):], target)
                     dangling_links[pkg].append(os.path.normpath(target))
 
-    for pkg in packages:
-        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg, True) or d.getVar('RDEPENDS', True) or "")
-
+    newrdepends = {}
+    for pkg in dangling_links:
         for l in dangling_links[pkg]:
             found = False
             bb.debug(1, "%s contains dangling link %s" % (pkg, l))
             for p in packages:
-                for f in pkg_files[p]:
-                    if f == l:
+                if l in pkg_files[p]:
                         found = True
                         bb.debug(1, "target found in %s" % p)
                         if p == pkg:
                             break
-                        if p not in rdepends:
-                            rdepends[p] = []
+                        if pkg not in newrdepends:
+                            newrdepends[pkg] = []
+                        newrdepends[pkg].append(p)
                         break
             if found == False:
                 bb.note("%s contains dangling symlink to %s" % (pkg, l))
+
+    for pkg in newrdepends:
+        rdepends = bb.utils.explode_dep_versions2(d.getVar('RDEPENDS_' + pkg, True) or d.getVar('RDEPENDS', True) or "")
+        for p in newrdepends[pkg]:
+            if p not in rdepends:
+                rdepends[p] = []
         d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
 }
 
-- 
1.7.10.4



