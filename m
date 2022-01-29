Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC5DC433EF
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 22:07:45 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.12022.1643494058991439403
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jan 2022 14:07:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=W/KvZjJ+;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643494059;
  x=1675030059;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PTmhJAipj0HXUSZl0dwObp8eg585Wb4orlmCqSnRPxo=;
  b=W/KvZjJ+X5LuPh+jyipoULFa8KKsyXZT8tC4Hobka6G1KcW9M9uRUHZy
   O7kdMv44UIIvnsX3fzgt4zflxgJXjOZi022Ee5vk+nH6kHXx/3bA4PI7d
   poBvai8nLAnQqPNPhjoFogtJv7toDuBePXi0ek5Kpxv81xYbm/PskMIQP
   kkLgf2Y0jO0VFbdpqlhlBMkKd8mVieCnA1AQDRWPIdjfRPBf3SZgOfY4X
   PsQgtbau4g9GdcBZxJBLppBNdRtG0m3t9Vg5KXVTPJBR1mllS68L50et+
   Q4jKodzxvii6qasWVxy0huPC0vFslmDBJH7ZEmuPRlhaZzLWMDtsvmgub
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [dunfell][PATCH] sstate: A third fix for for touching files inside
 pseudo
Date: Sat, 29 Jan 2022 23:07:32 +0100
Message-ID: <20220129220732.6734-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 22:07:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161105

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This continues where commit 676757f "sstate: fix touching files inside
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

Change-Id: I3800f98d0f2a0dd076352df85fad7c81460e733d
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c2720cde92..00a0e8fbd7 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -841,14 +841,18 @@ sstate_create_package () {
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
@@ -878,7 +882,7 @@ python sstate_report_unihash() {
 sstate_unpack_package () {
 	tar -xvzf ${SSTATE_PKG}
 	# update .siginfo atime on local/NFS mirror if it is a symbolic link
-	[ ! -h ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
+	[ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
 	# update each symbolic link instead of any referenced file
 	touch --no-dereference ${SSTATE_PKG} 2>/dev/null || true
 	[ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig 2>/dev/null || true

