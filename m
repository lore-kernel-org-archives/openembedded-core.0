Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 84CDD6D772
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:31:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7V3XJ014370
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:31:03 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:31:02 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:30:58 -0600
Message-ID: <1385019058-24303-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [master][dora][PATCH] package_rpm.bbclass: Replace -linux-gnun32 with -linux.* in RPM platform file
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
X-List-Received-Date: Thu, 21 Nov 2013 07:31:04 -0000
Content-Type: text/plain

From: Lei Liu <layliu@gmail.com>

On a multilib system when one of the multibs has a different OS then
other multilibs a failure can occur during the install process because
RPM assumes all systems have the same OS.

When an n32 platform is selected as an alternative multilib, it shows
up as mips64_n32-.*-linux-gnun32 in /etc/rpm/platform.  This causes
problems when the smart tool tries to add a channel for the multilib.
RPM archScore call always returns zero for arch "mips64_n32" -
after appending default vendor and os, it finds "mips64_n32-wrs-linux"
doesn't match any predefined platforms.  Fix this by removing the
restriction of -gnun32 suffix in platform file.

Signed-off-by: Lei Liu <lei.liu2@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 meta/classes/package_rpm.bbclass | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 75ee264..63b1b21 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -367,11 +367,7 @@ package_install_internal_rpm () {
 		if [ ! -z "$INSTALL_PLATFORM_EXTRA_RPM" ]; then
 			for pt in $INSTALL_PLATFORM_EXTRA_RPM ; do
 				channel_priority=$(expr $channel_priority + 5)
-				case $pt in
-					noarch-* | any-* | all-*)
-						pt=$(echo $pt | sed "s,-linux.*$,-linux\.*,")
-						;;
-				esac
+				pt=$(echo $pt | sed "s,-linux.*$,-linux\.*,")
 				echo "$pt" >> ${target_rootfs}/etc/rpm/platform
 			done
 		fi
-- 
1.8.1.2.545.g2f19ada


