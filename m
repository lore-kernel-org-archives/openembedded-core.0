Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33A236D2AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 02:41:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9L2fmKc016421
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 19:41:48 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 20 Oct 2013 19:41:47 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Oct 2013 10:42:29 +0800
Message-ID: <d09074f6e59cc6ea203d433e7cb56a5085a65129.1382323261.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1382323261.git.Qi.Chen@windriver.com>
References: <cover.1382323261.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] runqemu-extract-sdk: add --numeric-owner option to tar command
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
X-List-Received-Date: Mon, 21 Oct 2013 02:41:46 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

If the same username exists on both target and the build host, but
the uids differ, and we start target via NFS, then the uid for the
user will be incorrect on target.

For example, if postfix's uid on host is 119 and on target is 1024,
then if we start target via NFS, the uid for postfix will be 119.

The root cause is that when we use runqemu-extract-sdk to generate
the NFS rootfs for later use, the tar command will respect the username
instead of uid. So if PSEUDO_PASSWD environment is not set correctly,
the host /etc/passwd will be used, resulting in wrong uids.

The situation for gid is completely analogous to that of uid.

It's almost impossible for the runqemu-extract-sdk to guess the correct
location of the needed password file merely based on the target tarball
name.

This patch solves this problem by adding the '--numeric-owner' option
to the tar command so that the uid/gid will be used when extracting the
tarball using runqemu-extract-sdk. In this situation, we'll always get
the correct uid/gid after extracting the tarball.

[YOCTO #5364]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu-extract-sdk |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
index 509af66..4ce906a 100755
--- a/scripts/runqemu-extract-sdk
+++ b/scripts/runqemu-extract-sdk
@@ -54,13 +54,13 @@ fi
 
 TAR_OPTS=""
 if [[ "$ROOTFS_TARBALL" =~ tar\.bz2$ ]]; then
-	TAR_OPTS="-xjf"
+	TAR_OPTS="--numeric-owner -xjf"
 fi
 if [[ "$ROOTFS_TARBALL" =~ tar\.gz$ ]]; then
-	TAR_OPTS="-xzf"
+	TAR_OPTS="--numeric-owner -xzf"
 fi
 if [[ "$ROOTFS_TARBALL" =~ \.tar$ ]]; then
-	TAR_OPTS="-xf"
+	TAR_OPTS="--numeric-owner -xf"
 fi
 if [ -z "$TAR_OPTS" ]; then
 	echo "Error: Unable to determine sdk tarball format"
-- 
1.7.9.5


