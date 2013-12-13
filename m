Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 06BE0610D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 14:42:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Dec 2013 06:39:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,479,1384329600"; d="scan'208";a="424237800"
Received: from junemccl-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.17])
	by orsmga001.jf.intel.com with ESMTP; 13 Dec 2013 06:42:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2013 14:42:46 +0000
Message-Id: <1386945766-24556-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] shadow: change to use SHA512 password encryption
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
X-List-Received-Date: Fri, 13 Dec 2013 14:42:58 -0000

The default encryption method for shadow is DES, which limits passwords
to 8 characters. Not only is this undesirable, it's also not how busybox
works so we had different passwd/login length behaviour depending on
whether shadow was installed in the image or not. Change it to SHA512
which is what most Linux distributions seem to be using currently.
(SHA512 also matches up with how we are configuring PAM.)

Fixes [YOCTO #5656].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/shadow/shadow.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 33ecc7d..048709e 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -109,6 +109,9 @@ do_install() {
 	# Disable checking emails.
 	sed -i 's/MAIL_CHECK_ENAB/#MAIL_CHECK_ENAB/g' ${D}${sysconfdir}/login.defs
 
+	# Use proper encryption for passwords
+	sed -i 's/^#ENCRYPT_METHOD.*$/ENCRYPT_METHOD SHA512/' ${D}${sysconfdir}/login.defs
+
 	# Now we don't have a mail system. Disable mail creation for now.
 	sed -i 's:/bin/bash:/bin/sh:g' ${D}${sysconfdir}/default/useradd
 	sed -i '/^CREATE_MAIL_SPOOL/ s:^:#:' ${D}${sysconfdir}/default/useradd
-- 
1.8.1.2


