Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DEBD17044C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 09:41:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6E9f5eJ023265
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 02:41:05 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 14 Jul 2014 02:41:05 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Jul 2014 02:41:04 -0700
Message-ID: <965b510cf2d609b1fac50901312b3372d4e063a5.1405330780.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405330780.git.liezhi.yang@windriver.com>
References: <cover.1405330780.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] package.bbclass: convert file depends into pkg depends
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
X-List-Received-Date: Mon, 14 Jul 2014 09:41:08 -0000
Content-Type: text/plain

The ipk or deb can't depend on file such as "/usr/bin/perl", so it would
know nothing about perl, and there would be dependencies problems when
we run "apt-get install" on the target. Convert the file depends into
pkg depends can fix the issue:

/bin/bash -> bash
/usr/bin/perl -> perl
/usr/bin/python -> python

NOTE, we still need the QA check package_qa_check_file_depends though we
have this fix, manually add the pkg to RDEPENDS is correct, anyway.

TODO:
- Add a global var for the paths, such as BASH_PATH = "/bin/bash" rather than
  directly use /bin/bash ?

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package.bbclass |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 26a20d1..419cdcf 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1318,6 +1318,9 @@ python package_do_filedeps() {
     pool.close()
     pool.join()
 
+    # Used for converting file depends into pkg depends
+    prog_maps = {"/bin/bash": "bash", "/usr/bin/perl": "perl", "/usr/bin/python": "python"}
+
     provides_files = {}
     requires_files = {}
 
@@ -1334,10 +1337,21 @@ python package_do_filedeps() {
             key = "FILERPROVIDES_" + file + "_" + pkg
             d.setVar(key, " ".join(provides[file]))
 
+        req_file_pkgs = []
         for file in requires:
             requires_files[pkg].append(file)
             key = "FILERDEPENDS_" + file + "_" + pkg
             d.setVar(key, " ".join(requires[file]))
+            for req_file in requires[file]:
+                if req_file in prog_maps and prog_maps[req_file] not in req_file_pkgs:
+                    req_file_pkgs.append(prog_maps[req_file])
+
+        if req_file_pkgs:
+            rdepends = bb.utils.explode_deps(d.getVar('RDEPENDS_' + pkg, True) or "")
+            for p in req_file_pkgs:
+                if p not in rdepends:
+                    bb.note("Adding %s to RDEPENDS_%s" % (p, pkg))
+                    d.appendVar("RDEPENDS_" + pkg, ' ' + p)
 
     for pkg in requires_files:
         d.setVar("FILERDEPENDSFLIST_" + pkg, " ".join(requires_files[pkg]))
-- 
1.7.9.5


