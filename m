Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 437C071EC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 12:15:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9RCFeIp015973
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 05:15:40 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 27 Oct 2014 05:15:39 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Oct 2014 20:17:12 +0800
Message-ID: <48e14f7ea380f0e38c906fab7e9b4b4226f38ba6.1414412180.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1414412180.git.Qi.Chen@windriver.com>
References: <cover.1414412180.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] toolchain-shar-template.sh: fix installation of SDK
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
X-List-Received-Date: Mon, 27 Oct 2014 12:15:43 -0000
Content-Type: text/plain

Previously, the installation of our SDK is not consistent.

For example, there's a user with user name 'test' and group name 'test', and
the user has sudo privilege. First, the user tries to install the SDK to his
own home directory /home/test, and the SDK files are installed with 'test' as
their owner. Then, the user tries to install the SDK to /opt/ directory which
is owned by root, and the SDK files are installed with 'root' as their owner.

We can see from the above example the same SDK would result in different
installation results only because the installation directories are different.

In fact, in the second use case above, the user has to use the `sudo' command
every time whenever he/she wants to perform some action with the SDK.

This patch fixes the above problems by installing the SDK with the current user
as the owner of the installed files.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/files/toolchain-shar-template.sh | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/meta/files/toolchain-shar-template.sh b/meta/files/toolchain-shar-template.sh
index 02035d4..592795c 100644
--- a/meta/files/toolchain-shar-template.sh
+++ b/meta/files/toolchain-shar-template.sh
@@ -94,24 +94,33 @@ if [ "$answer" != "Y" -a "$answer" != "y" ]; then
 	exit 1
 fi
 
-# Try to create the directory (this will not succeed if user doesn't have rights)
+# Create directory under current user/group
+USERID=`id -u`
+GROUPID=`id -g`
 mkdir -p $target_sdk_dir >/dev/null 2>&1
-
-# if don't have the right to access dir, gain by sudo 
-if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; then 
+if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; then
 	SUDO_EXEC=$(which "sudo")
 	if [ -z $SUDO_EXEC ]; then
-		echo "No command 'sudo' found, please install sudo first. Abort!"
+		echo "Error: Creating $target_sdk_dir needs sudo privilege, please install sudo or change your installation location. Abort!"
 		exit 1
 	fi
-
-	# test sudo could gain root right
+	# make sure sudo could gain root privilege
 	$SUDO_EXEC pwd >/dev/null 2>&1
-	[ $? -ne 0 ] && echo "Sorry, you are not allowed to execute as root." && exit 1
-
-	# now that we have sudo rights, create the directory
-	$SUDO_EXEC mkdir -p $target_sdk_dir >/dev/null 2>&1
+	[ $? -ne 0 ] && echo "Error: Creating $target_sdk_dir failed. Please make sure you have sudo privilege." && exit 1
+	# create directory and change its owner and group
+	$SUDO_EXEC mkdir -p $target_sdk_dir
+	$SUDO_EXEC chown ${USERID}:${GROUPID} $target_sdk_dir
 fi
+# Make sure the created directory has the same UID/GID as the current user
+FUID=`stat -c '%u' $target_sdk_dir`
+FGID=`stat -c '%g' $target_sdk_dir`
+if [ $USERID != $FUID -o $GROUPID != $FGID ]; then
+	echo "Error: $target_sdk_dir doesn't have the corret UID/GID. Abort!"
+	exit 1
+fi
+
+# From now on, we don't need to use sudo anymore
+SUDO_EXEC=""
 
 payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
 
-- 
1.9.1


