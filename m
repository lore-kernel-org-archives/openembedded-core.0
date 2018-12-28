Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 48A906C494
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 08:59:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBS8xALw012328
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 00:59:20 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 28 Dec 2018 00:58:59 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Dec 2018 00:58:58 -0800
Message-ID: <8af07afb7c6e1e7c937682d89b88229a688d971b.1545987435.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1545987435.git.liezhi.yang@windriver.com>
References: <cover.1545987435.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1 V2] runqemu-gen-tapdevs: Allow run --help without sudo
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
X-List-Received-Date: Fri, 28 Dec 2018 08:59:30 -0000
Content-Type: text/plain

Then we can get user's UID and GID rather than hardcode to 1000, e.g.:

- Without sudo
$ runqemu-gen-tapdevs --help
[snip]
$ sudo ../poky/scripts/runqemu-gen-tapdevs 15220 100 4 tmp/sysroots-components/x86_64/qemu-helper-native/usr/bin
[snip]

- With sudo
$ sudo ../poky/scripts/runqemu-gen-tapdevs --help
[snip]
$ sudo ../poky/scripts/runqemu-gen-tapdevs 15220 100 4 tmp/sysroots-components/x86_64/qemu-helper-native/usr/bin
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu-gen-tapdevs | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index 11de318..869fee2 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -22,22 +22,28 @@
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
+uid=`id -u`
+gid=`id -g`
+if [ -n "$SUDO_UID" ]; then
+    uid=$SUDO_UID
+fi
+if [ -n "$SUDO_GID" ]; then
+    gid=$SUDO_GID
+fi
+
 usage() {
 	echo "Usage: sudo $0 <uid> <gid> <num> <staging_bindir_native>"
-        echo "Where <uid> is the numeric user id the tap devices will be owned by"
+	echo "Where <uid> is the numeric user id the tap devices will be owned by"
 	echo "Where <gid> is the numeric group id the tap devices will be owned by"
 	echo "<num> is the number of tap devices to create (0 to remove all)"
 	echo "<native-sysroot-basedir> is the path to the build system's native sysroot"
-	echo "e.g. $ bitbake qemu-helper-native"
-	echo "$ sudo $0 1000 1000 4 tmp/sysroots-components/x86_64/qemu-helper-native/usr/bin"
+	echo "For example:"
+	echo "$ bitbake qemu-helper-native"
+	echo "$ sudo $0 $uid $gid 4 tmp/sysroots-components/x86_64/qemu-helper-native/usr/bin"
+	echo ""
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
@@ -54,6 +60,11 @@ if [[ ! -x "$TUNCTL" || -d "$TUNCTL" ]]; then
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


