Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 584AD71AA7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 13:40:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 31 Oct 2016 06:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,575,1473145200"; d="scan'208";a="1078434288"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 31 Oct 2016 06:40:25 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 3BC3A6A4080;
	Mon, 31 Oct 2016 06:39:49 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2016 15:40:17 +0200
Message-Id: <fd24d27e634b416712e7b1052a1697137719e517.1477914497.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <c1588f91c5cfe65c0daede3a52ed35ee84f3e612.1477914497.git.jussi.kukkonen@intel.com>
References: <c1588f91c5cfe65c0daede3a52ed35ee84f3e612.1477914497.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477914497.git.jussi.kukkonen@intel.com>
References: <cover.1477914497.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/3] avahi: Don't remove users/groups in postrm
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
X-List-Received-Date: Mon, 31 Oct 2016 13:40:25 -0000

There's no way to ensure that files owned by the users aren't left
on the system at postrm time: Removing the user would mean those
files are now owned by a non-existing user, and later may be owned
by a completely unrelated new user.

[YOCTO #10442]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index cb36802..faa8741 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -153,13 +153,3 @@ if [ -z "$D" ]; then
 	killall -q -HUP dbus-daemon || true
 fi
 }
-
-pkg_postrm_avahi-daemon () {
-	deluser avahi || true
-	delgroup avahi || true
-}
-
-pkg_postrm_avahi-autoipd () {
-	deluser avahi-autoipd || true
-	delgroup avahi-autoipd || true
-}
-- 
2.1.4


