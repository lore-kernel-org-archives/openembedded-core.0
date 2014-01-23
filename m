Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2BEF36E7E3
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 14:35:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0NEZw5L027217
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 06:35:58 -0800 (PST)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 23 Jan 2014 06:35:58 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 08:32:45 -0600
Message-ID: <1390487566-13569-6-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1390487566-13569-1-git-send-email-jason.wessel@windriver.com>
References: <1390487566-13569-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 5/6] runqemu-export-rootfs: update for unfs3
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
X-List-Received-Date: Thu, 23 Jan 2014 14:35:58 -0000
Content-Type: text/plain

The unfs3 no longer has an rpc.mountd component. There is just a
single server for mountd and nfsd requests.  This means changing
the name of the server in the scripts that check for it.

[YOCTO #5639]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 scripts/runqemu-export-rootfs |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 2d87996..79403ab 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -46,8 +46,8 @@ if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
 fi
 . $SYSROOT_SETUP_SCRIPT
 
-if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/sbin/rpc.mountd" ]; then
-	echo "Error: Unable to find rpc.mountd binary in $OECORE_NATIVE_SYSROOT/usr/sbin/"
+if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/sbin/unfsd" ]; then
+	echo "Error: Unable to find unfsd binary in $OECORE_NATIVE_SYSROOT/usr/sbin/"
 
 	if [ "x$OECORE_DISTRO_VERSION" = "x" ]; then
 		echo "Have you run 'bitbake meta-ide-support'?"
-- 
1.7.9.5


