Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3706978C9A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 08:58:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9B8wX5X019436
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 01:58:33 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 11 Oct 2018 01:58:32 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Oct 2018 17:04:08 +0800
Message-ID: <2cdd7e6a71905b3d61d8996e8683728f90d89b0d.1539248594.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1539248594.git.Qi.Chen@windriver.com>
References: <cover.1539248594.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] util-linux: fix alternatives setting for unshare
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
X-List-Received-Date: Thu, 11 Oct 2018 08:58:32 -0000
Content-Type: text/plain

The alternative setting for unshare belongs to the util-linux-unshare
package instead of the util-linux package. Fix this problem to avoid
a dead symlink /usr/bin/unshare -> /usr/bin/unshare.util-linux on target.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 45e2203..60ac9c2 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -207,7 +207,7 @@ ALTERNATIVE_PRIORITY = "80"
 
 ALTERNATIVE_${PN}  = " \
     dmesg kill more mkswap blockdev pivot_root switch_root \
-    hexdump last lastb logger mesg renice wall unshare \
+    hexdump last lastb logger mesg renice wall \
     setsid chrt flock utmpdump eject nologin taskset fallocate \
     fsfreeze nsenter \
 "
@@ -220,7 +220,6 @@ ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
 ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
 ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
-ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
 ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
 ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
@@ -292,6 +291,9 @@ ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
 ALTERNATIVE_util-linux-mountpoint = "mountpoint"
 ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
 
+ALTERNATIVE_util-linux-unshare = "unshare"
+ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
+
 BBCLASSEXTEND = "native nativesdk"
 
 python do_package_prepend () {
-- 
1.9.1


