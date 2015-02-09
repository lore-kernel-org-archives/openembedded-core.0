Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB8A73291
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Feb 2015 16:03:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 09 Feb 2015 08:03:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,544,1418112000"; d="scan'208";a="683146965"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.162])
	by orsmga002.jf.intel.com with ESMTP; 09 Feb 2015 08:03:29 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Feb 2015 10:03:45 -0600
Message-Id: <1423497825-4095-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [dizzy][PATCH] files/toolchain-shar-template.sh: fix replace target_sdk_dir twice in environment setup file
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
X-List-Received-Date: Mon, 09 Feb 2015 16:03:40 -0000
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

(From OE-Core rev: 02ecaa69abe97fe2f01cd609e0e59933c0f9ddbf)

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


