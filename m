Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AE15560167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 14:34:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sADEYKjr029822
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 06:34:20 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 13 Nov 2014 06:34:19 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Nov 2014 06:34:18 -0800
Message-ID: <cdcd78298215cd8f7a99e354bcf4ed1c1a740b8e.1415889088.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1415889088.git.liezhi.yang@windriver.com>
References: <cover.1415889088.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] toolchain-shar-template.sh: fix the text files in the top dir
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
X-List-Received-Date: Thu, 13 Nov 2014 14:34:24 -0000
Content-Type: text/plain

It only fixed the text files in native_sysroot, but there might be some
files in the top installed dir (whose var name is target_sdk_dir in the
code) which are also needed to be fixed.

It used "find $native_sysroot", now also "find $target_sdk_dir -maxdepth 1",
and split the long line into small ones.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/files/toolchain-shar-template.sh |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-template.sh b/meta/files/toolchain-shar-template.sh
index 2578a34..0d679a6 100644
--- a/meta/files/toolchain-shar-template.sh
+++ b/meta/files/toolchain-shar-template.sh
@@ -154,7 +154,12 @@ if [ $relocate = 1 ] ; then
 fi
 
 # replace @SDKPATH@ with the new prefix in all text files: configs/scripts/etc
-$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\|source\).*text"|awk -F':' '{printf "\"%s\"\n", $1}'|$SUDO_EXEC xargs -n32 sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
+for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
+	$SUDO_EXEC find $replace -type f -exec file '{}' \; | \
+		grep ":.*\(ASCII\|script\|source\).*text" | \
+		awk -F':' '{printf "\"%s\"\n", $1}' | \
+		$SUDO_EXEC xargs -n32 sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
+done
 
 # change all symlinks pointing to @SDKPATH@
 for l in $($SUDO_EXEC find $native_sysroot -type l); do
-- 
1.7.9.5


