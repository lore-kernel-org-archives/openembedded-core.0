Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338C0CAC593
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 12:50:00 +0000 (UTC)
Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.web11.45908.1757594991275412087
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 05:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=mf+EH8nI;
 spf=pass (domain: bmw.de, ip: 207.54.69.29, mailfrom: prvs=34223b862=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1757594993; x=1789130993;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0utGbVRF9QtdBQxt+jimNsZfh6Lavb7iPxlXd2+KvdY=;
  b=mf+EH8nImocjUcO4oNSXBlF4NrsQ+iT4arf+hU6XqhyyWyqK1keomkvD
   HdFjM9+kC+TT1Jt6xJ/M5jE7cZL/hkJdG/NX+Xrw9jw6KaDlWR244cOJg
   dIQ0kVulWQ1iZrdmjfl36n6oZ+L9M/99hL6OEQpPuNDIRWCYfEVVccd9f
   A=;
X-CSE-ConnectionGUID: VOMe1bPzTiWdUOmQnhR9Qw==
X-CSE-MsgGUID: S+DkbeNxSQKENGpHpVDAQw==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa10.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Sep 2025 14:49:49 +0200
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw6.muc with
 ESMTP/TLS; 11 Sep 2025 14:49:49 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb4.muc with ESMTP/TLS; 11 Sep 2025 14:49:49 +0200
Received: from marvin-ws (10.30.85.213) by smucmp19d.europe.bmw.corp
 (2a03:1e80:a15:58f::205d) with Microsoft SMTP Server (version=TLS;
 Thu, 11 Sep 2025 14:49:48 +0200
X-CSE-ConnectionGUID: pkQ/yGIgRkm8uMatTOiFGg==
X-CSE-MsgGUID: kKRgYjI9Q2iADourQQDH+w==
X-CSE-ConnectionGUID: pcdyo3VCRv+Ygks7Gu6Zag==
X-CSE-MsgGUID: u8WrHXCIToCjNAKqQN/xpg==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>, Richard Purdie <richard.purdie@linuxfoundation.org>,
	Philip Lorenz <philip.lorenz@bmw.de>
Subject: [kirkstone][PATCH v2 1/2] insane: Improve patch warning/error handling
Date: Thu, 11 Sep 2025 14:41:29 +0200
Message-ID: <20250911124130.182442-1-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp18g.europe.bmw.corp (2a03:1e80:a15:58f::1:79) To
 smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 12:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223275

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently, whilst patch errors or warnings are shown, the errors don't stop builds.
The configuration isn't very configurable from WARN_QA and ERROR_QA either.

This patch:
 * Uses the standard mechanisms to handle the patch fuzz warnings/errors
 * Makes Upstream-Status checking configurable from WARN/ERROR_QA
 * Allows that checking to be used with non-core layers
 * Makes patch-fuzz an error by default

(From OE-Core rev: 76a685bfcf927593eac67157762a53259089ea8a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3c3fd6a65e8103f74ae382d196d486b31a168b39)

The backported commit was modified to not mark "patch-fuzz" as an error
by default (which retains compatibility with kirkstone behaviour).

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
changes in v2:
* Do not add patch-status-noncore to WARN_QA
---
 meta/classes/insane.bbclass | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f4b4c05e3d8..99340c17522 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1182,24 +1182,27 @@ python do_qa_patch() {
             msg += "    devtool modify %s\n" % d.getVar('PN')
             msg += "    devtool finish --force-patch-refresh %s <layer_path>\n\n" % d.getVar('PN')
             msg += "Don't forget to review changes done by devtool!\n"
-            if bb.utils.filter('ERROR_QA', 'patch-fuzz', d):
-                bb.error(msg)
-            elif bb.utils.filter('WARN_QA', 'patch-fuzz', d):
-                bb.warn(msg)
-            msg = "Patch log indicates that patches do not apply cleanly."
+            msg += "\nPatch log indicates that patches do not apply cleanly."
             oe.qa.handle_error("patch-fuzz", msg, d)
 
     # Check if the patch contains a correctly formatted and spelled Upstream-Status
     import re
     from oe import patch
 
+    allpatches = False
+    if bb.utils.filter('ERROR_QA', 'patch-status-noncore', d) or bb.utils.filter('WARN_QA', 'patch-status-noncore', d):
+        allpatches = True
+
     coremeta_path = os.path.join(d.getVar('COREBASE'), 'meta', '')
     for url in patch.src_patches(d):
        (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
 
        # skip patches not in oe-core
+       patchtype = "patch-status-core"
        if not os.path.abspath(fullpath).startswith(coremeta_path):
-           continue
+           patchtype = "patch-status-noncore"
+           if not allpatches:
+               continue
 
        kinda_status_re = re.compile(r"^.*upstream.*status.*$", re.IGNORECASE | re.MULTILINE)
        strict_status_re = re.compile(r"^Upstream-Status: (Pending|Submitted|Denied|Accepted|Inappropriate|Backport|Inactive-Upstream)( .+)?$", re.MULTILINE)
@@ -1212,9 +1215,13 @@ python do_qa_patch() {
 
            if not match_strict:
                if match_kinda:
-                   bb.error("Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0)))
+                   msg = "Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0))
+                   oe.qa.handle_error(patchtype, msg, d)
                else:
-                   bb.error("Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
+                   msg = "Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines)
+                   oe.qa.handle_error(patchtype, msg, d)
+
+    oe.qa.exit_if_errors(d)
 }
 
 python do_qa_configure() {

