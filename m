Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1R4aQP-0006oa-Mp
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 17:33:57 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Sep 2011 08:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="49183860"
Received: from unknown (HELO [10.255.14.162]) ([10.255.14.162])
	by orsmga002.jf.intel.com with ESMTP; 16 Sep 2011 08:28:43 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2011 10:28:27 -0500
Message-ID: <1316186907.2384.90.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: [PATCH] package.bbclass: fix spurious 'installed but not shipped' warning
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
X-List-Received-Date: Fri, 16 Sep 2011 15:33:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

For packages that have files installed that aren't in a subdirectory,
the following build WARNING is emitted (this for initramfs-live-boot
as an example):

WARNING: For recipe initramfs-live-boot, the following files were
 installed but not shipped in any package:
WARNING:   init

The problem is that the filenames added to the 'seen' array are always
added with a path separator at the beginning of the filename, but when
the package dir is walked for comparison, any files at the top-level
will be missing the beginning path separator and the comparison will
fail despite the fact that the file was actually packaged.  This
because the remainder between the dirname and the dvar base name is
used in the path join and in the case of files at the top-level, the
remainder is the empty string, where it should be '/' for comparison
purposes.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/classes/package.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 73e8f63..3dbe308 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -936,8 +936,11 @@ python populate_packages () {
 
 	unshipped = []
 	for root, dirs, files in os.walk(dvar):
+		dir = root[len(dvar):]
+		if not dir:
+			dir = os.sep
 		for f in files:
-			path = os.path.join(root[len(dvar):], f)
+			path = os.path.join(dir, f)
 			if ('.' + path) not in seen:
 				unshipped.append(path)
 
-- 
1.7.0.4





