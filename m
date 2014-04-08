Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 51DB865D41
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 07:16:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s387GAqq028611
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Apr 2014 00:16:11 -0700 (PDT)
Received: from PEK-WKANG-D1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Tue, 8 Apr 2014 00:16:10 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Apr 2014 15:16:02 +0800
Message-ID: <1396941362-27622-1-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] busybox: fix a sh link wrong
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
X-List-Received-Date: Tue, 08 Apr 2014 07:16:11 -0000
Content-Type: text/plain

When both bash and busybox be installed, without ash support
in busybox,if bash is installed before busybox in the final stage,
even if ALTERNATIVE_PRIORITY of bash > ALTERNATIVE_PRIORITY of busybox,
the symlink from /bin/sh to bash can be yet overwritten by busybox.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 69b9b0c..bf2ddc1 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -188,7 +188,9 @@ do_install () {
 			install -m 0755 ${B}/busybox.nosuid ${D}${base_bindir}
 			install -m 0644 ${S}/busybox.links.suid ${D}${sysconfdir}
 			install -m 0644 ${S}/busybox.links.nosuid ${D}${sysconfdir}
-			ln -sf busybox.nosuid ${D}${base_bindir}/sh
+			if grep -q "CONFIG_FEATURE_SH_IS_ASH=y" ${B}/.config; then
+				ln -sf busybox.nosuid ${D}${base_bindir}/sh
+			fi
 			# Keep a default busybox for people who want to invoke busybox directly.
 			# This is also useful for the on device upgrade. Because we want
 			# to use the busybox command in postinst.
@@ -200,7 +202,9 @@ do_install () {
 				install -m 0755 ${B}/busybox ${D}${base_bindir}
 			fi
 			install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
-			ln -sf busybox ${D}${base_bindir}/sh
+			if grep -q "CONFIG_FEATURE_SH_IS_ASH=y" ${B}/.config; then
+				ln -sf busybox ${D}${base_bindir}/sh
+			fi
 			# We make this symlink here to eliminate the error when upgrading together
 			# with busybox-syslog. Without this symlink, the opkg may think of the
 			# busybox.nosuid as obsolete and remove it, resulting in dead links like
-- 
1.7.9.5


