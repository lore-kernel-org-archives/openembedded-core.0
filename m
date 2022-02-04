Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D1AC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:12:56 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.9481.1643983972820228964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 06:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=EVBKZh0R;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643983975; x=1675519975;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=4biG4CgvShTvQSPwhjnUbnJUltfNn+iWoMBFSZmua5U=;
  b=EVBKZh0RkOYsZsIQg4ubFHYfcdpUDtt+1hPPdhCtu1Rb3GDe5TF8Q7mq
   NA9EWssl2LizPF5SjcBGwYarxhI7xtp4fVzWqxXEAiJfFMQcD4Ow8tzst
   R9P05Yr7UNPYs7Oswa9IkkcdakFlzg/Ze1urx5tN1E4FeVUXuokfaBxOE
   4pR0M7a32jn6YJBoGg3Qb+mNpfQvE/WjMcOgmiU3E2WSII1iU91UVLpvw
   h0AGrHz+D7Sl6Wp5okiupgGmzrGbko9Kd2YLV15alOsNHBxTRsreXFYTP
   MJSkMhlmfn3hbxC2GgrgiWfvqdA8SXU/Lgxq+S53gkQ4b5ZeYuTnHJyBj
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248321587"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="248321587"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:12:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="566749998"
Received: from raajloka-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.235.116])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:12:53 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 02/17] sstate: A third fix for for touching files
 inside pseudo
Date: Fri,  4 Feb 2022 22:12:28 +0800
Message-Id: 
 <b2a5d9bc61e0b2b7e0f187a262a514952ed30563.1643983711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643983711.git.anuj.mittal@intel.com>
References: <cover.1643983711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 14:12:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161349

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
---
 meta/classes/sstate.bbclass | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ba2c9fee35..566a58dafb 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -852,14 +852,18 @@ sstate_create_package () {
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
@@ -889,7 +893,7 @@ python sstate_report_unihash() {
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


