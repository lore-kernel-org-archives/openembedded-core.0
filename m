Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB65CC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 09:07:17 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.19860.1644224834864333556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 01:07:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=KHUiQDW7;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644224836; x=1675760836;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Up5llH4y/hTd9oRq/a7JjDYrKQG5s53LEFL7Ndz+0oA=;
  b=KHUiQDW7m75F1/kbBYepUCkkmZdZ4lsR4afxhinyiqofXPQ3oLMSLFtM
   3uv9f7dOESvWFZPGDGFbs44xA5EZU61tdY0kt/j26tlWSJsW1mAnZtBUM
   ldKpgYutXTFu8fCRWSEDqERk3jg7kKh9G67YEss0L/03kjtG3hG88VUyt
   0cpRugBU2iolDJwB7mVqDtpsuMpwJHOIwaXwnsr0BIj1v3ihuiwqcUxOC
   0IbVeOsA1o++UNctiI/V/7jvfOhTpSQlEF6uUiBbl940WcERQ74sxTmzd
   UbrQVxXwO4ycX40zHq2qmLLCQXLM0J+XgNbk7I/wTkSOoKIjZIg9+pEZ+
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="309420804"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="309420804"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="499140425"
Received: from xgoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.138.138])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:15 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/12] sstate: A third fix for for touching files
 inside pseudo
Date: Mon,  7 Feb 2022 17:06:55 +0800
Message-Id: 
 <3eceda67a1098ab9641cb1b7fc789048b7daeae8.1644224643.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644224643.git.anuj.mittal@intel.com>
References: <cover.1644224643.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 09:07:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161447

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This continues where commit676757f "sstate: fix touching files inside
pseudo" and commit 29fc8599 "sstate: another fix for touching files
inside pseudo" left off.

The previous changes switched from trying to check if the sstate file is
writable before touching it, to always touching the sstate file and
ignoring any errors. However, if the sstate file is actually a symbolic
link that links to nothing, this would actually result in an empty
sstate file being created. And this in turn leads to that future
setscene tasks will fail when they try to unpack the empty file.

Change the code so that if an sstate file linking to nothing already
exists, it is overwritten with the new sstate file. Also change it so
that the temporary file that is used is always removed, even if ln
fails to link the sstate file to it.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
(cherry picked from commit b2a5d9bc61e0b2b7e0f187a262a514952ed30563)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sstate.bbclass | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index da29225983..caa25815e0 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -827,14 +827,18 @@ sstate_create_package () {
 	fi
 	chmod 0664 $TFILE
 	# Skip if it was already created by some other process
-	if [ ! -e ${SSTATE_PKG} ]; then
+	if [ -h ${SSTATE_PKG} ] && [ ! -e ${SSTATE_PKG} ]; then
+		# There is a symbolic link, but it links to nothing.
+		# Forcefully replace it with the new file.
+		ln -f $TFILE ${SSTATE_PKG} || true
+	elif [ ! -e ${SSTATE_PKG} ]; then
 		# Move into place using ln to attempt an atomic op.
 		# Abort if it already exists
-		ln $TFILE ${SSTATE_PKG} && rm $TFILE
+		ln $TFILE ${SSTATE_PKG} || true
 	else
-		rm $TFILE
+		touch ${SSTATE_PKG} 2>/dev/null || true
 	fi
-	touch ${SSTATE_PKG} 2>/dev/null || true
+	rm $TFILE
 }
 
 python sstate_sign_package () {
@@ -864,7 +868,7 @@ python sstate_report_unihash() {
 sstate_unpack_package () {
 	tar -xvzf ${SSTATE_PKG}
 	# update .siginfo atime on local/NFS mirror if it is a symbolic link
-	[ ! -h ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
+	[ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
 	# update each symbolic link instead of any referenced file
 	touch --no-dereference ${SSTATE_PKG} 2>/dev/null || true
 	[ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig 2>/dev/null || true
-- 
2.34.1


