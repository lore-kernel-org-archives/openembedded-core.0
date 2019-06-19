Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 478E27E554
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 15:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 22B7B184ED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 17:45:11 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 9TvT0GJvOgIl
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 17:45:10 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2529118523
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 17:45:10 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 093561E083
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 17:45:10 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F192E1E081
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 17:45:09 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 17:45:09 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by seth.se.axis.com (Postfix) with ESMTP id E58641ABA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 17:45:09 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x5JFj9v8023124
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 17:45:09 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x5JFj9eH023123
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Jun 2019 17:45:09 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 17:45:06 +0200
Message-Id: <20190619154506.23071-3-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619154506.23071-1-pkj@axis.com>
References: <20190619154506.23071-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [warrior][PATCH 3/3] package.bbclass: Clean up writing of runtime pkgdata files
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
X-List-Received-Date: Wed, 19 Jun 2019 15:45:10 -0000
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This introduces a variable, PKGDATA_VARS, that contains the names of
the variables that are to be output in the runtime pkgdata files.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 
This is a backport from master.

 meta/classes/package.bbclass | 56 ++++++++++++------------------------
 1 file changed, 18 insertions(+), 38 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4c0a859536..eef1f7b945 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1343,6 +1343,8 @@ EXPORT_FUNCTIONS package_name_hook
 
 PKGDESTWORK = "${WORKDIR}/pkgdata"
 
+PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY RDEPENDS RPROVIDES RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS SECTION PKG ALLOW_EMPTY FILES CONFFILES FILES_INFO pkg_postinst pkg_postrm pkg_preinst pkg_prerm"
+
 python emit_pkgdata() {
     from glob import glob
     import json
@@ -1447,48 +1449,26 @@ fi
                 total_size += fstat.st_size
         d.setVar('FILES_INFO', json.dumps(files, sort_keys=True))
 
-        subdata_file = pkgdatadir + "/runtime/%s" % pkg
-        sf = open(subdata_file, 'w')
-        write_if_exists(sf, pkg, 'PN')
-        write_if_exists(sf, pkg, 'PE')
-        write_if_exists(sf, pkg, 'PV')
-        write_if_exists(sf, pkg, 'PR')
-        write_if_exists(sf, pkg, 'PKGE')
-        write_if_exists(sf, pkg, 'PKGV')
-        write_if_exists(sf, pkg, 'PKGR')
-        write_if_exists(sf, pkg, 'LICENSE')
-        write_if_exists(sf, pkg, 'DESCRIPTION')
-        write_if_exists(sf, pkg, 'SUMMARY')
-        write_if_exists(sf, pkg, 'RDEPENDS')
-        rprov = write_if_exists(sf, pkg, 'RPROVIDES')
-        write_if_exists(sf, pkg, 'RRECOMMENDS')
-        write_if_exists(sf, pkg, 'RSUGGESTS')
-        write_if_exists(sf, pkg, 'RREPLACES')
-        write_if_exists(sf, pkg, 'RCONFLICTS')
-        write_if_exists(sf, pkg, 'SECTION')
-        write_if_exists(sf, pkg, 'PKG')
-        write_if_exists(sf, pkg, 'ALLOW_EMPTY')
-        write_if_exists(sf, pkg, 'FILES')
-        write_if_exists(sf, pkg, 'CONFFILES')
         process_postinst_on_target(pkg, d.getVar("MLPREFIX"))
         add_set_e_to_scriptlets(pkg)
-        write_if_exists(sf, pkg, 'pkg_postinst')
-        write_if_exists(sf, pkg, 'pkg_postrm')
-        write_if_exists(sf, pkg, 'pkg_preinst')
-        write_if_exists(sf, pkg, 'pkg_prerm')
-        write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
-        write_if_exists(sf, pkg, 'FILES_INFO')
-        for dfile in (d.getVar('FILERPROVIDESFLIST_' + pkg) or "").split():
-            write_if_exists(sf, pkg, 'FILERPROVIDES_' + dfile)
-
-        write_if_exists(sf, pkg, 'FILERDEPENDSFLIST')
-        for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg) or "").split():
-            write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
-
-        sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
-        sf.close()
+
+        subdata_file = pkgdatadir + "/runtime/%s" % pkg
+        with open(subdata_file, 'w') as sf:
+            for var in (d.getVar('PKGDATA_VARS') or "").split():
+                val = write_if_exists(sf, pkg, var)
+
+            write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
+            for dfile in (d.getVar('FILERPROVIDESFLIST_' + pkg) or "").split():
+                write_if_exists(sf, pkg, 'FILERPROVIDES_' + dfile)
+
+            write_if_exists(sf, pkg, 'FILERDEPENDSFLIST')
+            for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg) or "").split():
+                write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
+
+            sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
 
         # Symlinks needed for rprovides lookup
+        rprov = d.getVar('RPROVIDES_%s' % pkg) or d.getVar('RPROVIDES')
         if rprov:
             for p in rprov.strip().split():
                 subdata_sym = pkgdatadir + "/runtime-rprovides/%s/%s" % (p, pkg)
-- 
2.21.0


