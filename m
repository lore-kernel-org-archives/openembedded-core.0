Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBACC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:59:48 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.14146.1635263986014269342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290783580"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="290783580"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:47 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="578786731"
Received: from wandsuan-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.17])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:45 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 36/37] sstate: fix touching files inside pseudo
Date: Tue, 26 Oct 2021 23:58:07 +0800
Message-Id: 
 <1092bb67737eff63c24c26c9f807bec5e6adffc9.1635257336.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:59:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157438

From: Jose Quaresma <quaresma.jose@gmail.com>

running the 'id' command inside the sstate_create_package
function shows that this funcion run inside the pseudo:

 uid=0(root) gid=0(root) groups=0(root)

The check for touch files [ ! -w ${SSTATE_PKG} ]
will always return true and the touch can fail
when the real user don't have permission or
in readonly filesystem.

As the documentation refers, the file test operator "-w"
check if the file has write permission (for the user running the test).

We can avoid this test running the touch and mask any return errors
that we have.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6e7445c94443544e92fda97a017ce93393c5f84)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sstate.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 701a19bc61..240ae111ee 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -825,7 +825,7 @@ sstate_task_postfunc[dirs] = "${WORKDIR}"
 sstate_create_package () {
 	# Exit early if it already exists
 	if [ -e ${SSTATE_PKG} ]; then
-		[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
+		touch ${SSTATE_PKG} 2>/dev/null || true
 		return
 	fi
 
@@ -859,7 +859,7 @@ sstate_create_package () {
 	else
 		rm $TFILE
 	fi
-	[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
+	touch ${SSTATE_PKG} 2>/dev/null || true
 }
 
 python sstate_sign_package () {
-- 
2.31.1


