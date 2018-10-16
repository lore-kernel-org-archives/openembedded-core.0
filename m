Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04BBA7990B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 23:25:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9GNOgVG012778
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 16:24:58 -0700
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 16 Oct 2018 16:24:53 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Oct 2018 19:24:27 -0400
Message-ID: <20181016232427.15363-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20181016232427.15363-1-Randy.MacLeod@windriver.com>
References: <2d902e2e7fad998fdd1c22eea5c64ade52955e6a.camel@linuxfoundation.org>
	<20181016232427.15363-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2] util-linux: fix alternatives setting for switch-root
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
X-List-Received-Date: Tue, 16 Oct 2018 23:25:07 -0000
Content-Type: text/plain

The alternative setting for switch_root belongs to the util-linux-switch-root
package instead of the util-linux package. Fix this problem to avoid
a dangling symlink:
   /usr/bin/switch_root-> /usr/bin/switch_root.util-linux
on target and in the sdk.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 60ac9c2006..3d8b3ff592 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -206,7 +206,7 @@ do_install_append_class-native () {
 ALTERNATIVE_PRIORITY = "80"
 
 ALTERNATIVE_${PN}  = " \
-    dmesg kill more mkswap blockdev pivot_root switch_root \
+    dmesg kill more mkswap blockdev pivot_root \
     hexdump last lastb logger mesg renice wall \
     setsid chrt flock utmpdump eject nologin taskset fallocate \
     fsfreeze nsenter \
@@ -218,7 +218,6 @@ ALTERNATIVE_LINK_NAME[more] = "${base_bindir}/more"
 ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
 ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
 ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
-ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
 ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
@@ -294,6 +293,9 @@ ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
 ALTERNATIVE_util-linux-unshare = "unshare"
 ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
 
+ALTERNATIVE_util-linux-switch-root = "switch_root"
+ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
+
 BBCLASSEXTEND = "native nativesdk"
 
 python do_package_prepend () {
-- 
2.17.0


