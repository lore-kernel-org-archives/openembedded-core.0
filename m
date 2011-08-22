Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvcUR-0006yF-0Q
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 23:57:03 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2011 14:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,265,1312182000"; d="scan'208";a="43970309"
Received: from unknown (HELO swold-MOBL.lan) ([10.255.13.234])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2011 14:52:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2011 14:52:04 -0700
Message-Id: <9037f676920bbb10ba4db7f21a4b2d634d02f124.1314043945.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314043945.git.sgw@linux.intel.com>
References: <cover.1314043945.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/19] utils.bbclass: skip empty paths when handling FILESEXTRAPATHS
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
X-List-Received-Date: Mon, 22 Aug 2011 21:57:03 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* if there is multiple .bbappend files with FILESEXTRAPATHS_prepend := "/:"
  then the one parsed last is causing trailing ':' and that's causing empty element in
  path = extrapaths.split(:) + path
* it's hard to keep all .bbappends from foreign layers to follow this rule, so it's better
  to be able to handle trailing ':'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/utils.bbclass |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 56abdd8..3c2e342 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -338,8 +338,9 @@ def base_set_filespath(path, d):
 	# The ":" ensures we have an 'empty' override
 	overrides = (bb.data.getVar("OVERRIDES", d, 1) or "") + ":"
 	for p in path:
-		for o in overrides.split(":"):
-			filespath.append(os.path.join(p, o))
+		if p != "": 
+			for o in overrides.split(":"):
+				filespath.append(os.path.join(p, o))
 	return ":".join(filespath)
 
 def extend_variants(d, var, extend, delim=':'):
-- 
1.7.6



