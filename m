Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CDBB06F933
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 19:24:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Mar 2014 12:25:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,697,1389772800"; d="scan'208";a="476625262"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.182])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2014 12:24:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 19:24:37 +0000
Message-Id: <dc7eec6c0b3e60dd6c50685098abb14986be6a5f.1395343268.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1395343268.git.paul.eggleton@linux.intel.com>
References: <cover.1395343268.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1395343268.git.paul.eggleton@linux.intel.com>
References: <cover.1395343268.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/5] python3: sync module dependencies from 2.7
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
X-List-Received-Date: Thu, 20 Mar 2014 19:24:59 -0000

These have been added recently to 2.7 but were missing in the 3.3
script/inc file.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/python/python-3.3-manifest.inc | 6 +++---
 scripts/contrib/python/generate-manifest-3.3.py      | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.3-manifest.inc b/meta/recipes-devtools/python/python-3.3-manifest.inc
index 2cfc3ae..ea56970 100644
--- a/meta/recipes-devtools/python/python-3.3-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.3-manifest.inc
@@ -138,7 +138,7 @@ RDEPENDS_${PN}-mmap="${PN}-core ${PN}-io"
 FILES_${PN}-mmap="${libdir}/python3.3/lib-dynload/mmap.*.so "
 
 SUMMARY_${PN}-multiprocessing="Python multiprocessing support"
-RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang"
+RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap"
 FILES_${PN}-multiprocessing="${libdir}/python3.3/lib-dynload/_multiprocessing.*.so ${libdir}/python3.3/multiprocessing "
 
 SUMMARY_${PN}-netclient="Python Internet Protocol clients"
@@ -162,7 +162,7 @@ RDEPENDS_${PN}-pkgutil="${PN}-core"
 FILES_${PN}-pkgutil="${libdir}/python3.3/pkgutil.* "
 
 SUMMARY_${PN}-pprint="Python pretty-print support"
-RDEPENDS_${PN}-pprint="${PN}-core"
+RDEPENDS_${PN}-pprint="${PN}-core ${PN}-io"
 FILES_${PN}-pprint="${libdir}/python3.3/pprint.* "
 
 SUMMARY_${PN}-profile="Python basic performance profiling support"
@@ -238,7 +238,7 @@ RDEPENDS_${PN}-tkinter="${PN}-core"
 FILES_${PN}-tkinter="${libdir}/python3.3/lib-dynload/_tkinter.*.so ${libdir}/python3.3/lib-tk ${libdir}/python3.3/tkinter "
 
 SUMMARY_${PN}-unittest="Python unit testing framework"
-RDEPENDS_${PN}-unittest="${PN}-core ${PN}-stringold ${PN}-lang"
+RDEPENDS_${PN}-unittest="${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell"
 FILES_${PN}-unittest="${libdir}/python3.3/unittest/ "
 
 SUMMARY_${PN}-unixadmin="Python Unix administration support"
diff --git a/scripts/contrib/python/generate-manifest-3.3.py b/scripts/contrib/python/generate-manifest-3.3.py
index 23d1887..1586c46 100755
--- a/scripts/contrib/python/generate-manifest-3.3.py
+++ b/scripts/contrib/python/generate-manifest-3.3.py
@@ -295,7 +295,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-mmap", "Python memory-mapped file support", "${PN}-core ${PN}-io",
     "lib-dynload/mmap.*.so " )
 
-    m.addPackage( "${PN}-multiprocessing", "Python multiprocessing support", "${PN}-core ${PN}-io ${PN}-lang",
+    m.addPackage( "${PN}-multiprocessing", "Python multiprocessing support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap",
     "lib-dynload/_multiprocessing.*.so multiprocessing" ) # package
 
     m.addPackage( "${PN}-netclient", "Python Internet Protocol clients", "${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime",
@@ -314,7 +314,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-pkgutil", "Python package extension utility support", "${PN}-core",
     "pkgutil.*")
 
-    m.addPackage( "${PN}-pprint", "Python pretty-print support", "${PN}-core",
+    m.addPackage( "${PN}-pprint", "Python pretty-print support", "${PN}-core ${PN}-io",
     "pprint.*" )
 
     m.addPackage( "${PN}-profile", "Python basic performance profiling support", "${PN}-core ${PN}-textutils",
@@ -362,7 +362,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-tkinter", "Python Tcl/Tk bindings", "${PN}-core",
     "lib-dynload/_tkinter.*.so lib-tk tkinter" ) # package
 
-    m.addPackage( "${PN}-unittest", "Python unit testing framework", "${PN}-core ${PN}-stringold ${PN}-lang",
+    m.addPackage( "${PN}-unittest", "Python unit testing framework", "${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell",
     "unittest/" )
 
     m.addPackage( "${PN}-unixadmin", "Python Unix administration support", "${PN}-core",
-- 
1.8.5.3


