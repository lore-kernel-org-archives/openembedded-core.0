Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AA90D6E92F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 16:06:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Feb 2014 08:06:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,535,1389772800"; d="scan'208";a="487168749"
Received: from mcmahond-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.208])
	by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2014 08:06:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 16:05:45 +0000
Message-Id: <3355558abce9bf006f32c126294a33fe8eb72e7c.1393257867.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1393257867.git.paul.eggleton@linux.intel.com>
References: <cover.1393257867.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1393257867.git.paul.eggleton@linux.intel.com>
References: <cover.1393257867.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] classes/package_tar: fix conflicts with package_deb / package_ipk
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
X-List-Received-Date: Mon, 24 Feb 2014 16:06:23 -0000

Avoid tar noticing that the directory is changing when
do_package_write_deb or do_package_write_ipk are running at the same
time as do_package_write_tar (because DEBIAN and CONTROL are being added
and removed while tar is running so the directory changes).

Fixes [YOCTO #5652]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package_tar.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index 2d6fc8f..fed2c28 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -41,11 +41,12 @@ python do_package_tar () {
         basedir = os.path.dirname(root)
         tarfn = localdata.expand("${DEPLOY_DIR_TAR}/${PKG}-${PKGV}-${PKGR}.tar.gz")
         os.chdir(root)
-        from glob import glob
-        if not glob('*'):
+        dlist = os.listdir(root)
+        if not dlist:
             bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV', True), localdata.getVar('PKGR', True)))
             continue
-        ret = subprocess.call("tar -czf %s %s" % (tarfn, '.'), shell=True)
+        args = "tar -cz --exclude=CONTROL --exclude=DEBIAN -f".split()
+        ret = subprocess.call(args + [tarfn] + dlist)
         if ret != 0:
             bb.error("Creation of tar %s failed." % tarfn)
 }
-- 
1.8.5.3


