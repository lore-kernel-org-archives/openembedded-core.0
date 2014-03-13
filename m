Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id CDB2B6E750
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 15:31:53 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id n15so816620lbi.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=23us+BiCCL3k7ZgJ+PTqIyV8FlA8m8i5uHW+ezuKxqU=;
	b=CkNj9VDbXcwS6l/T0xB3+ReC0EPyL2TqlxsX/KlBs5xO+bilaE4q9xXg91zD6tD4uJ
	oizImLQdVEuFuHZmF3756HYvfik0f7GRAt19NdifoPJrbdOxnxjpWcuZo3bVXNZT9Z2w
	X5usunVTGe8LxYxLj03TTrBCBcxNMEC4lEOmNQi+NPiTs3OYJIoZR67u4Y4czZGUgX9M
	ZMZ2ecs7GgVLr8H6RRLrBO4EnWIn4DOObOQn8U4pnxuTg8kt4vTvjWaSvrOrKMyy6Jnt
	gXeairsA/yBix3g2zbrA8aqOuiDlI3UuPzMB9kb+9hz2yxLMflrmGMG3x11o58tHwSBO
	GDww==
X-Received: by 10.112.50.194 with SMTP id e2mr1649469lbo.4.1394724712899;
	Thu, 13 Mar 2014 08:31:52 -0700 (PDT)
Received: from neopili.qtec.com (0x4dd4aed9.adsl.cybercity.dk.
	[77.212.174.217])
	by mx.google.com with ESMTPSA id tq9sm2801411lbb.10.2014.03.13.08.31.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Mar 2014 08:31:51 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org, sgw@linux.intel.com,
	richard.purdie@linuxfoundation.org
Date: Thu, 13 Mar 2014 16:31:48 +0100
Message-Id: <1394724708-9894-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] package_deb: Remove version from Provides Field
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
X-List-Received-Date: Thu, 13 Mar 2014 15:31:57 -0000

According to Debian Policy Manual. Chapter 7.1

All of the fields except for Provides may restrict their applicability
to particular versions of each named package. This is done in
parentheses after each individual package name; the parentheses should
contain a relation from the list below followed by a version number, in
the format described in Version, Section 5.6.12.

This Fixes the following warning:

root@qt5022:~# apt-get update

...

Reading package lists... Done
W: Ignoring Provides line with DepCompareOp for package
pkgconfig__pkg-config__
W: You may want to run apt-get update to correct these problems

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/classes/package_deb.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 2d2f3f1..905af24 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -322,6 +322,13 @@ python do_package_deb () {
 
         mapping_rename_hook(localdata)
 
+        def debian_cmp_purgeversion(var):
+            # dpkg does not allow versions on Provides.
+            # From Debian Policy Manual, Chapter 7:
+            # All of the fields except for Provides may restrict their applicability to particular versions of each named package.
+            for key in var:
+                var[key] = []
+
         def debian_cmp_remap(var):
             # dpkg does not allow for '(' or ')' in a dependency name
             # replace these instances with '__' and '__'
@@ -359,6 +366,7 @@ python do_package_deb () {
         debian_cmp_remap(rsuggests)
         rprovides = bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES", True) or "")
         debian_cmp_remap(rprovides)
+        debian_cmp_purgeversion(rprovides)
         rreplaces = bb.utils.explode_dep_versions2(localdata.getVar("RREPLACES", True) or "")
         debian_cmp_remap(rreplaces)
         rconflicts = bb.utils.explode_dep_versions2(localdata.getVar("RCONFLICTS", True) or "")
-- 
1.9.0


