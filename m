Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 31FDC6D772
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:34:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7YlWD027953
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:34:47 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:34:46 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:34:41 -0600
Message-ID: <1385019281-24577-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [master][dora][PATCH] rootfs_*.bbclass: List which post-install scripts can not be run
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
X-List-Received-Date: Thu, 21 Nov 2013 07:34:47 -0000
Content-Type: text/plain

From: Jeffrey C Honig <jeffrey.honig@windriver.com>

When preping a read-only rootfs and finding some post-install
scripts that can not be run, list the names of said scripts to
avoid having to look around the rootfs to find a list.

Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 meta/classes/rootfs_deb.bbclass | 5 +++--
 meta/classes/rootfs_ipk.bbclass | 5 +++--
 meta/classes/rootfs_rpm.bbclass | 5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index b1c52f9..8613032 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -91,8 +91,9 @@ fakeroot rootfs_deb_do_rootfs () {
 	${ROOTFS_POSTPROCESS_COMMAND}
 
 	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
-		if [ -n "$(delayed_postinsts)" ]; then
-			bberror "Some packages could not be configured offline and rootfs is read-only."
+	        delayed_postinsts="$(delayed_postinsts)"
+		if [ -n "$delayed_postinsts" ]; then
+			bberror "The following packages could not be configured offline and rootfs is read-only: $delayed_postinsts"
 			exit 1
 		fi
 	fi
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index b0805dc..6ce3e5d 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -89,8 +89,9 @@ fakeroot rootfs_ipk_do_rootfs () {
 	${ROOTFS_POSTPROCESS_COMMAND}
 
 	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
-		if [ -n "$(delayed_postinsts)" ]; then
-			bberror "Some packages could not be configured offline and rootfs is read-only."
+	        delayed_postinsts="$(delayed_postinsts)"
+		if [ -n "$delayed_postinsts" ]; then
+			bberror "The following packages could not be configured offline and rootfs is read-only: $delayed_postinsts"
 			exit 1
 		fi
 	fi
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 6c68ac8..1a0c225 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -115,8 +115,9 @@ fakeroot rootfs_rpm_do_rootfs () {
 
 	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
 		if [ -d ${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts ] ; then
-			if [ "`ls -A ${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts`" != "" ] ; then
-				bberror "Some packages could not be configured offline and rootfs is read-only."
+		        failed_pkgs=$(ls -A ${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts)
+			if [ -n "$failed_pkgs" ] ; then
+				bberror "The following post-install scripts could not be run offline and rootfs is read-only: $failed_pkgs"
 				exit 1
 			fi
 		fi
-- 
1.8.1.2.545.g2f19ada


