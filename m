Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A41FB60557
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 14:54:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 04 Feb 2015 06:48:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,518,1418112000"; d="scan'208";a="672660198"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.57])
	by fmsmga002.fm.intel.com with ESMTP; 04 Feb 2015 06:54:51 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Feb 2015 08:54:58 -0600
Message-Id: <1423061698-9776-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] files/toolchain-shar-template.sh: fix replace target_sdk_dir twice in environment setup file
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
X-List-Received-Date: Wed, 04 Feb 2015 14:54:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When specify a target sdk dir that contains default install dir as
subdir,

	target_sdk_dir=/opt/poky/$version/
	custom_target_sdk_dir=/opt/poky/$version/some

The target_sdk_dir variable in environment-setup file is replaced twice
causes to point to wrong PATH.

In order to fix filter environment-setup file in second replacement.

[YOCTO #7032]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/files/toolchain-shar-template.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/files/toolchain-shar-template.sh b/meta/files/toolchain-shar-template.sh
index 0d679a6..4a7fbd5 100644
--- a/meta/files/toolchain-shar-template.sh
+++ b/meta/files/toolchain-shar-template.sh
@@ -158,6 +158,7 @@ for replace in "$target_sdk_dir -maxdepth 1" "$native_sysroot"; do
 	$SUDO_EXEC find $replace -type f -exec file '{}' \; | \
 		grep ":.*\(ASCII\|script\|source\).*text" | \
 		awk -F':' '{printf "\"%s\"\n", $1}' | \
+		grep -v "$target_sdk_dir/environment-setup-*" | \
 		$SUDO_EXEC xargs -n32 sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
 done
 
-- 
1.9.1


