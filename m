Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U0Ybe-0002FG-Hr
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 15:25:49 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE67sd007221; Wed, 30 Jan 2013 14:06:09 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Nwdd5rm16O+w; Wed, 30 Jan 2013 14:06:09 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE63Z3007183
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Jan 2013 14:06:04 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U0YDz-00083T-Nc; Wed, 30 Jan 2013 14:01:15 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 14:01:03 +0000
Message-Id: <c83ee16d1c239f9dcc0a63f4059f8f511c0768fe.1359554291.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
References: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
References: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 10/17] package.bbclass: Move PKG handling code to emit_pkgdata
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
X-List-Received-Date: Wed, 30 Jan 2013 14:25:58 -0000

We only use the PKG variable in emit_pkgdata so we might as well move the
fallback code there, allowing restructuring of other parts of the metadata.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4e7db9a..858afbd 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1038,11 +1038,6 @@ python populate_packages () {
 
     bb.build.exec_func("package_name_hook", d)
 
-    for pkg in package_list:
-        pkgname = d.getVar('PKG_%s' % pkg, True)
-        if pkgname is None:
-            d.setVar('PKG_%s' % pkg, pkg)
-
     dangling_links = {}
     pkg_files = {}
     for pkg in package_list:
@@ -1154,6 +1149,11 @@ python emit_pkgdata() {
     for pkg in packages.split():
         subdata_file = pkgdatadir + "/runtime/%s" % pkg
 
+        pkgval = d.getVar('PKG_%s' % pkg, True)
+        if pkgval is None:
+            pkgval = pkg
+            d.setVar('PKG_%s' % pkg, pkg)
+
         sf = open(subdata_file, 'w')
         write_if_exists(sf, pkg, 'PN')
         write_if_exists(sf, pkg, 'PV')
@@ -1189,7 +1189,6 @@ python emit_pkgdata() {
         sf.close()
 
         # Symlinks needed for reverse lookups (from the final package name)
-        pkgval = d.getVar('PKG_%s' % (pkg), True)
         subdata_sym = pkgdatadir + "/runtime-reverse/%s" % pkgval
         oe.path.symlink("../runtime/%s" % pkg, subdata_sym, True)
 
-- 
1.7.10.4



