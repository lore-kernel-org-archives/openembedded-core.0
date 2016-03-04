Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 01EEE605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 03:23:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 03 Mar 2016 19:23:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,534,1449561600"; d="scan'208";a="757852640"
Received: from nikhilbh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.241])
	by orsmga003.jf.intel.com with ESMTP; 03 Mar 2016 19:23:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Mar 2016 16:22:52 +1300
Message-Id: <084a46f934ea1a22bc1bf550d7eb4e836d339f8b.1457061745.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457061745.git.paul.eggleton@linux.intel.com>
References: <cover.1457061745.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457061745.git.paul.eggleton@linux.intel.com>
References: <cover.1457061745.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] classes/packageinfo: remove
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
X-List-Received-Date: Fri, 04 Mar 2016 03:23:07 -0000

This class was only used by Hob, and since Hob has now been removed we
can drop it as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/packageinfo.bbclass | 22 ----------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 meta/classes/packageinfo.bbclass

diff --git a/meta/classes/packageinfo.bbclass b/meta/classes/packageinfo.bbclass
deleted file mode 100644
index 7d60ace..0000000
--- a/meta/classes/packageinfo.bbclass
+++ /dev/null
@@ -1,22 +0,0 @@
-python packageinfo_handler () {
-    import oe.packagedata
-    pkginfolist = []
-
-    pkgdata_dir = e.data.getVar("PKGDATA_DIR", True) + '/runtime/'
-    if os.path.exists(pkgdata_dir):
-        for root, dirs, files in os.walk(pkgdata_dir):
-            for pkgname in files:
-                if pkgname.endswith('.packaged'):
-                    pkgname = pkgname[:-9]
-                    pkgdatafile = root + pkgname
-                    try:
-                        sdata = oe.packagedata.read_pkgdatafile(pkgdatafile)
-                        sdata['PKG'] = pkgname
-                        pkginfolist.append(sdata)
-                    except Exception as e:
-                        bb.warn("Failed to read pkgdata file %s: %s: %s" % (pkgdatafile, e.__class__, str(e)))
-    bb.event.fire(bb.event.PackageInfo(pkginfolist), e.data)
-}
-
-addhandler packageinfo_handler
-packageinfo_handler[eventmask] = "bb.event.RequestPackageInfo"
-- 
2.5.0


