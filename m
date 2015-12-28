Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D6FE73179
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:15:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBS7F9LJ024237
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:15:09 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:15:08 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:37 -0800
Message-ID: <d7bcdb33a675fbdd30596d62961be52aa98c9e05.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 29/40] toolchain-shar-extract.sh: do not allow $ in paths for ext SDK
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
X-List-Received-Date: Mon, 28 Dec 2015 07:15:08 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

If you put an $ character in the path, SDK installation fails during the
preparation stage, so add this to the disallowed characters.

Fixes [YOCTO #8625].

(From OE-Core master rev: 654f4785f719552f4e78e14a5a901c07d00ce68d)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/files/toolchain-shar-extract.sh |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 6af37b7..35d3c75 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -101,9 +101,9 @@ fi
 
 if [ "$SDK_EXTENSIBLE" = "1" ]; then
 	# We're going to be running the build system, additional restrictions apply
-	if echo "$target_sdk_dir" | grep -q '[+\ @]'; then
+	if echo "$target_sdk_dir" | grep -q '[+\ @$]'; then
 		echo "The target directory path ($target_sdk_dir) contains illegal" \
-		     "characters such as spaces, @ or +. Abort!"
+		     "characters such as spaces, @, \$ or +. Abort!"
 		exit 1
 	fi
 else
-- 
1.7.9.5


