Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F586CA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 09:53:29 +0000 (UTC)
Received: from esa1.hc324-48.eu.iphmx.com (esa1.hc324-48.eu.iphmx.com [207.54.68.119])
 by mx.groups.io with SMTP id smtpd.web11.8199.1755251599051142438
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 02:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=GjZGyuGW;
 spf=pass (domain: bmw.de, ip: 207.54.68.119, mailfrom: prvs=315bbc237=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1755251599; x=1786787599;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=otkvhTucYxgPuaF5kreBfhM/n4Ww3BmLGn/oR+8j4GI=;
  b=GjZGyuGWoJjnBdPkmA5GT0aENPBZTrah3SCDt5ozWtE3hhxdMABmzAs8
   aQ0MFjEV3X43veGb13ee0XfGkQ3vgHRbVTyj8+quIELqemLpeOtIE1m5E
   hhYRD8ngsWbBCRazNn6VvbnOSLvesXb0fnw0Egzx2pByYcyA9hGuLL6wx
   s=;
X-CSE-ConnectionGUID: IbEEMqvASsKnTrwQeuKkUQ==
X-CSE-MsgGUID: MWo3TRR4Sm6oKXyV2be+kA==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa1.hc324-48.eu.iphmx.com with ESMTP/TLS; 15 Aug 2025 11:53:17 +0200
Received: from unknown (HELO esabb6.muc) ([10.31.187.137]) by esagw6.muc with
 ESMTP/TLS; 15 Aug 2025 11:53:01 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb6.muc with ESMTP/TLS; 15 Aug 2025 11:53:01 +0200
Received: from marvin-ws (10.30.85.200) by smucmp19d.europe.bmw.corp
 (2a03:1e80:a15:58f::205d) with Microsoft SMTP Server (version=TLS;
 Fri, 15 Aug 2025 11:53:01 +0200
X-CSE-ConnectionGUID: oqrqH/yzQSW9854Z7KObdg==
X-CSE-MsgGUID: SNqVux8CTV6aO6FNvBjSvA==
X-CSE-ConnectionGUID: YgamtDe/RHWctZIVsMmTIg==
X-CSE-MsgGUID: 5lk6K1EeTr+/INoXRxgYpw==
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>, Richard Purdie <richard.purdie@linuxfoundation.org>,
	Philip Lorenz <philip.lorenz@bmw.de>
Subject: [kirkstone][PATCH 1/2] insane: Improve patch warning/error handling
Date: Fri, 15 Aug 2025 11:45:08 +0200
Message-ID: <20250815094509.3034151-1-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp16e.europe.bmw.corp (2a03:1e80:a15:58f::1:147) To
 smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 09:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221879

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
 meta/classes/insane.bbclass | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f4b4c05e3d8..495bdda652c 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -28,6 +28,7 @@ WARN_QA ?= " libdir xorg-driver-abi \
             missing-update-alternatives native-last missing-ptest \
             license-exists license-no-generic license-syntax license-format \
             license-incompatible license-file-missing obsolete-license \
+            patch-status-noncore \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -1182,24 +1183,27 @@ python do_qa_patch() {
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
@@ -1212,9 +1216,13 @@ python do_qa_patch() {
 
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

