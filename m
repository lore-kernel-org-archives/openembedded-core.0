Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F2FC54F3B
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:44 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.6322.1648857550347391921
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 16:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=RgBJ323/;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648857550;
  x=1680393550;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jNA30nfR1sdaXKQxW9bnuu/v0GD3QDU48qBq2n+Us60=;
  b=RgBJ323/U6qQ4f8pEUZP0tLYJN2uZgYQVAC1iTyaQjk+/c4bhixgKLt4
   AU3smVnuTsf7Fk0uvGR33Wb/+LDXauSkLWg7ekNYbh3PjuXIH1WovA6gn
   zyOQWtwRZPYVxR4WCRjykFqhuODxdUiQBtANPD/MbZ+MTbBJyJKQPD34J
   rqVQC4HLvgwgKwYuPQNHvItQP6e5u+7j8VApHzRUIfEysVi5Kh41kqwd1
   zX3IAXdVbFnyJNijMGpWDWFmEYI47xezBeGoaKjL0MY3lz2HAs4DfL38k
   iJpG8GhJFBK87DtkbWKh+F80LkG7xGf8UzsSOzb+OEFC/TC1MBAUulH+z
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] insane.bbclass: Make do_qa_patch() depend on if
 patch-fuzz is in ERROR_QA
Date: Sat, 2 Apr 2022 01:59:04 +0200
Message-ID: <20220401235906.652-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163947

Adding "patch-fuzz" to ERROR_QA should trigger the patch tasks to
rerun to make sure any already existing fuzz is caught. This is
achieved by using bb.utils.filter() to see if "patch-fuzz" is in
ERROR_QA/WARN_QA as it adds whether the filtered strings are set or
not to the task hash.

Since the mechanism used above ignores that a variable is excluded
(which WARN_QA is), the value for whether "patch-fuzz" is in WARN_QA
or not has to be explicitly excluded so that adding/removing
"patch-fuzz" to/from WARN_QA does not trigger the patch tasks to
rerun.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/insane.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 0deebdb148..873706952b 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1142,6 +1142,8 @@ python do_qa_staging() {
     oe.qa.exit_with_message_if_errors("QA staging was broken by the package built above", d)
 }
 
+do_qa_patch[vardepvalueexclude] .= "|WARN_QA{patch-fuzz} = Set"
+do_qa_patch[vardepvalueexclude] .= "|WARN_QA{patch-fuzz} = Unset"
 python do_qa_patch() {
     import subprocess
 
@@ -1182,9 +1184,9 @@ python do_qa_patch() {
             msg += "    devtool modify %s\n" % d.getVar('PN')
             msg += "    devtool finish --force-patch-refresh %s <layer_path>\n\n" % d.getVar('PN')
             msg += "Don't forget to review changes done by devtool!\n"
-            if 'patch-fuzz' in d.getVar('ERROR_QA'):
+            if bb.utils.filter('ERROR_QA', 'patch-fuzz', d):
                 bb.error(msg)
-            elif 'patch-fuzz' in d.getVar('WARN_QA'):
+            elif bb.utils.filter('WARN_QA', 'patch-fuzz', d):
                 bb.warn(msg)
             msg = "Patch log indicates that patches do not apply cleanly."
             oe.qa.handle_error("patch-fuzz", msg, d)

