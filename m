Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765F2C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:24:46 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.5109.1637033083559436548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="213649278"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="213649278"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:45 -0800
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="567023982"
Received: from jli90-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.214.145.204])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 19:24:43 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 08/14] sstate: another fix for touching files
 inside pseudo
Date: Tue, 16 Nov 2021 11:24:14 +0800
Message-Id: 
 <a5240d78f287ff5f3c5831af69e6e0ca3feaf769.1637032974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637032974.git.anuj.mittal@intel.com>
References: <cover.1637032974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 03:24:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158331

From: Jose Quaresma <quaresma.jose@gmail.com>

This patch is a fixup for 676757f "sstate: fix touching files inside pseudo"

running the 'id' command inside the sstate_unpack_package
function shows that this funcion run inside the pseudo:

 uid=0(root) gid=0(root) groups=0(root)

The check for [ -w ${SSTATE_PKG} ] and [ -O ${SSTATE_PKG}.siginfo ]
will always return true and the touch can fail when the real user
don't have permission or in readonly filesystem.

As the documentation refers:
- the file test operator "-w" check if the file has write permission
(for the user running the test).
- the file test operator "-O" check if you are owner of file

We can avoid this test running the touch and mask any return errors
that we have.

(From OE-Core rev: 29fc85997ade490ae46ffca37ef8e1a56957c876)

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b9210d66c78bb3f79056e5586cea7b0edd714a9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sstate.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 957762db5c..da29225983 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -863,12 +863,12 @@ python sstate_report_unihash() {
 #
 sstate_unpack_package () {
 	tar -xvzf ${SSTATE_PKG}
-	# update .siginfo atime on local/NFS mirror
-	[ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.siginfo ] && [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
-	# Use "! -w ||" to return true for read only files
-	[ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
-	[ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig
-	[ ! -w ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-dereference ${SSTATE_PKG}.siginfo
+	# update .siginfo atime on local/NFS mirror if it is a symbolic link
+	[ ! -h ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
+	# update each symbolic link instead of any referenced file
+	touch --no-dereference ${SSTATE_PKG} 2>/dev/null || true
+	[ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig 2>/dev/null || true
+	[ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-dereference ${SSTATE_PKG}.siginfo 2>/dev/null || true
 }
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
-- 
2.33.1


