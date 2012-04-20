Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH75-0005g0-F3
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:15 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2012 09:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167907"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:20 -0700
Message-Id: <086fa62c043e3cd4b9bc8d2377507ed842a3097b.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 29/43] package.bbclass: Ensure kernel modules get stripped
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:20 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Kernel modules are not marked as executable but we do expect to strip them.
This patch adds in missing code to ensure we do this. Without this images
are getting sigificantly bloated in size.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 99c945d..71bd3a6 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -870,6 +870,14 @@ python split_and_strip_files () {
 				elf_file = int(file_list[file][5:])
 				#bb.note("Strip %s" % file)
 				runstrip(file, elf_file, d)
+
+
+	if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):	
+		for root, dirs, files in os.walk(dvar):
+			for f in files:
+				if not f.endswith(".ko"):
+					continue
+				runstrip(os.path.join(root, f), None, d)
 	#
 	# End of strip
 	#
-- 
1.7.7.6



