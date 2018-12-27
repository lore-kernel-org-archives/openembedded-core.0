Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E03EE6C23A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 09:00:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBR90Znu007606
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 01:00:36 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 27 Dec 2018 01:00:24 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Dec 2018 00:59:42 -0800
Message-ID: <97c9fb76d7d46684593fe7b1c7786bdd1344b165.1545901142.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1545901142.git.liezhi.yang@windriver.com>
References: <cover.1545901142.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] runqemu-gen-tapdevs: Allow run --help without sudo
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
X-List-Received-Date: Thu, 27 Dec 2018 09:00:35 -0000
Content-Type: text/plain

Then we can get user's UID and GID rather than hardcode to 1000, e.g.:

$ sudo ../poky/scripts/runqemu-gen-tapdevs 15220 100 4 tmp/sysroots-components/x86_64/qemu-helper-native/usr/bin

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu-gen-tapdevs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index 11de318..67c4fcc 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -29,15 +29,10 @@ usage() {
 	echo "<num> is the number of tap devices to create (0 to remove all)"
 	echo "<native-sysroot-basedir> is the path to the build system's native sysroot"
 	echo "e.g. $ bitbake qemu-helper-native"
-	echo "$ sudo $0 1000 1000 4 tmp/sysroots-components/x86_64/qemu-helper-native/usr/bin"
+	echo "$ sudo $0 `id -u` `id -g` 4 tmp/sysroots-components/x86_64/qemu-helper-native/usr/bin"
 	exit 1
 }
 
-if [ $EUID -ne 0 ]; then
-	echo "Error: This script must be run with root privileges"
-	exit
-fi
-
 if [ $# -ne 4 ]; then
 	echo "Error: Incorrect number of arguments"
 	usage
@@ -54,6 +49,11 @@ if [[ ! -x "$TUNCTL" || -d "$TUNCTL" ]]; then
 	usage
 fi
 
+if [ $EUID -ne 0 ]; then
+	echo "Error: This script must be run with root privileges"
+	exit
+fi
+
 SCRIPT_DIR=`dirname $0`
 RUNQEMU_IFUP="$SCRIPT_DIR/runqemu-ifup"
 if [ ! -x "$RUNQEMU_IFUP" ]; then
-- 
2.10.2


